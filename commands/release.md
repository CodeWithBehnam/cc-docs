---
name: release
description: Update changelog, bump version, tag, and push a release for the specified version number.
argument-hint: <version e.g. 1.2.0>
allowed-tools: Bash, Read, Glob
---

Create release version $ARGUMENTS.

Follow these steps in order. Stop and report if any step fails.

### Step 1 - Validate
- Confirm the version `$ARGUMENTS` follows semantic versioning (X.Y.Z or X.Y.Z-prerelease).
- Run `git tag` and confirm this tag does not already exist.
- Confirm the working tree is clean (`git status`). If not, stop.
- Confirm you are on the main (or release) branch.

### Step 2 - Update CHANGELOG
- Look for a `CHANGELOG.md`, `HISTORY.md`, or `CHANGES.md` file.
- Find the `## Unreleased` section (or equivalent).
- Rename it to `## [$ARGUMENTS] - YYYY-MM-DD` (use today's date).
- Add a new empty `## Unreleased` section at the top.
- If no changelog file exists, create `CHANGELOG.md` with the standard Keep a Changelog format and add an entry for this version.

### Step 3 - Bump version
Find the version string in the project's manifest file and update it to `$ARGUMENTS`:
- `package.json`: `"version"` field.
- `pyproject.toml`: `version =` under `[project]` or `[tool.poetry]`.
- `setup.py` / `setup.cfg`: `version=` field.
- `Cargo.toml`: `version =` field.
- `version.rb`, `version.go`, `__version__.py`, or similar version files.

Update all locations where the old version appears (not just one).

### Step 4 - Run tests
Run the full test suite. If any tests fail, stop and report.

### Step 5 - Commit the release
Stage only the version and changelog files. Commit with the message:
`chore(release): $ARGUMENTS`

### Step 6 - Tag
Create an annotated tag: `git tag -a v$ARGUMENTS -m "Release $ARGUMENTS"`

### Step 7 - Push
Push the commit and tag: `git push && git push --tags`

### Step 8 - Create GitHub release (if gh is available)
Run `gh release create v$ARGUMENTS --generate-notes --title "v$ARGUMENTS"`.
Print the release URL when done.
