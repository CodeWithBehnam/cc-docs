# LLM Gateway Cheatsheet

## What an LLM Gateway Provides

- Centralized authentication and API key management
- Usage tracking and cost controls across teams
- Audit logging for compliance
- Model routing without code changes

## Gateway Requirements

The gateway must expose at least one of these API formats:

| Format                  | Endpoints                                              | Must Forward                          |
|-------------------------|--------------------------------------------------------|---------------------------------------|
| Anthropic Messages      | `/v1/messages`, `/v1/messages/count_tokens`            | Headers: `anthropic-beta`, `anthropic-version` |
| Bedrock InvokeModel     | `/invoke`, `/invoke-with-response-stream`              | Body fields: `anthropic_beta`, `anthropic_version` |
| Vertex rawPredict       | `:rawPredict`, `:streamRawPredict`, `/count-tokens:rawPredict` | Headers: `anthropic-beta`, `anthropic-version` |

- When using Anthropic Messages format with Bedrock/Vertex: set `CLAUDE_CODE_DISABLE_EXPERIMENTAL_BETAS=1`

## LiteLLM — Authentication

**Static API key:**

```bash
export ANTHROPIC_AUTH_TOKEN=sk-litellm-static-key
```

**Dynamic API key (helper script):**

```json
{
  "apiKeyHelper": "~/bin/get-litellm-key.sh",
}
```

```bash
export CLAUDE_CODE_API_KEY_HELPER_TTL_MS=3600000   # refresh interval in ms
```

- `apiKeyHelper` has lower precedence than `ANTHROPIC_AUTH_TOKEN` or `ANTHROPIC_API_KEY`
- Token is sent as `Authorization` and `X-Api-Key` headers

## LiteLLM — Endpoints

**Unified endpoint (recommended):**

```bash
export ANTHROPIC_BASE_URL=https://litellm-server:4000
```

Benefits over pass-through: load balancing, fallbacks, consistent cost/user tracking.

**Provider-specific pass-through:**

```bash
# Claude API
export ANTHROPIC_BASE_URL=https://litellm-server:4000/anthropic

# Amazon Bedrock
export ANTHROPIC_BEDROCK_BASE_URL=https://litellm-server:4000/bedrock
export CLAUDE_CODE_SKIP_BEDROCK_AUTH=1
export CLAUDE_CODE_USE_BEDROCK=1

# Google Vertex AI
export ANTHROPIC_VERTEX_BASE_URL=https://litellm-server:4000/vertex_ai/v1
export ANTHROPIC_VERTEX_PROJECT_ID=your-gcp-project-id
export CLAUDE_CODE_SKIP_VERTEX_AUTH=1
export CLAUDE_CODE_USE_VERTEX=1
export CLOUD_ML_REGION=us-east5
```

## Key Environment Variables Summary

| Variable                              | Purpose                                        |
|---------------------------------------|------------------------------------------------|
| `ANTHROPIC_BASE_URL`                  | Override Anthropic API endpoint                |
| `ANTHROPIC_BEDROCK_BASE_URL`          | Override Bedrock endpoint                      |
| `ANTHROPIC_VERTEX_BASE_URL`           | Override Vertex endpoint                       |
| `ANTHROPIC_AUTH_TOKEN`                | Static auth token for gateway                  |
| `CLAUDE_CODE_SKIP_BEDROCK_AUTH`       | Skip AWS auth (gateway handles it)             |
| `CLAUDE_CODE_SKIP_VERTEX_AUTH`        | Skip GCP auth (gateway handles it)             |
| `CLAUDE_CODE_DISABLE_EXPERIMENTAL_BETAS` | Disable beta features when using proxy     |

## Verify Configuration

```bash
/status    # inside Claude Code — shows proxy/gateway config in effect
```

---

> Source: [llm-gateway.md](../llm-gateway.md)
