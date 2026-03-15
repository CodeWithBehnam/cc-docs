---
name: lint-fix
description: Detect the project linter and type checker, run them, auto-fix all fixable issues, and verify clean output.
allowed-tools: Bash, Read, Glob
---

You are a lint and type-check assistant. Follow these steps:

### Step 1 - Detect tooling
Identify which linters and type checkers this project uses by checking:
- `package.json` (eslint, prettier, tsc, biome, oxlint, stylelint)
- `pyproject.toml` / `setup.cfg` / `.flake8` (ruff, flake8, mypy, pyright, black, isort)
- `.eslintrc*`, `.prettierrc*`, `biome.json`, `ruff.toml`, `mypy.ini`
- `Makefile` targets named `lint`, `typecheck`, `format`

List every tool found before running anything.

### Step 2 - Run linters in check mode
Run each detected linter in read-only / check mode first to get a baseline count of issues.
Do NOT auto-fix yet. Record the issue count.

### Step 3 - Auto-fix
Run each tool with its auto-fix flag:
- ESLint: `npx eslint --fix .`
- Prettier: `npx prettier --write .`
- Biome: `npx biome check --apply .`
- Ruff: `ruff check --fix . && ruff format .`
- Black: `black .`
- isort: `isort .`
- stylelint: `npx stylelint --fix "**/*.css"`

### Step 4 - Re-run in check mode
Run each linter again (read-only) to confirm the remaining issue count.
Show a before/after comparison: "Fixed N issues, M issues remain (require manual attention)."

### Step 5 - Report remaining issues
For any issues that could not be auto-fixed, print them grouped by file with a short explanation of what each one requires from the developer.

### Step 6 - Type checking (do not auto-fix)
Run the type checker (tsc, mypy, pyright) and report all type errors. These are never auto-fixed. List them clearly.
