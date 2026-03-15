# MCP (Model Context Protocol) Cheatsheet

## What MCP Does

Connects Claude Code to external tools, databases, and APIs. MCP servers give Claude access to services like GitHub, Jira, Slack, Postgres, Figma, etc.

## Install / Add Servers

```bash
# HTTP server (recommended for remote/cloud services)
claude mcp add --transport http <name> <url>
claude mcp add --transport http notion https://mcp.notion.com/mcp
claude mcp add --transport http secure-api https://api.example.com/mcp \
  --header "Authorization: Bearer your-token"

# SSE server (deprecated — use HTTP where available)
claude mcp add --transport sse asana https://mcp.asana.com/sse

# Local stdio server (for local processes / custom scripts)
claude mcp add --transport stdio <name> -- <command> [args...]
claude mcp add --transport stdio --env AIRTABLE_API_KEY=YOUR_KEY airtable \
  -- npx -y airtable-mcp-server
```

> All options (`--transport`, `--env`, `--scope`, `--header`) must come **before** the server name. Use `--` to separate server name from the command.

## Manage Servers

```bash
claude mcp list           # list all configured servers
claude mcp get <name>     # details for one server
claude mcp remove <name>  # remove a server
/mcp                      # check status (inside Claude Code)
```

## Scopes

| Scope | Storage | When to use |
| :--- | :--- | :--- |
| `local` (default) | `~/.claude.json` | Personal, project-specific, sensitive credentials |
| `project` | `.mcp.json` in repo root | Team-shared, check into version control |
| `user` | `~/.claude.json` | Personal utilities across all projects |

```bash
claude mcp add --scope project --transport http paypal https://mcp.paypal.com/mcp
claude mcp add --scope user    --transport http hubspot https://mcp.hubspot.com/anthropic
```

Precedence: `local` > `project` > `user`

## Environment Variables in `.mcp.json`

```json
{
  "mcpServers": {
    "api-server": {
      "type": "http",
      "url": "${API_BASE_URL:-https://api.example.com}/mcp",
      "headers": { "Authorization": "Bearer ${API_KEY}" }
    }
  }
}
```
- `${VAR}` — required variable
- `${VAR:-default}` — optional with fallback

## Useful Environment Variables

| Variable | Purpose |
| :--- | :--- |
| `MCP_TIMEOUT` | Startup timeout in ms (e.g., `MCP_TIMEOUT=10000`) |
| `MAX_MCP_OUTPUT_TOKENS` | Raise 10K token output limit (e.g., `50000`) |

## Plugin-provided MCP Servers

- Defined in plugin's `.mcp.json` or inline in `plugin.json`
- Auto-start when plugin is enabled
- Use `${CLAUDE_PLUGIN_ROOT}` for plugin-relative paths
- View with `/mcp` — appear alongside manually configured servers
- Require Claude Code restart when enabled/disabled

## Windows Note

```bash
# Wrap npx with cmd /c on native Windows (not WSL)
claude mcp add --transport stdio my-server -- cmd /c npx -y @some/package
```

## Dynamic Tool Updates

MCP servers can send `list_changed` notifications — Claude Code auto-refreshes available tools without disconnect/reconnect.

## Authentication

- For OAuth 2.0 remote servers: run `/mcp` to authenticate
- For project-scope `.mcp.json`: Claude Code prompts approval on first use
  - Reset choices: `claude mcp reset-project-choices`

---
> Source: [mcp.md](../mcp.md)
