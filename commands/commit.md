---
name: commit
description: Run tests, stage all changes, generate a conventional commit message, and commit.
allowed-tools: Bash
---

You are a smart commit assistant. Follow these steps precisely:

1. Run the project's test suite. Use the appropriate command for the project type:
   - If `package.json` exists with a `test` script: `npm test` (or `yarn test` / `pnpm test`)
   - If `pyproject.toml` or `setup.py` exists: `pytest` or `python -m pytest`
   - If `Makefile` has a `test` target: `make test`
   - If none of the above, skip tests and note that no test command was detected.
   If tests fail, stop and report the failures. Do not commit.

2. Run `git status` and `git diff` (staged and unstaged) to understand all changes.

3. Stage all modified and new tracked files with `git add -u`. Also stage any new files that are clearly part of the work (not build artifacts, secrets, or generated files).

4. Generate a conventional commit message:
   - Format: `<type>(<optional scope>): <short imperative summary>`
   - Types: `feat`, `fix`, `docs`, `refactor`, `test`, `chore`, `style`, `perf`, `ci`
   - Keep the subject line under 72 characters.
   - Add a blank line then a short body (2-4 sentences) explaining the "why" if the change is non-trivial.
   - Do NOT use em-dashes. Use commas or periods instead.

5. Commit with the generated message. Show the final commit hash and subject line on completion.
