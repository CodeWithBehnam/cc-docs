# Test-Driven Development with Claude Code

This guide walks through a full TDD cycle using Claude Code. You write no implementation code until tests exist and are failing. Claude helps you write the tests, then implements only what is needed to make them pass, then refactors cleanly.

**Time:** 20-40 minutes for a small feature
**Requires:** A project with a test runner already configured
**Related skill:** `/tdd` (see `.claude/skills/tdd/` if present in your project)

---

## Overview

TDD with Claude Code follows the classic red-green-refactor loop:

1. Describe the feature
2. Write failing tests
3. Review and adjust the tests
4. Implement just enough to pass
5. Run tests, verify green
6. Refactor with tests as a safety net
7. Commit

---

## Step 1: Describe the feature to Claude

Start a new Claude Code session in your project root. Give Claude a clear description of what you want to build. Do not ask it to implement anything yet.

```bash
cd /path/to/your/project
claude
```

Then type:

```text
I want to build a feature: [describe your feature in plain language].

We are going to use TDD. Do not write any implementation code yet. First, help me think through the behavior this feature needs to have. What are the key cases we should test?
```

**Expected outcome:** Claude lists the behavioral cases - happy path, edge cases, error conditions - without writing any code. This is your chance to catch missing requirements before writing a single line.

**Tip:** If Claude starts writing implementation code, interrupt it and repeat: "No implementation yet. I want to agree on the test cases first."

---

## Step 2: Ask Claude to write the failing tests

Once you agree on the cases, ask Claude to write the tests. Be explicit that it should not create the implementation file.

```text
Good. Now write the tests for those cases in [test file path or "a new test file"]. Use our existing test framework. Do not create any implementation files yet - the tests should fail because the implementation does not exist.
```

**Expected outcome:** Claude creates a test file covering the agreed cases. If you run your test suite now, these tests should fail with "module not found" or equivalent errors - not logic failures. That is the correct starting state for TDD.

**Verify:**

```bash
npm test          # or: pytest, go test ./..., cargo test, etc.
```

You should see red. If any test passes without implementation, the test is not actually testing anything - ask Claude to fix it.

---

## Step 3: Review the tests, adjust if needed

Read through every test Claude wrote. Ask yourself:

- Does each test name clearly describe the behavior it checks?
- Are assertions specific enough to catch wrong behavior?
- Are edge cases covered?
- Are there tests that overlap or are redundant?

If anything needs changing, tell Claude directly:

```text
The test for [case] is too broad - it would pass even if [wrong behavior]. Make the assertion stricter.
```

```text
Add a test for the case where [edge case you noticed].
```

```text
The test names are hard to read. Rename them to follow the pattern: "should [behavior] when [condition]".
```

**Expected outcome:** A test file you fully understand and trust. Do not proceed until you are satisfied - these tests are your specification.

---

## Step 4: Ask Claude to implement just enough to pass

Now give Claude permission to write implementation code. Be explicit that it should write the minimum needed - no extras.

```text
Now implement [feature name] in [target file path]. Write only what is needed to make the tests pass. Do not add functionality that is not covered by a test. Do not add comments explaining what the code does.
```

**Expected outcome:** Claude creates the implementation file with a focused, minimal implementation. It should not add helper utilities, extra error handling, or "nice to have" functionality beyond what the tests require.

**If using the /tdd skill:** If your project has a `/tdd` skill set up in `.claude/skills/tdd/`, invoke it instead:

```text
/tdd [feature name]
```

The skill will run the full TDD loop with its own instructions tailored to your project's conventions.

---

## Step 5: Run tests, verify green

Run your full test suite:

```bash
npm test
```

**Expected outcome:** All tests pass. If any test is still failing:

```text
The test "[test name]" is still failing. Here is the error output:

[paste error output]

Fix the implementation to make this test pass without changing the test.
```

Important: tell Claude not to change the tests to make them pass. Tests are the specification - the implementation must conform to them, not the other way around.

---

## Step 6: Ask Claude to refactor while keeping tests green

With green tests as your safety net, now improve the code quality.

```text
The tests are passing. Now refactor the implementation for clarity and maintainability. Do not change any test files. After each change, the tests must still pass. Focus on: [name your priorities, e.g. "removing duplication", "extracting helper functions", "improving variable names"].
```

**Expected outcome:** Cleaner implementation code with no test failures. Claude may make multiple small changes, running tests (or describing test runs) between each one.

If Claude proposes a large refactor in one shot, ask it to break it down:

```text
Do that refactor in smaller steps. Show me one change at a time and explain why it improves the code.
```

**After each refactor step, run tests yourself:**

```bash
npm test
```

Do not trust that tests pass until you have run them. Claude can describe intended behavior but cannot run your test suite unless you have shell tools enabled.

---

## Step 7: Commit

When everything is green and the code is clean, commit the work.

```text
Create a commit with the tests and implementation. The commit message should describe the behavior added, not the files changed.
```

**Expected outcome:** A single commit (or two, if you prefer to separate "add tests" from "add implementation") with a clear message like:

```
Add rate limiting to the authentication endpoint

Limits login attempts to 5 per minute per IP address.
Returns 429 with a Retry-After header when the limit is exceeded.
```

If you prefer to write the commit message yourself:

```bash
git add -p     # review exactly what is staged
git commit
```

---

## Tips for better TDD sessions

**Keep sessions focused.** One feature per session. If Claude starts exploring unrelated code, redirect it.

**Name your test file first.** Tell Claude exactly where to put the tests so it does not create files in unexpected locations.

**Use plan mode for the design phase.** Before Step 2, switch to plan mode (`Shift+Tab`) to explore the design space without any files being created or modified. Switch back to normal mode before asking for the tests.

**Save your session name.** After Step 1, name the session so you can resume it:

```text
/name tdd-[feature-name]
```

**If Claude over-implements.** Some models tend to add extra code "for completeness." If you see code that is not covered by any test, ask:

```text
Which test requires this code? If no test requires it, remove it.
```

---

## Related resources

- `claude-code-docs/common-workflows.md` - General workflow patterns
- `claude-code-docs/interactive-mode.md` - Plan mode and permission modes
- `templates/SKILL-TEMPLATE.md` - How to create a `/tdd` skill for your project
