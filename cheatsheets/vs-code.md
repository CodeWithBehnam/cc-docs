# VS Code Cheatsheet

## Installation

- Requires VS Code 1.98.0+
- Install: `Cmd+Shift+X` / `Ctrl+Shift+X` → search "Claude Code"
- If extension doesn't appear: run "Developer: Reload Window" from Command Palette
- Reset all data: `rm -rf ~/.vscode/globalStorage/anthropic.claude-code`

## Opening Claude

| Method | How |
|---|---|
| Editor Toolbar | Spark icon (top-right, file must be open) |
| Activity Bar | Spark icon in left sidebar |
| Status Bar | Click "✱ Claude Code" (bottom-right, always visible) |
| Command Palette | `Cmd+Shift+P` → "Claude Code: Open in New Tab" |

## Keyboard Shortcuts

| Command | Mac | Windows/Linux |
|---|---|---|
| Toggle focus editor/Claude | `Cmd+Esc` | `Ctrl+Esc` |
| Open new tab | `Cmd+Shift+Esc` | `Ctrl+Shift+Esc` |
| New conversation | `Cmd+N` (Claude focused) | `Ctrl+N` |
| Insert @-mention | `Option+K` (editor focused) | `Alt+K` |
| Multi-line input | `Shift+Enter` | `Shift+Enter` |

## Prompt Box Features

- **Permission modes**: click mode indicator — `default` (ask), `plan`, `acceptEdits`, `bypassPermissions`
- **Command menu**: type `/` — attach files, switch models, toggle extended thinking, `/usage`, `/compact`
- **@-mentions**: type `@filename` for fuzzy file/folder matching; `@src/components/` (trailing slash for folders)
- **Selection context**: highlighted code auto-shared; `Option+K`/`Alt+K` inserts `@file#L5-10` reference
- **Attachments**: `Shift+drag` files into prompt box

## Extension Settings

| Setting | Default | Description |
|---|---|---|
| `selectedModel` | `default` | Model for new conversations |
| `useTerminal` | `false` | Launch as CLI instead of panel |
| `initialPermissionMode` | `default` | `default`, `plan`, `acceptEdits`, `bypassPermissions` |
| `preferredLocation` | `panel` | `sidebar` or `panel` |
| `autosave` | `true` | Auto-save before Claude reads/writes |
| `useCtrlEnterToSend` | `false` | Use Ctrl/Cmd+Enter to send |
| `respectGitIgnore` | `true` | Exclude .gitignore files |
| `allowDangerouslySkipPermissions` | `false` | Bypass all prompts (use with caution) |

- Add schema for autocomplete: `"$schema": "https://json.schemastore.org/claude-code-settings.json"` in `~/.claude/settings.json`

## Checkpointing (Rewind)

Hover over a message to reveal the rewind button:
- **Fork conversation from here** — new branch, keep code changes
- **Rewind code to here** — revert files, keep conversation
- **Fork conversation and rewind code** — new branch + revert files

## CLI vs Extension

| Feature | CLI | Extension |
|---|---|---|
| All `/` commands | Yes | Subset |
| `!` bash shortcut | Yes | No |
| Tab completion | Yes | No |
| Checkpoints | Yes | Yes |
| MCP server config | Full | Partial (add via CLI) |

- Run CLI in VS Code: `` Ctrl+` `` / `` Cmd+` `` then `claude`
- Connect external terminal: run `/ide` inside Claude Code
- Resume extension session in CLI: `claude --resume`
- Reference terminal output: `@terminal:name`

## MCP Servers

```bash
claude mcp add --transport http github https://api.githubcopilot.com/mcp/
```

Manage in-panel: type `/mcp`

## Git Worktrees

```bash
claude --worktree feature-auth
```

## Third-Party Providers (Bedrock, Vertex, Foundry)

1. Enable "Disable Login Prompt" in settings
2. Configure provider in `~/.claude/settings.json`

---
> Source: [vs-code.md](../vs-code.md)
