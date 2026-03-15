# Claude Code Overview Cheatsheet

## What It Is
- AI-powered agentic coding tool: reads codebase, edits files, runs commands
- Available in: Terminal CLI, VS Code, JetBrains, Desktop app, Web browser

## Install (Terminal CLI)

| Platform | Command |
|---|---|
| macOS/Linux/WSL | `curl -fsSL https://claude.ai/install.sh \| bash` |
| Windows PowerShell | `irm https://claude.ai/install.ps1 \| iex` |
| Homebrew | `brew install --cask claude-code` |
| WinGet | `winget install Anthropic.ClaudeCode` |

> Homebrew and WinGet do NOT auto-update. Run `brew upgrade claude-code` / `winget upgrade Anthropic.ClaudeCode` manually.

## Start a Session

```bash
cd your-project
claude
```

## Core Capabilities

| Task | Example prompt |
|---|---|
| Understand codebase | `"what does this project do?"` |
| Fix bugs | `"fix the login bug where users see a blank screen"` |
| Write tests | `"write unit tests for the auth module"` |
| Git operations | `"commit my changes with a descriptive message"` |
| Refactor | `"refactor auth module to use async/await"` |
| CI automation | pipe output \| `claude -p "review for security issues"` |

## Surfaces

| Surface | Best for |
|---|---|
| Terminal CLI | Full-featured, primary interface |
| VS Code / JetBrains | Inline diffs, editor integration |
| Desktop app | Visual diffs, multiple sessions |
| Web (claude.ai/code) | No local setup, mobile access |
| GitHub Actions | Automated PR review, CI/CD |
| Slack | Route bug reports → pull requests |

## Key Extension Points
- **CLAUDE.md** — persistent instructions loaded every session
- **Skills** — reusable workflows (`/deploy`, `/review`)
- **MCP** — connect to external services (Slack, DB, Jira)
- **Hooks** — run shell scripts on tool events
- **Subagents** — isolated workers for parallel tasks

## Pipe / Headless Usage

```bash
tail -f app.log | claude -p "Slack me if you see anomalies"
git diff main --name-only | claude -p "review for security issues"
claude -p "translate new strings into French and raise a PR"
```

---
> Source: [overview.md](../overview.md)
