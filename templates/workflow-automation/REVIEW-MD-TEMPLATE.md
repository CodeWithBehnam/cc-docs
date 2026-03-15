# Workflow Automation: REVIEW.md Templates

Customize Claude's code review behavior by placing a `REVIEW.md` file in your project root.

Claude's code review service reads this file to understand your team's review standards.

---

## Basic REVIEW.md

```markdown
# Code Review Rules

## Always Check

- All new public functions have JSDoc/docstring comments
- Error handling exists for all external API calls
- No hardcoded secrets, API keys, or passwords
- Database queries use parameterized statements
- New features have corresponding tests

## Skip

- Generated files under `src/gen/`
- Third-party vendored code in `vendor/`
- Lock files (`package-lock.json`, `yarn.lock`)
```

---

## TypeScript / JavaScript Project

```markdown
# Code Review Rules

## Always Check

- Strict TypeScript: no `any` types, no `@ts-ignore` without explanation
- All async functions have error handling (try/catch or .catch())
- React components have typed props interfaces
- API endpoints validate input (zod, joi, or similar)
- No `console.log` in production code (use structured logger)
- Imports use named exports, not default exports
- No unused imports or variables
- Tests exist for new utilities and business logic

## Style

- Use `const` by default, `let` only when reassignment needed
- Prefer early returns over nested conditionals
- Maximum function length: 50 lines (suggest splitting if longer)
- Use descriptive variable names (no single-letter outside loops)

## Security

- No user input rendered as `dangerouslySetInnerHTML`
- API tokens loaded from environment, not hardcoded
- CORS configuration reviewed for any API endpoint changes
- Authentication checked on all protected routes

## Performance

- No N+1 queries in data fetching
- Large lists use virtualization or pagination
- Images have width/height attributes (prevent layout shift)
- New npm packages justified (check bundle size impact)

## Skip

- Files in `src/generated/`
- Files in `node_modules/`
- `*.min.js` files
- `package-lock.json`
```

---

## Python Project

```markdown
# Code Review Rules

## Always Check

- Type hints on all function signatures
- Docstrings on all public functions and classes
- No bare `except:` clauses (catch specific exceptions)
- Use `pathlib.Path` over `os.path`
- Use f-strings for string formatting
- Tests exist for new functions (pytest)
- No `print()` in production code (use `logging`)

## Style

- Follow PEP 8 (enforced by ruff)
- Maximum function length: 40 lines
- Imports sorted: stdlib, third-party, local (ruff isort)
- Use dataclasses or Pydantic for structured data, not plain dicts

## Security

- User input validated before use
- SQL queries use parameterized statements
- File paths sanitized (no path traversal)
- Secrets loaded from environment variables

## Performance

- Database queries use `.select_related()` / `.prefetch_related()` (Django)
- Large querysets use `.iterator()` for memory efficiency
- Expensive computations cached where appropriate

## Skip

- Files in `migrations/`
- Files matching `*_pb2.py` (protobuf generated)
- `poetry.lock`
```

---

## Ruby on Rails Project

```markdown
# Code Review Rules

## Always Check

- Controllers have only REST actions (index, show, new, create, edit, update, destroy)
- Business logic lives in models or service objects, not controllers
- Database migrations are reversible
- New columns have `null: false` where appropriate
- Foreign keys have indexes
- Strong parameters used for all user input
- Tests exist for model validations and scopes

## Style

- Follow Rubocop configuration
- Prefer scopes over class methods for queries
- Use `Current` attributes for request-scoped state
- Partials for shared view code

## Security

- No raw SQL from user input (`where("name = '#{params[:name]}'"` is forbidden)
- CSRF protection enabled on all forms
- Authentication checked with `before_action`
- Sensitive data not logged (filter_parameters)

## Performance

- Eager loading used to prevent N+1 queries (`.includes()`)
- Pagination on all index actions
- Counter caches for frequently counted associations
- Background jobs for slow operations

## Skip

- `db/schema.rb` (auto-generated)
- Files in `vendor/`
- `Gemfile.lock`
```

---

## Go Project

```markdown
# Code Review Rules

## Always Check

- All errors are handled (no ignored return values)
- Context propagation through function chains
- Goroutines have proper cleanup (defer, context cancellation)
- Public functions have doc comments
- Interfaces defined by consumers, not providers
- Tests use table-driven patterns

## Style

- Follow `gofmt` and `golangci-lint` output
- Prefer returning errors over panicking
- Use named return values only when they improve readability
- Keep packages small and focused

## Security

- User input validated at API boundaries
- SQL uses parameterized queries
- HTTP handlers set appropriate timeouts
- Sensitive data not in logs

## Performance

- No unnecessary allocations in hot paths
- Sync.Pool used for frequently allocated objects
- Benchmarks exist for performance-critical code

## Skip

- Generated protobuf files (`*.pb.go`)
- `go.sum`
- `vendor/` directory
```

---

## Monorepo / Multi-Language

```markdown
# Code Review Rules

## Always Check (all code)

- Changes include tests
- No hardcoded secrets or credentials
- Error handling present for external calls
- Documentation updated for user-facing changes

## Frontend (apps/web/**)

- Components have typed props
- No inline styles (use Tailwind classes)
- Accessibility: interactive elements have labels
- Bundle size impact checked for new dependencies

## Backend (apps/api/**)

- API endpoints validate input
- Database queries are optimized (no N+1)
- New endpoints have integration tests
- Rate limiting considered for public endpoints

## Shared (packages/**)

- No app-specific dependencies
- Public API exported from index.ts
- Breaking changes documented

## Infrastructure (terraform/**, .github/**)

- Changes reviewed by platform team
- No credentials in config files
- Rollback plan documented for database changes

## Skip

- `**/node_modules/**`
- `**/dist/**`
- `**/*.generated.*`
- Lock files
```

---

## Tips

- Place `REVIEW.md` in your project root alongside `CLAUDE.md`
- Rules in `CLAUDE.md` also apply to reviews (bidirectional)
- Be specific: "no `any` types" is better than "use good TypeScript"
- Use `## Skip` to prevent noise on generated/vendored files
- Keep the file focused: 20-40 rules is the sweet spot
- Review rules should be enforceable (not subjective preferences)
