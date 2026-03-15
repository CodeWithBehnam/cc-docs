---
name: changelog
description: >
  Generate a changelog from git history since the last tag or release.
  Groups commits by type and formats them for a CHANGELOG.md file or
  release notes. Use when cutting a release, updating the changelog,
  or when the user says "generate changelog", "what changed since last release",
  or "write release notes".
disable-model-invocation: true
allowed-tools: Bash, Read, Write, Edit, Glob
argument-hint: "[version] [--since <tag-or-sha>]"
---

Generate a changelog for the changes since the last release:

1. Determine the range:
   - Check for existing tags: `git tag --sort=-version:refname | head -5`
   - If $ARGUMENTS contains `--since <ref>`, use that ref as the base
   - Otherwise use the most recent tag as the base: `git describe --tags --abbrev=0`
   - If there are no tags, use the first commit: `git rev-list --max-parents=0 HEAD`

2. Collect commits in the range:
   ```
   git log <base>..HEAD --pretty=format:"%H %s" --no-merges
   ```

3. Parse and categorize each commit by its conventional commit prefix:
   - `feat:` / `feat(<scope>):` -> Features
   - `fix:` / `fix(<scope>):` -> Bug Fixes
   - `perf:` / `perf(<scope>):` -> Performance Improvements
   - `refactor:` -> Internal Changes
   - `docs:` -> Documentation
   - `test:` -> Tests
   - `chore:` / `ci:` / `build:` -> Maintenance
   - `BREAKING CHANGE:` in commit body -> Breaking Changes (separate section at top)
   - Commits without a conventional prefix -> Uncategorized (include but note)

4. For each commit, fetch additional details if useful:
   - `git show <hash> --stat` to understand scope of change
   - Check for PR references (`#NNN`) in commit messages

5. Determine the version:
   - If $ARGUMENTS[0] looks like a version number (e.g., `1.2.0`), use it
   - Otherwise, suggest a version based on the types of changes:
     - Any breaking change -> major bump
     - Any `feat:` commits -> minor bump
     - Only `fix:`/`perf:` -> patch bump

6. Format the changelog entry:

```markdown
## [<version>] - <today's date>

### Breaking Changes
- Description of breaking change (commit abc1234)

### Features
- Short description of feature (commit abc1234)

### Bug Fixes
- Short description of fix (commit abc1234)

### Performance Improvements
- Short description (commit abc1234)

### Documentation
- Short description (commit abc1234)

### Maintenance
- Short description (commit abc1234)
```

7. Update `CHANGELOG.md`:
   - If the file exists, prepend the new entry after the title and any intro paragraph
   - If it does not exist, create it with a standard header and the new entry

8. Print the generated entry and the version recommendation.

## Requirements

- Must be run inside a git repository with at least one commit
- Write access to `CHANGELOG.md` in the repository root

## Error Handling

- If there are no commits since the last tag: report "No changes since <tag>" and stop
- If commits do not follow conventional format: include them under "Uncategorized" and suggest adopting conventional commits
- If `CHANGELOG.md` is very large: only update the top of the file, do not rewrite it
