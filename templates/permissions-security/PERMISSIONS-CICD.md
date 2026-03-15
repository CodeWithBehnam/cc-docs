# Permissions Template: CI/CD Safe Mode

Locked-down permission configurations for running Claude Code in CI/CD pipelines,
automated workflows, and unattended operation.

---

## Read-Only Analysis (Safest)

For code review, analysis, and reporting. No file modifications allowed.

```json
{
  "permissions": {
    "allow": [
      "Read",
      "Grep",
      "Glob",
      "Bash(git diff *)",
      "Bash(git log *)",
      "Bash(git show *)",
      "Bash(wc *)",
      "Bash(cat *)"
    ],
    "deny": [
      "Edit",
      "Write",
      "NotebookEdit",
      "Bash(rm *)",
      "Bash(git push *)",
      "Bash(git commit *)",
      "Bash(git checkout *)",
      "Bash(git reset *)",
      "Bash(curl *)",
      "Bash(wget *)"
    ]
  }
}
```

CLI equivalent:

```bash
claude -p "Review this code" \
  --allowedTools "Read,Grep,Glob,Bash(git diff *),Bash(git log *)" \
  --disallowedTools "Edit,Write"
```

---

## PR Review with Test Running

Allow reading, running tests, but no file edits.

```bash
claude -p "Review this PR and run tests" \
  --permission-mode acceptEdits \
  --allowedTools "Read,Grep,Glob,Bash(npm test *),Bash(npm run lint *),Bash(git diff *)" \
  --disallowedTools "Edit,Write,Bash(rm *),Bash(git push *)" \
  --max-turns 15 \
  --max-budget-usd 5.00
```

---

## Implementation Mode (Controlled Edits)

Allow file edits within specific directories, block everything else.

```json
{
  "permissions": {
    "allow": [
      "Read",
      "Grep",
      "Glob",
      "Edit(src/**)",
      "Edit(tests/**)",
      "Write(src/**)",
      "Write(tests/**)",
      "Bash(npm test *)",
      "Bash(npm run *)",
      "Bash(git add *)",
      "Bash(git commit *)",
      "Bash(git diff *)",
      "Bash(git status)"
    ],
    "deny": [
      "Edit(.github/**)",
      "Edit(package.json)",
      "Edit(*.config.*)",
      "Edit(.env*)",
      "Write(.github/**)",
      "Write(package.json)",
      "Write(.env*)",
      "Bash(rm -rf *)",
      "Bash(git push --force *)",
      "Bash(git reset --hard *)",
      "Bash(curl * | *)",
      "Bash(wget * | *)"
    ]
  }
}
```

CLI equivalent:

```bash
claude -p "Implement the feature described in this issue" \
  --permission-mode acceptEdits \
  --allowedTools "Read,Grep,Glob,Edit(src/**),Edit(tests/**),Write(src/**),Write(tests/**),Bash(npm test *),Bash(npm run *),Bash(git add *),Bash(git commit *)" \
  --max-turns 30 \
  --max-budget-usd 10.00
```

---

## GitHub Actions Presets

### Review-only workflow

```yaml
- uses: anthropics/claude-code-action@v1
  with:
    anthropic_api_key: ${{ secrets.ANTHROPIC_API_KEY }}
    claude_args: >-
      --max-turns 10
      --max-budget-usd 3.00
      --allowedTools Read,Grep,Glob,Bash(git diff *)
      --disallowedTools Edit,Write
    prompt: "Review this PR for bugs and security issues. Do not modify any files."
```

### Implementation workflow

```yaml
- uses: anthropics/claude-code-action@v1
  with:
    anthropic_api_key: ${{ secrets.ANTHROPIC_API_KEY }}
    claude_args: >-
      --max-turns 25
      --max-budget-usd 10.00
      --allowedTools Read,Grep,Glob,Edit,Write,Bash(npm test *),Bash(npm run lint *)
      --disallowedTools Bash(rm -rf *),Bash(curl *),Bash(wget *)
    prompt: "Implement the feature described in this issue."
```

---

## GitLab CI Presets

### Review-only pipeline

```yaml
claude-review:
  script:
    - |
      claude -p "Review changes in this MR" \
        --permission-mode acceptEdits \
        --allowedTools "Read Grep Glob Bash(git diff *)" \
        --disallowedTools "Edit Write" \
        --max-turns 10 \
        --output-format text
```

### Implementation pipeline

```yaml
claude-implement:
  script:
    - |
      claude -p "Implement the requested changes" \
        --permission-mode acceptEdits \
        --allowedTools "Read Grep Glob Edit Write Bash(npm test *)" \
        --disallowedTools "Bash(rm -rf *) Bash(curl *)" \
        --max-turns 25 \
        --output-format text
```

---

## Cost Controls

Always set budget limits in CI/CD to prevent runaway costs:

| Flag | Purpose | Recommended |
|------|---------|-------------|
| `--max-turns` | Limit iteration count | 10-30 depending on task |
| `--max-budget-usd` | Hard cost cap | $2-10 for reviews, $10-25 for implementation |

```bash
claude -p "task" --max-turns 15 --max-budget-usd 5.00
```

---

## Safety Checklist

- [ ] Set `--max-turns` and `--max-budget-usd` on every CI/CD invocation
- [ ] Use `--allowedTools` to explicitly list permitted tools
- [ ] Use `--disallowedTools` to block destructive commands
- [ ] Never expose `ANTHROPIC_API_KEY` in logs (use masked CI/CD variables)
- [ ] Block `curl | bash`, `wget | bash`, and similar download-and-execute patterns
- [ ] Block `git push --force` and `git reset --hard`
- [ ] Protect config files (`.github/`, CI configs, `.env`) from edits
- [ ] Review generated diffs before merging PRs created by Claude
