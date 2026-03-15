# GitHub Actions: Auto-Implement Issues

Automatically implement GitHub issues when labeled, creating PRs with the solution.

## Prerequisites

1. Install the Claude GitHub App (see PR Review template for details)
2. Add `ANTHROPIC_API_KEY` to repository secrets
3. Create a label called `claude` (or your preferred trigger label)

---

## Basic Issue Implementation

Copy into `.github/workflows/claude-implement.yml`:

```yaml
name: Claude Issue Implementation

on:
  issues:
    types: [labeled]
  issue_comment:
    types: [created]

jobs:
  implement:
    if: |
      (github.event_name == 'issues' && github.event.label.name == 'claude') ||
      (github.event_name == 'issue_comment' && contains(github.event.comment.body, '@claude'))
    runs-on: ubuntu-latest
    permissions:
      contents: write
      pull-requests: write
      issues: write
    steps:
      - uses: actions/checkout@v4
        with:
          fetch-depth: 0

      - uses: anthropics/claude-code-action@v1
        with:
          anthropic_api_key: ${{ secrets.ANTHROPIC_API_KEY }}
          claude_args: "--max-turns 30 --allowedTools Bash,Read,Edit,Write,Grep,Glob"
          prompt: |
            Implement the feature or fix described in this issue.

            Steps:
            1. Read the issue description carefully
            2. Explore the codebase to understand the architecture
            3. Implement the solution with clean, tested code
            4. Run existing tests to make sure nothing breaks
            5. Add tests for the new functionality
            6. Create a commit with a descriptive message

            Follow the project's existing code style and patterns.
            If the issue is unclear, leave a comment asking for clarification instead of guessing.
```

---

## Implementation with Guardrails

```yaml
      - uses: anthropics/claude-code-action@v1
        with:
          anthropic_api_key: ${{ secrets.ANTHROPIC_API_KEY }}
          claude_args: >-
            --max-turns 20
            --max-budget-usd 10.00
            --allowedTools Bash(npm test *),Bash(npm run lint *),Read,Edit,Write,Grep,Glob
            --disallowedTools Bash(rm *),Bash(curl *),Bash(wget *)
          prompt: |
            Implement the feature described in this issue.

            Rules:
            - Only modify files under src/ and tests/
            - Do not modify package.json, CI configs, or infrastructure files
            - Run tests after making changes
            - Run the linter after making changes
            - Do not introduce new dependencies without noting it in the PR

            If the task is too large or risky, comment on the issue explaining why
            and suggest breaking it into smaller tasks.
```

---

## Implementation with Setup Steps

```yaml
    steps:
      - uses: actions/checkout@v4
        with:
          fetch-depth: 0

      # Set up the development environment first
      - uses: actions/setup-node@v4
        with:
          node-version: 20
          cache: npm

      - run: npm ci

      - uses: anthropics/claude-code-action@v1
        with:
          anthropic_api_key: ${{ secrets.ANTHROPIC_API_KEY }}
          claude_args: "--max-turns 25"
          prompt: |
            The development environment is already set up.
            Node.js and all npm dependencies are installed.

            Implement the feature described in this issue.
            Run `npm test` to verify your changes work.
            Run `npm run lint` to ensure code quality.
```

---

## Multi-Step: Implement, Test, then Self-Review

```yaml
    steps:
      - uses: actions/checkout@v4
        with:
          fetch-depth: 0

      - uses: anthropics/claude-code-action@v1
        with:
          anthropic_api_key: ${{ secrets.ANTHROPIC_API_KEY }}
          claude_args: "--max-turns 30"
          prompt: |
            You have two phases:

            PHASE 1 - IMPLEMENT:
            1. Read and understand the issue
            2. Explore the codebase
            3. Implement the solution
            4. Write tests
            5. Run all tests

            PHASE 2 - SELF-REVIEW:
            1. Review your own changes with `git diff`
            2. Check for: edge cases, error handling, security issues
            3. Verify test coverage is adequate
            4. Fix any issues found
            5. Run tests again

            Create a single commit with all changes.
```

---

## Tips

- **Label strategy**: Use `claude` for auto-implementation, `claude-review` for review-only
- **Budget limits**: Set `--max-budget-usd` to prevent runaway costs on complex issues
- **Tool restrictions**: Use `--allowedTools` to prevent unintended file modifications
- **Branch strategy**: The action creates a branch and PR automatically
- **Retry**: Comment `@claude` on the issue to retry if the first attempt fails
