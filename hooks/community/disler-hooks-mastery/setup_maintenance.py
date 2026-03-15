#!/usr/bin/env -S uv run --script
# /// script
# requires-python = ">=3.11"
# dependencies = []
# ///
"""Claude Code Setup Hook: Maintenance Mode

Triggered by: claude --maintenance
Purpose: Update dependencies and run database maintenance
"""

import json
import os
import sqlite3
import subprocess
import sys
from datetime import datetime
from pathlib import Path

LOG_FILE = Path(__file__).parent / "setup.maintenance.log"


def log(msg: str) -> None:
    """Append message to log file."""
    with open(LOG_FILE, "a") as f:
        f.write(msg + "\n")


def run(cmd: list[str], cwd: str | None = None) -> None:
    """Run a command and log it."""
    log(f"  Running: {' '.join(cmd)}")
    result = subprocess.run(cmd, cwd=cwd, capture_output=True, text=True)
    if result.stdout:
        for line in result.stdout.strip().split("\n")[:5]:
            log(f"    {line}")
    if result.returncode != 0:
        log(f"  ERROR: exit code {result.returncode}")
        if result.stderr:
            log(f"  {result.stderr[:200]}")


def main() -> None:
    # Read input from Claude Code
    try:
        hook_input = json.load(sys.stdin)
    except:
        hook_input = {}

    project_dir = os.environ.get("CLAUDE_PROJECT_DIR", os.getcwd())
    backend_dir = os.path.join(project_dir, "apps", "backend")
    frontend_dir = os.path.join(project_dir, "apps", "frontend")
    db_path = os.path.join(backend_dir, "starter.db")

    # Start logging
    log(f"\n{'='*60}")
    log(f"=== Maintenance Hook: {datetime.now().isoformat()} ===")
    log(f"{'='*60}")
    log(f"INPUT: {json.dumps(hook_input, indent=2)}")
    log(f"Project: {project_dir}")

    actions = []

    # Update backend
    log("\n>>> Updating backend dependencies...")
    run(["uv", "sync", "--upgrade"], cwd=backend_dir)
    actions.append("Updated Python backend dependencies")

    # Update frontend
    log("\n>>> Updating frontend dependencies...")
    run(["npm", "update"], cwd=frontend_dir)
    actions.append("Updated Vue-TS frontend dependencies")

    # Database maintenance
    log("\n>>> Running database maintenance...")
    db_stats = {}
    if os.path.exists(db_path):
        conn = sqlite3.connect(db_path)
        conn.execute("VACUUM")
        log("  VACUUM completed")
        actions.append("Ran VACUUM on SQLite database")

        result = conn.execute("PRAGMA integrity_check").fetchone()
        log(f"  Integrity: {result[0]}")
        actions.append(f"Database integrity: {result[0]}")

        for (table,) in conn.execute("SELECT name FROM sqlite_master WHERE type='table'"):
            count = conn.execute(f"SELECT COUNT(*) FROM {table}").fetchone()[0]
            log(f"  Table '{table}': {count} rows")
            db_stats[table] = count
        conn.close()

    # Build output
    summary = "Maintenance completed!\n\nActions:\n"
    for action in actions:
        summary += f"  - {action}\n"
    if db_stats:
        summary += "\nDatabase:\n"
        for table, count in db_stats.items():
            summary += f"  - {table}: {count} rows\n"

    output = {
        "hookSpecificOutput": {
            "hookEventName": "Setup",
            "additionalContext": summary
        }
    }

    log(f"\nOUTPUT: {json.dumps(output, indent=2)}")
    log(f"=== Completed: {datetime.now().isoformat()} ===")

    # Return to Claude Code
    print(json.dumps(output))
    sys.exit(0)


if __name__ == "__main__":
    main()
