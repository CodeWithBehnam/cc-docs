# Hooks Template Reference

Use this template when creating new Claude Code hooks. Copy the appropriate section below and customize it for the specific use case.

For full documentation, see `hooks.md` (reference) and `hooks-guide.md` (practical guide) in the cc-docs folder.

---

## Where to Configure Hooks

| Location                          | Scope              | Shareable |
|-----------------------------------|--------------------|-----------|
| `~/.claude/settings.json`        | All your projects  | No        |
| `.claude/settings.json`          | Single project     | Yes (git) |
| `.claude/settings.local.json`    | Single project     | No        |
| Managed policy settings           | Organization-wide  | Yes       |
| Skill/agent frontmatter           | While active       | Yes       |

Use `/hooks` in Claude Code for interactive setup. Manual edits require session restart.

---

## Hook Events Reference

| Event                | When it fires                          | Matcher filters          | Can block? |
|----------------------|----------------------------------------|--------------------------|------------|
| `SessionStart`       | Session begins/resumes                 | `startup`, `resume`, `clear`, `compact` | No |
| `UserPromptSubmit`   | User submits a prompt                  | (no matcher)             | Yes (exit 2) |
| `PreToolUse`         | Before tool executes                   | Tool name                | Yes (exit 2 or JSON) |
| `PermissionRequest`  | Permission dialog appears              | Tool name                | Yes (JSON) |
| `PostToolUse`        | After tool succeeds                    | Tool name                | Yes (JSON block) |
| `PostToolUseFailure` | After tool fails                       | Tool name                | No |
| `Notification`       | Claude needs attention                 | Notification type        | No |
| `SubagentStart`      | Subagent spawns                        | Agent type name          | No |
| `SubagentStop`       | Subagent finishes                      | Agent type name          | No |
| `Stop`               | Claude finishes responding             | (no matcher)             | Yes (JSON block) |
| `TeammateIdle`       | Team teammate goes idle                | (no matcher)             | No |
| `TaskCompleted`      | Task marked completed                  | (no matcher)             | Yes |
| `ConfigChange`       | Config file changes                    | Config source            | Yes (exit 2 or JSON) |
| `PreCompact`         | Before context compaction              | `manual`, `auto`         | No |
| `SessionEnd`         | Session terminates                     | End reason               | No |
| `WorktreeCreate`     | Worktree being created                 | (no matcher)             | No |
| `WorktreeRemove`     | Worktree being removed                 | (no matcher)             | No |

---

## Hook Types

### Command Hook (deterministic)

```json
{
  "type": "command",
  "command": "./scripts/my-hook.sh",
  "timeout": 60
}
```

### Prompt Hook (LLM judgment, single-turn)

```json
{
  "type": "prompt",
  "prompt": "Check if <condition>. Respond with {\"ok\": true} or {\"ok\": false, \"reason\": \"...\"}.",
  "model": "haiku"
}
```

### Agent Hook (LLM with tool access, multi-turn)

```json
{
  "type": "agent",
  "prompt": "Verify <condition> by <inspecting/running>. $ARGUMENTS",
  "timeout": 120
}
```

---

## Exit Codes (Command Hooks)

| Exit Code | Behavior                                                      |
|-----------|---------------------------------------------------------------|
| `0`       | Action proceeds. Stdout added to context (SessionStart, UserPromptSubmit) |
| `2`       | Action BLOCKED. Stderr sent to Claude as feedback             |
| Other     | Action proceeds. Stderr logged (visible in verbose mode)      |

---

## Hook Input (stdin JSON)

Every hook receives JSON on stdin with common fields:

```json
{
  "session_id": "abc123",
  "cwd": "/path/to/project",
  "hook_event_name": "PreToolUse",
  "tool_name": "Bash",
  "tool_input": {
    "command": "npm test"
  }
}
```

Fields vary by event. Use `jq` to extract what you need:

```bash
INPUT=$(cat)
COMMAND=$(echo "$INPUT" | jq -r '.tool_input.command // empty')
FILE_PATH=$(echo "$INPUT" | jq -r '.tool_input.file_path // empty')
```

---

## Template 1: Auto-Format After Edits (PostToolUse)

Runs a formatter on every file Claude edits.

```json
{
  "hooks": {
    "PostToolUse": [
      {
        "matcher": "Edit|Write",
        "hooks": [
          {
            "type": "command",
            "command": "jq -r '.tool_input.file_path' | xargs <formatter> --write"
          }
        ]
      }
    ]
  }
}
```

**Common formatters:**

| Language   | Command                                         |
|------------|------------------------------------------------|
| JS/TS      | `npx prettier --write`                         |
| Python     | `ruff format` or `black`                       |
| Go         | `gofmt -w`                                     |
| Rust       | `rustfmt`                                      |
| General    | `npx prettier --write`                         |

---

## Template 2: Block Edits to Protected Files (PreToolUse)

Prevent Claude from modifying sensitive files.

**Settings JSON:**

```json
{
  "hooks": {
    "PreToolUse": [
      {
        "matcher": "Edit|Write",
        "hooks": [
          {
            "type": "command",
            "command": "\"$CLAUDE_PROJECT_DIR\"/.claude/hooks/protect-files.sh"
          }
        ]
      }
    ]
  }
}
```

**Script** (`.claude/hooks/protect-files.sh`):

```bash
#!/bin/bash
INPUT=$(cat)
FILE_PATH=$(echo "$INPUT" | jq -r '.tool_input.file_path // empty')

PROTECTED_PATTERNS=(
  ".env"
  "package-lock.json"
  ".git/"
  "<add-more-patterns>"
)

for pattern in "${PROTECTED_PATTERNS[@]}"; do
  if [[ "$FILE_PATH" == *"$pattern"* ]]; then
    echo "Blocked: $FILE_PATH matches protected pattern '$pattern'" >&2
    exit 2
  fi
done

exit 0
```

Remember: `chmod +x .claude/hooks/protect-files.sh`

---

## Template 3: Block Dangerous Bash Commands (PreToolUse)

Prevent destructive shell commands.

**Settings JSON:**

```json
{
  "hooks": {
    "PreToolUse": [
      {
        "matcher": "Bash",
        "hooks": [
          {
            "type": "command",
            "command": "\"$CLAUDE_PROJECT_DIR\"/.claude/hooks/block-dangerous.sh"
          }
        ]
      }
    ]
  }
}
```

**Script** (`.claude/hooks/block-dangerous.sh`):

```bash
#!/bin/bash
INPUT=$(cat)
COMMAND=$(echo "$INPUT" | jq -r '.tool_input.command // empty')

# Block dangerous patterns
BLOCKED_PATTERNS=(
  "rm -rf /"
  "drop table"
  "DROP TABLE"
  "format c:"
  "<add-more-patterns>"
)

for pattern in "${BLOCKED_PATTERNS[@]}"; do
  if [[ "$COMMAND" == *"$pattern"* ]]; then
    echo "BLOCKED: Command contains dangerous pattern '$pattern'" >&2
    exit 2
  fi
done

exit 0
```

---

## Template 4: Desktop Notification (Notification)

Get notified when Claude needs your attention.

**macOS:**

```json
{
  "hooks": {
    "Notification": [
      {
        "matcher": "",
        "hooks": [
          {
            "type": "command",
            "command": "osascript -e 'display notification \"Claude Code needs your attention\" with title \"Claude Code\"'"
          }
        ]
      }
    ]
  }
}
```

**Linux:**

```json
{
  "hooks": {
    "Notification": [
      {
        "matcher": "",
        "hooks": [
          {
            "type": "command",
            "command": "notify-send 'Claude Code' 'Claude Code needs your attention'"
          }
        ]
      }
    ]
  }
}
```

---

## Template 5: Re-inject Context After Compaction (SessionStart)

Re-inject critical info when context is compacted.

```json
{
  "hooks": {
    "SessionStart": [
      {
        "matcher": "compact",
        "hooks": [
          {
            "type": "command",
            "command": "echo 'Reminder: <critical project rules>. Current task: <context>.'"
          }
        ]
      }
    ]
  }
}
```

For dynamic context, replace `echo` with a script:

```json
{
  "command": "\"$CLAUDE_PROJECT_DIR\"/.claude/hooks/inject-context.sh"
}
```

```bash
#!/bin/bash
# inject-context.sh — outputs text that gets added to Claude's context
echo "## Project Reminders"
echo "- Use bun, not npm"
echo "- Run tests before committing"
echo ""
echo "## Recent Changes"
git log --oneline -5
echo ""
echo "## Current Branch"
git branch --show-current
```

---

## Template 6: Audit/Log Tool Usage (PostToolUse)

Log all commands Claude runs for audit trail.

```json
{
  "hooks": {
    "PostToolUse": [
      {
        "matcher": "Bash",
        "hooks": [
          {
            "type": "command",
            "command": "jq -r '.tool_input.command' >> ~/.claude/command-log.txt"
          }
        ]
      }
    ]
  }
}
```

---

## Template 7: Enforce Tool Preference (PreToolUse with JSON)

Redirect Claude to use a preferred tool instead.

```json
{
  "hooks": {
    "PreToolUse": [
      {
        "matcher": "Bash",
        "hooks": [
          {
            "type": "command",
            "command": "\"$CLAUDE_PROJECT_DIR\"/.claude/hooks/enforce-tools.sh"
          }
        ]
      }
    ]
  }
}
```

**Script:**

```bash
#!/bin/bash
INPUT=$(cat)
COMMAND=$(echo "$INPUT" | jq -r '.tool_input.command // empty')

# Block grep in favor of Grep tool
if echo "$COMMAND" | grep -qE '^grep |^grep$'; then
  cat <<'JSON'
{
  "hookSpecificOutput": {
    "hookEventName": "PreToolUse",
    "permissionDecision": "deny",
    "permissionDecisionReason": "Use the built-in Grep tool instead of grep command for better performance."
  }
}
JSON
  exit 0
fi

exit 0
```

---

## Template 8: Task Completion Verification (Stop — Prompt Hook)

Use LLM to verify all tasks are complete before Claude stops.

```json
{
  "hooks": {
    "Stop": [
      {
        "hooks": [
          {
            "type": "prompt",
            "prompt": "Check if all requested tasks are complete. If not, respond with {\"ok\": false, \"reason\": \"description of remaining work\"}."
          }
        ]
      }
    ]
  }
}
```

---

## Template 9: Test Verification (Stop — Agent Hook)

Run tests before allowing Claude to finish.

```json
{
  "hooks": {
    "Stop": [
      {
        "hooks": [
          {
            "type": "agent",
            "prompt": "Run the test suite and verify all tests pass. If any fail, respond with {\"ok\": false, \"reason\": \"failing tests details\"}. $ARGUMENTS",
            "timeout": 120
          }
        ]
      }
    ]
  }
}
```

---

## Template 10: Config Change Audit (ConfigChange)

Track configuration changes for compliance.

```json
{
  "hooks": {
    "ConfigChange": [
      {
        "matcher": "",
        "hooks": [
          {
            "type": "command",
            "command": "jq -c '{timestamp: now | todate, source: .source, file: .file_path}' >> ~/claude-config-audit.log"
          }
        ]
      }
    ]
  }
}
```

---

## Matcher Quick Reference

| Event                                           | What matcher filters        | Example values                          |
|-------------------------------------------------|-----------------------------|-----------------------------------------|
| `PreToolUse`, `PostToolUse`, `PermissionRequest`| Tool name                   | `Bash`, `Edit\|Write`, `mcp__.*`        |
| `SessionStart`                                  | How session started          | `startup`, `resume`, `compact`          |
| `SessionEnd`                                    | Why session ended            | `clear`, `logout`, `other`              |
| `Notification`                                  | Notification type            | `permission_prompt`, `idle_prompt`      |
| `SubagentStart/Stop`                            | Agent type name              | `Explore`, `Plan`, custom agent names   |
| `ConfigChange`                                  | Config source                | `user_settings`, `project_settings`     |
| `PreCompact`                                    | Compaction trigger           | `manual`, `auto`                        |

Matchers support regex: `Edit|Write`, `mcp__github__.*`, `Bash`

---

## Debugging Hooks

- Toggle verbose mode: `Ctrl+O` — shows hook output in transcript
- Full debug: `claude --debug` — shows which hooks matched and exit codes
- Test manually:

```bash
echo '{"tool_name":"Bash","tool_input":{"command":"ls"}}' | ./my-hook.sh
echo $?
```

---

## Common Pitfalls

- **Hook not firing**: Check matcher is case-sensitive and matches tool name exactly
- **JSON parse error**: Shell profile `echo` statements pollute stdout — wrap in `if [[ $- == *i* ]]`
- **Stop hook loops**: Check `stop_hook_active` field and exit 0 if true
- **Script not running**: Ensure `chmod +x` on all hook scripts
- **`jq` not found**: Install with `brew install jq` (macOS) or `apt-get install jq` (Linux)

---

## Checklist Before Deploying

- [ ] Hook script is executable (`chmod +x`)
- [ ] Tested with sample JSON input piped to stdin
- [ ] Exit codes are correct (0 = proceed, 2 = block)
- [ ] Stderr messages are informative (Claude uses them as feedback)
- [ ] No unconditional `echo` in shell profile that could corrupt JSON output
- [ ] Matcher pattern tested against actual tool names
- [ ] Timeout set appropriately (default: 10 min)
- [ ] Stop hooks check `stop_hook_active` to prevent infinite loops
- [ ] Settings file is valid JSON (no trailing commas)
