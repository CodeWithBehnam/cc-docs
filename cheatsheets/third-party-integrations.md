# Enterprise Deployment Overview Cheatsheet

## Deployment Options Comparison

| Feature            | Teams/Enterprise       | Anthropic Console | Amazon Bedrock      | Google Vertex AI  | Microsoft Foundry  |
|--------------------|------------------------|-------------------|---------------------|-------------------|--------------------|
| Best for           | Most orgs (recommended)| Individual devs   | AWS-native           | GCP-native        | Azure-native       |
| Billing            | $150/seat or Enterprise| PAYG              | PAYG via AWS        | PAYG via GCP      | PAYG via Azure     |
| Auth               | SSO or email           | API key           | API key / AWS creds | GCP credentials   | API key / Entra ID |
| Claude on web      | Yes                    | No                | No                  | No                | No                 |
| Enterprise features| SSO, team mgmt, usage  | None              | IAM, CloudTrail     | IAM, Audit Logs   | RBAC, Azure Monitor|
| Prompt caching     | Enabled                | Enabled           | Enabled             | Enabled           | Enabled            |

## Corporate Proxy Configuration

```bash
export HTTPS_PROXY='https://proxy.example.com:8080'
```

Works alongside any provider (`CLAUDE_CODE_USE_BEDROCK=1` etc.)

## LLM Gateway Configuration

```bash
# Route to gateway instead of provider directly
export ANTHROPIC_BEDROCK_BASE_URL='https://your-llm-gateway.com/bedrock'
export CLAUDE_CODE_SKIP_BEDROCK_AUTH=1  # if gateway handles AWS auth

export ANTHROPIC_VERTEX_BASE_URL='https://your-llm-gateway.com/vertex'
export CLAUDE_CODE_SKIP_VERTEX_AUTH=1

export ANTHROPIC_FOUNDRY_BASE_URL='https://your-llm-gateway.com'
export CLAUDE_CODE_SKIP_FOUNDRY_AUTH=1
```

Verify: run `/status` in Claude Code.

## Key Org Best Practices

- **CLAUDE.md files**: Deploy at org-wide system dirs and repo roots — check into source control
  - macOS org-wide: `/Library/Application Support/ClaudeCode/CLAUDE.md`
- **Pin model versions** for Bedrock/Vertex/Foundry: use `ANTHROPIC_DEFAULT_OPUS_MODEL`, `ANTHROPIC_DEFAULT_SONNET_MODEL`, `ANTHROPIC_DEFAULT_HAIKU_MODEL`
- **MCP**: Configure centrally; check `.mcp.json` into repos for shared access
- **Onboarding**: Start users with Q&A and small bug fixes before agentic tasks
- **Security policies**: Use managed permissions to enforce what Claude Code can/can't do

## Setup Sequence

1. Choose deployment option
2. Install Claude Code + authenticate team members
3. Create `CLAUDE.md` in repos
4. Configure permissions and security policies

---

> Source: [third-party-integrations.md](../third-party-integrations.md)
