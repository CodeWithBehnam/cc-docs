# Headless / Programmatic Mode Cheatsheet

## What It Is

Run Claude Code non-interactively via the `-p` flag (CLI) or via the Agent SDK (Python/TypeScript).
Previously called "headless mode." Useful for scripts, CI/CD, and automation.

## Basic Usage

```bash
claude -p "What does the auth module do?"
claude -p "Find and fix the bug in auth.py" --allowedTools "Read,Edit,Bash"
```

## Output Formats

| Format | Flag | Notes |
|---|---|---|
| Plain text | `--output-format text` | Default |
| JSON | `--output-format json` | Includes `result`, `session_id`, metadata |
| Streaming JSON | `--output-format stream-json` | Newline-delimited, real-time |

```bash
# Get JSON output
claude -p "Summarize this project" --output-format json

# Extract just the result
claude -p "Summarize" --output-format json | jq -r '.result'
```

## Structured Output (JSON Schema)

```bash
claude -p "Extract function names from auth.py" \
  --output-format json \
  --json-schema '{"type":"object","properties":{"functions":{"type":"array","items":{"type":"string"}}},"required":["functions"]}'

# Result is in `.structured_output` field
```

## Streaming

```bash
claude -p "Explain recursion" \
  --output-format stream-json \
  --verbose \
  --include-partial-messages | \
  jq -rj 'select(.type == "stream_event" and .event.delta.type? == "text_delta") | .event.delta.text'
```

## Auto-Approve Tools

```bash
# Allow specific tools
claude -p "Run tests and fix failures" --allowedTools "Bash,Read,Edit"

# Prefix matching (space before * is required)
claude -p "Create a commit" \
  --allowedTools "Bash(git diff *),Bash(git log *),Bash(git status *),Bash(git commit *)"
```

Note: `Bash(git diff *)` matches `git diff --staged`; `Bash(git diff*)` (no space) would also match `git diff-index`.

## Continue Conversations

```bash
# Continue most recent conversation
claude -p "Review this codebase"
claude -p "Focus on database queries" --continue

# Continue specific session
session_id=$(claude -p "Start a review" --output-format json | jq -r '.session_id')
claude -p "Continue that review" --resume "$session_id"
```

## Customize System Prompt

```bash
# Append instructions (keeps default Claude Code behavior)
gh pr diff "$1" | claude -p \
  --append-system-prompt "You are a security engineer. Review for vulnerabilities." \
  --output-format json

# Fully replace system prompt
claude -p "..." --system-prompt "Custom system prompt here"
```

## Common Automation Patterns

**Auto-commit staged changes:**
```bash
claude -p "Look at my staged changes and create an appropriate commit" \
  --allowedTools "Bash(git diff *),Bash(git log *),Bash(git status *),Bash(git commit *)"
```

**CI security review:**
```bash
gh pr diff "$PR_NUMBER" | claude -p \
  --append-system-prompt "Review for security vulnerabilities." \
  --output-format json | jq -r '.result'
```

## Gotchas

- Skills (`/commit`, `/review`) and built-in commands are interactive-only — describe the task instead
- For structured outputs, use Python/TypeScript Agent SDK for callbacks and native message objects
- See [Agent SDK docs](https://platform.claude.com/docs/en/agent-sdk/overview) for full programmatic control

---
> Source: [headless.md](../headless.md)
