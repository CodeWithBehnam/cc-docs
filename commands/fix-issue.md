---
name: fix-issue
description: Read a GitHub issue, implement the fix, write tests, and commit.
argument-hint: <issue-number>
allowed-tools: Bash, Read, Grep, Glob
---

Fix GitHub issue #$ARGUMENTS.

Follow these steps:

1. Fetch the issue details with `gh issue view $ARGUMENTS`. Read the title, body, and any comments carefully.

2. Explore the codebase to find the relevant code:
   - Search for symbols, file names, or error messages mentioned in the issue.
   - Read the affected files to understand the current behavior.

3. Plan the fix. Write a short plan (3-5 bullet points) before making any changes. Include:
   - Root cause of the issue.
   - Files that need to change.
   - How the fix addresses the root cause without introducing regressions.

4. Implement the fix. Make minimal, focused changes. Do not refactor unrelated code.

5. Write or update tests that:
   - Reproduce the bug (a test that would have caught this issue before the fix).
   - Verify the fixed behavior.
   Place tests in the appropriate test file following the project's existing conventions.

6. Run the test suite to confirm all tests pass (including pre-existing tests).

7. Stage the changed files and commit with a message in this format:
   `fix: <short description> (closes #$ARGUMENTS)`
   Include a brief body explaining the root cause and the approach taken.

8. Summarize what was changed and why.
