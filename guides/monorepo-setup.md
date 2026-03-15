# Configuring Claude Code for Monorepos

This guide walks through setting up Claude Code in a monorepo so that Claude always has the right context for the package you are working in. You will layer CLAUDE.md files from root to package level, use `.claude/rules/` for path-scoped rules, configure per-package skills, run packages in parallel with worktrees, and use `@imports` to share documentation across packages.

**Time:** 1-2 hours for initial setup
**Requires:** A monorepo with multiple packages or apps
**Related template:** `templates/SUBAGENT-TEMPLATE.md` (worker pattern)

---

## Overview

1. Create the root CLAUDE.md with shared conventions
2. Add package-level CLAUDE.md files with specific rules
3. Set up path-specific rules in `.claude/rules/`
4. Configure per-package skills
5. Set up worktrees for parallel package work
6. Configure CLAUDE.md imports for shared documentation

---

## Step 1: Create the root CLAUDE.md with shared conventions

The root CLAUDE.md is loaded in every session, regardless of which package you are working in. Put rules here that apply everywhere.

Start by asking Claude to generate a starting point from the existing codebase:

```bash
cd /path/to/monorepo
claude
```

```text
Run /init to generate a root CLAUDE.md for this monorepo. After it is created, I want to review it and extend it.
```

**Expected outcome:** A CLAUDE.md in the monorepo root covering build commands, test commands, and conventions Claude discovered.

Now ask Claude to extend it with monorepo-specific structure:

```text
Update the root CLAUDE.md to include:

1. A packages overview: list each package/app in this monorepo with a one-line description of what it does
2. The monorepo toolchain (e.g., nx, turborepo, pnpm workspaces, Lerna) and how to run commands across packages
3. Cross-package conventions: how packages import each other, how shared utilities are organized, how versioning works
4. Rules that apply everywhere: code style, error handling, logging, commit message format
5. A note that package-level CLAUDE.md files add more specific rules for individual packages

Keep the root CLAUDE.md under 150 lines. Detailed rules belong in package-level files.
```

**Expected outcome:** A concise root CLAUDE.md that gives Claude a map of the whole repository without overwhelming it with one package's details.

---

## Step 2: Add package-level CLAUDE.md files with specific rules

Each package gets its own CLAUDE.md in its root directory. This file is loaded automatically when Claude reads files in that package.

Navigate to each significant package and create its CLAUDE.md:

```text
I am working in the packages/api package. Create a CLAUDE.md for this package that covers:

1. What this package does and its role in the system
2. Its own build and test commands (different from root commands)
3. The framework and conventions specific to this package (e.g., Express middleware patterns, specific ORM usage)
4. Its dependencies on other packages in this monorepo
5. Any rules specific to this package (e.g., "all database queries must go through repositories/", "no direct HTTP calls - use the shared http-client package")
6. Known gotchas or complex areas to be aware of

Keep it under 100 lines.
```

**Expected outcome:** A focused CLAUDE.md for the package. Repeat this for each major package.

**What to put in package vs. root CLAUDE.md:**

| Belongs in root | Belongs in package |
|---|---|
| Monorepo toolchain commands | Package-specific build/test commands |
| Cross-cutting conventions | Framework-specific patterns |
| Shared naming rules | Package-internal architecture |
| How to reference other packages | Which services this package depends on |
| Commit format | Known tech debt in this package |

---

## Step 3: Set up path-specific rules in `.claude/rules/`

The `.claude/rules/` directory lets you scope rules to specific file types or directory patterns. Rules are loaded automatically when Claude reads a matching file.

Create the rules directory:

```bash
mkdir -p .claude/rules
```

Ask Claude to create rules for your common file patterns:

**For test files:**

```text
Create a .claude/rules/tests.md file that applies when working in any *.test.ts, *.spec.ts, or __tests__/ path. Include:
- Our test framework and preferred assertion style
- How to structure test files (describe blocks, naming conventions)
- Which test utilities to use and which to avoid
- Rules about mocking (what to mock, what not to mock)
- Coverage expectations
```

**For API route files:**

```text
Create a .claude/rules/api-routes.md that applies when working in packages/api/src/routes/. Include:
- Required middleware on every route (auth, validation, rate limiting)
- Input validation patterns
- Error response format
- How to add a new route (reference the existing pattern in routes/users.ts)
```

**For database files:**

```text
Create a .claude/rules/database.md that applies when working in packages/*/src/repositories/ or packages/*/src/migrations/. Include:
- Migration naming conventions
- Rules about column types and constraints
- Index requirements for foreign keys
- The pattern for soft-delete vs. hard-delete
```

**Expected outcome:** A set of rule files in `.claude/rules/`. Each file is small and focused on its domain.

To verify rules are loading, ask Claude when working in a matching path:

```text
What rules are currently active for this file?
```

---

## Step 4: Configure per-package skills

Skills in `.claude/skills/` are discovered automatically when Claude works on files in the same directory tree. You can create package-specific skills without them polluting other packages' contexts.

**Create a package-specific test runner skill:**

```bash
mkdir -p packages/api/.claude/skills/test-api
```

```text
Create a SKILL.md for a skill called "test-api" at packages/api/.claude/skills/test-api/SKILL.md. This skill should:
- Run only the API package tests with the correct command
- Report which tests pass and which fail
- On failure, show the relevant test output without the full suite output
- Be user-invocable with /test-api

Use disable-model-invocation: true since tests should only run when explicitly requested.
```

**Create a package-specific code generator:**

```bash
mkdir -p packages/api/.claude/skills/generate-endpoint
```

```text
Create a generate-endpoint skill at packages/api/.claude/skills/generate-endpoint/SKILL.md. This skill should generate a new REST endpoint by:
1. Creating the route handler following the pattern in routes/users.ts
2. Creating the corresponding repository method in repositories/
3. Creating tests in __tests__/
4. Adding the route to routes/index.ts

The skill takes a resource name as $ARGUMENTS[0] (e.g., "orders").
```

**Expected outcome:** Skills that appear in the `/` menu only when working in the relevant package directory. Claude discovers them automatically from the nested `.claude/skills/` directories.

See `claude-code-docs/skills.md` for the full documentation on automatic discovery from nested directories.

---

## Step 5: Set up worktrees for parallel package work

When working on features that span multiple packages, worktrees let you run separate Claude sessions per package without context bleeding between them.

**Create worktrees for parallel package development:**

```bash
# From the monorepo root
git worktree add ../monorepo-api-work feature/api-changes
git worktree add ../monorepo-ui-work feature/ui-changes
```

Then open separate Claude sessions in each worktree:

```bash
# Terminal 1: API changes
cd ../monorepo-api-work/packages/api
claude
```

```bash
# Terminal 2: UI changes
cd ../monorepo-ui-work/packages/ui
claude
```

**In each session, tell Claude which package it is working on:**

```text
I am working in the API package worktree on the feature/api-changes branch. The UI package is being worked on in a separate worktree. My job here is only the API side of [feature name].
```

**Expected outcome:** Two independent Claude sessions, each with the correct package context, making changes in isolation. No risk of API session accidentally editing UI files.

**Using agent teams for coordinated changes:**

If packages need coordinated changes (e.g., changing an API response format requires updating both the API and every UI consumer), use agent teams:

```text
I need to change the /api/users endpoint response format to include a "role" field. This affects both the API package and the web-app package. Create a plan to coordinate this change across both packages using agent teams.
```

See `claude-code-docs/agent-teams.md` for the full agent teams documentation.

---

## Step 6: Configure CLAUDE.md imports for shared documentation

Monorepos often have documentation that is relevant to multiple packages: shared utility docs, API contracts, design system specs, architectural decision records. Use CLAUDE.md `@imports` to pull these into context without duplicating them.

**Import shared documentation into relevant packages:**

In `packages/web-app/CLAUDE.md`:

```markdown
## Shared documentation

@../../docs/api-contracts/users.md
@../../docs/design-system/component-patterns.md
@../../docs/architecture/decisions/0003-state-management.md
```

**Import the root conventions into package-level files:**

```markdown
## Inherited from root

@../../CLAUDE.md
```

This is useful if a package needs all root rules plus its own. However, be careful: if both the root CLAUDE.md and the package CLAUDE.md are loaded (which they are by default in the directory hierarchy), importing root into package creates duplication. Use `@imports` for documentation that is not already in the loading hierarchy.

**Import a shared conventions file:**

If several packages share the same conventions (e.g., all backend packages use the same error handling pattern), create a shared conventions file and import it:

```bash
touch docs/shared/backend-conventions.md
```

Then in each backend package's CLAUDE.md:

```markdown
@../../docs/shared/backend-conventions.md
```

**Expected outcome:** Each package's Claude session has exactly the context it needs - shared docs pulled in, root conventions applied, package-specific rules added on top.

**Check what is loaded:**

```text
What CLAUDE.md files and rules are currently loaded in this session? Summarize the key rules that apply.
```

---

## Putting it all together: a typical monorepo session

Here is what a typical session looks like after this setup is complete.

```bash
cd /path/to/monorepo/packages/api
claude
```

Claude automatically loads:
- Root `CLAUDE.md` (shared conventions, monorepo structure)
- `packages/api/CLAUDE.md` (API-specific rules)
- Any `.claude/rules/` files that match the files you open

You ask:

```text
I need to add a new "tags" field to the products API. Show me what changes are needed.
```

Claude knows:
- The monorepo structure from root CLAUDE.md
- The API's patterns from packages/api/CLAUDE.md
- The route and repository patterns from `.claude/rules/api-routes.md`

It proposes changes that follow all three layers of conventions automatically.

---

## Tips for monorepo setups

**Start with root, add package rules only when needed.** It is tempting to create a CLAUDE.md for every package on day one. Start with the root file and add package-level files only when you find yourself repeatedly explaining package-specific context.

**Keep files small.** The total CLAUDE.md content loaded per session should ideally stay under 400 lines. Large files degrade instruction-following quality. Split into `.claude/rules/` files for anything path-specific.

**Exclude irrelevant packages.** In very large monorepos, Claude may load CLAUDE.md files from packages you are not working on. Use `claudeMdExcludes` in your settings to prevent this:

```json
{
  "claudeMdExcludes": ["packages/legacy-*/**", "packages/deprecated/**"]
}
```

See `claude-code-docs/memory.md` for the `claudeMdExcludes` option.

**Document inter-package contracts.** The most common mistake in monorepo Claude sessions is Claude not knowing the contract between packages. Add a brief section to each package's CLAUDE.md describing what it exports and what it expects from its dependencies.

---

## Related resources

- `templates/SKILL-TEMPLATE.md` - Skill templates for per-package skills
- `templates/SUBAGENT-TEMPLATE.md` - Worker and isolated-worktree subagent patterns
- `claude-code-docs/memory.md` - Full CLAUDE.md documentation including imports and claudeMdExcludes
- `claude-code-docs/skills.md` - Automatic skill discovery from nested directories
- `claude-code-docs/agent-teams.md` - Coordinating changes across multiple packages
- `claude-code-docs/common-workflows.md` - Parallel worktree workflows
