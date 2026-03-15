# Claude Code Rules

Drop-in rules files for Claude Code. Copy any file to your project's `.claude/rules/` directory and Claude will automatically follow those conventions when working with matching files.

## How to Use

1. Create a `.claude/rules/` directory in your project root (if it does not exist).
2. Copy the rules files you want into that directory.
3. Claude loads a rules file whenever it reads or edits a file whose path matches the `globs` pattern declared in the file's frontmatter.
4. You can edit the rules to match your project's specific conventions before committing them.

Path-specific rules are scoped: a rule with `globs: ["**/*.py"]` is only active when Claude is working on Python files. You can have multiple rules files active at the same time if a file matches several patterns (e.g., a `.tsx` file will load both `typescript.md` and `react.md`).

## Available Rules

| File | Glob Patterns | Description |
|------|---------------|-------------|
| `typescript.md` | `**/*.ts`, `**/*.tsx` | Strict TypeScript: no `any`, union types over enums, proper generics, const-first, optional chaining |
| `python.md` | `**/*.py` | PEP 8, type hints on all signatures, f-strings, pathlib, dataclasses, logging, specific exception handling |
| `react.md` | `**/*.tsx`, `**/*.jsx` | Functional components, custom hooks, named exports, accessibility, composition over inheritance, error boundaries |
| `go.md` | `**/*.go` | Immediate error checks, table-driven tests, context as first param, small interfaces, standard project layout |
| `rails.md` | `**/*.rb`, `**/*.erb` | Fat models/thin controllers, model-level validation, strong params, scopes, service objects, I18n |
| `rust.md` | `**/*.rs` | Result over panic, `?` operator, custom error types, prefer borrows, derive macros, minimize unsafe |
| `sql.md` | `**/*.sql`, `**/migrations/**` | snake_case naming, BIGINT IDs, reversible migrations with up/down, transactions, index foreign keys |
| `testing.md` | `**/*test*`, `**/*spec*`, `**/test/**`, `**/tests/**`, `**/spec/**` | Arrange-Act-Assert, one concept per test, descriptive names, no sleep/timeouts, clean up test data |

## Tips

- Rules files are plain Markdown. The YAML frontmatter (`description`, `globs`) is parsed by Claude Code; the body is the actual instruction text.
- Keep rules concise. Claude gives less weight to very long rules files.
- Combine rules with a project-level `CLAUDE.md` for repo-wide conventions, and use these rules files for language- or framework-specific detail.
- Rules files are a good fit for team standards: commit them to `.claude/rules/` so every contributor gets the same behavior.
