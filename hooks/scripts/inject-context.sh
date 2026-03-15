#!/bin/bash
# inject-context.sh
# SessionStart hook with "compact" matcher.
# Runs after context compaction to re-inject critical project context.
# Output written to stdout is added directly to Claude's context window.
# Customize the REMINDER variable below for your project.

set -euo pipefail

# ---- Customizable reminder (edit this for your project) ----
REMINDER="Follow project conventions: use the existing code style, write tests for new features, and run the full test suite before marking a task complete."
# ------------------------------------------------------------

CWD=$(pwd)

echo "=== Context Restored After Compaction ==="
echo ""

# Git branch (if inside a repo).
if command -v git &>/dev/null && git -C "$CWD" rev-parse --is-inside-work-tree &>/dev/null 2>&1; then
  BRANCH=$(git -C "$CWD" rev-parse --abbrev-ref HEAD 2>/dev/null || echo "unknown")
  echo "Current branch: $BRANCH"
  echo ""

  echo "Recent commits (last 5):"
  git -C "$CWD" log --oneline -5 2>/dev/null || echo "  (no commits)"
  echo ""
else
  echo "Working directory: $CWD"
  echo ""
fi

echo "Reminder: $REMINDER"
echo ""
echo "========================================="
