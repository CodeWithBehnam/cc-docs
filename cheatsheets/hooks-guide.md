# Hooks Guide Cheatsheet

## What Hooks Do

Hooks run shell commands, HTTP requests, or LLM prompts automatically at lifecycle points. They provide **deterministic** control — always run, not LLM-decided.

## Quick Setup

1. Edit `~/.claude/settings.json` (global) or `.claude/settings.json` (project)
2. Add a `hooks` block
3. Run `/hooks` to verify — it's read-only; edit files directly to change hooks
4. Reload: edits require opening `/hooks` or restarting the session

## Common Patterns

### Desktop notification when Claude needs input
```json
{ "hooks": { "Notification": [{ "matcher": "", "hooks": [
  { "type": "command", "command": "notify-send 'Claude Code' 'Needs attention'" }
]}]}}
```
macOS: `osascript -e 'display notification "..." with title "..."'`
Windows: `powershell.exe -Command "[...MessageBox]::Show(...)"`

### Auto-format after edits
```json
{ "hooks": { "PostToolUse": [{ "matcher": "Edit|Write", "hooks": [
  { "type": "command", "command": "jq -r '.tool_input.file_path' | xargs npx prettier --write" }
]}]}}
```

### Block edits to protected files (exit code 2)
```bash
#!/bin/bash
FILE_PATH=$(cat | jq -r '.tool_input.file_path // empty')
if [[ "$FILE_PATH" == *".env"* ]]; then
  echo "Blocked: .env is protected" >&2; exit 2
fi
```
Hook config: `{ "type": "command", "command": "\"$CLAUDE_PROJECT_DIR\"/.claude/hooks/protect.sh" }`

### Re-inject context after compaction
```json
{ "hooks": { "SessionStart": [{ "matcher": "compact", "hooks": [
  { "type": "command", "command": "echo 'Use Bun not npm. Current sprint: auth refactor.'" }
]}]}}
```

### Audit config changes
```json
{ "hooks": { "ConfigChange": [{ "matcher": "", "hooks": [
  { "type": "command", "command": "jq -c '{time: now|todate, file: .file_path}' >> ~/audit.log" }
]}]}}
```

## Hook Events Quick Reference

| Event | Fires when | Can block? |
| :--- | :--- | :--- |
| `SessionStart` | Session begins/resumes/compacts | No (stdout adds context) |
| `UserPromptSubmit` | You submit a prompt | No (stdout adds context) |
| `PreToolUse` | Before tool executes | Yes (exit 2 or JSON deny) |
| `PostToolUse` | After tool succeeds | Yes (JSON block) |
| `Stop` | Claude finishes responding | Yes (JSON block) |
| `Notification` | Claude needs attention | No |
| `ConfigChange` | Config file changes | Yes (exit 2) |

## Matcher Reference

| Events | Matches on |
| :--- | :--- |
| `PreToolUse`, `PostToolUse`, `PermissionRequest` | Tool name: `Bash`, `Edit\|Write`, `mcp__.*` |
| `SessionStart` | Start reason: `startup`, `resume`, `clear`, `compact` |
| `SessionEnd` | End reason: `clear`, `logout`, `prompt_input_exit`, `other` |
| `Notification` | Type: `permission_prompt`, `idle_prompt`, `auth_success` |
| `ConfigChange` | Source: `user_settings`, `project_settings`, `skills` |

## Prompt-based Hooks

Use when judgment (not rules) is needed:
```json
{ "hooks": { "Stop": [{ "hooks": [
  { "type": "prompt", "prompt": "Check all tasks are done. If not: {\"ok\": false, \"reason\": \"what's missing\"}" }
]}]}}
```
Model returns `{"ok": true}` to allow or `{"ok": false, "reason": "..."}` to block.

## Agent-based Hooks

For verification requiring file inspection or commands:
```json
{ "type": "agent", "prompt": "Verify tests pass. $ARGUMENTS", "timeout": 120 }
```
Agent has 50 tool-use turns, 60s default timeout.

## HTTP Hooks

```json
{ "type": "http", "url": "http://localhost:8080/hooks",
  "headers": { "Authorization": "Bearer $MY_TOKEN" },
  "allowedEnvVars": ["MY_TOKEN"] }
```
Return 2xx + JSON body to block; HTTP status codes alone cannot block.

---
> Source: [hooks-guide.md](../hooks-guide.md)
