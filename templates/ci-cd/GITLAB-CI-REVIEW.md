# GitLab CI/CD: MR Review with Claude

Copy the pipeline configuration into `.gitlab-ci.yml` in your repository.

## Prerequisites

1. Add `ANTHROPIC_API_KEY` as a CI/CD variable (Settings > CI/CD > Variables, masked)
2. Install Claude Code in the CI runner or use a Docker image with it pre-installed
3. Install the GitLab MCP server for API access

---

## Basic MR Review (Manual Trigger)

```yaml
stages:
  - ai

claude-review:
  stage: ai
  image: node:20
  rules:
    - if: $CI_PIPELINE_SOURCE == "merge_request_event"
      when: manual
  before_script:
    - npm install -g @anthropic-ai/claude-code
  script:
    - |
      claude -p "Review this merge request.

      MR Title: ${CI_MERGE_REQUEST_TITLE}
      MR Description: ${CI_MERGE_REQUEST_DESCRIPTION}
      Source Branch: ${CI_MERGE_REQUEST_SOURCE_BRANCH_NAME}
      Target Branch: ${CI_MERGE_REQUEST_TARGET_BRANCH_NAME}

      Review the changes for:
      - Bugs and logic errors
      - Security vulnerabilities
      - Performance issues
      - Code style consistency
      - Test coverage

      Be specific with file names and line numbers." \
        --permission-mode acceptEdits \
        --allowedTools "Bash Read Grep Glob" \
        --output-format text
```

---

## Auto-Triggered Review (on every MR push)

```yaml
claude-review:
  stage: ai
  image: node:20
  rules:
    - if: $CI_PIPELINE_SOURCE == "merge_request_event"
  before_script:
    - npm install -g @anthropic-ai/claude-code
  script:
    - |
      DIFF=$(git diff origin/${CI_MERGE_REQUEST_TARGET_BRANCH_NAME}...HEAD)
      claude -p "Review these changes:

      ${DIFF}

      Check for bugs, security issues, and code quality problems.
      Output a concise list of findings with severity (critical/warning/suggestion)." \
        --permission-mode acceptEdits \
        --allowedTools "Read Grep Glob" \
        --max-turns 10 \
        --output-format text
```

---

## Review with GitLab MCP Server

```yaml
claude-review:
  stage: ai
  image: node:20
  rules:
    - if: $CI_PIPELINE_SOURCE == "merge_request_event"
      when: manual
  variables:
    GITLAB_PERSONAL_ACCESS_TOKEN: $GITLAB_TOKEN
    GITLAB_API_URL: "https://gitlab.com/api/v4"
  before_script:
    - npm install -g @anthropic-ai/claude-code
    - |
      cat > /tmp/mcp-config.json << 'EOF'
      {
        "mcpServers": {
          "gitlab": {
            "command": "npx",
            "args": ["-y", "@anthropic-ai/mcp-server-gitlab"],
            "env": {
              "GITLAB_PERSONAL_ACCESS_TOKEN": "${GITLAB_PERSONAL_ACCESS_TOKEN}",
              "GITLAB_API_URL": "${GITLAB_API_URL}"
            }
          }
        }
      }
      EOF
  script:
    - |
      claude -p "Review MR !${CI_MERGE_REQUEST_IID} in project ${CI_PROJECT_PATH}.
      Use the GitLab MCP tools to read the MR details and post review comments." \
        --permission-mode acceptEdits \
        --allowedTools "Bash Read Grep Glob mcp__gitlab" \
        --mcp-config /tmp/mcp-config.json \
        --output-format text
```

---

## Review with AWS Bedrock (OIDC)

```yaml
claude-review:
  stage: ai
  image: node:20
  id_tokens:
    AWS_OIDC_TOKEN:
      aud: sts.amazonaws.com
  variables:
    CLAUDE_CODE_USE_BEDROCK: "1"
    AWS_REGION: us-east-1
    AWS_ROLE_ARN: "arn:aws:iam::<ACCOUNT_ID>:role/<ROLE_NAME>"
  rules:
    - if: $CI_PIPELINE_SOURCE == "merge_request_event"
      when: manual
  before_script:
    - npm install -g @anthropic-ai/claude-code
    - |
      STS_RESPONSE=$(curl -s "https://sts.amazonaws.com/?Action=AssumeRoleWithWebIdentity&RoleArn=${AWS_ROLE_ARN}&RoleSessionName=claude-ci&WebIdentityToken=${AWS_OIDC_TOKEN}&Version=2011-06-15")
      export AWS_ACCESS_KEY_ID=$(echo "$STS_RESPONSE" | grep -oP '(?<=<AccessKeyId>)[^<]+')
      export AWS_SECRET_ACCESS_KEY=$(echo "$STS_RESPONSE" | grep -oP '(?<=<SecretAccessKey>)[^<]+')
      export AWS_SESSION_TOKEN=$(echo "$STS_RESPONSE" | grep -oP '(?<=<SessionToken>)[^<]+')
  script:
    - |
      claude -p "Review the changes in this merge request." \
        --permission-mode acceptEdits \
        --allowedTools "Read Grep Glob" \
        --output-format text
```

---

## Review with Google Vertex AI (Workload Identity Federation)

```yaml
claude-review:
  stage: ai
  image: node:20
  id_tokens:
    GCP_OIDC_TOKEN:
      aud: "https://iam.googleapis.com/projects/<PROJECT_NUMBER>/locations/global/workloadIdentityPools/<POOL_ID>/providers/<PROVIDER_ID>"
  variables:
    CLAUDE_CODE_USE_VERTEX: "1"
    CLOUD_ML_REGION: us-east5
    ANTHROPIC_VERTEX_PROJECT_ID: "<GCP_PROJECT_ID>"
  rules:
    - if: $CI_PIPELINE_SOURCE == "merge_request_event"
      when: manual
  before_script:
    - npm install -g @anthropic-ai/claude-code
    - |
      cat > /tmp/gcp-creds.json << EOF
      {
        "type": "external_account",
        "audience": "//iam.googleapis.com/projects/<PROJECT_NUMBER>/locations/global/workloadIdentityPools/<POOL_ID>/providers/<PROVIDER_ID>",
        "subject_token_type": "urn:ietf:params:oauth:token-type:jwt",
        "token_url": "https://sts.googleapis.com/v1/token",
        "credential_source": {
          "file": "/tmp/gitlab-oidc-token"
        },
        "service_account_impersonation_url": "https://iamcredentials.googleapis.com/v1/projects/-/serviceAccounts/<SA_EMAIL>:generateAccessToken"
      }
      EOF
      echo "$GCP_OIDC_TOKEN" > /tmp/gitlab-oidc-token
      export GOOGLE_APPLICATION_CREDENTIALS=/tmp/gcp-creds.json
  script:
    - |
      claude -p "Review the changes in this merge request." \
        --permission-mode acceptEdits \
        --allowedTools "Read Grep Glob" \
        --output-format text
```

---

## Tips

- **Manual vs auto**: Use `when: manual` to control costs, remove it for auto-triggering
- **Cost control**: Add `--max-turns 10 --max-budget-usd 5.00` to limit spending
- **Variables**: Use CI/CD variables (masked + protected) for all secrets
- **Artifacts**: Pipe review output to a file and save as CI artifact for record-keeping
- **MCP tools**: The GitLab MCP server allows Claude to post inline comments directly
