# Migrating Frameworks or Libraries

This guide walks through a structured approach to migrating a codebase from one framework or library to another. The process uses plan mode to assess scope before touching a single file, establishes a test safety net, migrates incrementally with verification at each step, and uses worktrees to parallelize bulk migration work.

**Time:** Varies. A library upgrade might take an hour; a framework migration might take days.
**Requires:** A git repository with a working test suite
**Related skill:** `/migrate` (if configured in `.claude/skills/migrate/`)

---

## Overview

1. Research current usage in plan mode
2. Create a migration plan
3. Set up tests as a safety net
4. Migrate file by file with verification
5. Fan out for bulk migration with worktrees
6. Run the full test suite
7. Clean up and commit

---

## Step 1: Research current usage (plan mode)

Before changing a single file, you need to understand the full scope of what you are migrating. Start in plan mode.

```bash
cd /path/to/your/project
claude
```

Switch to plan mode with `Shift+Tab`, then:

```text
I want to migrate from [old library/framework] to [new library/framework]. Before we plan anything, I need to understand the current usage. Please:

1. Find every file that imports or uses [old library/framework]
2. Count how many files are affected
3. Identify the usage patterns (which APIs, which features)
4. Flag any usages that look especially complex or non-standard
5. Check whether [old library/framework] is used in tests as well as application code

Do not change anything yet.
```

**Expected outcome:** A complete inventory. Something like:

```
Found 47 files using [old library]:
- 32 files use the basic render/mount API
- 8 files use the context API
- 4 files use lifecycle methods that have no direct equivalent
- 3 files use internal APIs not in the public interface

Tests: 15 test files use [old library] directly via testing utilities.

Complexity flags:
- src/components/DataGrid.jsx uses [unusual pattern] which may need manual migration
```

If the scope is larger than expected, this is the moment to decide whether to proceed. Ask Claude to estimate effort:

```text
Based on what you found, give me a rough time estimate for each migration approach: (a) migrate all at once, (b) migrate incrementally while keeping both libraries running, (c) migrate module by module in isolation.
```

---

## Step 2: Create a migration plan

Ask Claude to write a concrete, ordered migration plan. This plan becomes your checklist.

```text
Create a migration plan as a numbered list. For each step:
- Describe exactly what changes
- List the files affected
- Note any risks or places that need manual review
- Estimate effort: small (< 30 min), medium (30-90 min), large (> 90 min)

Order the steps so that lower-risk, straightforward changes come first and complex or risky changes come last.
```

**Expected outcome:** An ordered checklist you can follow. Review it carefully before leaving plan mode.

Ask about rollback:

```text
If something goes wrong midway through this migration, what is the rollback strategy? At which points can we safely stop and ship what we have?
```

**Expected outcome:** Specific commit points or feature flags where partial migration is safe to ship.

Leave plan mode now - `Shift+Tab` back to normal mode.

---

## Step 3: Set up tests as a safety net

If the codebase has good test coverage, verify tests pass before making any migration changes:

```bash
npm test
```

Note the exact pass count. You will use this as your baseline.

If coverage is thin, ask Claude to add tests before the migration:

```text
The test coverage for [component/module] is low. Before we migrate it, write tests that verify the current behavior. Focus on the inputs, outputs, and side effects - not the internal implementation.
```

**Expected outcome:** Tests that describe what the code does today. These tests should pass with the current library and should continue to pass after migration.

**Consider adding a codemods step.** For large migrations, many libraries provide codemod scripts. Ask Claude:

```text
Does [new library/framework] provide a codemod for migrating from [old library]? If so, show me how to run it safely on a subset of files first.
```

---

## Step 4: Migrate file by file with verification

Work through the migration plan one step at a time. For each file or small group of files:

```text
Migrate step 1 from our plan: [describe the step]. Apply the changes following the patterns from [new library]'s documentation. After each file, confirm the change is correct before moving to the next.
```

After each batch of changes, run the tests:

```bash
npm test
```

If tests fail, stop immediately:

```text
Tests are failing after the last change. Here is the output:

[paste test output]

Do not continue with the migration. Diagnose this failure and fix it before proceeding.
```

**Important:** Never migrate more files on top of a failing test suite. You lose the ability to isolate which change broke what.

**For complex migrations where patterns differ**, ask Claude to explain before applying:

```text
Before migrating DataGrid.jsx, show me what the equivalent code looks like in [new library]. This one was flagged as complex. I want to review the approach before you make changes.
```

---

## Step 5: Fan out for bulk migration with worktrees

Once you have proven the migration pattern on a few files, the remaining straightforward files can be migrated in parallel using git worktrees. This dramatically speeds up bulk work.

```text
We have proven the migration pattern. There are 32 files with the basic [pattern] that all need the same change. Use the /batch skill to fan out the migration across those files in parallel.
```

If `/batch` is not available, ask Claude to use worktrees directly:

```text
Create a plan to migrate the remaining 32 files using parallel worktrees. Divide them into 4 groups of 8. For each group, describe the worktree branch name and the files it should handle.
```

Then for each group:

```text
Create a worktree branch called migration/batch-1 and migrate these files: [list]. Run tests in that worktree before finishing.
```

**Expected outcome:** Multiple worktree branches, each with a clean subset of migrated files. Merge them one at a time after verifying each passes tests.

See `claude-code-docs/common-workflows.md` for the full worktree workflow.

---

## Step 6: Run the full test suite

Once all files are migrated and merged, run the complete test suite including any integration or end-to-end tests:

```bash
npm test
npm run test:integration  # if applicable
npm run test:e2e          # if applicable
```

**Expected outcome:** All tests pass. Pass count equals or exceeds the baseline from Step 3.

If there are failures you cannot immediately explain:

```text
These tests were passing before the migration and are now failing. I have not changed any test files. Here is the failure output:

[paste output]

Is this a real behavioral regression, or is it a test that was tightly coupled to the old library's internals?
```

For each genuine regression, fix the implementation. For tests that were coupled to implementation details, you may need to rewrite the test to test behavior rather than internals - but discuss this with your team first.

---

## Step 7: Clean up and commit

Remove the old library and any migration scaffolding:

```text
The migration is complete. Help me clean up:

1. Remove [old library] from package.json and install dependencies
2. Remove any compatibility shims or adapter code we added during migration
3. Check for any remaining imports of [old library] that were missed
4. Update the README or docs if they mention [old library]
```

**Expected outcome:** A clean codebase with no references to the old library.

Run a final verification:

```bash
grep -r "[old-library-package-name]" --include="*.js" --include="*.ts" --include="*.jsx" --include="*.tsx" .
```

This should return nothing (or only expected references in changelogs or comments).

Commit in a logical structure. Consider:

```bash
git log --oneline    # review what you have
git commit -m "Migrate from [old library] to [new library]

- Replaced all 47 usages across 32 component files and 15 test files
- Removed [old library] from dependencies
- Updated documentation"
```

---

## Tips for cleaner migrations

**Use the /migrate skill.** If your project has a `/migrate` skill in `.claude/skills/migrate/`, it may have project-specific migration patterns already documented. Invoke it with:

```text
/migrate [old library] to [new library]
```

**Keep old and new running in parallel.** For user-facing libraries, consider maintaining both during the migration period. Wrap the new library in an adapter that matches the old API. Migrate call sites to the adapter, then swap the adapter's implementation.

**Migrate tests last.** Migration is easier when tests still run against the old library while you change application code. Tests tell you whether application behavior changed. Once application code is migrated, update the test utilities.

**Create a migration tracking file.** Ask Claude to create `MIGRATION.md` with a checklist of files and their status. Update it as you go:

```text
Create a MIGRATION.md tracking file with a row for each file that needs migration. Include columns: file path, status (pending/in-progress/done/skipped), and notes.
```

---

## Related resources

- `templates/SKILL-TEMPLATE.md` - Template for creating a `/migrate` skill with project-specific patterns
- `claude-code-docs/common-workflows.md` - Worktree and parallel session workflows
- `claude-code-docs/interactive-mode.md` - Plan mode reference
- `claude-code-docs/agent-teams.md` - Coordinating multiple Claude sessions for large migrations
