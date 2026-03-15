---
name: tdd
description: >
  Test-driven development cycle. Writes a failing test for a feature,
  implements the minimum code to make it pass, then refactors. Use when
  the user says "use TDD", "write the test first", "TDD this feature",
  or "red-green-refactor".
disable-model-invocation: true
allowed-tools: Bash, Read, Write, Edit, Grep, Glob
argument-hint: "<feature description>"
---

Apply test-driven development for: $ARGUMENTS

## Phase 1: Red - Write a Failing Test

1. Understand the feature:
   - If $ARGUMENTS is provided, use it as the feature description
   - Explore related existing code and tests to understand conventions
   - Identify the right test file location and naming conventions

2. Write the test:
   - Create a test that describes the desired behavior from the outside
   - Use the project's existing test framework (Jest, pytest, Go test, RSpec, etc.)
   - The test must be specific, readable, and test one behavior at a time
   - Do NOT write the implementation yet

3. Run the test to confirm it fails:
   - The failure should be a meaningful assertion failure, not a syntax error
   - If the test passes without implementation, the test is wrong - revise it

## Phase 2: Green - Implement the Minimum

4. Write the minimum code to make the test pass:
   - Implement only what the test requires
   - Do not add features not yet tested
   - Ugly code is acceptable here - we refactor next

5. Run the full test suite:
   - The new test must pass
   - No previously passing tests may break

## Phase 3: Refactor - Clean Up

6. Improve the implementation:
   - Remove duplication
   - Improve naming
   - Extract helper functions if they clarify intent
   - Keep the same external behavior

7. Run tests again to confirm refactoring did not break anything

8. Report the completed cycle:
   - Show the test added and where it lives
   - Show the implementation changes
   - Summarize what behavior is now covered

## Requirements

- A working test runner must be available in the project
- The feature must be describable in terms of inputs and expected outputs

## Error Handling

- If the project has no test framework: suggest adding one and list options for the detected language
- If the test cannot be made to fail: explain why and discuss with the user
- If making the test pass requires large refactors: flag this and get user approval before proceeding
