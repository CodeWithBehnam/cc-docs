# MCP Integration: GitHub

Connect Claude Code to the GitHub API for working with issues, PRs, repos, and code search.

## Prerequisites

- GitHub CLI (`gh`) installed and authenticated: `gh auth login`
- Or: a GitHub Personal Access Token

---

## Option 1: GitHub CLI MCP Server (Recommended)

The simplest setup, uses your existing `gh` authentication.

### Add via CLI

```bash
claude mcp add github -- gh mcp
```

### Or add to `.mcp.json`

Create/edit `.mcp.json` in your project root:

```json
{
  "mcpServers": {
    "github": {
      "command": "gh",
      "args": ["mcp"]
    }
  }
}
```

### Available Tools

Once connected, Claude can:
- Read and create issues
- Read and review pull requests
- Search code across repositories
- Read file contents from any repo
- List and manage branches
- Read commit history and diffs

### Usage Examples

```text
> Use GitHub to find all open issues labeled "bug" in this repo
> Review PR #42 and post inline comments
> Search for how authentication is handled across our org's repos
> Create an issue for the bug we just found
```

---

## Option 2: Dedicated GitHub MCP Server

For more control over permissions and configuration.

### Add via CLI

```bash
claude mcp add github \
  --transport stdio \
  --env GITHUB_PERSONAL_ACCESS_TOKEN=ghp_your_token_here \
  -- npx -y @anthropic-ai/mcp-server-github
```

### Or add to `.mcp.json`

```json
{
  "mcpServers": {
    "github": {
      "command": "npx",
      "args": ["-y", "@anthropic-ai/mcp-server-github"],
      "env": {
        "GITHUB_PERSONAL_ACCESS_TOKEN": "${GITHUB_TOKEN}"
      }
    }
  }
}
```

Set the environment variable:

```bash
export GITHUB_TOKEN=ghp_your_token_here
```

---

## Option 3: GitHub Enterprise

For GitHub Enterprise Server installations:

```json
{
  "mcpServers": {
    "github": {
      "command": "npx",
      "args": ["-y", "@anthropic-ai/mcp-server-github"],
      "env": {
        "GITHUB_PERSONAL_ACCESS_TOKEN": "${GITHUB_TOKEN}",
        "GITHUB_API_URL": "https://github.yourcompany.com/api/v3"
      }
    }
  }
}
```

---

## Permission Configuration

Restrict Claude's GitHub access in `.claude/settings.json`:

```json
{
  "permissions": {
    "allow": [
      "mcp__github__search_code",
      "mcp__github__get_issue",
      "mcp__github__list_issues",
      "mcp__github__get_pull_request"
    ],
    "deny": [
      "mcp__github__create_issue",
      "mcp__github__create_pull_request"
    ]
  }
}
```

---

## Scope

| File Location | Who Uses It |
|---------------|-------------|
| `.mcp.json` (project root) | Everyone on the team (commit to git) |
| `~/.claude/.mcp.json` (home) | Just you, across all projects |
| `.claude/settings.local.json` | Just you, this project only |

---

## Tips

- Use `gh auth status` to verify your GitHub CLI is authenticated
- Environment variables in `.mcp.json` use `${VAR_NAME}` syntax
- Run `claude mcp list` to verify the server is connected
- Use `/mcp` in Claude Code to check server status interactively
- Token permissions: `repo` scope is sufficient for most operations
