#!/bin/bash
# stop-check.sh
# Stop hook. Checks for uncommitted changes before Claude finishes.
# If there are staged or unstaged changes, outputs a JSON block reminder
# asking Claude to commit before stopping.
# Uses structured JSON output so Claude receives the reason as feedback.
#
# IMPORTANT: Must check stop_hook_active to avoid an infinite loop.
# Exit codes: 0 = allow Claude to stop (or re-engage via JSON output)

set -euo pipefail

INPUT=$(cat)

# Guard: if this hook itself triggered the current Claude turn, allow stopping
# unconditionally to prevent an infinite loop.
STOP_HOOK_ACTIVE=$(echo "$INPUT" | jq -r '.stop_hook_active // false')
if [ "$STOP_HOOK_ACTIVE" = "true" ]; then
  exit 0
fi

CWD=$(echo "$INPUT" | jq -r '.cwd // empty')
if [ -z "$CWD" ]; then
  CWD=$(pwd)
fi

# Only check if we are inside a git repository.
if ! git -C "$CWD" rev-parse --is-inside-work-tree &>/dev/null 2>&1; then
  exit 0
fi

# Collect uncommitted state.
STAGED=$(git -C "$CWD" diff --cached --name-only 2>/dev/null)
UNSTAGED=$(git -C "$CWD" diff --name-only 2>/dev/null)
UNTRACKED=$(git -C "$CWD" ls-files --others --exclude-standard 2>/dev/null)

if [ -n "$STAGED" ] || [ -n "$UNSTAGED" ] || [ -n "$UNTRACKED" ]; then
  # Build a summary of what is uncommitted.
  SUMMARY=""
  if [ -n "$STAGED" ]; then
    SUMMARY="${SUMMARY}Staged changes:\n$(echo "$STAGED" | sed 's/^/  - /')\n"
  fi
  if [ -n "$UNSTAGED" ]; then
    SUMMARY="${SUMMARY}Unstaged changes:\n$(echo "$UNSTAGED" | sed 's/^/  - /')\n"
  fi
  if [ -n "$UNTRACKED" ]; then
    SUMMARY="${SUMMARY}Untracked files:\n$(echo "$UNTRACKED" | sed 's/^/  - /')\n"
  fi

  REASON=$(printf "There are uncommitted changes in the repository. Please commit or stash them before finishing.\n\n%b" "$SUMMARY")

  # Output structured JSON to block the stop and feed the reason back to Claude.
  jq -n --arg reason "$REASON" '{
    decision: "block",
    reason: $reason
  }'
  exit 0
fi

# No uncommitted changes; allow Claude to stop normally.
exit 0
