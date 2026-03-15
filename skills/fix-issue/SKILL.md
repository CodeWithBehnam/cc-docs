---
name: fix-issue
description: >
  Fix a GitHub issue by number. Reads the issue, implements the fix,
  writes tests, and commits the result. Use when the user says
  "fix issue #123", "work on issue", or "implement the bug fix for #N".
disable-model-invocation: true
allowed-tools: Bash, Read, Write, Edit, Grep, Glob
argument-hint: "<issue-number>"
---

Fix GitHub issue #$ARGUMENTS:

1. Read the issue details:
   ```
   gh issue view $ARGUMENTS
   ```
   Understand the reported problem, reproduction steps, and acceptance criteria.

2. Explore the codebase to find relevant files:
   - Search for symbols, file names, or keywords mentioned in the issue
   - Read the relevant source files to understand the current implementation
   - Check existing tests for the affected area

3. Plan the fix:
   - Identify the root cause (not just the symptom)
   - Outline the minimal change needed to fix the issue without breaking existing behavior

4. Write a failing test first (TDD approach):
   - Add a test that reproduces the reported bug or missing behavior
   - Confirm it fails before the fix

5. Implement the fix:
   - Make the targeted change to source code
   - Keep the diff minimal - avoid unrelated refactors in the same commit

6. Run the test suite to verify:
   - The new test passes
   - No existing tests were broken

7. Commit with a message referencing the issue:
   ```
   fix(<scope>): <description>

   Fixes #$ARGUMENTS
   ```

## Requirements

- `gh` CLI must be installed and authenticated
- The issue number must exist in the current repository
- Tests must pass before committing

## Error Handling

- If the issue is not found: report the error and stop
- If the issue is already closed: confirm with the user before proceeding
- If tests fail after the fix: report failures and do not commit
- If the fix requires a design decision: outline the options and ask the user to choose
