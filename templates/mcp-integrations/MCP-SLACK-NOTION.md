# MCP Integration: Team Communication Tools

Connect Claude Code to Slack, Notion, Linear, and other team tools.

---

## Slack

### Add via CLI

```bash
claude mcp add slack \
  --transport http \
  -- https://mcp.slack.com/sse
```

Claude will open a browser for OAuth authentication on first use.

### Or add to `.mcp.json`

```json
{
  "mcpServers": {
    "slack": {
      "type": "http",
      "url": "https://mcp.slack.com/sse"
    }
  }
}
```

### Usage Examples

```text
> Search Slack for recent discussions about the authentication refactor
> Post a status update to #engineering about the deployment
> Find the thread where we discussed the database migration plan
> Summarize the key decisions from today's messages in #product
```

---

## Notion

### Add via CLI

```bash
claude mcp add notion \
  --transport http \
  -- https://mcp.notion.com/mcp
```

### Or add to `.mcp.json`

```json
{
  "mcpServers": {
    "notion": {
      "type": "http",
      "url": "https://mcp.notion.com/mcp"
    }
  }
}
```

### Usage Examples

```text
> Find the API design spec in Notion
> Update the project status page with today's progress
> Search Notion for the onboarding documentation
> Create a new page in the Engineering wiki with the architecture decision
```

---

## Linear

### Add to `.mcp.json`

```json
{
  "mcpServers": {
    "linear": {
      "command": "npx",
      "args": ["-y", "@anthropic-ai/mcp-server-linear"],
      "env": {
        "LINEAR_API_KEY": "${LINEAR_API_KEY}"
      }
    }
  }
}
```

### Usage Examples

```text
> Show me all my assigned Linear issues
> Create a bug ticket for the null pointer exception we found
> Move issue FE-123 to "In Review"
> Find all high-priority issues in the current sprint
```

---

## Jira

### Add to `.mcp.json`

```json
{
  "mcpServers": {
    "jira": {
      "command": "npx",
      "args": ["-y", "@anthropic-ai/mcp-server-jira"],
      "env": {
        "JIRA_URL": "https://yourcompany.atlassian.net",
        "JIRA_EMAIL": "${JIRA_EMAIL}",
        "JIRA_API_TOKEN": "${JIRA_API_TOKEN}"
      }
    }
  }
}
```

---

## Sentry (Error Monitoring)

### Add to `.mcp.json`

```json
{
  "mcpServers": {
    "sentry": {
      "command": "npx",
      "args": ["-y", "@anthropic-ai/mcp-server-sentry"],
      "env": {
        "SENTRY_AUTH_TOKEN": "${SENTRY_AUTH_TOKEN}",
        "SENTRY_ORG": "your-org-slug"
      }
    }
  }
}
```

### Usage Examples

```text
> Show me the top unresolved errors from the last 24 hours
> Find the stack trace for error FRONTEND-123
> What's the error rate trend for the payments service?
```

---

## Combining Multiple Tools

A complete team setup in `.mcp.json`:

```json
{
  "mcpServers": {
    "github": {
      "command": "gh",
      "args": ["mcp"]
    },
    "slack": {
      "type": "http",
      "url": "https://mcp.slack.com/sse"
    },
    "notion": {
      "type": "http",
      "url": "https://mcp.notion.com/mcp"
    },
    "linear": {
      "command": "npx",
      "args": ["-y", "@anthropic-ai/mcp-server-linear"],
      "env": {
        "LINEAR_API_KEY": "${LINEAR_API_KEY}"
      }
    }
  }
}
```

### Cross-Tool Workflows

```text
> Find the Linear issue for the auth bug, read the related Slack discussion,
  check the Notion spec, then implement the fix and create a PR on GitHub

> Summarize all Sentry errors from today, create Linear tickets for the
  critical ones, and post a summary to #engineering on Slack
```

---

## Permission Configuration

Control which tools Claude can use in `.claude/settings.json`:

```json
{
  "permissions": {
    "allow": [
      "mcp__slack__search_messages",
      "mcp__notion__search",
      "mcp__linear__list_issues"
    ],
    "ask": [
      "mcp__slack__post_message",
      "mcp__notion__create_page",
      "mcp__linear__create_issue"
    ]
  }
}
```

---

## Tips

- HTTP MCP servers (Slack, Notion) use OAuth, no API key needed in config
- Stdio MCP servers (Linear, Jira, Sentry) need API tokens via environment variables
- Keep credentials in environment variables, never hardcode in `.mcp.json`
- Commit `.mcp.json` to git (safe because credentials use `${VAR}` references)
- Use `claude mcp list` to verify all servers are connected
- Set write operations (posting, creating) to `ask` permission so Claude confirms first
