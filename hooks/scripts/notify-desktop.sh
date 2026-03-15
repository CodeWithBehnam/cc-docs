#!/bin/bash
# notify-desktop.sh
# Notification hook. Sends a desktop notification when Claude Code needs attention.
# Cross-platform: macOS (osascript), Linux (notify-send), Windows (powershell).
# Exit codes: 0 = success (always non-blocking)

set -euo pipefail

INPUT=$(cat)

# Extract a human-readable title from the notification type, falling back to a default.
NOTIF_TYPE=$(echo "$INPUT" | jq -r '.notification_type // "idle_prompt"')

case "$NOTIF_TYPE" in
  permission_prompt)
    TITLE="Claude Code - Permission Required"
    MESSAGE="Claude Code is asking for your permission."
    ;;
  idle_prompt)
    TITLE="Claude Code - Waiting for Input"
    MESSAGE="Claude Code has finished and is waiting for your next prompt."
    ;;
  auth_success)
    TITLE="Claude Code - Authenticated"
    MESSAGE="Claude Code authentication was successful."
    ;;
  elicitation_dialog)
    TITLE="Claude Code - Input Needed"
    MESSAGE="Claude Code needs additional information from you."
    ;;
  *)
    TITLE="Claude Code"
    MESSAGE="Claude Code needs your attention."
    ;;
esac

OS="$(uname -s 2>/dev/null || echo 'Unknown')"

case "$OS" in
  Darwin)
    # macOS - use osascript
    if command -v osascript &>/dev/null; then
      osascript -e "display notification \"$MESSAGE\" with title \"$TITLE\"" 2>/dev/null || true
    fi
    ;;
  Linux)
    # Linux - use notify-send
    if command -v notify-send &>/dev/null; then
      notify-send "$TITLE" "$MESSAGE" 2>/dev/null || true
    else
      echo "notify-desktop: notify-send not found; install libnotify-bin" >&2
    fi
    ;;
  CYGWIN*|MINGW*|MSYS*|Windows_NT)
    # Windows - use PowerShell toast notification
    if command -v powershell.exe &>/dev/null; then
      powershell.exe -Command \
        "[System.Reflection.Assembly]::LoadWithPartialName('System.Windows.Forms') | Out-Null; \
         [System.Windows.Forms.MessageBox]::Show('$MESSAGE', '$TITLE')" \
        2>/dev/null || true
    fi
    ;;
  *)
    echo "notify-desktop: unsupported OS '$OS'" >&2
    ;;
esac

exit 0
