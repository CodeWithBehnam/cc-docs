#!/bin/bash
# log-tool-usage.sh
# PostToolUse hook (no matcher - fires for every tool).
# Appends a JSON line to ~/.claude/tool-usage.log containing:
#   - timestamp (ISO 8601)
#   - session_id
#   - tool_name
#   - file_path (if present, for Edit/Write/Read tools)
#   - command (if present, for the Bash tool)
# Non-blocking: always exits 0.

set -euo pipefail

LOG_DIR="$HOME/.claude"
LOG_FILE="$LOG_DIR/tool-usage.log"

# Ensure the log directory exists.
mkdir -p "$LOG_DIR"

INPUT=$(cat)

# Build a JSON log entry using jq. Omit null fields gracefully.
jq -c '{
  timestamp: (now | todate),
  session_id: (.session_id // null),
  tool_name:  (.tool_name  // null),
  file_path:  (.tool_input.file_path // null),
  command:    (.tool_input.command   // null)
} | with_entries(select(.value != null))' <<< "$INPUT" >> "$LOG_FILE" 2>/dev/null || {
  # If jq fails (e.g., malformed input), write a minimal fallback entry.
  echo "{\"timestamp\":\"$(date -u +%Y-%m-%dT%H:%M:%SZ)\",\"error\":\"failed to parse hook input\"}" >> "$LOG_FILE" || true
}

exit 0
