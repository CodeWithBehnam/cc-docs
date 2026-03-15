# Hooks Cheatsheet

## Hook Events

| Event | When it fires | Supports matcher |
| :--- | :--- | :--- |
| `SessionStart` | Session begins/resumes | Yes (`startup`, `resume`, `clear`, `compact`) |
| `UserPromptSubmit` | Before Claude processes prompt | No |
| `PreToolUse` | Before tool executes — can block | Yes (tool name) |
| `PermissionRequest` | Permission dialog appears | Yes (tool name) |
| `PostToolUse` | After tool succeeds | Yes (tool name) |
| `PostToolUseFailure` | After tool fails | Yes (tool name) |
| `Stop` | Claude finishes responding | No |
| `Notification` | Claude sends notification | Yes (notification type) |
| `SubagentStart` / `SubagentStop` | Subagent spawns/finishes | Yes (agent type) |
| `TeammateIdle` / `TaskCompleted` | Agent team events | No |
| `ConfigChange` | Config file changes | Yes (`user_settings`, `project_settings`, etc.) |
| `PreCompact` / `PostCompact` | Before/after context compaction | Yes (`manual`, `auto`) |
| `SessionEnd` | Session terminates | Yes (reason) |
| `WorktreeCreate` / `WorktreeRemove` | Worktree lifecycle | No |
| `Elicitation` / `ElicitationResult` | MCP server requests user input | No |
| `InstructionsLoaded` | CLAUDE.md file loaded | No |

## Hook Types

| Type | Description |
| :--- | :--- |
| `command` | Run a shell command; input on stdin, output via exit code + stdout |
| `http` | POST event JSON to an HTTP endpoint |
| `prompt` | Single-turn LLM evaluation (Haiku by default); returns `{"ok": true/false}` |
| `agent` | Subagent with tool access (Read, Grep, etc.); 60s timeout, 50 turns |

## Exit Codes (command hooks)

| Code | Meaning |
| :--- | :--- |
| `0` | Allow; stdout injected into Claude's context (for `SessionStart`, `UserPromptSubmit`) |
| `2` | Block; stderr message fed back to Claude as feedback |
| other | Allow; stderr logged but not shown to Claude (visible in verbose mode `Ctrl+O`) |

## Structured JSON Output (exit 0)

```json
{
  "hookSpecificOutput": {
    "hookEventName": "PreToolUse",
    "permissionDecision": "deny",
    "permissionDecisionReason": "Use rg instead of grep"
  }
}
```

- `PreToolUse` decisions: `"allow"` | `"deny"` | `"ask"`
- `PostToolUse` / `Stop`: use `{"decision": "block"}`
- `prompt`/`agent` hooks: `{"ok": false, "reason": "..."}`

## Configuration Structure

```json
{
  "hooks": {
    "PostToolUse": [
      {
        "matcher": "Edit|Write",
        "hooks": [
          { "type": "command", "command": "npx prettier --write $(jq -r '.tool_input.file_path')" }
        ]
      }
    ]
  }
}
```

## Hook Locations (scope)

| File | Scope |
| :--- | :--- |
| `~/.claude/settings.json` | All projects (personal) |
| `.claude/settings.json` | Project (committable) |
| `.claude/settings.local.json` | Project (gitignored) |
| Plugin `hooks/hooks.json` | When plugin enabled |
| Skill/agent frontmatter | While component active |

## Common Hook Fields

| Field | Description |
| :--- | :--- |
| `type` | `command`, `http`, `prompt`, `agent` |
| `timeout` | Seconds; defaults: 600 (cmd), 30 (prompt), 60 (agent) |
| `statusMessage` | Custom spinner text |
| `async` | `true` = run in background (command only) |

## MCP Tool Matcher Pattern

```
mcp__<server>__<tool>
mcp__memory__.*        # all tools from memory server
mcp__.*__write.*       # any write tool from any server
```

## Troubleshooting

- Hook not firing? Check `/hooks` menu; matchers are case-sensitive
- "command not found"? Use absolute paths or `$CLAUDE_PROJECT_DIR`
- Infinite loop on Stop hook? Check `stop_hook_active` field and exit early if `true`
- JSON parse error? Wrap shell profile `echo` in `if [[ $- == *i* ]]; then ... fi`
- Debug: `Ctrl+O` (verbose mode) or `claude --debug`

---
> Source: [hooks.md](../hooks.md)
