# Cloud Provider Setup: AWS Bedrock

Complete setup for running Claude Code through Amazon Bedrock.

---

## Quick Start

```bash
# 1. Enable Bedrock
export CLAUDE_CODE_USE_BEDROCK=1
export AWS_REGION=us-east-1

# 2. Authenticate (pick one method below)
aws configure  # or use SSO, environment variables, etc.

# 3. Run Claude Code
claude
```

---

## Authentication Methods

### AWS CLI (simplest)

```bash
aws configure
# Enter: Access Key ID, Secret Access Key, Region
```

### AWS SSO

```bash
# Configure SSO profile
aws configure sso --profile claude-profile

# Login
aws sso login --profile claude-profile

# Set profile
export AWS_PROFILE=claude-profile
```

### Environment Variables

```bash
export AWS_ACCESS_KEY_ID=AKIA...
export AWS_SECRET_ACCESS_KEY=...
export AWS_SESSION_TOKEN=...  # if using temporary credentials
export AWS_REGION=us-east-1
```

### API Key (Bedrock Marketplace)

```bash
export AWS_BEARER_TOKEN_BEDROCK=your-api-key
export AWS_REGION=us-east-1
```

---

## Settings File Configuration

Add to `~/.claude/settings.json` for persistent configuration:

```json
{
  "env": {
    "CLAUDE_CODE_USE_BEDROCK": "1",
    "AWS_REGION": "us-east-1",
    "AWS_PROFILE": "claude-profile"
  }
}
```

---

## Auto-Refresh for SSO / Corporate Identity

If your credentials expire during sessions, configure auto-refresh:

```json
{
  "env": {
    "CLAUDE_CODE_USE_BEDROCK": "1",
    "AWS_REGION": "us-east-1",
    "AWS_PROFILE": "claude-profile"
  },
  "awsAuthRefresh": "aws sso login --profile claude-profile"
}
```

Claude Code will automatically run this command when credentials expire.

---

## Model Pinning

Pin specific model versions to prevent unexpected behavior from version updates:

```bash
# Pin to specific versions
export ANTHROPIC_DEFAULT_OPUS_MODEL='us.anthropic.claude-opus-4-6-v1'
export ANTHROPIC_DEFAULT_SONNET_MODEL='us.anthropic.claude-sonnet-4-6-v1'
export ANTHROPIC_DEFAULT_HAIKU_MODEL='us.anthropic.claude-haiku-4-5-v1'
```

Or in `~/.claude/settings.json`:

```json
{
  "env": {
    "ANTHROPIC_DEFAULT_OPUS_MODEL": "us.anthropic.claude-opus-4-6-v1",
    "ANTHROPIC_DEFAULT_SONNET_MODEL": "us.anthropic.claude-sonnet-4-6-v1",
    "ANTHROPIC_DEFAULT_HAIKU_MODEL": "us.anthropic.claude-haiku-4-5-v1"
  }
}
```

---

## Cross-Region Inference

Use cross-region inference profiles for better availability:

```bash
# Use cross-region profile IDs (prefixed with region)
export ANTHROPIC_DEFAULT_SONNET_MODEL='us.anthropic.claude-sonnet-4-6-v1'
```

Cross-region profiles route requests to the nearest available region automatically.

---

## Guardrails

Apply content filtering guardrails to all Claude Code requests:

```json
{
  "env": {
    "CLAUDE_CODE_USE_BEDROCK": "1",
    "AWS_REGION": "us-east-1",
    "ANTHROPIC_CUSTOM_HEADERS": "X-Amzn-Bedrock-GuardrailIdentifier: your-guardrail-id\nX-Amzn-Bedrock-GuardrailVersion: 1"
  }
}
```

---

## IAM Policy

Minimum IAM permissions required for Claude Code:

```json
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [
        "bedrock:InvokeModel",
        "bedrock:InvokeModelWithResponseStream"
      ],
      "Resource": [
        "arn:aws:bedrock:*::foundation-model/anthropic.claude-*",
        "arn:aws:bedrock:*:*:inference-profile/us.anthropic.claude-*"
      ]
    }
  ]
}
```

---

## Complete Example (settings.json)

```json
{
  "env": {
    "CLAUDE_CODE_USE_BEDROCK": "1",
    "AWS_REGION": "us-east-1",
    "AWS_PROFILE": "claude-profile",
    "ANTHROPIC_DEFAULT_OPUS_MODEL": "us.anthropic.claude-opus-4-6-v1",
    "ANTHROPIC_DEFAULT_SONNET_MODEL": "us.anthropic.claude-sonnet-4-6-v1",
    "ANTHROPIC_DEFAULT_HAIKU_MODEL": "us.anthropic.claude-haiku-4-5-v1"
  },
  "awsAuthRefresh": "aws sso login --profile claude-profile"
}
```

---

## Troubleshooting

| Issue | Fix |
|-------|-----|
| `AccessDeniedException` | Check IAM policy has `bedrock:InvokeModel` permission |
| `ExpiredTokenException` | Set `awsAuthRefresh` for auto-renewal |
| Model not available | Request model access in AWS Console > Bedrock > Model access |
| Wrong region | Verify `AWS_REGION` matches where models are enabled |
| SSO expired | Run `aws sso login --profile <profile>` manually |

---

## Tips

- Enable model access in the AWS Console before first use (Bedrock > Model access)
- Use cross-region inference profiles for better availability and latency
- SSO credentials typically expire after 8-12 hours; use `awsAuthRefresh` to handle this
- Costs appear in your AWS bill under Bedrock, not Anthropic
- Use CloudWatch to monitor Bedrock API usage and costs
