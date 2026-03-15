# GitLab CI/CD Cheatsheet

> Beta — maintained by GitLab. See [GitLab issue #573776](https://gitlab.com/gitlab-org/gitlab/-/issues/573776).

## Quick Setup

1. Add `ANTHROPIC_API_KEY` as a **masked** CI/CD variable (Settings → CI/CD → Variables)
2. Add a Claude job to `.gitlab-ci.yml`
3. Trigger manually or via MR events

## Minimal Job (Claude API)

```yaml
stages:
  - ai

claude:
  stage: ai
  image: node:24-alpine3.21
  rules:
    - if: '$CI_PIPELINE_SOURCE == "web"'
    - if: '$CI_PIPELINE_SOURCE == "merge_request_event"'
  variables:
    GIT_STRATEGY: fetch
  before_script:
    - apk add --no-cache git curl bash
    - curl -fsSL https://claude.ai/install.sh | bash
  script:
    - /bin/gitlab-mcp-server || true
    - >
      claude
      -p "${AI_FLOW_INPUT:-'Review this MR and implement changes'}"
      --permission-mode acceptEdits
      --allowedTools "Bash Read Edit Write mcp__gitlab"
      --debug
```

## AI_FLOW Variables

| Variable          | Purpose                                      |
|-------------------|----------------------------------------------|
| `AI_FLOW_INPUT`   | The prompt / user instruction                |
| `AI_FLOW_CONTEXT` | Context (e.g., MR URL, issue reference)      |
| `AI_FLOW_EVENT`   | Trigger event type                           |

## AWS Bedrock Setup

**Required CI/CD variables:** `AWS_ROLE_TO_ASSUME`, `AWS_REGION`

```yaml
claude-bedrock:
  before_script:
    - pip install --no-cache-dir awscli
    - curl -fsSL https://claude.ai/install.sh | bash
    # Exchange GitLab OIDC token for AWS creds
    - export AWS_WEB_IDENTITY_TOKEN_FILE="/tmp/oidc_token"
    - printf "%s" "$CI_JOB_JWT_V2" > "$AWS_WEB_IDENTITY_TOKEN_FILE"
    - aws sts assume-role-with-web-identity ...
```

- Bedrock model IDs include region prefix: `us.anthropic.claude-sonnet-4-6`

## Google Vertex AI Setup

**Required CI/CD variables:** `GCP_WORKLOAD_IDENTITY_PROVIDER`, `GCP_SERVICE_ACCOUNT`, `CLOUD_ML_REGION`

```yaml
claude-vertex:
  image: gcr.io/google.com/cloudsdktool/google-cloud-cli:slim
  before_script:
    - curl -fsSL https://claude.ai/install.sh | bash
    - gcloud auth login --cred-file=<(...)
  script:
    - CLOUD_ML_REGION="${CLOUD_ML_REGION:-us-east5}" claude -p "..." ...
```

## Key Parameters

| Parameter / Flag       | Purpose                                   |
|------------------------|-------------------------------------------|
| `-p "<prompt>"`        | Inline prompt                             |
| `--permission-mode`    | `acceptEdits` (auto-apply) or `plan`      |
| `--allowedTools`       | Space-separated tool list                 |
| `--debug`              | Verbose logging                           |
| `max_turns`            | Limit iterations                          |
| `timeout_minutes`      | Job time limit                            |

## Trigger Methods

- **Manual**: CI/CD → Pipelines → Run pipeline
- **MR event**: `$CI_PIPELINE_SOURCE == "merge_request_event"`
- **Webhook + listener**: POST to pipeline trigger API with `AI_FLOW_*` vars when comment contains `@claude`

## Gotchas

- `@claude` not `/claude` for mentions
- `CI_JOB_TOKEN` may need `api` scope for MR/comment operations; use a Project Access Token if needed
- Use OIDC/WIF — avoid storing long-lived cloud credentials
- Set job `timeout` to prevent runaway runs
- `CLAUDE.md` at repo root guides Claude's behavior

---

> Source: [gitlab-ci-cd.md](../gitlab-ci-cd.md)
