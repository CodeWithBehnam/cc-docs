#!/usr/bin/env -S uv run --script
# /// script
# requires-python = ">=3.11"
# dependencies = []
# ///
"""
Claude Code Setup Hook: Repository Initialization

Triggered by: claude --init or claude --init-only
Purpose: Install dependencies and initialize the database for first-time setup
"""

import json
import os
import subprocess
import sys
from datetime import datetime
from pathlib import Path

# Log file in the same directory as this script
SCRIPT_DIR = Path(__file__).parent
LOG_FILE = SCRIPT_DIR / "setup.init.log"


class Logger:
    """Simple logger that writes to both stderr and a log file (appends)."""

    def __init__(self, log_path: Path):
        self.log_path = log_path
        self.log_path.parent.mkdir(parents=True, exist_ok=True)
        # Append to log file (preserves history)
        with open(self.log_path, "a") as f:
            f.write(f"\n{'='*60}\n")
            f.write(f"=== Init Hook Started: {datetime.now().isoformat()} ===\n")
            f.write(f"{'='*60}\n")

    def log(self, message: str) -> None:
        """Print to stderr and append to log file."""
        print(
            message, file=sys.stderr
        )  # Use stderr for logs so stdout is clean for JSON
        with open(self.log_path, "a") as f:
            f.write(message + "\n")


logger = Logger(LOG_FILE)


def read_hook_input() -> dict:
    """Read the JSON payload from stdin."""
    try:
        return json.load(sys.stdin)
    except (json.JSONDecodeError, EOFError):
        return {}


def output_result(context: str) -> dict:
    """Build and return structured JSON result."""
    return {
        "hookSpecificOutput": {"hookEventName": "Setup", "additionalContext": context}
    }


def run(cmd: list[str], cwd: str | None = None) -> str:
    """Run a command, log output, and exit on failure. Returns stdout."""
    logger.log(f"  Running: {' '.join(cmd)}")
    result = subprocess.run(cmd, cwd=cwd, capture_output=True, text=True)

    output_lines = []
    if result.stdout:
        for line in result.stdout.strip().split("\n")[:10]:
            logger.log(f"    {line}")
            output_lines.append(line)

    if result.returncode != 0:
        logger.log(f"  ERROR: Command failed with code {result.returncode}")
        if result.stderr:
            logger.log(f"  STDERR: {result.stderr[:500]}")
        sys.exit(2)

    return "\n".join(output_lines)


def main() -> None:
    # ============================================
    # Read and log INPUT from Claude Code
    # ============================================
    hook_input = read_hook_input()

    logger.log("")
    logger.log("HOOK INPUT (JSON received via stdin from Claude Code):")
    logger.log("-" * 60)
    logger.log(json.dumps(hook_input, indent=2) if hook_input else "{}")
    logger.log("")

    trigger = hook_input.get("trigger", "init")
    session_id = hook_input.get("session_id", "unknown")

    project_dir = os.environ.get("CLAUDE_PROJECT_DIR", os.getcwd())
    env_file = os.environ.get("CLAUDE_ENV_FILE")

    logger.log("Claude Code Setup Hook: Initializing Repository")
    logger.log("-" * 60)
    logger.log(f"Trigger: --{trigger}")
    logger.log(f"Session ID: {session_id}")
    logger.log(f"Project directory: {project_dir}")
    logger.log(f"Log file: {LOG_FILE}")

    backend_dir = os.path.join(project_dir, "apps", "backend")
    frontend_dir = os.path.join(project_dir, "apps", "frontend")

    # Track what we did for the summary
    actions = []

    # ============================================
    # Backend Setup (Python with uv)
    # ============================================
    logger.log("\n>>> Setting up Python backend...")
    run(["uv", "sync"], cwd=backend_dir)
    logger.log("Backend dependencies installed with uv")
    actions.append("Installed Python backend dependencies with uv")

    # ============================================
    # Frontend Setup (Vite Vue-TS)
    # ============================================
    logger.log("\n>>> Setting up Vue-TS frontend...")
    run(["npm", "install"], cwd=frontend_dir)
    logger.log("Frontend dependencies installed")
    actions.append("Installed Vue-TS frontend dependencies")

    # Initialize SQLite database with mock data
    logger.log("\n>>> Initializing SQLite database...")
    run(["uv", "run", "python", "init_db.py"], cwd=backend_dir)
    logger.log("Database initialized at apps/backend/starter.db")
    actions.append("Initialized SQLite database with mock tasks")

    # ============================================
    # Persist environment variables for Claude session
    # ============================================
    if env_file:
        logger.log("\n>>> Setting up session environment variables...")
        with open(env_file, "a") as f:
            f.write("export BACKEND_URL=http://localhost:8000\n")
            f.write("export FRONTEND_URL=http://localhost:5173\n")
        actions.append("Set BACKEND_URL and FRONTEND_URL environment variables")

    logger.log("\n" + "-" * 60)
    logger.log("Setup Complete!")
    logger.log("-" * 60)

    # ============================================
    # Build and log OUTPUT for Claude Code
    # ============================================
    summary = "Setup completed successfully!\n\n"
    summary += "What was done:\n"
    for action in actions:
        summary += f"  - {action}\n"
    summary += "\n"
    summary += "To start the application:\n"
    summary += "  1. Backend:  cd apps/backend && uv run uvicorn main:app --reload\n"
    summary += "  2. Frontend: cd apps/frontend && npm run dev\n"
    summary += "\n"
    summary += "Then visit http://localhost:5173 to see the Task Manager app.\n"
    summary += f"\nLog file: {LOG_FILE}"

    hook_output = output_result(summary)

    logger.log("")
    logger.log("HOOK OUTPUT (JSON returned via stdout to Claude Code):")
    logger.log("-" * 60)
    logger.log(json.dumps(hook_output, indent=2))

    # Log completion timestamp
    with open(LOG_FILE, "a") as f:
        f.write(f"\n=== Init Hook Completed: {datetime.now().isoformat()} ===\n")

    # Output the JSON to stdout for Claude Code to consume
    print(json.dumps(hook_output, indent=2))
    sys.exit(0)


if __name__ == "__main__":
    main()
