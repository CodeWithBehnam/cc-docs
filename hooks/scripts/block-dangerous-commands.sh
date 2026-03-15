#!/bin/bash
# block-dangerous-commands.sh
# PreToolUse hook for the Bash tool.
# Blocks shell commands that are irreversibly destructive or unsafe:
#   - rm -rf with root or home targets
#   - SQL DROP TABLE / DROP DATABASE
#   - git push --force to main or master
#   - Piping curl or wget output directly to bash/sh (arbitrary remote code execution)
# Exit codes: 0 = allow, 2 = block

set -euo pipefail

INPUT=$(cat)
COMMAND=$(echo "$INPUT" | jq -r '.tool_input.command // empty')

if [ -z "$COMMAND" ]; then
  exit 0
fi

block() {
  local reason="$1"
  echo "Blocked: $reason" >&2
  exit 2
}

# Block rm -rf / (root filesystem wipe) or rm -rf ~/ (home directory wipe).
if echo "$COMMAND" | grep -qE 'rm\s+(-\w*r\w*f|-\w*f\w*r)\s+(\/|~\/?\s*$|~\s)'; then
  block "rm -rf with a root or home directory target is not allowed"
fi

# Block rm -rf with an explicit / or /* argument anywhere in the command.
if echo "$COMMAND" | grep -qE 'rm\s+.*-[a-zA-Z]*r[a-zA-Z]*f.*\s+(\/\s*$|\/\*|\/\s+)'; then
  block "rm -rf / or rm -rf /* is not allowed"
fi

# Block SQL DROP TABLE and DROP DATABASE (case-insensitive).
if echo "$COMMAND" | grep -iqE '\bDROP\s+(TABLE|DATABASE)\b'; then
  block "DROP TABLE and DROP DATABASE statements are not allowed"
fi

# Block git push --force (or -f) targeting main or master.
if echo "$COMMAND" | grep -qE 'git\s+push\b.*-(-force|-f\b)' && \
   echo "$COMMAND" | grep -qE '\b(main|master)\b'; then
  block "git push --force to main or master is not allowed"
fi

# Block piping curl output directly to bash or sh (remote code execution pattern).
if echo "$COMMAND" | grep -qE '\bcurl\b.+\|\s*(bash|sh)\b'; then
  block "piping curl output to bash/sh is not allowed (arbitrary remote code execution risk)"
fi

# Block piping wget output directly to bash or sh.
if echo "$COMMAND" | grep -qE '\bwget\b.+\|\s*(bash|sh)\b'; then
  block "piping wget output to bash/sh is not allowed (arbitrary remote code execution risk)"
fi

exit 0
