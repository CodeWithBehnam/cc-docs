# JetBrains Cheatsheet

## Supported IDEs

IntelliJ IDEA, PyCharm, Android Studio, WebStorm, PhpStorm, GoLand

## Installation

1. Install [Claude Code plugin](https://plugins.jetbrains.com/plugin/27310-claude-code-beta-) from JetBrains Marketplace
2. Restart the IDE completely (may need to restart multiple times)
3. For Remote Development: install plugin on the **remote host** via Settings → Plugin (Host)

## Key Shortcuts

| Action | Mac | Windows/Linux |
|---|---|---|
| Open Claude Code | `Cmd+Esc` | `Ctrl+Esc` |
| Insert file reference | `Cmd+Option+K` | `Alt+Ctrl+K` |

File reference format: `@File#L1-99`

## Usage

**From integrated terminal:**
```bash
claude
```

**From external terminal** (connect to IDE):
```text
/ide
```

Start Claude from the same directory as your IDE project root for file access parity.

## Plugin Settings

Go to **Settings → Tools → Claude Code [Beta]**:

| Setting | Notes |
|---|---|
| Claude command | Custom path, e.g. `/usr/local/bin/claude` |
| Enable Option+Enter multi-line (macOS) | Disable if Option key captured unexpectedly |
| Enable automatic updates | Applied on restart |
| Suppress "command not found" notification | Skip missing-Claude warnings |

**WSL users:** set Claude command to `wsl -d Ubuntu -- bash -lic "claude"` (replace `Ubuntu` with your distro)

## Fix ESC Key Not Interrupting

**Settings → Tools → Terminal**, then either:
- Uncheck "Move focus to the editor with Escape", or
- Click "Configure terminal keybindings" → delete "Switch focus to Editor"

## Diff Tool Configuration

```text
claude → /config → set diff tool to "auto"
```

This enables automatic IDE diff viewer detection.

## Features

- **Diff viewing**: changes shown in IDE diff viewer (not terminal)
- **Selection context**: current selection/tab auto-shared with Claude
- **Diagnostic sharing**: lint/syntax errors auto-shared as you work

## Troubleshooting

| Issue | Fix |
|---|---|
| Plugin not working | Run from project root; restart IDE; check plugin enabled |
| IDE not detected | Restart IDE; run from integrated terminal |
| "Command not found" icon | Verify with `npm list -g @anthropic-ai/claude-code`; configure path in settings |
| WSL IDE not detected | See WSL troubleshooting guide |

## Security Note

With auto-edit permissions, Claude can modify IDE config files that execute automatically. Use manual approval mode with untrusted code.

---
> Source: [jetbrains.md](../jetbrains.md)
