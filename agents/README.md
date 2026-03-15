# Claude Code Agents

Ready-to-use subagent files for Claude Code. Copy any agent file to your project's `.claude/agents/` directory (or to `~/.claude/agents/` for personal use across all projects) and it becomes available immediately.

## How to Use

**Install a single agent into your project:**
```bash
cp agents/code-reviewer.md .claude/agents/
```

**Install all agents into your project:**
```bash
mkdir -p .claude/agents
cp agents/*.md .claude/agents/
```

**Install an agent for personal use across all projects:**
```bash
mkdir -p ~/.claude/agents
cp agents/code-reviewer.md ~/.claude/agents/
```

**Reload agents without restarting Claude Code:**
```
/agents
```

**Use an agent directly:**
```
Use the code-reviewer agent to review my recent changes.
```

**Trigger auto-delegation** - agents with "use proactively" in their description will be selected automatically when you describe a matching task:
```
Review this code for security issues before I open a PR.
```

## Agents

| Agent | Model | Tools | Description |
|-------|-------|-------|-------------|
| `code-reviewer.md` | sonnet | Read, Grep, Glob, Bash | Reviews code for quality, security, and best practices. Read-only. Proactive. |
| `security-auditor.md` | opus | Read, Grep, Glob, Bash | Deep OWASP-based security audit with severity ratings. Read-only. |
| `test-writer.md` | sonnet | Read, Write, Edit, Grep, Glob, Bash | Writes tests matching the project's framework and style. |
| `debugger.md` | inherit | Read, Edit, Bash, Grep, Glob | Root cause analysis using hypothesis-driven debugging. Applies fixes. |
| `docs-writer.md` | sonnet | Read, Write, Edit, Grep, Glob | Writes JSDoc, docstrings, and README content matching project conventions. |
| `refactorer.md` | sonnet | Read, Edit, Write, Bash, Grep, Glob | Refactors for readability while preserving behavior. Runs tests before and after. |
| `performance-analyst.md` | sonnet | Read, Bash, Grep, Glob | Identifies N+1 queries, memory leaks, inefficient algorithms, missing indexes. Read-only. |
| `db-reader.md` | haiku | Bash | Read-only database queries. PreToolUse hook blocks all write operations. |
| `api-designer.md` | sonnet | Read, Write, Grep, Glob | Designs RESTful endpoints following REST conventions with OpenAPI output. |
| `migration-planner.md` | inherit | Read, Grep, Glob, Bash | Analyzes current usage and produces phased migration plans with verification steps. |
| `dependency-checker.md` | haiku | Bash, Read, Grep | Runs npm/pip/bundle/cargo audit and flags vulnerable and outdated packages. |
| `onboarding-guide.md` | sonnet | Read, Grep, Glob | Generates architecture overviews, key file maps, and setup guides. Uses project memory. |

## Agent Details

### code-reviewer
Read-only reviewer for code quality and security. Runs `git diff` to focus on recent changes and produces findings grouped into Critical, Warning, and Suggestion categories with file and line references. Ends with a clear verdict.

**Trigger phrases:** "review my code", "check this before I push", "code review"

### security-auditor
Uses the opus model for deeper analysis. Covers the OWASP Top 10: injection, broken access control, cryptographic failures, insecure design, security misconfiguration, vulnerable dependencies, and more. Each finding includes a severity rating (Critical / High / Medium / Low / Informational) and specific remediation steps.

**Trigger phrases:** "security audit", "check for vulnerabilities", "is this code safe"

### test-writer
Reads the project to discover the test framework, file structure, naming conventions, and assertion style before writing a single line. Tests are never written in a vacuum - they match what already exists.

**Trigger phrases:** "write tests for", "add test coverage", "test this function"

### debugger
Uses `inherit` model so it gets the same model as the parent session. Follows a strict hypothesis-driven process: form hypotheses, gather evidence, eliminate alternatives, fix the root cause. Cleans up debug logging before finishing.

**Trigger phrases:** "debug this", "why is this failing", "fix this error"

### docs-writer
Detects whether the project uses JSDoc, Google-style docstrings, NumPy-style, RST, or plain Markdown before writing anything. Prioritizes accuracy (reads the actual code, not just function signatures) and flags unclear behavior rather than guessing.

**Trigger phrases:** "document this", "write docs for", "add docstrings"

### refactorer
Establishes a baseline test result first and refuses to start if tests are already failing. Applies focused, named refactoring patterns (extract function, remove duplication, improve naming, simplify conditionals) without mixing in feature changes or bug fixes.

**Trigger phrases:** "refactor this", "clean up this code", "improve readability"

### performance-analyst
Read-only analyst that looks for concrete patterns: N+1 queries in ORM code, nested loops over the same data, missing pagination, repeated expensive computations, and unbounded in-memory accumulation. Includes suggestions for how to measure improvements.

**Trigger phrases:** "why is this slow", "optimize this", "performance audit"

### db-reader
The safest database agent: only has the Bash tool, and a PreToolUse hook written in Python blocks any command containing INSERT, UPDATE, DELETE, DROP, TRUNCATE, ALTER, CREATE, REPLACE, MERGE, UPSERT, GRANT, or REVOKE. Uses the haiku model for fast, low-cost queries.

**Trigger phrases:** "query the database", "look up records", "check the data"

### api-designer
Produces endpoint specifications with HTTP methods, status codes, request/response schemas, and error formats. Follows the REST conventions already used in the project. Outputs a ready-to-paste OpenAPI YAML snippet.

**Trigger phrases:** "design an API", "add an endpoint", "what should this REST API look like"

### migration-planner
Analyzes how many files and call sites are affected, lists all breaking changes between versions, and produces a phased plan where each phase is independently deployable and verifiable. Estimates effort and flags risks.

**Trigger phrases:** "migrate from X to Y", "upgrade this dependency", "plan this migration"

### dependency-checker
Detects which package manager is in use (npm, yarn, pnpm, pip, poetry, bundler, cargo, go modules) and runs the right audit commands. Produces a prioritized list with ready-to-run fix commands.

**Trigger phrases:** "check dependencies", "audit packages", "are there any vulnerable dependencies"

### onboarding-guide
Uses project-scoped memory so knowledge accumulates across sessions. The first run explores the full codebase; subsequent runs build on stored knowledge. Produces a guide structured for a new developer: what the project does, how to get it running, how the code is organized, and what conventions to follow.

**Trigger phrases:** "give me an overview of this codebase", "onboard me to this project", "explain how this project is structured"

## Model Selection Guide

| Model | Use when |
|-------|----------|
| `opus` | Maximum reasoning depth needed (security audits, complex analysis) |
| `sonnet` | Default for most tasks - good balance of quality and speed |
| `haiku` | Speed and low cost matter most (simple queries, lightweight checks) |
| `inherit` | Match the model the user already has active in their session |

## Tips

- Agents listed in `.claude/agents/` (project scope) are committed to git and shared with your team.
- Agents in `~/.claude/agents/` (user scope) are personal and available in every project.
- The `description` field controls when Claude auto-delegates. Be specific about trigger conditions.
- The `db-reader` agent's hook requires Python 3 to be available on the PATH.
- Agents do not inherit skills from the parent session - add a `skills` field if your project has custom skills they need.
