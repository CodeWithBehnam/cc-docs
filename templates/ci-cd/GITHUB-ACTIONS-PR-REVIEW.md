# GitHub Actions: Automated PR Review

Copy the workflow YAML into `.github/workflows/claude-pr-review.yml` in your repository.

## Prerequisites

1. Install the Claude GitHub App: run `/install-github-app` in Claude Code, or install manually from [github.com/apps/claude](https://github.com/apps/claude)
2. Add `ANTHROPIC_API_KEY` to your repository secrets (Settings > Secrets > Actions)
3. Required GitHub App permissions: Contents R/W, Issues R/W, Pull requests R/W

---

## Basic PR Review (on every push)

```yaml
name: Claude PR Review

on:
  pull_request:
    types: [opened, synchronize]
  issue_comment:
    types: [created]

jobs:
  review:
    if: |
      (github.event_name == 'pull_request') ||
      (github.event_name == 'issue_comment' && contains(github.event.comment.body, '@claude'))
    runs-on: ubuntu-latest
    permissions:
      contents: read
      pull-requests: write
      issues: write
    steps:
      - uses: actions/checkout@v4
        with:
          fetch-depth: 0

      - uses: anthropics/claude-code-action@v1
        with:
          anthropic_api_key: ${{ secrets.ANTHROPIC_API_KEY }}
          prompt: |
            Review this pull request thoroughly. Check for:
            - Bugs, logic errors, and edge cases
            - Security vulnerabilities
            - Performance issues
            - Code style and consistency
            - Test coverage gaps

            Be specific with line references. Only flag real issues, not style preferences.
```

---

## Review with Custom Rules

```yaml
      - uses: anthropics/claude-code-action@v1
        with:
          anthropic_api_key: ${{ secrets.ANTHROPIC_API_KEY }}
          claude_args: "--max-turns 10 --model claude-sonnet-4-6"
          prompt: |
            Review this PR following these project rules:

            1. All new functions must have JSDoc comments
            2. Database queries must use parameterized statements
            3. API endpoints must validate input with zod
            4. No console.log in production code (use logger)
            5. New features must have tests

            For each issue found, provide:
            - File and line number
            - What's wrong
            - How to fix it (with code example)

            If the PR looks good, say so briefly.
```

---

## Review with Specific Tool Access

```yaml
      - uses: anthropics/claude-code-action@v1
        with:
          anthropic_api_key: ${{ secrets.ANTHROPIC_API_KEY }}
          claude_args: >-
            --max-turns 15
            --allowedTools Bash,Read,Grep,Glob
            --disallowedTools Edit,Write
          prompt: |
            Review this PR. You can read files and run tests, but do not modify any files.

            Steps:
            1. Read the changed files
            2. Run the test suite to check for failures
            3. Check test coverage for the changed code
            4. Post your findings as a review comment
```

---

## Review with AWS Bedrock

```yaml
      - uses: anthropics/claude-code-action@v1
        with:
          use_bedrock: "true"
          claude_args: "--max-turns 10"
          prompt: "Review this pull request for bugs, security issues, and code quality."
        env:
          AWS_ACCESS_KEY_ID: ${{ secrets.AWS_ACCESS_KEY_ID }}
          AWS_SECRET_ACCESS_KEY: ${{ secrets.AWS_SECRET_ACCESS_KEY }}
          AWS_REGION: us-east-1
```

---

## Review with Google Vertex AI

```yaml
      - uses: anthropics/claude-code-action@v1
        with:
          use_vertex: "true"
          claude_args: "--max-turns 10"
          prompt: "Review this pull request for bugs, security issues, and code quality."
        env:
          ANTHROPIC_VERTEX_PROJECT_ID: ${{ secrets.GCP_PROJECT_ID }}
          CLOUD_ML_REGION: us-east5
          GOOGLE_APPLICATION_CREDENTIALS: ${{ steps.auth.outputs.credentials_file_path }}
```

---

## Trigger Modes

| Mode | Config | When |
|------|--------|------|
| Every push | `types: [opened, synchronize]` | Review on each commit push |
| PR creation only | `types: [opened]` | Review once when PR is created |
| Manual only | Remove `pull_request` trigger | Only responds to `@claude` comments |
| Label-triggered | Add `if: contains(github.event.pull_request.labels.*.name, 'needs-review')` | Only when labeled |

---

## Cost Control

```yaml
          claude_args: "--max-turns 5 --max-budget-usd 2.00"
```

Limit turns and budget to control costs per review.
