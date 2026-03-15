# Built-in Commands Cheatsheet

Type `/` to see all commands. Type `/<letters>` to filter. Commands depend on platform/plan.

## Session Management

| Command | Purpose |
|---|---|
| `/clear` | Clear conversation history (aliases: `/reset`, `/new`) |
| `/compact [instructions]` | Compact conversation with optional focus |
| `/resume [session]` | Resume by ID/name or open picker (alias: `/continue`) |
| `/fork [name]` | Fork current conversation at this point |
| `/rename [name]` | Rename current session |
| `/rewind` | Rewind code/conversation to a previous point (alias: `/checkpoint`) |
| `/export [filename]` | Export conversation as plain text |
| `/exit` | Exit CLI (alias: `/quit`) |

## Context & Memory

| Command | Purpose |
|---|---|
| `/memory` | Edit CLAUDE.md files, toggle auto-memory, view entries |
| `/init` | Initialize project with CLAUDE.md |
| `/context` | Visualize context usage with suggestions |
| `/cost` | Show token usage statistics |
| `/compact` | Compact conversation to free context |

## Configuration

| Command | Purpose |
|---|---|
| `/config` | Open settings UI (alias: `/settings`) |
| `/model [model]` | Select/change AI model |
| `/effort [low\|medium\|high\|max\|auto]` | Set model effort level |
| `/theme` | Change color theme |
| `/vim` | Toggle Vim editing mode |
| `/color [color\|default]` | Set prompt bar color |
| `/permissions` | View/update permission rules (alias: `/allowed-tools`) |
| `/keybindings` | Open/create keybindings config file |

## Tools & Integrations

| Command | Purpose |
|---|---|
| `/mcp` | Manage MCP server connections |
| `/agents` | Manage agent configurations |
| `/hooks` | View hook configurations |
| `/plugin` | Manage plugins |
| `/reload-plugins` | Reload plugins without restarting |
| `/ide` | Manage IDE integrations |
| `/chrome` | Configure Claude in Chrome settings |

## Git & Code

| Command | Purpose |
|---|---|
| `/diff` | Interactive diff viewer for uncommitted changes |
| `/security-review` | Analyze branch changes for security vulnerabilities |
| `/pr-comments [PR]` | Fetch comments from a GitHub PR |
| `/install-github-app` | Set up Claude GitHub Actions app |

## Info & Help

| Command | Purpose |
|---|---|
| `/help` | Show help and available commands |
| `/doctor` | Diagnose installation and settings |
| `/status` | Show version, model, account, connectivity |
| `/stats` | Visualize daily usage and session history |
| `/insights` | Report on session patterns and friction points |
| `/usage` | Show plan usage and rate limit status |
| `/cost` | Show token usage |
| `/release-notes` | View full changelog |
| `/btw <question>` | Quick side question without polluting history |
| `/skills` | List available skills |

## Remote & Multi-surface

| Command | Purpose |
|---|---|
| `/remote-control` | Make session available for remote control (alias: `/rc`) |
| `/desktop` | Continue session in Desktop app (alias: `/app`) |
| `/tasks` | List and manage background tasks |
| `/plan` | Enter plan mode directly |

## MCP Prompts

MCP servers can expose prompts as commands using the format:
```
/mcp__<server>__<prompt>
```

---
> Source: [commands.md](../commands.md)
