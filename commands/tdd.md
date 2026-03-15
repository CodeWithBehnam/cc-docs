---
name: tdd
description: Implement a feature using a strict TDD cycle (red, green, refactor).
argument-hint: <feature description>
allowed-tools: Bash, Read, Grep, Glob
---

Implement the following feature using strict TDD: $ARGUMENTS

Follow the red-green-refactor cycle precisely:

### Step 1 - Explore (before writing any code)
- Look at the existing codebase to understand conventions: file structure, naming patterns, test framework used, assertion style.
- Identify where the new feature logically belongs.

### Step 2 - Red (write a failing test)
- Write the smallest possible test that captures one meaningful behavior of the feature.
- Run the test and confirm it fails for the right reason (not due to a syntax error or missing import, but because the feature does not exist yet).
- Show the failing test output.

### Step 3 - Green (make the test pass)
- Write the minimum production code needed to make the failing test pass.
- Do not over-engineer. Hardcoding is acceptable at this stage if it makes the test pass.
- Run the tests and confirm they are now green.

### Step 4 - Refactor
- Clean up both the production code and test code without changing behavior.
- Remove duplication, improve naming, simplify logic.
- Run the tests again to confirm they are still green after refactoring.

### Step 5 - Repeat
- Add the next test for the next behavior of the feature.
- Repeat the red-green-refactor cycle until the full feature described in "$ARGUMENTS" is implemented and tested.

### Step 6 - Final check
- Run the full test suite (not just the new tests) to confirm no regressions.
- Summarize the tests written and the behaviors they cover.
