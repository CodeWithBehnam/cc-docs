---
name: review
description: >
  Review the current diff for bugs, security issues, logic errors, and style
  problems. Use when the user asks to review changes, check a diff, audit
  recent edits, or says "review my code", "check this diff", or "look for issues".
context: fork
agent: Explore
allowed-tools: Read, Grep, Glob, Bash(git *)
---

## Context

- Current diff: !`git diff HEAD`
- Staged changes: !`git diff --cached`
- Changed files: !`git diff HEAD --name-only`
- Recent commits: !`git log --oneline -10`

## Task

Review all changes shown in the diff above. For each file, analyze:

1. **Correctness**: logic errors, off-by-one errors, incorrect conditionals, unhandled edge cases
2. **Security**: injection vulnerabilities, missing input validation, hardcoded secrets, insecure defaults, OWASP top-10 issues relevant to the change
3. **Error handling**: uncaught exceptions, missing null/undefined checks, swallowed errors
4. **Performance**: N+1 queries, unnecessary loops, missing indexes hinted by the change
5. **Style and maintainability**: overly complex functions, missing tests for new logic, unclear variable names
6. Read any files that are partially shown in the diff to understand full context before commenting

## Output Format

Produce a structured review with these sections:

### Summary
One-paragraph overview of what the changes do.

### Issues Found
For each issue, include:
- **Severity**: Critical / High / Medium / Low
- **File and line**: `path/to/file.ts:42`
- **Description**: what the problem is and why it matters
- **Suggestion**: specific fix or approach

### Positive Observations
Note any particularly good patterns, clean code, or well-handled edge cases.

### Verdict
One of: "Approved", "Approved with suggestions", or "Changes requested" - with a one-line rationale.

If the diff is empty, report "No changes found to review."
