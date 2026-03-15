---
name: debug
description: >
  Systematic debugging using hypothesis testing. Reproduces the error,
  isolates the cause, and implements a fix. Use when the user reports a bug,
  error, or unexpected behavior, or says "debug this", "fix this error",
  "why is this failing", or "it's not working".
disable-model-invocation: true
allowed-tools: Bash, Read, Write, Edit, Grep, Glob
argument-hint: "<error message or description>"
---

Debug the following issue: $ARGUMENTS

## Phase 1: Reproduce

1. Understand the error:
   - Read $ARGUMENTS carefully. Extract: the error message, the affected component, any stack trace or file/line references.
   - If a stack trace is provided, read every file and line mentioned.

2. Reproduce the failure:
   - Find or write a command, test, or script that triggers the error reliably
   - Confirm it fails consistently before investigating the cause

## Phase 2: Isolate

3. Form hypotheses (list at least 3):
   - Based on the error message and stack trace, what are the most likely root causes?
   - Rank them by likelihood

4. Test each hypothesis systematically (highest likelihood first):
   - Add targeted logging or print statements to narrow the scope
   - Check variable values at key points
   - Inspect config files, environment variables, and dependencies that could be involved
   - Use binary search: disable/simplify half the code to find which half contains the bug
   - Read the documentation or source of any library involved if the error is unfamiliar

5. Identify the root cause:
   - A hypothesis is confirmed when you can explain both WHY the error occurs and WHY it does NOT occur in other cases
   - Do not fix until the root cause is confirmed

## Phase 3: Fix

6. Implement the minimal fix:
   - Change only what is necessary to address the root cause
   - Do not refactor or add features in the same change

7. Verify the fix:
   - Re-run the reproduction case - it must succeed
   - Run the full test suite - no regressions allowed

8. Report the finding:
   - Root cause (one sentence)
   - Fix applied (file and line)
   - How to prevent similar issues in the future (if obvious)

## Error Handling

- If the bug cannot be reproduced: ask the user for more context (environment, inputs, exact error message)
- If multiple root causes are found: fix the most critical one, then list the others
- If the fix would be a large refactor: describe it and get user approval before implementing
- If the root cause is in a third-party dependency: report it, provide a workaround, and suggest filing an issue upstream
