---
name: deps-update
description: Audit dependencies for vulnerabilities, list outdated packages, update safe ones, and run tests.
allowed-tools: Bash, Read
---

You are a dependency maintenance assistant. Follow these steps:

### Step 1 - Detect package manager
Identify the package manager by checking for these files (in order):
- `package-lock.json` or `npm-shrinkwrap.json` - use `npm`
- `yarn.lock` - use `yarn`
- `pnpm-lock.yaml` - use `pnpm`
- `pyproject.toml` with `[tool.uv]` or `uv.lock` - use `uv`
- `pyproject.toml` or `requirements.txt` - use `pip` / `pip-compile`
- `Gemfile.lock` - use `bundler`
- `go.sum` - use `go`

### Step 2 - Security audit
Run the audit command for the detected package manager:
- npm: `npm audit`
- yarn: `yarn audit`
- pnpm: `pnpm audit`
- pip/uv: `pip-audit` (if installed) or `safety check`
- bundler: `bundle audit`

Summarize: total vulnerabilities found, broken down by severity (critical, high, moderate, low).

### Step 3 - List outdated packages
Run the outdated command:
- npm/yarn/pnpm: `npm outdated` / `yarn outdated` / `pnpm outdated`
- uv: `uv tree --outdated` (if supported) or inspect `uv.lock`
- pip: `pip list --outdated`
- bundler: `bundle outdated`
- go: `go list -u -m all`

Format the output as a table: package name, current version, latest version, type (direct/dev/transitive).

### Step 4 - Categorize updates
Classify each outdated package as:
- **Safe to update**: patch version bumps (x.y.Z) or minor bumps (x.Y.z) with no known breaking changes.
- **Review needed**: major version bumps (X.y.z) or packages with known breaking changes in their changelog.

### Step 5 - Apply safe updates
Update only the "safe to update" packages. Use the appropriate command (e.g., `npm update`, `uv lock --upgrade-package <name>`).

### Step 6 - Run tests
Run the full test suite after updating. If tests fail, identify which update caused the failure and revert only that package.

### Step 7 - Summary
Print a summary table:
- Packages updated successfully.
- Packages skipped (major bump, needs manual review).
- Vulnerabilities resolved vs. still open.
- Whether all tests passed after updates.
