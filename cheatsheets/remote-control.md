# Remote Control Cheatsheet

## What It Is

Connect claude.ai/code or the Claude mobile app to a Claude Code session running **on your local machine**. Session stays local — nothing moves to the cloud.

- Requires Claude Code v2.1.51+
- Available on Pro, Max, Team, Enterprise (not API keys)
- Team/Enterprise: admin must enable Claude Code in admin settings first

## Requirements

```bash
# Sign in via claude.ai
/login

# Accept workspace trust (run once per project directory)
claude   # in your project directory
```

## Start a Remote Control Session

**Server mode** (dedicated, waits for connections):
```bash
claude remote-control
# Press spacebar to show QR code
```

**Interactive mode** (normal session + remote access):
```bash
claude --remote-control
claude --remote-control "My Project"   # with custom name
```

**From within an existing session:**
```text
/remote-control
/remote-control My Project
/rc             # shorthand
```

## Server Mode Flags

| Flag | Description |
|---|---|
| `--name "My Project"` | Session title shown in claude.ai/code |
| `--spawn same-dir` | (default) All connections share working directory |
| `--spawn worktree` | Each connection gets its own git worktree |
| `--capacity <N>` | Max concurrent sessions (default: 32) |
| `--verbose` | Detailed connection/session logs |
| `--sandbox` / `--no-sandbox` | Enable/disable filesystem isolation |

## Connect from Another Device

1. **URL**: open session URL shown in terminal → goes directly to session on claude.ai/code
2. **QR code**: scan with Claude app (press spacebar to toggle in server mode)
3. **Session list**: open claude.ai/code or Claude app → find session by name (green dot = online)

Get Claude app QR code: `/mobile` (inside Claude Code)

## Enable for All Sessions

```text
/config → "Enable Remote Control for all sessions" → true
```

Each interactive `claude` process registers one remote session. Use server mode with `--spawn` for multiple concurrent sessions from one process.

## Security

- Claude Code makes outbound HTTPS only — no inbound ports opened
- Registers with Anthropic API, polls for work
- Traffic routed over TLS via Anthropic API
- Multiple short-lived credentials, each scoped to a single purpose

## Remote Control vs Cloud (Web)

| | Remote Control | Claude Code on the Web |
|---|---|---|
| Runs on | Your local machine | Anthropic cloud infrastructure |
| Local filesystem | Yes | No |
| MCP servers | Your local ones | Cloud environment only |
| Survives laptop close | No | Yes |
| Use case | Continue local work from another device | Start tasks without local setup |

## Limitations

- Terminal must stay open (session ends if process stops)
- Network outage > ~10 min causes timeout/exit
- One remote session per interactive process (use server mode for multiple)
- `--verbose`, `--sandbox`, `--no-sandbox` not available with `/remote-control`

---
> Source: [remote-control.md](../remote-control.md)
