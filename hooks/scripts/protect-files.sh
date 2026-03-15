#!/bin/bash
# protect-files.sh
# PreToolUse hook for Edit|Write tools.
# Blocks edits to sensitive files: .env, lock files, .git/, and paths
# containing "secret" or "credential".
# Exit codes: 0 = allow, 2 = block

set -euo pipefail

INPUT=$(cat)
FILE_PATH=$(echo "$INPUT" | jq -r '.tool_input.file_path // empty')

if [ -z "$FILE_PATH" ]; then
  exit 0
fi

# Normalize to lowercase for case-insensitive pattern checks.
FILE_LOWER=$(echo "$FILE_PATH" | tr '[:upper:]' '[:lower:]')

BASENAME=$(basename "$FILE_PATH")
BASENAME_LOWER=$(echo "$BASENAME" | tr '[:upper:]' '[:lower:]')

block() {
  local reason="$1"
  echo "Blocked: $reason" >&2
  exit 2
}

# Block .env files (exact name or .env.* variants).
if [[ "$BASENAME_LOWER" == ".env" ]] || [[ "$BASENAME_LOWER" == .env.* ]]; then
  block "editing '$FILE_PATH' is not allowed (.env files may contain secrets)"
fi

# Block package lock files.
case "$BASENAME_LOWER" in
  package-lock.json|yarn.lock|pnpm-lock.yaml|composer.lock|gemfile.lock|poetry.lock)
    block "editing '$FILE_PATH' is not allowed (lock files should only be updated by the package manager)"
    ;;
esac

# Block anything inside a .git directory.
if [[ "$FILE_PATH" == *"/.git/"* ]] || [[ "$FILE_PATH" == .git/* ]]; then
  block "editing '$FILE_PATH' is not allowed (files inside .git/ must not be modified directly)"
fi

# Block paths containing "secret" or "credential" (case-insensitive).
if [[ "$FILE_LOWER" == *secret* ]] || [[ "$FILE_LOWER" == *credential* ]]; then
  block "editing '$FILE_PATH' is not allowed (path contains 'secret' or 'credential')"
fi

exit 0
