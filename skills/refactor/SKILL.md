---
name: refactor
description: >
  Refactor a target file, function, or module while preserving behavior.
  Runs tests before and after to verify correctness. Use when the user says
  "refactor this", "clean up", "improve this code", or "simplify this function".
disable-model-invocation: true
allowed-tools: Bash, Read, Write, Edit, Grep, Glob
argument-hint: "<file or function to refactor>"
---

Refactor $ARGUMENTS while preserving all existing behavior:

1. Establish a baseline:
   - Run the test suite and record the result: tests must be passing before you start
   - If tests are failing, stop and report - do not refactor broken code
   - Note which files are covered by tests

2. Read and understand the target:
   - Read the file(s) mentioned in $ARGUMENTS
   - Identify code smells: long functions, deep nesting, duplication, unclear names, magic numbers, mixed abstraction levels
   - Read callers and dependencies to understand the full contract

3. Plan the refactoring (do not modify files yet):
   - List the specific changes to make
   - Confirm none of them changes observable behavior (inputs/outputs, side effects, public API)
   - If a behavior change would improve things, note it separately and ask the user first

4. Apply the refactoring in small, safe steps:
   - Rename for clarity
   - Extract repeated logic into named helpers
   - Flatten deep nesting using early returns
   - Replace magic values with named constants
   - Break large functions at natural seams
   - Preserve all existing public interfaces and function signatures

5. Run tests after each significant step to catch regressions early

6. Final verification:
   - Run the full test suite
   - All previously passing tests must still pass
   - No new failures allowed

7. Report the result:
   - List what was changed and why
   - Show a diff summary
   - Note any follow-up improvements that would require behavior changes (flagged, not applied)

## Requirements

- Tests must be passing before refactoring begins
- The target ($ARGUMENTS) must be a valid file, function name, or module path

## Error Handling

- If tests are failing before the refactor: stop and report, suggest fixing them first
- If a refactoring step causes test failures: revert that step and try a safer approach
- If no tests cover the target code: warn the user and ask whether to proceed or write tests first
