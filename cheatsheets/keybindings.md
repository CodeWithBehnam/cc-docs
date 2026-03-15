# Keybindings Cheatsheet

> Requires Claude Code v2.1.18+. Run `/keybindings` to open config file.

## Config File Location
`~/.claude/keybindings.json` — changes apply live without restart.

## Config File Structure

```json
{
  "$schema": "https://www.schemastore.org/claude-code-keybindings.json",
  "bindings": [
    {
      "context": "Chat",
      "bindings": {
        "ctrl+e": "chat:externalEditor",
        "ctrl+u": null
      }
    }
  ]
}
```

Set an action to `null` to unbind a default shortcut.

## Contexts

| Context | Where it applies |
|---|---|
| `Global` | Everywhere |
| `Chat` | Main chat input |
| `Autocomplete` | While autocomplete menu is open |
| `Confirmation` | Permission/confirmation dialogs |
| `Transcript` | Transcript viewer |
| `HistorySearch` | `Ctrl+R` history search mode |
| `Task` | While background task is running |
| `ThemePicker` | Theme picker dialog |
| `DiffDialog` | Diff viewer |
| `ModelPicker` | Model picker |
| `Settings` | Settings menu |

## Key Actions by Context

### Global
| Action | Default |
|---|---|
| `app:interrupt` | Ctrl+C |
| `app:exit` | Ctrl+D |
| `app:toggleTodos` | Ctrl+T |
| `app:toggleTranscript` | Ctrl+O |

### Chat
| Action | Default |
|---|---|
| `chat:submit` | Enter |
| `chat:cancel` | Escape |
| `chat:cycleMode` | Shift+Tab |
| `chat:modelPicker` | Cmd+P / Meta+P |
| `chat:thinkingToggle` | Cmd+T / Meta+T |
| `chat:externalEditor` | Ctrl+G |
| `chat:stash` | Ctrl+S |
| `chat:imagePaste` | Ctrl+V |

### History
| Action | Default |
|---|---|
| `history:search` | Ctrl+R |
| `history:previous` | Up |
| `history:next` | Down |

## Keystroke Syntax

```text
ctrl+k          # Single modifier + key
shift+tab       # Shift + Tab
meta+p          # Command/Meta + P
ctrl+shift+c    # Multiple modifiers
K               # Uppercase = shift+k
ctrl+k ctrl+s   # Chord (sequence)
```

Modifiers: `ctrl`/`control`, `alt`/`opt`/`option`, `shift`, `meta`/`cmd`/`command`

Special keys: `escape`, `enter`, `tab`, `space`, `up`, `down`, `left`, `right`, `backspace`, `delete`

## Reserved (Cannot Rebind)

| Shortcut | Reason |
|---|---|
| `Ctrl+C` | Hardcoded interrupt |
| `Ctrl+D` | Hardcoded exit |

## Terminal Conflicts

| Shortcut | Conflict |
|---|---|
| `Ctrl+B` | tmux prefix (press twice) |
| `Ctrl+A` | GNU screen prefix |
| `Ctrl+Z` | Unix process suspend |

## Vim Mode Interaction
- Vim mode handles text input; keybindings handle app actions — they are independent
- `Esc` in vim = switch INSERT→NORMAL (does NOT trigger `chat:cancel`)
- Most `Ctrl+key` shortcuts pass through vim mode to keybindings

## Validation
Run `/doctor` to see keybinding warnings (parse errors, invalid contexts, duplicates, reserved conflicts).

---
> Source: [keybindings.md](../keybindings.md)
