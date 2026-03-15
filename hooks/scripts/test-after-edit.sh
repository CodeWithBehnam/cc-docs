#!/bin/bash
# test-after-edit.sh
# PostToolUse hook for Edit|Write tools.
# After a file is written, attempts to locate and run a related test file.
# Test file discovery rules:
#   foo.ts       -> foo.test.ts, foo.spec.ts  (same dir or __tests__/ sibling)
#   foo.js       -> foo.test.js, foo.spec.js
#   foo.tsx      -> foo.test.tsx, foo.spec.tsx
#   foo.py       -> test_foo.py, foo_test.py  (same dir or tests/ sibling)
#   foo.rb       -> foo_spec.rb               (same dir or spec/ sibling)
#   foo.go       -> foo_test.go               (same dir)
# Non-blocking: always exits 0 regardless of test results.

set -euo pipefail

INPUT=$(cat)
FILE_PATH=$(echo "$INPUT" | jq -r '.tool_input.file_path // empty')

if [ -z "$FILE_PATH" ] || [ ! -f "$FILE_PATH" ]; then
  exit 0
fi

DIR=$(dirname "$FILE_PATH")
BASENAME=$(basename "$FILE_PATH")
NAME="${BASENAME%.*}"
EXT="${BASENAME##*.}"

run_test() {
  local test_file="$1"
  local runner="$2"
  if [ -f "$test_file" ]; then
    echo "test-after-edit: running $test_file" >&2
    $runner "$test_file" 2>&1 >&2 || true
    return 0  # Found and attempted to run; stop searching.
  fi
  return 1
}

find_and_run_js_test() {
  local base_dir="$1"
  local name="$2"
  local ext="$3"

  # Check: <name>.test.<ext> and <name>.spec.<ext> in same dir.
  run_test "$base_dir/$name.test.$ext"  "npx jest --testPathPattern" && return 0
  run_test "$base_dir/$name.spec.$ext"  "npx jest --testPathPattern" && return 0

  # Check inside __tests__/ sibling directory.
  run_test "$base_dir/__tests__/$name.test.$ext" "npx jest --testPathPattern" && return 0
  run_test "$base_dir/__tests__/$name.spec.$ext" "npx jest --testPathPattern" && return 0

  return 1
}

case "$EXT" in
  ts|js|tsx|jsx|mjs)
    find_and_run_js_test "$DIR" "$NAME" "$EXT" || true
    ;;
  py)
    if command -v pytest &>/dev/null; then
      RUNNER="pytest -q"
    else
      RUNNER="python -m pytest -q"
    fi
    run_test "$DIR/test_${NAME}.py"   "$RUNNER" ||
    run_test "$DIR/${NAME}_test.py"   "$RUNNER" ||
    run_test "$DIR/../tests/test_${NAME}.py" "$RUNNER" || true
    ;;
  rb)
    if command -v rspec &>/dev/null; then
      run_test "$DIR/${NAME}_spec.rb"        "rspec" ||
      run_test "$DIR/../spec/${NAME}_spec.rb" "rspec" || true
    fi
    ;;
  go)
    # Go tests live alongside source files with _test.go suffix.
    run_test "$DIR/${NAME}_test.go" "go test" || true
    ;;
  *)
    # No test discovery configured for this file type.
    ;;
esac

exit 0
