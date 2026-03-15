# Claude Code Skills

Ready-to-use Claude Code skill files. Each skill is a drop-in directory you copy to your `.claude/skills/` folder.

## How to Use

### Install a single skill

Copy the skill directory to your project or personal skills folder:

```bash
# Project-scoped (only this project)
cp -r skills/commit .claude/skills/

# Personal (available in all your projects)
cp -r skills/commit ~/.claude/skills/
```

### Install all skills at once

```bash
# Project-scoped
cp -r skills/. .claude/skills/

# Personal
cp -r skills/. ~/.claude/skills/
```

After copying, the skill is immediately available. Type `/skill-name` to invoke it directly, or let Claude pick it up automatically when relevant.

### Skill scopes

| Scope | Path | Who can use it |
|-------|------|----------------|
| Personal | `~/.claude/skills/<name>/SKILL.md` | You, across all projects |
| Project | `.claude/skills/<name>/SKILL.md` | Everyone working in this project |

---

## Skills Reference

| Skill | Invoke | Type | Description |
|-------|--------|------|-------------|
| `commit` | `/commit` | Task | Run tests, generate a conventional commit message, and commit staged changes |
| `pr` | `/pr [base]` | Task | Push branch and create a pull request with generated title and description via `gh` |
| `review` | `/review` | Task | Review the current diff for bugs, security issues, and style problems |
| `fix-issue` | `/fix-issue <number>` | Task | Read a GitHub issue, implement the fix, write tests, and commit |
| `tdd` | `/tdd <feature>` | Task | Red-green-refactor TDD cycle: failing test first, then implement, then clean up |
| `refactor` | `/refactor <target>` | Task | Refactor a file or function while preserving behavior, with test verification |
| `explain` | `/explain [target]` | Research | Explain code with an analogy, ASCII diagram, and step-by-step walkthrough |
| `security-scan` | `/security-scan [path]` | Research | Audit the codebase for OWASP Top 10 vulnerabilities with a structured report |
| `api-conventions` | (auto-loaded) | Reference | REST API design conventions applied whenever writing or reviewing API code |
| `doc-gen` | `/doc-gen <target>` | Task | Generate or update inline documentation and README files for a module |
| `migrate` | `/migrate <path> <target>` | Task | Migrate code from one framework or pattern to another, preserving behavior |
| `debug` | `/debug <error>` | Task | Systematic debugging: reproduce, isolate with hypothesis testing, fix, verify |
| `onboard` | `/onboard` | Research | Generate a codebase overview with architecture diagram, key files, and conventions |
| `changelog` | `/changelog [version]` | Task | Generate a categorized changelog from git history since the last release tag |
| `perf-audit` | `/perf-audit [target]` | Research | Find performance bottlenecks: N+1 queries, slow algorithms, memory issues |

### Types explained

- **Task**: has side effects (writes files, runs commands, creates commits). Most require explicit invocation via `/skill-name`. Claude will not trigger them automatically.
- **Research**: runs in a forked subagent context with read-only or limited tools. Returns a summary to your main conversation.
- **Reference**: background knowledge loaded into Claude's context automatically when relevant. Not a command you invoke - Claude reads it silently.

---

## Skill Details

### commit
Stages all changes, runs the project test suite, and generates a [Conventional Commits](https://www.conventionalcommits.org/)-formatted message (`type(scope): summary`). Aborts if tests fail. Requires `disable-model-invocation: true` so Claude cannot auto-commit your work.

### pr
Detects the base branch, pushes the current branch, generates a PR title and description (with Summary, Changes, Testing, and Related Issues sections), and runs `gh pr create`. Falls back to a manual URL if `gh` is not installed.

### review
Runs in a forked Explore agent. Fetches the current diff and analyzes it for correctness, security, error handling, performance, and style. Produces a structured report with severity-rated findings and a final verdict.

### fix-issue
Reads a GitHub issue with `gh issue view`, locates the relevant code, writes a failing test first, implements the fix, verifies tests pass, and commits with `Fixes #N` in the message.

### tdd
Guides a complete red-green-refactor cycle. Enforces the discipline of writing the failing test before any implementation. Works with any test framework the project already uses.

### refactor
Requires passing tests as a precondition. Makes only behavior-preserving changes (renaming, extracting helpers, flattening nesting, replacing magic values). Runs tests after each step to catch regressions early.

### explain
Runs in a forked Explore agent. Always produces three things: an everyday-life analogy, an ASCII architecture or flow diagram, and a "gotcha" - the common misconception about the code. Auto-invoked when you ask "how does this work?"

### security-scan
Systematically checks for all OWASP Top 10 categories using Grep and Read. Reads surrounding code to rule out false positives before reporting. Output includes severity, file location, evidence, and remediation for each finding.

### api-conventions
A reference skill (`user-invocable: false`) that Claude loads silently when you write or review API code. Covers kebab-case URLs, camelCase JSON, HTTP status codes, cursor pagination, versioning, authentication headers, idempotency keys, and rate limiting headers.

### doc-gen
Detects the project's documentation format (JSDoc, Google docstrings, Go doc comments) and writes inline documentation plus module-level READMEs. Uses test files to infer intended behavior when source comments are absent.

### migrate
Builds a source-to-target concept mapping before touching any files, then migrates file-by-file with test verification after each file. Flags constructs with no direct equivalent rather than making silent assumptions.

### debug
Enforces a three-phase process: reproduce (confirm the bug is consistent), isolate (form and test at least three hypotheses), fix (minimum change, full test suite). Prevents the common trap of fixing symptoms without finding root causes.

### onboard
Runs in a forked Explore agent. Reads README, CLAUDE.md, entry points, and CI config to produce a guide covering: what the project does, an ASCII architecture diagram, a directory map table, an ordered "read these first" file list, local setup steps, conventions, and a "where to make common changes" section.

### changelog
Parses conventional commit prefixes to group changes into Features, Bug Fixes, Performance, Docs, and Maintenance sections. Suggests a semver bump (major/minor/patch) based on the commit types found. Prepends the entry to `CHANGELOG.md`.

### perf-audit
Runs in a forked Explore agent. Covers six categories: algorithmic complexity, database/I/O patterns, memory allocation, concurrency, frontend rendering, and caching opportunities. Separates findings into "Quick Wins" (low-risk) and "Larger Investments" (requires design changes).
