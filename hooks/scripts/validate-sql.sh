#!/bin/bash
# validate-sql.sh
# PreToolUse hook for the Bash tool.
# Inspects the command for SQL mutation keywords and blocks them.
# Allowed:  SELECT (read-only queries)
# Blocked:  INSERT, UPDATE, DELETE, DROP, CREATE, ALTER, TRUNCATE
# Exit codes: 0 = allow, 2 = block

set -euo pipefail

INPUT=$(cat)
COMMAND=$(echo "$INPUT" | jq -r '.tool_input.command // empty')

if [ -z "$COMMAND" ]; then
  exit 0
fi

block_sql() {
  local keyword="$1"
  echo "Blocked: SQL statement '$keyword' is not allowed. Only SELECT queries are permitted." >&2
  exit 2
}

# Check for dangerous SQL keywords (case-insensitive, whole-word match).
# Each keyword is checked individually so the block message can name the specific keyword.
if echo "$COMMAND" | grep -iqwE '\bINSERT\b'; then
  block_sql "INSERT"
fi

if echo "$COMMAND" | grep -iqwE '\bUPDATE\b'; then
  block_sql "UPDATE"
fi

if echo "$COMMAND" | grep -iqwE '\bDELETE\b'; then
  block_sql "DELETE"
fi

if echo "$COMMAND" | grep -iqwE '\bDROP\b'; then
  block_sql "DROP"
fi

if echo "$COMMAND" | grep -iqwE '\bCREATE\b'; then
  block_sql "CREATE"
fi

if echo "$COMMAND" | grep -iqwE '\bALTER\b'; then
  block_sql "ALTER"
fi

if echo "$COMMAND" | grep -iqwE '\bTRUNCATE\b'; then
  block_sql "TRUNCATE"
fi

exit 0
