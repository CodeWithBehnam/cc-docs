# Cloud Provider Setup: LLM Gateway / Proxy

Configure Claude Code to route requests through an LLM gateway proxy for centralized authentication, usage tracking, and audit logging.

---

## Why Use a Gateway?

- **Centralized API keys**: Users don't need individual Anthropic API keys
- **Usage tracking**: Monitor costs and usage per user/team
- **Audit logging**: Record all API interactions for compliance
- **Rate limiting**: Control usage across your organization
- **Multi-provider routing**: Switch between Anthropic, Bedrock, and Vertex without client changes

---

## LiteLLM Setup (Popular Gateway)

### Server-Side (Gateway Admin)

```bash
# Install LiteLLM
pip install litellm[proxy]

# Start the proxy
litellm --model anthropic/claude-sonnet-4-6 --port 4000
```

Or with a config file (`litellm_config.yaml`):

```yaml
model_list:
  - model_name: claude-sonnet-4-6
    litellm_params:
      model: anthropic/claude-sonnet-4-6
      api_key: sk-ant-...
  - model_name: claude-opus-4-6
    litellm_params:
      model: anthropic/claude-opus-4-6
      api_key: sk-ant-...

general_settings:
  master_key: sk-litellm-master-key
```

```bash
litellm --config litellm_config.yaml --port 4000
```

### Client-Side (Developer)

```bash
# Point Claude Code at your gateway
export ANTHROPIC_BASE_URL=https://your-gateway.example.com

# Use a gateway-issued API key
export ANTHROPIC_AUTH_TOKEN=sk-litellm-user-key
```

Or in `~/.claude/settings.json`:

```json
{
  "env": {
    "ANTHROPIC_BASE_URL": "https://your-gateway.example.com",
    "ANTHROPIC_AUTH_TOKEN": "sk-litellm-user-key"
  }
}
```

---

## Generic Gateway Configuration

### Anthropic API format (recommended)

Most gateways support the Anthropic Messages API format natively:

```json
{
  "env": {
    "ANTHROPIC_BASE_URL": "https://gateway.example.com"
  }
}
```

### Provider-Specific Pass-Through

If your gateway exposes provider-specific endpoints:

```json
{
  "env": {
    "ANTHROPIC_BASE_URL": "https://gateway.example.com/anthropic",
    "ANTHROPIC_BEDROCK_BASE_URL": "https://gateway.example.com/bedrock",
    "ANTHROPIC_VERTEX_BASE_URL": "https://gateway.example.com/vertex_ai/v1"
  }
}
```

---

## Dynamic API Key Rotation

For gateways that issue short-lived tokens:

### Using apiKeyHelper

Create a helper script (`~/bin/get-gateway-key.sh`):

```bash
#!/bin/bash
# Fetch a temporary API key from your gateway
curl -s https://gateway.example.com/auth/token \
  -H "Authorization: Bearer $GATEWAY_REFRESH_TOKEN" | \
  jq -r '.api_key'
```

```bash
chmod +x ~/bin/get-gateway-key.sh
```

Configure in `~/.claude/settings.json`:

```json
{
  "env": {
    "ANTHROPIC_BASE_URL": "https://gateway.example.com"
  },
  "apiKeyHelper": "~/bin/get-gateway-key.sh"
}
```

### Setting TTL for Key Refresh

```bash
# Refresh the key every hour (3600000 ms)
export CLAUDE_CODE_API_KEY_HELPER_TTL_MS=3600000
```

---

## Bedrock Through Gateway

Route Bedrock requests through a corporate gateway:

```json
{
  "env": {
    "CLAUDE_CODE_USE_BEDROCK": "1",
    "ANTHROPIC_BEDROCK_BASE_URL": "https://gateway.example.com/bedrock",
    "AWS_REGION": "us-east-1"
  }
}
```

---

## Vertex AI Through Gateway

Route Vertex AI requests through a corporate gateway:

```json
{
  "env": {
    "CLAUDE_CODE_USE_VERTEX": "1",
    "ANTHROPIC_VERTEX_BASE_URL": "https://gateway.example.com/vertex_ai/v1",
    "ANTHROPIC_VERTEX_PROJECT_ID": "your-project-id",
    "CLOUD_ML_REGION": "us-east5"
  }
}
```

---

## With Corporate Proxy

If your gateway is behind a corporate proxy:

```json
{
  "env": {
    "ANTHROPIC_BASE_URL": "https://gateway.internal.example.com",
    "HTTPS_PROXY": "https://proxy.example.com:8080",
    "NO_PROXY": "localhost,127.0.0.1,.internal.example.com"
  }
}
```

---

## Complete Example: Enterprise Setup

```json
{
  "env": {
    "ANTHROPIC_BASE_URL": "https://ai-gateway.corp.example.com",
    "HTTPS_PROXY": "https://proxy.corp.example.com:8080",
    "NODE_EXTRA_CA_CERTS": "/etc/ssl/certs/corp-ca.pem"
  },
  "apiKeyHelper": "~/bin/get-corp-api-key.sh"
}
```

`~/bin/get-corp-api-key.sh`:

```bash
#!/bin/bash
# Get API key using corporate SSO token
SSO_TOKEN=$(cat ~/.corp/sso-token)
curl -s https://ai-gateway.corp.example.com/auth/api-key \
  -H "Authorization: Bearer $SSO_TOKEN" | \
  jq -r '.key'
```

---

## Troubleshooting

| Issue | Fix |
|-------|-----|
| `Connection refused` | Check gateway URL and port, verify it's running |
| `401 Unauthorized` | Check API key or run `apiKeyHelper` manually |
| `SSL certificate error` | Set `NODE_EXTRA_CA_CERTS` to your CA certificate |
| `Timeout` | Check `HTTPS_PROXY` settings and network connectivity |
| `Model not found` | Verify the model is configured in your gateway |
| `Rate limited` | Contact your gateway admin for quota increases |

---

## Tips

- Test your gateway connection with: `curl https://your-gateway/v1/messages -H "x-api-key: your-key"`
- Use `ANTHROPIC_BASE_URL` for the simplest setup (Anthropic API format)
- Use `apiKeyHelper` for rotating credentials instead of static keys
- Set `NO_PROXY` to bypass proxy for local/internal services
- Gateway logs provide visibility into usage patterns across your organization
