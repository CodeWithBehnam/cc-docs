# Headless Scripts: Batch Processing with Claude

Ready-to-use shell scripts for running Claude Code programmatically in non-interactive mode.

---

## 1. Batch File Migration

Migrate files from one pattern to another across your codebase.

```bash
#!/bin/bash
# migrate-files.sh - Batch migrate files using Claude
# Usage: ./migrate-files.sh "Convert all .jsx files to .tsx with proper TypeScript types"

PROMPT="${1:?Usage: $0 \"migration description\"}"
PATTERN="${2:-**/*.jsx}"  # Default: all JSX files

echo "Finding files matching: $PATTERN"
FILES=$(find . -path ./node_modules -prune -o -name "*.jsx" -print)

for file in $FILES; do
  echo "Processing: $file"
  claude -p "Migrate this file: $file

Instructions: $PROMPT

Read the file, apply the migration, and write the result back.
Do not change functionality, only apply the specified migration." \
    --permission-mode acceptEdits \
    --allowedTools "Read,Edit,Write" \
    --max-turns 5 \
    --output-format text
done

echo "Migration complete. Review changes with: git diff"
```

---

## 2. Code Review in Pre-Commit Hook

Run Claude as a pre-commit check.

```bash
#!/bin/bash
# .git/hooks/pre-commit (or .husky/pre-commit)
# Runs Claude to review staged changes before committing

STAGED_FILES=$(git diff --cached --name-only --diff-filter=ACMR)

if [ -z "$STAGED_FILES" ]; then
  exit 0
fi

DIFF=$(git diff --cached)

RESULT=$(claude -p "Review these staged changes for critical issues only.

Files changed:
$STAGED_FILES

Diff:
$DIFF

Only report CRITICAL issues that would cause bugs, security vulnerabilities,
or data loss. Do not report style issues or minor suggestions.

If no critical issues found, respond with exactly: LGTM
If issues found, list them clearly." \
  --output-format text \
  --max-turns 3 \
  --max-budget-usd 0.50 2>&1)

if echo "$RESULT" | grep -q "LGTM"; then
  echo "Pre-commit review: passed"
  exit 0
else
  echo "Pre-commit review found issues:"
  echo "$RESULT"
  echo ""
  echo "Fix the issues above or commit with --no-verify to skip."
  exit 1
fi
```

---

## 3. Structured Output with JSON Schema

Extract structured data from code using Claude.

```bash
#!/bin/bash
# extract-api-endpoints.sh - Extract API endpoint documentation as JSON
# Usage: ./extract-api-endpoints.sh src/routes/

DIR="${1:-.}"

claude -p "Analyze all route/endpoint definitions in $DIR and extract them.

Return a JSON array of all API endpoints found." \
  --output-format json \
  --json-schema '{
    "type": "object",
    "properties": {
      "endpoints": {
        "type": "array",
        "items": {
          "type": "object",
          "properties": {
            "method": { "type": "string" },
            "path": { "type": "string" },
            "description": { "type": "string" },
            "file": { "type": "string" },
            "line": { "type": "number" },
            "auth_required": { "type": "boolean" }
          },
          "required": ["method", "path", "file"]
        }
      }
    },
    "required": ["endpoints"]
  }' \
  --allowedTools "Read,Grep,Glob" \
  --max-turns 10
```

---

## 4. Lint and Fix Pipeline

Run a multi-step lint-analyze-fix pipeline.

```bash
#!/bin/bash
# lint-fix.sh - Lint, analyze, and fix issues
# Usage: ./lint-fix.sh [directory]

DIR="${1:-.}"

echo "Step 1: Running linter..."
LINT_OUTPUT=$(npm run lint 2>&1) || true

if echo "$LINT_OUTPUT" | grep -q "error"; then
  echo "Step 2: Fixing lint errors with Claude..."
  claude -p "Fix the following lint errors. Only fix the errors, do not refactor or improve code otherwise.

Lint output:
$LINT_OUTPUT

Fix each error in the affected files." \
    --permission-mode acceptEdits \
    --allowedTools "Read,Edit,Grep,Glob" \
    --max-turns 15 \
    --output-format text

  echo "Step 3: Verifying fixes..."
  npm run lint
else
  echo "No lint errors found."
fi
```

---

## 5. Generate Documentation

Auto-generate documentation from code.

```bash
#!/bin/bash
# generate-docs.sh - Generate API documentation from source code
# Usage: ./generate-docs.sh src/ docs/api.md

SRC_DIR="${1:?Usage: $0 <src-dir> <output-file>}"
OUTPUT="${2:?Usage: $0 <src-dir> <output-file>}"

claude -p "Generate comprehensive API documentation for the code in $SRC_DIR.

Read all source files and produce a well-organized markdown document covering:
- Module/class overview
- Public functions and methods with parameters and return types
- Usage examples where helpful
- Configuration options

Write the documentation to $OUTPUT.
Use clear headings and code examples.
Do not include internal/private implementation details." \
  --permission-mode acceptEdits \
  --allowedTools "Read,Write,Grep,Glob" \
  --max-turns 20 \
  --output-format text

echo "Documentation written to $OUTPUT"
```

---

## 6. Streaming Analysis

Real-time streaming output for long-running analysis.

```bash
#!/bin/bash
# analyze-stream.sh - Stream analysis results in real-time
# Usage: ./analyze-stream.sh

claude -p "Perform a comprehensive security audit of this codebase.

Check for:
1. SQL injection vulnerabilities
2. XSS vulnerabilities
3. Authentication/authorization issues
4. Hardcoded secrets or credentials
5. Insecure dependencies

Report each finding as you discover it." \
  --output-format stream-json \
  --allowedTools "Read,Grep,Glob,Bash(npm audit *)" \
  --max-turns 20 | \
  jq -r 'select(.type == "assistant") | .content[] | select(.type == "text") | .text'
```

---

## 7. Session Continuation

Resume previous work across script runs.

```bash
#!/bin/bash
# continue-work.sh - Continue a named session
# Usage: ./continue-work.sh "session-name" "next instruction"

SESSION="${1:?Usage: $0 <session-name> <prompt>}"
PROMPT="${2:?Usage: $0 <session-name> <prompt>}"

# First run: create a named session
# claude -p "initial task" --name "$SESSION" --output-format text

# Subsequent runs: continue the session
claude --resume "$SESSION" \
  -p "$PROMPT" \
  --output-format text \
  --max-turns 10
```

---

## Common Flags Reference

| Flag | Purpose | Example |
|------|---------|---------|
| `-p "prompt"` | Non-interactive mode | `-p "Fix all TypeErrors"` |
| `--output-format` | Output format | `text`, `json`, `stream-json` |
| `--json-schema` | Validate JSON output | `'{"type":"object",...}'` |
| `--allowedTools` | Pre-approve tools | `"Read,Edit,Bash(npm test *)"` |
| `--max-turns` | Limit iterations | `--max-turns 10` |
| `--max-budget-usd` | Cost cap | `--max-budget-usd 5.00` |
| `--permission-mode` | Permission handling | `acceptEdits`, `plan` |
| `--name` | Name the session | `--name "migration-v2"` |
| `--resume` | Resume session | `--resume "migration-v2"` |
| `--append-system-prompt` | Add instructions | `--append-system-prompt "Use Python 3.12"` |
