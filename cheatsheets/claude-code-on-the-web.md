# Claude Code on the Web Cheatsheet

## What It Is

Run Claude Code tasks asynchronously on Anthropic-managed cloud VMs. Currently in research preview.
Available on Pro, Max, Teams, and Enterprise (premium/Chat+Code seats).

## Getting Started

1. Visit [claude.ai/code](https://claude.ai/code)
2. Connect GitHub account
3. Install the Claude GitHub app in your repos
4. Select default environment
5. Submit task → review diff → create PR

## Terminal → Web (start remote session)

```bash
claude --remote "Fix the authentication bug in src/auth/login.ts"
```

- Creates a new web session on claude.ai
- Task runs in cloud while you continue locally
- Monitor with `/tasks`; interact from claude.ai or Claude mobile app

**Parallel tasks:**
```bash
claude --remote "Fix the flaky test in auth.spec.ts"
claude --remote "Update the API documentation"
```

**Plan locally, execute remotely:**
```bash
claude --permission-mode plan   # explore approach
claude --remote "Execute the migration plan in docs/migration-plan.md"
```

## Web → Terminal (teleport)

| Method | Command |
|---|---|
| Interactive picker | `claude --teleport` or `/teleport` (or `/tp`) |
| Specific session | `claude --teleport <session-id>` |
| From `/tasks` | Press `t` on a session |
| From web UI | Click "Open in CLI" |

**Requirements to teleport:**
- Clean git working directory (or stash changes)
- Correct repo (not a fork)
- Branch pushed to remote
- Same Claude.ai account

## Session Management

- **Archive**: hover in sidebar → archive icon (hidden from list but not deleted)
- **Delete**: filter archived → delete icon (permanent, cannot undo)
- **Share**: toggle visibility (Private / Team for Enterprise; Private / Public for Max/Pro)

## Cloud Environment

**Pre-installed runtimes:** Python 3.x, Node.js LTS, Ruby 3.3.6, PHP 8.4, Java/Maven/Gradle, Go, Rust, C++, PostgreSQL 16, Redis 7.0

Check available tools: ask Claude to run `check-tools`

**Network access levels:**
- Limited (default): allowlisted domains (npm, PyPI, GitHub, etc.)
- Full: unrestricted internet
- None: air-gapped

## Setup Scripts

Run before Claude Code launches, on new sessions only (not resumed):

```bash
#!/bin/bash
apt update && apt install -y gh
npm install
pip install -r requirements.txt
```

Add in environment settings dialog. Scripts run as root on Ubuntu 24.04.
- Non-zero exit = session fails to start; append `|| true` to non-critical steps
- Bun does not work with the security proxy

## Setup Scripts vs SessionStart Hooks

| | Setup scripts | SessionStart hooks |
|---|---|---|
| Attached to | Cloud environment | Repository |
| Configured in | Cloud environment UI | `.claude/settings.json` |
| Runs | Before Claude launches, new sessions only | After launch, every session |
| Scope | Cloud only | Local + cloud |

## Environment Variables (`.env` format)

```text
API_KEY=your_api_key
DEBUG=true
```

Select default environment from terminal: `/remote-env`

## Limitations

- GitHub only (no GitLab or other platforms)
- Session handoff is one-way (web → terminal only; `--remote` creates a new session)
- Rate limits shared with all Claude/Claude Code usage

---
> Source: [claude-code-on-the-web.md](../claude-code-on-the-web.md)
