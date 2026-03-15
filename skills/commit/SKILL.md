---
name: commit
description: >
  Smart git commit. Runs tests, stages all changes, generates a conventional
  commit message, and commits. Use when committing work, saving progress,
  or when the user says "commit this", "save my work", or "make a commit".
disable-model-invocation: true
allowed-tools: Bash, Read, Glob
---

Create a smart git commit for the current working tree:

1. Check for unstaged changes with `git status` and `git diff --stat`
2. Run the project test suite to verify nothing is broken:
   - Look for `package.json` (run `npm test` or `yarn test`), `Makefile` (run `make test`), `pytest.ini` / `pyproject.toml` (run `pytest`), or `go.mod` (run `go test ./...`)
   - If tests fail, stop and report the failures. Do NOT commit broken code.
3. Stage all changes: `git add -A`
4. Analyze the diff with `git diff --cached` to understand what changed
5. Generate a conventional commit message following this format:
   - `type(scope): short summary` on the first line (max 72 chars)
   - Blank line, then a short body explaining WHY (not what)
   - Types: `feat`, `fix`, `refactor`, `test`, `docs`, `chore`, `perf`, `ci`
   - Scope: the module or area affected (e.g., `auth`, `api`, `db`)
6. Commit with `git commit -m "<message>"`
7. Print the commit hash and summary

## Requirements

- Must be run inside a git repository
- Working tree must have at least one change to commit
- Tests must pass before committing

## Error Handling

- If no changes are staged or unstaged: report "Nothing to commit" and stop
- If tests fail: report the failures and stop without committing
- If `git commit` fails: show the error and suggest fixes
- If no test runner is found: skip tests, note the omission, and proceed
