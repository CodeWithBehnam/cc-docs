# Claude Code Slash Commands

Ready-to-use slash command files for Claude Code. Each file is a drop-in `.md` file you copy to your project's `.claude/commands/` directory.

## How to Use

1. Copy one or more `.md` files from this folder into your project:

   ```
   cp commit.md /path/to/your-project/.claude/commands/
   ```

2. Restart Claude Code (or reload the session) so it picks up the new commands.

3. Invoke the command in Claude Code:

   ```
   /commit
   /fix-issue 42
   /explain src/auth/middleware.ts
   ```

Commands that take input use `$ARGUMENTS`, which is replaced by whatever you type after the command name.

## Commands

| File | Command | Argument | Description |
|------|---------|----------|-------------|
| `commit.md` | `/commit` | (none) | Run tests, stage changes, generate a conventional commit message (feat/fix/docs/refactor/test/chore), and commit. |
| `pr.md` | `/pr` | (none) | Summarize branch changes vs main, generate a title and description with Summary and Test Plan sections, push, and create a PR with `gh`. |
| `review.md` | `/review` | (none) | Diff the current branch against main and report findings organized by priority: critical, warning, and suggestion. |
| `fix-issue.md` | `/fix-issue` | `<issue-number>` | Fetch a GitHub issue with `gh`, implement the fix, write tests, and commit with a closing reference. |
| `tdd.md` | `/tdd` | `<feature description>` | Implement a feature using strict TDD: write a failing test first, implement to make it pass, refactor, repeat. |
| `deploy.md` | `/deploy` | `<staging\|production>` | Run tests, build, and deploy to the target environment with safety checks and a production confirmation prompt. |
| `lint-fix.md` | `/lint-fix` | (none) | Detect the project linter (ESLint, Ruff, Biome, etc.), auto-fix all fixable issues, and report what remains. |
| `deps-update.md` | `/deps-update` | (none) | Audit dependencies for vulnerabilities, list outdated packages, update safe (patch/minor) ones, and run tests. |
| `explain.md` | `/explain` | `<file or symbol>` | Explain a file, function, or class with an ASCII diagram, an analogy, a step-by-step walkthrough, and common gotchas. |
| `release.md` | `/release` | `<version e.g. 1.2.0>` | Update changelog, bump version in manifest files, commit, tag, push, and create a GitHub release. |
| `db-migrate.md` | `/db-migrate` | `<migration description>` | Generate a migration file with up and down methods for the described schema change, then test the rollback. |
| `new-feature.md` | `/new-feature` | `<feature name>` | Scaffold a new feature by studying existing patterns, creating all files and tests, and wiring up imports. |

## Notes

- These commands use the legacy `.md` format, which is fully supported by all versions of Claude Code.
- The `allowed-tools` frontmatter field restricts which tools Claude can use during a command. Adjust it if your workflow needs additional tools.
- The `argument-hint` field controls the placeholder text shown in the Claude Code UI when you type the command name.
- Commands without `$ARGUMENTS` work on the current git branch or project directory.
- All commands are plain text. Edit them freely to match your project's conventions.
