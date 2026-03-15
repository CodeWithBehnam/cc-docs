# Status Line Cheatsheet

## What It Is

A customizable bar at the bottom of Claude Code that runs a shell script. The script receives JSON session data via stdin and prints whatever you want to display.

## Setup

**Quick (AI-generated):**
```text
/statusline show model name and context percentage with a progress bar
```

**Manual — add to `~/.claude/settings.json`:**
```json
{
  "statusLine": {
    "type": "command",
    "command": "~/.claude/statusline.sh",
    "padding": 2
  }
}
```

Make script executable: `chmod +x ~/.claude/statusline.sh`

**Inline (no script file):**
```json
{
  "statusLine": {
    "type": "command",
    "command": "jq -r '[\\(.model.display_name)] \\(.context_window.used_percentage // 0)% context'"
  }
}
```

**Disable:** `/statusline delete` or remove `statusLine` from settings.json

## Key JSON Fields (available via stdin)

| Field | Description |
|---|---|
| `model.display_name` | Current model name |
| `workspace.current_dir` | Current working directory |
| `workspace.project_dir` | Directory where Claude was launched |
| `context_window.used_percentage` | % of context used (preferred) |
| `context_window.remaining_percentage` | % remaining |
| `context_window.context_window_size` | Max tokens (200k or 1M) |
| `cost.total_cost_usd` | Session cost in USD |
| `cost.total_duration_ms` | Wall-clock time (ms) |
| `cost.total_lines_added/removed` | Lines changed |
| `vim.mode` | `NORMAL` or `INSERT` (when vim mode enabled) |
| `worktree.name`, `.branch` | Worktree info (worktree sessions only) |
| `session_id` | Unique session ID |
| `version` | Claude Code version |

Fields that may be absent: `vim`, `agent`, `worktree`
Fields that may be null: `context_window.current_usage`, `used_percentage` (before first API call)

## Minimal Script Template

```bash
#!/bin/bash
input=$(cat)
MODEL=$(echo "$input" | jq -r '.model.display_name')
PCT=$(echo "$input" | jq -r '.context_window.used_percentage // 0' | cut -d. -f1)
echo "[$MODEL] ${PCT}% context"
```

## Output Features

- **Multiple lines**: each `echo` = separate row
- **Colors**: ANSI codes like `\033[32m` (green), `\033[33m` (yellow), `\033[0m` (reset)
- **Clickable links**: OSC 8 sequences — requires iTerm2, Kitty, or WezTerm

## Update Behavior

- Runs after each assistant message, permission mode change, or vim mode toggle
- Debounced at 300ms
- Does not consume API tokens
- Hides during autocomplete, help menu, permission prompts

## Tips

- **Test your script**: `echo '{"model":{"display_name":"Opus"},"context_window":{"used_percentage":25}}' | ./statusline.sh`
- **Cache slow ops**: use `/tmp/statusline-git-cache` (fixed filename — not `$$` which changes each run)
- **Keep output short**: long output may truncate on narrow terminals
- Use `used_percentage` (not cumulative totals) for accurate context state

## Windows

```json
{
  "statusLine": {
    "type": "command",
    "command": "powershell -NoProfile -File C:/Users/username/.claude/statusline.ps1"
  }
}
```

## Troubleshooting

| Problem | Fix |
|---|---|
| Not appearing | Check `chmod +x`; verify stdout output; check `disableAllHooks` is not `true` |
| Shows `--` or empty | Fields null before first API call — use `// 0` fallbacks in jq |
| OSC 8 links not clickable | Requires iTerm2/Kitty/WezTerm; Terminal.app unsupported |
| Display glitches | Simplify to plain text output |
| Script hangs | Keep scripts fast; slow scripts block status line updates |

---
> Source: [statusline.md](../statusline.md)
