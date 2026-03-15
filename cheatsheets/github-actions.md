# GitHub Actions Cheatsheet

## Quick Setup

- Run `/install-github-app` inside Claude Code terminal (requires repo admin)
- Or manually: install [github.com/apps/claude](https://github.com/apps/claude), add `ANTHROPIC_API_KEY` secret, copy workflow from examples

**Required GitHub App permissions:** Contents R/W, Issues R/W, Pull requests R/W

## Basic Workflow

```yaml
- uses: anthropics/claude-code-action@v1
  with:
    anthropic_api_key: ${{ secrets.ANTHROPIC_API_KEY }}
    # Responds to @claude mentions automatically
```

## Action Parameters

| Parameter           | Description                              | Required |
|---------------------|------------------------------------------|----------|
| `anthropic_api_key` | Claude API key                           | Yes*     |
| `prompt`            | Instructions for Claude                  | No       |
| `claude_args`       | CLI flags passed to Claude Code          | No       |
| `github_token`      | GitHub token for API access              | No       |
| `trigger_phrase`    | Custom trigger (default: `@claude`)      | No       |
| `use_bedrock`       | Use AWS Bedrock instead of Claude API    | No       |
| `use_vertex`        | Use Google Vertex AI instead of Claude API | No    |

\* Not required for Bedrock/Vertex

## Common `claude_args` Options

```yaml
claude_args: "--max-turns 5 --model claude-sonnet-4-6 --allowedTools Bash,Read,Edit"
```

| Flag                      | Purpose                          |
|---------------------------|----------------------------------|
| `--max-turns N`           | Limit conversation turns         |
| `--model <model-id>`      | Override model                   |
| `--append-system-prompt`  | Append custom instructions       |
| `--allowedTools`          | Comma-separated allowed tools    |
| `--disallowedTools`       | Comma-separated blocked tools    |
| `--mcp-config <path>`     | Path to MCP config               |

## Trigger Modes

- **Interactive** (tag mode): listens for `@claude` in issue/PR comments — omit `prompt`
- **Automation** (direct mode): runs immediately with a `prompt` — for scheduled jobs, PR events, etc.

## Example: PR Review on Every PR

```yaml
on:
  pull_request:
    types: [opened, synchronize]
jobs:
  review:
    runs-on: ubuntu-latest
    steps:
      - uses: anthropics/claude-code-action@v1
        with:
          anthropic_api_key: ${{ secrets.ANTHROPIC_API_KEY }}
          prompt: "Review this PR for code quality and security."
          claude_args: "--max-turns 5"
```

## Cloud Provider Setup (Bedrock)

**Required secrets:** `AWS_ROLE_TO_ASSUME`, `APP_ID`, `APP_PRIVATE_KEY`

```yaml
permissions:
  id-token: write
steps:
  - uses: aws-actions/configure-aws-credentials@v4
    with:
      role-to-assume: ${{ secrets.AWS_ROLE_TO_ASSUME }}
      aws-region: us-west-2
  - uses: anthropics/claude-code-action@v1
    with:
      github_token: ${{ steps.app-token.outputs.token }}
      use_bedrock: "true"
      claude_args: '--model us.anthropic.claude-sonnet-4-6 --max-turns 10'
```

## Cloud Provider Setup (Vertex AI)

**Required secrets:** `GCP_WORKLOAD_IDENTITY_PROVIDER`, `GCP_SERVICE_ACCOUNT`, `APP_ID`, `APP_PRIVATE_KEY`

```yaml
  - uses: anthropics/claude-code-action@v1
    with:
      use_vertex: "true"
      claude_args: '--model claude-sonnet-4@20250514'
    env:
      ANTHROPIC_VERTEX_PROJECT_ID: ${{ steps.auth.outputs.project_id }}
      CLOUD_ML_REGION: us-east5
```

## Beta → v1 Migration

| Old (beta)            | New (v1)                              |
|-----------------------|---------------------------------------|
| `mode`                | Removed (auto-detected)               |
| `direct_prompt`       | `prompt`                              |
| `custom_instructions` | `claude_args: --append-system-prompt` |
| `max_turns`           | `claude_args: --max-turns`            |
| `model`               | `claude_args: --model`                |
| `allowed_tools`       | `claude_args: --allowedTools`         |

## Gotchas

- Use `@claude` not `/claude` in comments
- API key must be in GitHub Secrets, never hardcoded
- For Bedrock/Vertex, use a custom GitHub App — not the Anthropic app
- Bedrock model IDs have region prefix: `us.anthropic.claude-sonnet-4-6`
- Use `--max-turns` and workflow timeouts to control costs

---

> Source: [github-actions.md](../github-actions.md)
