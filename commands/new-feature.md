---
name: new-feature
description: Scaffold a new feature by following existing project patterns, creating all necessary files, tests, and wiring up imports.
argument-hint: <feature name e.g. "user notifications">
allowed-tools: Bash, Read, Grep, Glob
---

Scaffold a new feature: $ARGUMENTS

Follow these steps:

### Step 1 - Understand the codebase structure
Before creating any files, explore the project to understand its conventions:
- Run `ls` on the top-level directories to understand the high-level layout.
- Find 1-2 existing features that are similar to "$ARGUMENTS" in scope and complexity.
- Read those existing feature files to understand: file naming, folder structure, class/function patterns, export style, and how they are wired into the rest of the application (routes, stores, registries, etc.).
- Identify the test file pattern (co-located `*.test.ts`, `__tests__/` folder, `spec/` directory, etc.).

### Step 2 - Plan the scaffold
Print a plan listing every file that will be created or modified, with a one-line description of what each one will contain. Wait for implicit approval by continuing only after showing the plan.

### Step 3 - Create production code files
Create the feature files following the conventions discovered in Step 1:
- Use the same folder structure as similar features.
- Use the same naming conventions (PascalCase components, snake_case modules, etc.).
- Include all necessary boilerplate (type definitions, interfaces, docstrings, exports).
- Do NOT add placeholder comments like `// TODO: implement this`. Implement the actual logic based on what "$ARGUMENTS" describes.

### Step 4 - Wire up imports and registrations
Update existing files to integrate the new feature:
- Add the feature to the appropriate index/barrel file, router, store registry, plugin list, or equivalent entry point.
- Follow the exact pattern used by existing features.
- Make the minimal changes needed to existing files.

### Step 5 - Create tests
Create test files for the new feature:
- Follow the project's test file naming and location convention.
- Write tests that cover the main behavior, at least one edge case, and one error/failure case.
- Use the same test framework, assertion library, and mocking patterns as existing tests.

### Step 6 - Run tests and lint
- Run the test suite to confirm all new tests pass.
- Run the linter to confirm no new lint errors were introduced.

### Step 7 - Summary
Print:
- A list of every file created (with full paths).
- A list of every file modified (with full paths and a one-line description of the change).
- How to invoke or access the new feature.
