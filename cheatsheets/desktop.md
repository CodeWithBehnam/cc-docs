# Claude Code Desktop Cheatsheet

## Overview

The **Code tab** in Claude Desktop provides a graphical interface for Claude Code.
Available on macOS and Windows (not Linux). Requires Pro, Max, Teams, or Enterprise.

## Session Setup (4 things to configure)

| Setting | Options |
|---|---|
| Environment | Local / Remote (cloud) / SSH |
| Project folder | Select folder or repo |
| Model | Sonnet / Opus / Haiku (locked after start) |
| Permission mode | Ask / Auto accept edits / Plan / Bypass |

## Permission Modes

| Mode | Settings key | Behavior |
|---|---|---|
| Ask permissions | `default` | Asks before every edit or command |
| Auto accept edits | `acceptEdits` | Auto-accepts file edits; asks before commands |
| Plan mode | `plan` | Reads/analyzes only, no changes |
| Bypass permissions | `bypassPermissions` | No prompts (sandboxed env only) |

## Working with Code

- **Interrupt**: click stop or type correction and press Enter at any time
- **@mention files**: type `@filename` to add file to context
- **Attach files**: drag-and-drop images/PDFs into prompt box
- **Diff view**: click `+12 -1` indicator to review changes file by file
- **Comment on diffs**: click any diff line to add inline comments; submit all with `Cmd+Enter` / `Ctrl+Enter`
- **Code review**: click **Review code** in diff toolbar for high-signal issue analysis

## App Preview

- Claude auto-starts dev server after file edits
- Config stored in `.claude/launch.json`
- **Auto-verify**: Claude takes screenshots, checks DOM, fixes issues automatically (on by default)
- Disable per-project: add `"autoVerify": false` to `.claude/launch.json`

### launch.json Fields

| Field | Description |
|---|---|
| `name` | Server identifier |
| `runtimeExecutable` | Command (`npm`, `yarn`, `node`) |
| `runtimeArgs` | Args (`["run", "dev"]`) |
| `port` | Default 3000 |
| `cwd` | Relative to project root |
| `env` | Extra env vars (no secrets) |
| `autoPort` | `true` = find free port; `false` = fail if busy |

## Parallel Sessions

- Click **+ New session** in sidebar
- Each session gets its own Git worktree automatically
- Worktrees stored in `<project-root>/.claude/worktrees/` (configurable)
- Archive a session: hover in sidebar → archive icon

## PR Monitoring

- Requires `gh` CLI installed and authenticated
- **Auto-fix**: Claude fixes failing CI checks automatically
- **Auto-merge**: merges when all checks pass (squash; requires repo setting enabled)
- Desktop sends notification when CI finishes

## SSH Sessions

Settings → environment dropdown → **+ Add SSH connection**:
- SSH Host: `user@hostname` or `~/.ssh/config` alias
- Identity File: path to private key (or leave empty for default)
- Claude Code must be installed on the remote machine

## Scheduled Tasks (Desktop)

Create: **Schedule** in sidebar → **+ New task**

| Field | Notes |
|---|---|
| Frequency | Manual / Hourly / Daily / Weekdays / Weekly |
| Prompt | Written like any session message |
| Permission mode | Set per task |

- Desktop must be open and computer awake for tasks to fire
- Missed runs: one catch-up run fires on wake (most recent missed only)
- Edit prompt on disk: `~/.claude/scheduled-tasks/<task-name>/SKILL.md`
- Enable "Keep computer awake" in Settings → Desktop app → General

## CLI → Desktop Migration

```bash
/desktop    # Move current CLI session to Desktop (macOS/Windows only)
```

## CLI Flag Equivalents

| CLI flag | Desktop equivalent |
|---|---|
| `--model sonnet` | Model dropdown (before session starts) |
| `--resume`, `--continue` | Click session in sidebar |
| `--permission-mode` | Mode selector |
| `--dangerously-skip-permissions` | Bypass permissions (Settings → Claude Code) |
| `--allowedTools` | Not available |
| `--print`, `--output-format` | Not available (interactive only) |

## Not Available in Desktop

- Third-party providers (Bedrock, Vertex, Foundry)
- Linux support
- Inline code suggestions / autocomplete
- Agent teams / multi-agent orchestration
- `--allowedTools`, `--disallowedTools`, `--verbose`

## Troubleshooting

| Issue | Fix |
|---|---|
| 403 / auth error | Sign out and back in; verify paid subscription |
| Blank screen on launch | Restart; check for updates |
| "Failed to load session" | Folder missing or permissions issue |
| Tools not found | Verify PATH in shell profile; restart app |
| Git required (Windows) | Install [Git for Windows](https://git-scm.com/downloads/win) |
| App won't quit (Mac) | `Cmd+Q` or Force Quit (`Cmd+Option+Esc`) |
| App won't quit (Win) | Task Manager `Ctrl+Shift+Esc` → end Claude |

---
> Source: [desktop.md](../desktop.md)
