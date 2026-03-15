# Cloud Provider Setup: Google Vertex AI

Complete setup for running Claude Code through Google Cloud Vertex AI.

---

## Quick Start

```bash
# 1. Enable Vertex AI
export CLAUDE_CODE_USE_VERTEX=1
export CLOUD_ML_REGION=global
export ANTHROPIC_VERTEX_PROJECT_ID=your-gcp-project-id

# 2. Authenticate
gcloud auth application-default login

# 3. Run Claude Code
claude
```

---

## Authentication Methods

### gcloud CLI (simplest)

```bash
gcloud auth application-default login
```

### Service Account

```bash
export GOOGLE_APPLICATION_CREDENTIALS=/path/to/service-account-key.json
```

### Workload Identity Federation (for CI/CD)

See the GitLab CI template for a WIF example with CI/CD.

---

## Settings File Configuration

Add to `~/.claude/settings.json` for persistent configuration:

```json
{
  "env": {
    "CLAUDE_CODE_USE_VERTEX": "1",
    "CLOUD_ML_REGION": "global",
    "ANTHROPIC_VERTEX_PROJECT_ID": "your-gcp-project-id"
  }
}
```

---

## Region Configuration

### Global endpoint (recommended)

```bash
export CLOUD_ML_REGION=global
```

The global endpoint automatically routes to the best available region.

### Specific region

```bash
export CLOUD_ML_REGION=us-east5
```

### Per-model region overrides

Route different models to different regions:

```bash
export CLOUD_ML_REGION=global
export VERTEX_REGION_CLAUDE_OPUS_4=us-east5
export VERTEX_REGION_CLAUDE_SONNET_4=us-east5
export VERTEX_REGION_CLAUDE_HAIKU_4_5=us-east5
```

---

## Model Pinning

Pin specific model versions:

```bash
export ANTHROPIC_DEFAULT_OPUS_MODEL='claude-opus-4-6'
export ANTHROPIC_DEFAULT_SONNET_MODEL='claude-sonnet-4-6'
export ANTHROPIC_DEFAULT_HAIKU_MODEL='claude-haiku-4-5@20251001'
```

Or in `~/.claude/settings.json`:

```json
{
  "env": {
    "ANTHROPIC_DEFAULT_OPUS_MODEL": "claude-opus-4-6",
    "ANTHROPIC_DEFAULT_SONNET_MODEL": "claude-sonnet-4-6",
    "ANTHROPIC_DEFAULT_HAIKU_MODEL": "claude-haiku-4-5@20251001"
  }
}
```

---

## 1M Token Context Window

Enable extended context for large codebases:

```bash
# Use 1M context via model alias suffix
export ANTHROPIC_MODEL='claude-sonnet-4-6[1m]'

# Or set in a session
/model sonnet[1m]
```

---

## Auto-Refresh for gcloud Credentials

If credentials expire during long sessions:

```json
{
  "env": {
    "CLAUDE_CODE_USE_VERTEX": "1",
    "CLOUD_ML_REGION": "global",
    "ANTHROPIC_VERTEX_PROJECT_ID": "your-gcp-project-id"
  },
  "gcpAuthRefresh": "gcloud auth application-default login --quiet"
}
```

---

## Complete Example (settings.json)

```json
{
  "env": {
    "CLAUDE_CODE_USE_VERTEX": "1",
    "CLOUD_ML_REGION": "global",
    "ANTHROPIC_VERTEX_PROJECT_ID": "your-gcp-project-id",
    "ANTHROPIC_DEFAULT_OPUS_MODEL": "claude-opus-4-6",
    "ANTHROPIC_DEFAULT_SONNET_MODEL": "claude-sonnet-4-6",
    "ANTHROPIC_DEFAULT_HAIKU_MODEL": "claude-haiku-4-5@20251001"
  }
}
```

---

## Required GCP Permissions

Minimum IAM role: `roles/aiplatform.user`

Or create a custom role with:

```yaml
title: Claude Code Vertex AI User
includedPermissions:
  - aiplatform.endpoints.predict
  - aiplatform.endpoints.list
```

---

## Troubleshooting

| Issue | Fix |
|-------|-----|
| `Permission denied` | Grant `roles/aiplatform.user` to the service account or user |
| `Model not found` | Request Claude model access via Google Cloud Console |
| `Quota exceeded` | Request quota increase in Google Cloud Console > IAM > Quotas |
| `Auth expired` | Run `gcloud auth application-default login` again, or set `gcpAuthRefresh` |
| `Region not available` | Switch to `global` or try `us-east5` |

---

## Tips

- Use the `global` region for best availability and automatic load balancing
- Request model access through Google Cloud Console before first use
- Costs appear in your GCP bill under Vertex AI, not Anthropic
- Use GCP billing alerts to monitor spending
- The 1M context window is available on Vertex AI (use `[1m]` suffix)
- For CI/CD, use Workload Identity Federation instead of service account keys
