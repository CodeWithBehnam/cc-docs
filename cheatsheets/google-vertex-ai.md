# Google Vertex AI Cheatsheet

## Prerequisites

- GCP account with billing enabled
- Vertex AI API enabled in your project
- Claude models requested and approved in Model Garden (24-48 hr wait)
- `gcloud` CLI installed

## Enable Vertex AI in Claude Code

```bash
export CLAUDE_CODE_USE_VERTEX=1
export CLOUD_ML_REGION=global       # or a specific region like us-east5
export ANTHROPIC_VERTEX_PROJECT_ID=YOUR-PROJECT-ID
```

## Setup Steps

```bash
# 1. Set project and enable API
gcloud config set project YOUR-PROJECT-ID
gcloud services enable aiplatform.googleapis.com

# 2. Authenticate
gcloud auth application-default login
```

## Pin Model Versions (required for production)

```bash
export ANTHROPIC_DEFAULT_OPUS_MODEL='claude-opus-4-6'
export ANTHROPIC_DEFAULT_SONNET_MODEL='claude-sonnet-4-6'
export ANTHROPIC_DEFAULT_HAIKU_MODEL='claude-haiku-4-5@20251001'
```

- Without pinning, new model releases can break existing users

## Defaults (when no pinning is set)

| Model type | Default ID                    |
|------------|-------------------------------|
| Primary    | `claude-sonnet-4-6`           |
| Small/fast | `claude-haiku-4-5@20251001`   |

## Override Model

```bash
export ANTHROPIC_MODEL='claude-opus-4-6'
export ANTHROPIC_SMALL_FAST_MODEL='claude-haiku-4-5@20251001'
```

## Per-Model Region Overrides

```bash
# When using global endpoint, some models need a regional fallback
export VERTEX_REGION_CLAUDE_3_5_HAIKU=us-east5
export VERTEX_REGION_CLAUDE_3_7_SONNET=us-east5
export VERTEX_REGION_CLAUDE_4_0_SONNET=us-east5
export VERTEX_REGION_CLAUDE_4_0_OPUS=europe-west1
```

## 1M Token Context Window

- Supported by Opus 4.6, Sonnet 4.6, Sonnet 4.5, Sonnet 4
- Append `[1m]` to the model ID in pinning variables to enable

## IAM Configuration

- Minimum role: `roles/aiplatform.user`
- Required permission: `aiplatform.endpoints.predict`
- Use a dedicated GCP project for cost tracking

## Other Variables

```bash
export DISABLE_PROMPT_CACHING=1    # disable prompt caching if needed
```

- `/login` and `/logout` are disabled when using Vertex
- Project ID auto-read from `ANTHROPIC_VERTEX_PROJECT_ID`; override with `GCLOUD_PROJECT` or `GOOGLE_CLOUD_PROJECT`

## Troubleshooting

| Problem                   | Fix                                                                 |
|---------------------------|---------------------------------------------------------------------|
| 404 "model not found"     | Confirm model is enabled in Model Garden; check region support      |
| 429 rate limit            | Switch to `CLOUD_ML_REGION=global`; or request quota increase       |
| Quota issues              | Cloud Console → APIs & Services → Quotas                           |
| Global endpoint 404       | Some models don't support global; use `VERTEX_REGION_*` override    |

---

> Source: [google-vertex-ai.md](../google-vertex-ai.md)
