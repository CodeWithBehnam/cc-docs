# Terminal Config Cheatsheet

## Theme & Appearance

- Claude cannot control terminal theme — configure in your terminal app
- Match Claude Code UI theme: `/config`
- Add custom status bar: `/statusline` (see statusline cheatsheet)

## Line Breaks

| Method | Works in |
|---|---|
| `\` + Enter | All terminals |
| `Shift+Enter` | iTerm2, WezTerm, Ghostty, Kitty (native) |
| Keyboard shortcut | Set up manually in others |

**Auto-configure Shift+Enter** (VS Code, Alacritty, Zed, Warp):
```text
/terminal-setup
```
Only visible if your terminal requires configuration (not shown in iTerm2, WezTerm, Ghostty, Kitty).

**Option+Enter setup:**

- **Mac Terminal.app**: Settings → Profiles → Keyboard → check "Use Option as Meta Key"
- **iTerm2 / VS Code terminal**: Settings → Profiles → Keys → set Left/Right Option to "Esc+"

## Desktop Notifications

| Terminal | Support |
|---|---|
| Kitty, Ghostty | Native, no setup needed |
| iTerm2 | Settings → Profiles → Terminal → enable "Notification Center Alerts" + filter alerts |
| macOS Terminal, others | Not supported — use notification hooks instead |

Verify terminal app has notification permissions in OS settings.

For custom behavior (sound, Slack message, etc.): configure a [notification hook](/en/hooks#notification).

## Handling Large Inputs

- Avoid pasting very long content directly (can truncate, especially in VS Code terminal)
- Preferred: write content to a file, then ask Claude to read it
- VS Code terminal is most prone to truncation on long pastes

## Vim Mode

Enable: `/vim` or via `/config`

**Supported keys:**

| Category | Keys |
|---|---|
| Mode switching | `Esc` (NORMAL), `i`/`I`, `a`/`A`, `o`/`O` (INSERT) |
| Navigation | `h`/`j`/`k`/`l`, `w`/`e`/`b`, `0`/`$`/`^`, `gg`/`G`, `f`/`F`/`t`/`T` |
| Editing | `x`, `dw`/`de`/`db`/`dd`/`D`, `cw`/`ce`/`cb`/`cc`/`C`, `.` |
| Yank/paste | `yy`/`Y`, `yw`/`ye`/`yb`, `p`/`P` |
| Text objects | `iw`/`aw`, `i"`/`a"`, `i(`/`a(`, `i[`/`a[`, `i{`/`a{` |
| Indentation | `>>`/`<<` |
| Repeat navigation | `;`/`,` for `f`/`F`/`t`/`T` |
| Join lines | `J` |

---
> Source: [terminal-config.md](../terminal-config.md)
