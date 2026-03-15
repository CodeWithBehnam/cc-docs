# Microsoft Foundry Cheatsheet

## Prerequisites

- Azure subscription with access to Microsoft Foundry
- RBAC permissions to create Foundry resources and deployments
- Azure CLI (optional)

## Setup Steps

1. Navigate to [ai.azure.com](https://ai.azure.com/) → create a new resource
2. Create deployments for Claude Opus, Sonnet, and Haiku models
3. Choose authentication method (API key or Entra ID)

## Enable Foundry in Claude Code

```bash
export CLAUDE_CODE_USE_FOUNDRY=1
export ANTHROPIC_FOUNDRY_RESOURCE=your-resource-name
# Or provide full base URL:
# export ANTHROPIC_FOUNDRY_BASE_URL=https://{resource}.services.ai.azure.com/anthropic
```

## Authentication

**Option A: API Key**

```bash
# From Foundry portal → your resource → Endpoints and keys
export ANTHROPIC_FOUNDRY_API_KEY=your-azure-api-key
```

**Option B: Microsoft Entra ID (when API key is not set)**

```bash
az login    # Claude Code uses Azure SDK default credential chain automatically
```

- `/login` and `/logout` are disabled when using Foundry

## Pin Model Versions (required for production)

```bash
# Must match the deployment names you created in Foundry
export ANTHROPIC_DEFAULT_OPUS_MODEL='claude-opus-4-6'
export ANTHROPIC_DEFAULT_SONNET_MODEL='claude-sonnet-4-6'
export ANTHROPIC_DEFAULT_HAIKU_MODEL='claude-haiku-4-5'
```

- Select a specific model version in Azure — do **not** use "auto-update to latest"

## Azure RBAC

- Built-in roles: `Azure AI User` or `Cognitive Services User` (both sufficient)
- Minimum custom permission: `Microsoft.CognitiveServices/accounts/providers/*` (dataAction)

## Troubleshooting

| Problem                                          | Fix                                                    |
|--------------------------------------------------|--------------------------------------------------------|
| `ChainedTokenCredential authentication failed`   | Configure Entra ID or set `ANTHROPIC_FOUNDRY_API_KEY`  |
| Model not found                                  | Verify deployment name matches the env var value       |

---

> Source: [microsoft-foundry.md](../microsoft-foundry.md)
