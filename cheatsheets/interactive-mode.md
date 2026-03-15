# Interactive Mode Cheatsheet

## General Controls

| Shortcut | Action |
|---|---|
| `Ctrl+C` | Cancel current input or generation |
| `Ctrl+D` | Exit Claude Code |
| `Ctrl+G` | Open in default text editor |
| `Ctrl+L` | Clear terminal screen (keeps history) |
| `Ctrl+O` | Toggle verbose output |
| `Ctrl+R` | Reverse search command history |
| `Ctrl+V` / `Cmd+V` | Paste image from clipboard |
| `Ctrl+B` | Background running task (tmux: press twice) |
| `Ctrl+T` | Toggle task list |
| `Ctrl+F` | Kill all background agents (press twice to confirm) |
| `Esc`+`Esc` | Rewind/summarize conversation |
| `Shift+Tab` | Cycle permission modes (Auto-Accept / Plan / Normal) |
| `Option+P` / `Alt+P` | Switch model |
| `Option+T` / `Alt+T` | Toggle extended thinking |

## Text Editing

| Shortcut | Action |
|---|---|
| `Ctrl+K` | Delete to end of line |
| `Ctrl+U` | Delete entire line |
| `Ctrl+Y` | Paste deleted text |
| `Alt+B` | Move cursor back one word |
| `Alt+F` | Move cursor forward one word |

> macOS: Alt shortcuts require Option as Meta (iTerm2/Terminal.app settings)

## Multiline Input

| Method | Shortcut |
|---|---|
| Quick (all terminals) | `\` + `Enter` |
| macOS default | `Option+Enter` |
| Shift+Enter | Works natively in iTerm2, WezTerm, Ghostty, Kitty |
| Control sequence | `Ctrl+J` |

Run `/terminal-setup` to enable Shift+Enter in VS Code, Alacritty, Zed, Warp.

## Quick Prefixes

| Prefix | Effect |
|---|---|
| `/` | Command or skill |
| `!` | Run bash directly (adds output to context) |
| `@` | File path autocomplete |

## Bash Mode (`!` prefix)

```bash
! npm test
! git status
! ls -la
```
- Output added to conversation context
- Press `Ctrl+B` to background long-running commands
- `Tab` for history-based autocomplete

## Side Questions (`/btw`)

```text
/btw what was the name of that config file again?
```
- Ask without polluting conversation history
- Available while Claude is working
- No tool access — answers from existing context only
- Single response only; dismiss with `Space`, `Enter`, or `Esc`

## Task List
- `Ctrl+T` — toggle task list view (up to 10 tasks shown)
- Ask Claude: `"show me all tasks"` or `"clear all tasks"`
- Persist across sessions: `CLAUDE_CODE_TASK_LIST_ID=my-project claude`

## Vim Mode

Enable: `/vim` or via `/config`

| Mode switch | Key |
|---|---|
| INSERT → NORMAL | `Esc` |
| NORMAL → insert before | `i` |
| NORMAL → insert after | `a` |
| NORMAL → new line below | `o` |

Navigation (NORMAL): `h/j/k/l`, `w/e/b`, `0/$`, `gg/G`, `f{char}`

Editing (NORMAL): `x` delete char, `dd` delete line, `yy` yank, `p` paste, `.` repeat

## PR Status in Footer
- Shows PR link with color: green=approved, yellow=pending, red=changes-requested
- `Cmd+click` / `Ctrl+click` to open in browser
- Requires `gh` CLI authenticated

---
> Source: [interactive-mode.md](../interactive-mode.md)
