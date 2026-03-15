#!/bin/bash
# auto-format.sh
# PostToolUse hook for Edit|Write tools.
# Detects the edited file's type and runs the appropriate formatter.
# Supported: .ts/.js/.tsx/.jsx -> prettier, .py -> black, .go -> gofmt, .rb -> rubocop
# Exit codes: 0 = success (always non-blocking)

set -euo pipefail

INPUT=$(cat)
FILE_PATH=$(echo "$INPUT" | jq -r '.tool_input.file_path // empty')

if [ -z "$FILE_PATH" ]; then
  # No file path in input; nothing to format.
  exit 0
fi

if [ ! -f "$FILE_PATH" ]; then
  echo "auto-format: file not found: $FILE_PATH" >&2
  exit 0
fi

EXT="${FILE_PATH##*.}"

case "$EXT" in
  ts|js|tsx|jsx|mjs|cjs)
    if command -v prettier &>/dev/null; then
      prettier --write "$FILE_PATH" 2>&1 || true
    else
      echo "auto-format: prettier not found; skipping $FILE_PATH" >&2
    fi
    ;;
  py)
    if command -v black &>/dev/null; then
      black --quiet "$FILE_PATH" 2>&1 || true
    else
      echo "auto-format: black not found; skipping $FILE_PATH" >&2
    fi
    ;;
  go)
    if command -v gofmt &>/dev/null; then
      gofmt -w "$FILE_PATH" 2>&1 || true
    else
      echo "auto-format: gofmt not found; skipping $FILE_PATH" >&2
    fi
    ;;
  rb)
    if command -v rubocop &>/dev/null; then
      rubocop --autocorrect --no-color "$FILE_PATH" 2>&1 || true
    else
      echo "auto-format: rubocop not found; skipping $FILE_PATH" >&2
    fi
    ;;
  *)
    # Unsupported file type; do nothing.
    ;;
esac

exit 0
