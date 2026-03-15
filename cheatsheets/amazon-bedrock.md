# Amazon Bedrock Cheatsheet

## Prerequisites

- AWS account with Bedrock access enabled
- Claude models enabled in Bedrock console (one-time use-case form per account)
- Appropriate IAM permissions

## Enable Bedrock in Claude Code

```bash
export CLAUDE_CODE_USE_BEDROCK=1
export AWS_REGION=us-east-1
```

## Authentication Options

| Method               | Command / Variable                                                  |
|----------------------|---------------------------------------------------------------------|
| AWS CLI              | `aws configure`                                                     |
| Access key env vars  | `AWS_ACCESS_KEY_ID`, `AWS_SECRET_ACCESS_KEY`, `AWS_SESSION_TOKEN`  |
| SSO profile          | `aws sso login --profile <name>` + `export AWS_PROFILE=<name>`     |
| Bedrock API key      | `export AWS_BEARER_TOKEN_BEDROCK=your-bedrock-api-key`             |

## Auto Credential Refresh (settings.json)

```json
{
  "awsAuthRefresh": "aws sso login --profile myprofile",
  "env": { "AWS_PROFILE": "myprofile" }
}
```

- `awsAuthRefresh`: modifies `.aws` dir (browser SSO flows); output shown to user
- `awsCredentialExport`: outputs JSON credentials silently (when `.aws` can't be modified)

## Pin Model Versions (recommended for deployments)

```bash
export ANTHROPIC_DEFAULT_OPUS_MODEL='us.anthropic.claude-opus-4-6-v1'
export ANTHROPIC_DEFAULT_SONNET_MODEL='us.anthropic.claude-sonnet-4-6'
export ANTHROPIC_DEFAULT_HAIKU_MODEL='us.anthropic.claude-haiku-4-5-20251001-v1:0'
```

- Use cross-region inference IDs with `us.` prefix
- Without pinning, new model releases can break existing users

## Custom Model Selection

```bash
# Inference profile ID
export ANTHROPIC_MODEL='global.anthropic.claude-sonnet-4-6'

# Application inference profile ARN
export ANTHROPIC_MODEL='arn:aws:bedrock:us-east-2:123456789:application-inference-profile/...'

# Override region for small/fast model
export ANTHROPIC_SMALL_FAST_MODEL_AWS_REGION=us-west-2

# Disable prompt caching if needed
export DISABLE_PROMPT_CACHING=1
```

## Map Multiple Versions (modelOverrides in settings.json)

```json
{
  "modelOverrides": {
    "claude-opus-4-6": "arn:aws:bedrock:us-east-2:123456789:application-inference-profile/opus-46-prod"
  }
}
```

## IAM Policy (minimum required)

```json
{
  "Action": [
    "bedrock:InvokeModel",
    "bedrock:InvokeModelWithResponseStream",
    "bedrock:ListInferenceProfiles"
  ],
  "Resource": [
    "arn:aws:bedrock:*:*:inference-profile/*",
    "arn:aws:bedrock:*:*:foundation-model/*"
  ]
}
```

## AWS Guardrails

```json
{
  "env": {
    "ANTHROPIC_CUSTOM_HEADERS": "X-Amzn-Bedrock-GuardrailIdentifier: <id>\nX-Amzn-Bedrock-GuardrailVersion: 1"
  }
}
```

## Defaults (when no pinning is set)

| Model type    | Default ID                              |
|---------------|-----------------------------------------|
| Primary       | `global.anthropic.claude-sonnet-4-6`   |
| Small/fast    | `us.anthropic.claude-haiku-4-5-20251001-v1:0` |

## Troubleshooting

| Problem                             | Fix                                                       |
|-------------------------------------|-----------------------------------------------------------|
| Region issues                       | `aws bedrock list-inference-profiles --region <region>`   |
| "on-demand throughput not supported"| Use inference profile ID, not foundation model ID         |
| Model not available                 | Switch region or check Bedrock console for access status  |

- `/login` and `/logout` are disabled when using Bedrock
- Claude Code uses Invoke API, **not** the Converse API

---

> Source: [amazon-bedrock.md](../amazon-bedrock.md)
