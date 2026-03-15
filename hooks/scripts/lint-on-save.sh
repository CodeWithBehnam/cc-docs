#!/bin/bash
# lint-on-save.sh
# PostToolUse hook for Edit|Write tools.
# Runs the appropriate linter after a file is written:
#   .ts/.js/.tsx/.jsx -> ESLint
#   .py               -> ruff
#   .rb               -> rubocop (lint only, no autocorrect)
# Non-blocking: always exits 0 so lint warnings never prevent Claude from continuing.

set -euo pipefail

INPUT=$(cat)
FILE_PATH=$(echo "$INPUT" | jq -r '.tool_input.file_path // empty')

if [ -z "$FILE_PATH" ]; then
  exit 0
fi

if [ ! -f "$FILE_PATH" ]; then
  exit 0
fi

EXT="${FILE_PATH##*.}"

case "$EXT" in
  ts|js|tsx|jsx|mjs|cjs)
    if command -v eslint &>/dev/null; then
      # Run ESLint and emit results to stderr so they appear in verbose mode.
      eslint --no-error-on-unmatched-pattern "$FILE_PATH" 2>&1 >&2 || true
    elif command -v npx &>/dev/null; then
      npx --no-install eslint --no-error-on-unmatched-pattern "$FILE_PATH" 2>&1 >&2 || true
    else
      echo "lint-on-save: eslint not found; skipping $FILE_PATH" >&2
    fi
    ;;
  py)
    if command -v ruff &>/dev/null; then
      ruff check "$FILE_PATH" 2>&1 >&2 || true
    else
      echo "lint-on-save: ruff not found; skipping $FILE_PATH" >&2
    fi
    ;;
  rb)
    if command -v rubocop &>/dev/null; then
      rubocop --no-color "$FILE_PATH" 2>&1 >&2 || true
    else
      echo "lint-on-save: rubocop not found; skipping $FILE_PATH" >&2
    fi
    ;;
  *)
    # No linter configured for this file type.
    ;;
esac

exit 0
