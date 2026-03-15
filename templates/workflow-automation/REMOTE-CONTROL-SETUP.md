# Workflow Automation: Remote Control Setup

Access your local Claude Code sessions from any device (phone, tablet, another computer).

---

## Quick Start

### From within an active session

```text
/remote-control
```

This generates a URL and QR code you can open on any device.

### When starting a new session

```bash
claude --remote-control "My Project"
```

### Named session for easy identification

```bash
claude --remote-control --name "backend-refactor"
```

---

## Server Mode (Multiple Sessions)

Run a persistent Claude Code server that handles multiple concurrent sessions:

```bash
claude remote-control --spawn worktree --capacity 5
```

| Flag | Purpose | Default |
|------|---------|---------|
| `--spawn worktree` | Each session gets isolated git worktree | None |
| `--capacity N` | Max concurrent sessions | 3 |
| `--sandbox` | Enable sandboxing for all sessions | Off |
| `--name "name"` | Name the server | Auto-generated |
| `--verbose` | Show detailed logs | Off |

---

## Enable by Default

To automatically enable remote control for all sessions:

```text
/config
```

Then enable "Automatic Remote Control". Every session will print a connection URL on start.

Or add to `~/.claude/settings.json`:

```json
{
  "remoteControl": {
    "enabled": true
  }
}
```

---

## Use Cases

### Start locally, continue on phone

1. Start a task on your workstation:
   ```bash
   claude --remote-control --name "migration-task"
   ```
2. Scan the QR code with your phone
3. Continue the conversation from your phone while away from your desk

### Long-running task monitoring

1. Start a complex task:
   ```bash
   claude --remote-control --name "large-refactor"
   ```
2. Give Claude the instructions
3. Check progress from your phone/tablet periodically
4. Approve permission requests remotely

### Team session sharing

1. Start a server session:
   ```bash
   claude remote-control --spawn worktree --name "team-debug"
   ```
2. Share the URL with a teammate
3. Both can interact with the session
4. Each spawned session gets an isolated worktree

---

## Combining with Other Features

### Remote control + scheduled tasks

```bash
# Start a session with remote control and a monitoring task
claude --remote-control --name "deploy-monitor"
```

Then in the session:

```text
/loop 5m Check deployment status and notify me of any issues
```

You can monitor the deployment from your phone.

### Remote control + agent teams

```bash
CLAUDE_CODE_EXPERIMENTAL_AGENT_TEAMS=1 claude --remote-control --name "feature-team"
```

Monitor and direct a multi-agent team from any device.

### Remote control + sandboxing

```bash
claude remote-control --spawn worktree --sandbox --capacity 3
```

Each spawned session is isolated and sandboxed for safety.

---

## Network Requirements

- Your local machine must be reachable from the internet (or same network)
- Claude Code handles the connection tunneling automatically
- Sessions reconnect automatically on network interruption or machine sleep
- No port forwarding needed

---

## Tips

- Sessions persist even if the browser tab is closed; just reopen the URL
- QR codes are the fastest way to connect from a mobile device
- Name your sessions to keep track of multiple concurrent tasks
- Use `--spawn worktree` in server mode so sessions don't interfere with each other
- Remote control works with all Claude Code features (hooks, skills, MCP, etc.)
- The session runs locally, so all your filesystem, tools, and environment are available
