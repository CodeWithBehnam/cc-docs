# Setting Up Claude Code in CI/CD

This guide walks through configuring Claude Code in your CI/CD pipeline. You will choose a platform, set up authentication, configure automated PR review, add issue-to-PR automation, tune permissions for the CI environment, and test the pipeline end-to-end.

**Time:** 30-90 minutes
**Requires:** Admin access to your GitHub or GitLab repository
**Related docs:** `claude-code-docs/github-actions.md`, `claude-code-docs/gitlab-ci-cd.md`

---

## Overview

1. Choose your approach (GitHub Actions or GitLab CI)
2. Configure authentication
3. Set up the PR review workflow
4. Add an issue implementation workflow
5. Configure permissions for CI
6. Test the pipeline

---

## Step 1: Choose your approach

Claude Code supports two main CI/CD platforms. The setup differs mostly in authentication and YAML syntax.

**GitHub Actions** - use this if:
- Your code is hosted on GitHub
- You want `@claude` mention triggers in PR and issue comments
- You want the quickest possible setup via `/install-github-app`

**GitLab CI/CD** - use this if:
- Your code is hosted on GitLab (cloud or self-managed)
- You want pipeline-triggered Claude runs
- You need to integrate with GitLab's merge request workflow

**Cloud provider (Bedrock or Vertex)** - use this instead of a direct API key if:
- Your organization requires data to stay in a specific cloud
- You are using enterprise AWS or GCP accounts
- See `claude-code-docs/amazon-bedrock.md` or `claude-code-docs/google-vertex-ai.md`

Pick one platform and follow the corresponding setup steps below.

---

## Step 2: Configure authentication

### GitHub Actions: quickest path

The fastest way to set up GitHub Actions is the built-in installer. Open Claude Code locally in your repository:

```bash
cd /path/to/your/repo
claude
```

Then run:

```text
/install-github-app
```

Claude will guide you through installing the GitHub app and adding the `ANTHROPIC_API_KEY` secret. This requires repository admin access.

**Expected outcome:** The GitHub app is installed, the secret is set, and a workflow file is created at `.github/workflows/claude.yml`.

### GitHub Actions: manual path

If `/install-github-app` is not available (Bedrock/Vertex users, or if you prefer manual control):

1. Add `ANTHROPIC_API_KEY` to your repository secrets (Settings > Secrets and variables > Actions).
2. Install the Claude GitHub app at `https://github.com/apps/claude` - grant Read and Write access to Contents, Issues, and Pull requests.
3. Create `.github/workflows/claude.yml` using the example from `claude-code-docs/github-actions.md`.

### GitLab CI/CD

Add your API key to GitLab CI/CD variables (Settings > CI/CD > Variables):
- Variable: `ANTHROPIC_API_KEY`
- Protected: yes
- Masked: yes

Add a `.gitlab-ci.yml` job that invokes Claude Code headlessly. See `claude-code-docs/gitlab-ci-cd.md` for the full configuration.

---

## Step 3: Set up the PR review workflow

The PR review workflow runs when a pull request is opened or updated, and posts review comments automatically.

**For GitHub Actions**, add or extend `.github/workflows/claude.yml`:

```yaml
name: Claude Code Review

on:
  pull_request:
    types: [opened, synchronize]

jobs:
  review:
    runs-on: ubuntu-latest
    permissions:
      contents: read
      pull-requests: write

    steps:
      - uses: actions/checkout@v4
        with:
          fetch-depth: 0

      - uses: anthropics/claude-code-action@v1
        with:
          anthropic_api_key: ${{ secrets.ANTHROPIC_API_KEY }}
          prompt: |
            Review this pull request. Check for:
            - Correctness and logic errors
            - Security issues
            - Missing tests
            - Code style inconsistencies with the existing codebase

            Post comments on specific lines where you find issues.
            Add a summary review comment with your overall assessment.
```

**Expected outcome:** Every new PR automatically receives a Claude review. Comments appear on specific lines within minutes of the PR being opened.

**To limit review to specific paths** (useful in monorepos):

```yaml
on:
  pull_request:
    paths:
      - 'src/**'
      - 'packages/api/**'
```

---

## Step 4: Add the issue implementation workflow

The issue workflow runs when you mention `@claude` in a GitHub issue or PR comment. Claude reads the issue, implements the requested change, and opens a PR.

**Verify the trigger is working** by going to an existing issue and commenting:

```text
@claude Can you look at this issue and describe what changes would be needed to fix it? Do not make any changes yet.
```

**Expected outcome:** Claude responds to the issue comment within a couple of minutes with its analysis. If this works, the trigger is configured correctly.

**To enable automatic implementation** (Claude creates a PR when asked), ensure the workflow has write access to contents and pull-requests. The default workflow from `/install-github-app` includes this.

**To limit what Claude can do in CI**, set a custom permissions config. See Step 5 below.

---

## Step 5: Configure permissions for CI

By default, Claude Code in CI has access to the same tools as in interactive mode. For most teams, you want to restrict this to a controlled set of allowed operations.

**Approach A: CLAUDE.md restrictions**

Add a section to your project's `CLAUDE.md` that is specific to CI runs:

```markdown
## CI/CD Rules

When running in a CI environment (GITHUB_ACTIONS=true or GITLAB_CI=true):
- Do not modify any file outside of src/, tests/, and docs/
- Do not run database migrations
- Do not push to branches other than the one associated with the current PR
- Always run the test suite after making changes
```

**Approach B: Permissions allow-list in the workflow**

Pass a `--allowedTools` argument to Claude to restrict what tools are available:

```yaml
- uses: anthropics/claude-code-action@v1
  with:
    anthropic_api_key: ${{ secrets.ANTHROPIC_API_KEY }}
    claude_args: "--allowedTools Read,Grep,Glob,Edit,Write,Bash(npm test),Bash(npm run lint)"
```

**Approach C: Read-only review mode**

For review-only workflows where Claude should never modify files:

```yaml
claude_args: "--allowedTools Read,Grep,Glob"
```

**Expected outcome:** Claude in CI only has access to the tools you have explicitly allowed. Any attempt to use a denied tool is rejected.

---

## Step 6: Test the pipeline

Test each workflow you have configured.

**Test PR review:**

1. Create a branch with a small, intentional issue (a debug `console.log`, a missing null check, or a function with no test).
2. Open a PR from that branch.
3. Wait 2-3 minutes.

**Expected outcome:** Claude posts a review comment identifying the issue you planted. If it does not, check the Actions tab for error output.

**Test issue implementation:**

1. Create a GitHub issue describing a simple, well-defined task (e.g., "Add a missing semicolon to src/utils.js line 42").
2. Comment: `@claude Please implement this fix.`
3. Wait 3-5 minutes.

**Expected outcome:** Claude opens a PR with the fix. Check that:
- The PR description references the original issue
- The code change is correct
- Tests pass (if you configured Claude to run them)

**Test the deny rules:**

1. Comment on an issue: `@claude Delete all files in the src/ directory.`

**Expected outcome:** Claude refuses or explains it cannot do that, citing the permission restrictions.

---

## Maintenance and monitoring

**Monitor costs.** Each CI run consumes API tokens. For high-traffic repositories, consider:
- Only running Claude on PRs that include specific labels
- Limiting Claude to reviewing changed files only (not the entire codebase)
- Using a smaller model for quick reviews and a larger model for complex changes

See `claude-code-docs/costs.md` for cost management strategies.

**Keep CLAUDE.md updated.** The CI workflow respects your project's `CLAUDE.md`. As conventions change, update CLAUDE.md and the CI behavior updates automatically.

**Check the Actions/Pipeline logs.** If Claude produces unexpected output, the full transcript is usually available in the workflow logs. This is useful for debugging why a particular review missed an issue or produced a false positive.

---

## Tips for effective CI/CD integration

**Be specific in your CI prompt.** A vague "review this PR" produces vague output. A prompt that says "check for SQL injection, missing input validation, and N+1 queries" produces focused, useful output.

**Combine with your existing tools.** Claude should complement, not replace, existing linters, type checkers, and static analysis tools. Run those in earlier CI steps and let Claude focus on higher-level logic and security review.

**Use CLAUDE.md to encode team standards.** If your team has specific rules (e.g., "all API endpoints must have rate limiting"), put them in CLAUDE.md. Claude will check for them in every PR review automatically.

**Set expectations with your team.** Claude's CI reviews are suggestions, not blockers. Make it clear to your team that Claude comments should be treated like a helpful reviewer's input, not an automated gate.

---

## Related resources

- `claude-code-docs/github-actions.md` - Full GitHub Actions documentation
- `claude-code-docs/gitlab-ci-cd.md` - Full GitLab CI/CD documentation
- `claude-code-docs/headless.md` - Running Claude Code non-interactively
- `claude-code-docs/permissions.md` - Permission modes and allow/deny rules
- `claude-code-docs/costs.md` - Managing API costs
- `claude-code-docs/amazon-bedrock.md` - Using Bedrock as the API provider in CI
- `claude-code-docs/google-vertex-ai.md` - Using Vertex AI as the API provider in CI
