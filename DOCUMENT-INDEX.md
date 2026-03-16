# Detailed Document Index

This file contains the full index of all resources in this repo. Referenced from CLAUDE.md - read this file when you need to find a specific resource.

## Document Index

### Getting Started

| File | Description |
|------|-------------|
| `claude-code-docs/overview.md` | Claude Code overview - what it is, key capabilities |
| `claude-code-docs/quickstart.md` | Quickstart guide for first-time setup |
| `claude-code-docs/setup.md` | Advanced setup and installation options |
| `claude-code-docs/how-claude-code-works.md` | Architecture and inner workings of Claude Code |

### Core Usage

| File | Description |
|------|-------------|
| `claude-code-docs/interactive-mode.md` | Interactive (REPL) mode usage and commands |
| `claude-code-docs/cli-reference.md` | Full CLI reference - flags, options, commands |
| `claude-code-docs/common-workflows.md` | Common workflows and usage patterns |
| `claude-code-docs/best-practices.md` | Best practices for effective Claude Code usage |
| `claude-code-docs/code-review.md` | Code review workflows and best practices |
| `claude-code-docs/commands.md` | Slash commands reference |
| `claude-code-docs/keybindings.md` | Customize keyboard shortcuts |
| `claude-code-docs/fast-mode.md` | Speed up responses with fast mode |
| `claude-code-docs/output-styles.md` | Configure output formatting styles |
| `claude-code-docs/terminal-config.md` | Optimize terminal setup for Claude Code |

### Memory & Settings

| File | Description |
|------|-------------|
| `claude-code-docs/memory.md` | Manage Claude's memory (CLAUDE.md files, auto-memory) |
| `claude-code-docs/settings.md` | Full settings reference - all configuration options |
| `claude-code-docs/model-config.md` | Model configuration - choosing and switching models |
| `claude-code-docs/permissions.md` | Configure tool permissions and approval modes |
| `claude-code-docs/env-vars.md` | Environment variables reference |
| `claude-code-docs/statusline.md` | Customize the status line display |

### Extensibility

| File | Description |
|------|-------------|
| `claude-code-docs/features-overview.md` | Overview of extension points (skills, plugins, hooks, MCP, subagents) |
| `claude-code-docs/skills.md` | Create and use skills (slash commands) |
| `claude-code-docs/sub-agents.md` | Create custom subagents for specialized tasks |
| `claude-code-docs/agent-teams.md` | Orchestrate teams of Claude Code sessions |
| `claude-code-docs/plugins.md` | Create plugins to extend Claude Code |
| `claude-code-docs/plugins-reference.md` | Plugins technical reference |
| `claude-code-docs/discover-plugins.md` | Discover and install prebuilt plugins |
| `claude-code-docs/plugin-marketplaces.md` | Create and distribute plugin marketplaces |
| `claude-code-docs/hooks.md` | Hooks technical reference |
| `claude-code-docs/hooks-guide.md` | Practical guide to automating workflows with hooks |
| `claude-code-docs/mcp.md` | Connect Claude Code to external tools via MCP |

### IDE Integrations

| File | Description |
|------|-------------|
| `claude-code-docs/vs-code.md` | Use Claude Code in VS Code |
| `claude-code-docs/jetbrains.md` | Use Claude Code in JetBrains IDEs |
| `claude-code-docs/chrome.md` | Use Claude Code with Chrome (beta) |
| `claude-code-docs/desktop.md` | Use Claude Code Desktop app |
| `claude-code-docs/desktop-quickstart.md` | Get started with the desktop app |
| `claude-code-docs/claude-code-on-the-web.md` | Claude Code on the web |

### CI/CD & Automation

| File | Description |
|------|-------------|
| `claude-code-docs/headless.md` | Run Claude Code programmatically (non-interactive) |
| `claude-code-docs/github-actions.md` | Claude Code in GitHub Actions |
| `claude-code-docs/gitlab-ci-cd.md` | Claude Code in GitLab CI/CD |
| `claude-code-docs/remote-control.md` | Continue local sessions from any device |
| `claude-code-docs/scheduled-tasks.md` | Schedule recurring tasks |
| `claude-code-docs/slack.md` | Claude Code in Slack |

### Cloud Providers

| File | Description |
|------|-------------|
| `claude-code-docs/amazon-bedrock.md` | Claude Code on Amazon Bedrock |
| `claude-code-docs/google-vertex-ai.md` | Claude Code on Google Vertex AI |
| `claude-code-docs/microsoft-foundry.md` | Claude Code on Microsoft Foundry |
| `claude-code-docs/llm-gateway.md` | LLM gateway configuration for proxies |

### Enterprise & Security

| File | Description |
|------|-------------|
| `claude-code-docs/authentication.md` | Authentication setup |
| `claude-code-docs/security.md` | Security model and practices |
| `claude-code-docs/sandboxing.md` | Sandboxing and isolation |
| `claude-code-docs/network-config.md` | Enterprise network configuration |
| `claude-code-docs/server-managed-settings.md` | Server-managed settings (public beta) |
| `claude-code-docs/third-party-integrations.md` | Enterprise deployment overview |
| `claude-code-docs/data-usage.md` | Data usage and privacy |
| `claude-code-docs/zero-data-retention.md` | Zero data retention configuration |
| `claude-code-docs/legal-and-compliance.md` | Legal and compliance information |

### Operations

| File | Description |
|------|-------------|
| `claude-code-docs/costs.md` | Manage costs effectively |
| `claude-code-docs/analytics.md` | Track team usage with analytics |
| `claude-code-docs/monitoring-usage.md` | Monitor usage and performance |
| `claude-code-docs/checkpointing.md` | Checkpointing - save and restore state |
| `claude-code-docs/devcontainer.md` | Development containers setup |
| `claude-code-docs/troubleshooting.md` | Troubleshooting common issues |

### Reference

| File | Description |
|------|-------------|
| `claude-code-docs/tools-reference.md` | Built-in tools reference |
| `claude-code-docs/changelog.md` | Full changelog of Claude Code releases |
| `claude-code-docs/llms.txt` | Raw doc index used by the download script |

### Community Resources

| File | Description |
|------|-------------|
| `awesome.md` | Curated "Awesome Claude Code" list - official resources, MCP servers, plugins, CLAUDE.md starters, tools, cloud setup, and enterprise guides |

## Templates (`templates/`)

Ready-to-use, copy-paste-able templates. **Use these as starting points** when asked to create skills, subagents, hooks, or set up any Claude Code feature.

### Core Extension Templates

| File | Description |
|------|-------------|
| `templates/SKILL-TEMPLATE.md` | Skill patterns - reference, task, research, codegen, script-powered |
| `templates/SUBAGENT-TEMPLATE.md` | Subagent patterns - reviewer, debugger, domain expert, hooks, memory, background, worktree |
| `templates/HOOKS-TEMPLATE.md` | Hook patterns - formatter, protector, notifier, auditor, verifier, all event types |
| `templates/HOOKS-RECIPES.md` | 10 production-ready hook recipes - dangerous command blocker, network guard, git safety, auto-lint, test runner, commit validator, audit logger, Slack notifier, context injector, auto-commit |

### CLAUDE.md Starters (`templates/claude-md-starters/`)

| File | Description |
|------|-------------|
| `CLAUDE-MD-PYTHON.md` | Python project starter with pytest, ruff, uv/pip/poetry, Django/FastAPI variants |
| `CLAUDE-MD-TYPESCRIPT.md` | TypeScript/Node.js starter with ESLint, Prettier, npm/pnpm/bun variants |
| `CLAUDE-MD-REACT.md` | React/Next.js starter with App Router, Tailwind, Vite/shadcn variants |
| `CLAUDE-MD-RAILS.md` | Ruby on Rails starter with RSpec, Rubocop, Hotwire, API-only variant |
| `CLAUDE-MD-MONOREPO.md` | Monorepo starter with path-specific rules, workspace conventions, imports |

### CI/CD Workflows (`templates/ci-cd/`)

| File | Description |
|------|-------------|
| `GITHUB-ACTIONS-PR-REVIEW.md` | GitHub Actions PR review with custom rules, Bedrock/Vertex options |
| `GITHUB-ACTIONS-ISSUE-IMPL.md` | GitHub Actions auto-implement issues and create PRs |
| `GITLAB-CI-REVIEW.md` | GitLab CI MR review with MCP, Bedrock OIDC, Vertex WIF |
| `HEADLESS-SCRIPTS.md` | Shell scripts for batch migration, pre-commit, JSON output, lint-fix |

### MCP Integrations (`templates/mcp-integrations/`)

| File | Description |
|------|-------------|
| `MCP-GITHUB.md` | GitHub API access via MCP (issues, PRs, code search) |
| `MCP-DATABASE.md` | Database access (PostgreSQL, MySQL, SQLite) with read-only safety |
| `MCP-SLACK-NOTION.md` | Team tools (Slack, Notion, Linear, Jira, Sentry) |
| `MCP-CUSTOM-SERVER.md` | Build your own MCP server (Node.js, Python, HTTP) |

### Plugins (`templates/plugins/`)

| File | Description |
|------|-------------|
| `PLUGIN-MINIMAL.md` | Minimal plugin scaffold with single skill |
| `PLUGIN-FULL.md` | Full plugin with skills, agents, hooks, MCP |
| `PLUGIN-LSP.md` | Code intelligence plugin with LSP server |

### Permissions & Security (`templates/permissions-security/`)

| File | Description |
|------|-------------|
| `PERMISSIONS-DEVELOPMENT.md` | Dev permission presets (balanced, Python, Rails, Go, restrictive, open) |
| `PERMISSIONS-CICD.md` | CI/CD safe mode (read-only, test-running, controlled edits, cost controls) |
| `SANDBOX-DEVCONTAINER.md` | Devcontainer with firewall, sandbox settings, Codespaces |

### Cloud Providers (`templates/cloud-providers/`)

| File | Description |
|------|-------------|
| `AWS-BEDROCK-SETUP.md` | AWS Bedrock setup (credentials, SSO, model pinning, guardrails) |
| `GCP-VERTEX-SETUP.md` | Google Vertex AI setup (gcloud, regions, 1M context) |
| `LLM-GATEWAY-SETUP.md` | LLM gateway/proxy setup (LiteLLM, key rotation, multi-provider) |

### Agent Teams (`templates/agent-teams/`)

| File | Description |
|------|-------------|
| `AGENT-TEAM-CODE-REVIEW.md` | Multi-agent code review (security + performance + test coverage) |
| `AGENT-TEAM-FEATURE-DEV.md` | Feature dev team (architect + implementer + test writer) |
| `AGENT-TEAM-DEBUGGING.md` | Debug team (log analyst + code tracer + hypothesis tester) |

### Workflow Automation (`templates/workflow-automation/`)

| File | Description |
|------|-------------|
| `SCHEDULED-TASKS.md` | Scheduled tasks (monitoring, PR checks, cron, reminders) |
| `REVIEW-MD-TEMPLATE.md` | REVIEW.md templates for TypeScript, Python, Rails, Go, monorepo |
| `REMOTE-CONTROL-SETUP.md` | Remote control (server mode, mobile access, concurrent sessions) |

### Enterprise (`templates/enterprise/`)

| File | Description |
|------|-------------|
| `ENTERPRISE-NETWORK.md` | Network config (proxy, custom CA, mTLS, credential refresh, firewall) |
| `ENTERPRISE-MANAGED-SETTINGS.md` | Managed settings (org-wide permissions, model restrictions, audit) |

## Rules (`rules/`)

Drop-in path-specific rules files. Copy to `.claude/rules/` in any project.

| File | Glob Patterns | Description |
|------|---------------|-------------|
| `rules/typescript.md` | `**/*.ts`, `**/*.tsx` | Strict TypeScript: no `any`, union types over enums, proper generics, const-first, optional chaining |
| `rules/python.md` | `**/*.py` | PEP 8, type hints on all signatures, f-strings, pathlib, dataclasses, logging, specific exception handling |
| `rules/react.md` | `**/*.tsx`, `**/*.jsx` | Functional components, custom hooks, named exports, accessibility, composition over inheritance, error boundaries |
| `rules/go.md` | `**/*.go` | Immediate error checks, table-driven tests, context as first param, small interfaces, standard project layout |
| `rules/rails.md` | `**/*.rb`, `**/*.erb` | Fat models/thin controllers, model-level validation, strong params, scopes, service objects, I18n |
| `rules/rust.md` | `**/*.rs` | Result over panic, `?` operator, custom error types, prefer borrows, derive macros, minimize unsafe |
| `rules/sql.md` | `**/*.sql`, `**/migrations/**` | snake_case naming, BIGINT IDs, reversible migrations with up/down, transactions, index foreign keys |
| `rules/testing.md` | `**/*test*`, `**/*spec*`, `**/test/**`, `**/tests/**`, `**/spec/**` | Arrange-Act-Assert, one concept per test, descriptive names, no sleep/timeouts, clean up test data |

## Tips (`tips/`)

| File | Description |
|------|-------------|
| `tips/README.md` | Index of all tips files with quick-reference examples |
| `tips/productivity.md` | Session management, context control, and daily workflow shortcuts |
| `tips/prompting.md` | How to write prompts that get better results faster |
| `tips/debugging.md` | Debugging strategies that save time and preserve context |
| `tips/cost-optimization.md` | Reduce token usage and API costs without slowing down |
| `tips/multi-session.md` | Parallel sessions, worktrees, and agent coordination |
| `tips/security.md` | Security-first habits and safeguards for safe automation |

## Skills (`skills/`)

Drop-in skill directories. Copy to `.claude/skills/` in any project, or `~/.claude/skills/` for personal use.

### Core Skills (15)

| File | Command | Type | Description |
|------|---------|------|-------------|
| `skills/commit/SKILL.md` | `/commit` | Task | Run tests, generate a conventional commit message, and commit |
| `skills/pr/SKILL.md` | `/pr [base]` | Task | Push branch and create a PR with generated title and description via `gh` |
| `skills/review/SKILL.md` | `/review` | Research | Review current diff for bugs, security issues, and style problems |
| `skills/fix-issue/SKILL.md` | `/fix-issue <number>` | Task | Read a GitHub issue, implement fix, write tests, and commit |
| `skills/tdd/SKILL.md` | `/tdd <feature>` | Task | Red-green-refactor TDD cycle: failing test first, then implement, then clean up |
| `skills/refactor/SKILL.md` | `/refactor <target>` | Task | Refactor a file or function while preserving behavior, with test verification |
| `skills/explain/SKILL.md` | `/explain [target]` | Research | Explain code with analogy, ASCII diagram, and step-by-step walkthrough |
| `skills/security-scan/SKILL.md` | `/security-scan [path]` | Research | Audit codebase for OWASP Top 10 vulnerabilities with structured report |
| `skills/api-conventions/SKILL.md` | (auto-loaded) | Reference | REST API design conventions applied when writing or reviewing API code |
| `skills/doc-gen/SKILL.md` | `/doc-gen <target>` | Task | Generate or update inline docs and README files for a module |
| `skills/migrate/SKILL.md` | `/migrate <path> <target>` | Task | Migrate code from one framework or pattern to another |
| `skills/debug/SKILL.md` | `/debug <error>` | Task | Systematic debugging: reproduce, isolate with hypothesis testing, fix, verify |
| `skills/onboard/SKILL.md` | `/onboard` | Research | Generate codebase overview with architecture diagram, key files, and conventions |
| `skills/changelog/SKILL.md` | `/changelog [version]` | Task | Generate categorized changelog from git history since last release tag |
| `skills/perf-audit/SKILL.md` | `/perf-audit [target]` | Research | Find performance bottlenecks: N+1 queries, slow algorithms, memory issues |

### Community Skills (222 skills in 16 categories)

Imported from community repos: [wshobson/agents](https://github.com/wshobson/agents) (MIT), [affaan-m/everything-claude-code](https://github.com/affaan-m/everything-claude-code), [garrytan/gstack](https://github.com/garrytan/gstack), [mitsuhiko/agent-stuff](https://github.com/mitsuhiko/agent-stuff), [EveryInc/compound-engineering-plugin](https://github.com/EveryInc/compound-engineering-plugin) (MIT). Each skill is in its own subdirectory under the category with a `SKILL.md` file and optional reference files.

| Directory | Count | Description |
|-----------|-------|-------------|
| `skills/api-architecture/` | 10 | API Design, REST, GraphQL, Microservices, CQRS, Event Sourcing |
| `skills/backend-development/` | 20 | Backend Patterns, Build Tools, Migrations, Rails, Ruby Gems |
| `skills/frontend-development/` | 19 | React, Next.js, Design Systems, Mobile, Accessibility, Browser Automation |
| `skills/testing-quality/` | 12 | E2E Testing, TDD, Code Review, Verification, Browser Automation |
| `skills/security/` | 14 | Threat Modeling, SAST, Compliance, Reverse Engineering, Damage Control |
| `skills/devops-infrastructure/` | 21 | CI/CD, K8s, Terraform, Cloud, Incident Response, Sandboxes, Cloud Storage |
| `skills/data-engineering/` | 6 | Airflow, dbt, Spark, Data Quality, SQL |
| `skills/ai-ml/` | 13 | LLM, RAG, Prompt Engineering, ML Pipelines, Embeddings, Agent Architecture, Image Generation |
| `skills/language-specific/` | 23 | Python, TypeScript, Go, Rust, Shell |
| `skills/content-research/` | 12 | Writing, Research, SEO, Media, Web Search, Summarization, Style Editing, Document Sharing |
| `skills/business/` | 15 | Finance, Payments, Analytics, Hiring |
| `skills/observability/` | 5 | Monitoring, Tracing, Grafana, Prometheus, SLOs, Sentry |
| `skills/team-workflow/` | 11 | Coordination, Parallel Work, Agent Teams |
| `skills/game-embedded/` | 3 | Game Development (Unity, Godot), 3D Modeling |
| `skills/blockchain/` | 4 | Solidity, DeFi, NFT, Web3 |
| `skills/productivity/` | 34 | QA, Reviews, Shipping, Git, Documentation, Parallel Work, Mac Automation, Diagrams, Email, Planning, Brainstorming, Skill Authoring, Coding Tutor |

For the full listing of individual skills within each category, see the skill category's own README or browse the `skills/<category>/` directories.

## Commands (`commands/`)

Drop-in slash command files. Copy to `.claude/commands/` in any project.

### Core Commands (12)

| File | Command | Argument | Description |
|------|---------|----------|-------------|
| `commands/commit.md` | `/commit` | (none) | Run tests, stage changes, generate a conventional commit message, and commit. |
| `commands/pr.md` | `/pr` | (none) | Summarize branch changes vs main, generate title and description, push, and create a PR with `gh`. |
| `commands/review.md` | `/review` | (none) | Diff the current branch against main and report findings by priority: critical, warning, suggestion. |
| `commands/fix-issue.md` | `/fix-issue` | `<issue-number>` | Fetch a GitHub issue, implement the fix, write tests, and commit with a closing reference. |
| `commands/tdd.md` | `/tdd` | `<feature description>` | Implement a feature using strict TDD: red, green, refactor cycle. |
| `commands/deploy.md` | `/deploy` | `<staging\|production>` | Run tests, build, and deploy to the target environment with safety checks. |
| `commands/lint-fix.md` | `/lint-fix` | (none) | Detect the project linter, auto-fix all fixable issues, and report what remains. |
| `commands/deps-update.md` | `/deps-update` | (none) | Audit for vulnerabilities, list outdated packages, update safe ones, and run tests. |
| `commands/explain.md` | `/explain` | `<file or symbol>` | Explain code with an ASCII diagram, analogy, step-by-step walkthrough, and common gotchas. |
| `commands/release.md` | `/release` | `<version e.g. 1.2.0>` | Update changelog, bump version, commit, tag, push, and create a GitHub release. |
| `commands/db-migrate.md` | `/db-migrate` | `<migration description>` | Generate a migration file with up/down methods and test the rollback. |
| `commands/new-feature.md` | `/new-feature` | `<feature name>` | Scaffold a new feature following existing patterns, with files, tests, and wired imports. |

### Community Commands (100 commands in 12 categories)

Sources: [wshobson/agents](https://github.com/wshobson/agents) (MIT), [davila7/claude-code-templates](https://github.com/davila7/claude-code-templates) (MIT), [disler](https://github.com/disler), [EveryInc/compound-engineering-plugin](https://github.com/EveryInc/compound-engineering-plugin) (MIT).

| Directory | Count | Description |
|-----------|-------|-------------|
| `commands/development/` | 20 | Feature development, scaffolding, build/plan execution, session priming, infinite agentic loops, team planning, quick plans, system start, coding tutor (quiz, teach, sync) |
| `commands/review-quality/` | 7 | Full code review orchestrator, PR enhancement, AI-powered review, multi-agent review, design review, accessibility audit, parallel UI review |
| `commands/testing/` | 8 | TDD cycle (red/green/refactor), test generation, API mocking, performance optimization, Python test runner |
| `commands/debugging/` | 6 | Error analysis, error tracing, smart debug, distributed debug tracing, incident response, smart fix |
| `commands/deployment-infra/` | 7 | CI/CD workflow automation, config validation, cloud cost optimization, monitoring setup, SLO implementation, install/init hooks, maintenance hooks |
| `commands/documentation/` | 4 | Doc generation, code explanation, C4 architecture documentation, blog article creation |
| `commands/git-workflow/` | 12 | Git workflow with quality gates, onboarding, Conductor project management (6 commands), worktree management (4 commands) |
| `commands/security/` | 5 | SAST scanning, security hardening, dependency vulnerability scanning, compliance checks, XSS scanning |
| `commands/team-management/` | 12 | Agent team orchestration (spawn/status/delegate/feature/review/debug/shutdown), issue resolution, standup notes, business case, financials, market analysis |
| `commands/data-migration/` | 7 | Data pipelines, SQL migrations, migration observability, code migration, dependency upgrades, legacy modernization, ML pipelines |
| `commands/ai-tools/` | 5 | AI assistant building, LangGraph agents, prompt optimization, agent improvement, multi-agent optimization |
| `commands/refactoring/` | 7 | Refactor with SOLID principles, tech debt analysis, dependency audit, context save/restore, cache cleanup, Python linting |

## Hook Scripts (`hooks/`)

Production-ready bash hook scripts. Copy to `.claude/hooks/` and wire via `.claude/settings.json`.

### Core Hook Scripts (10 + settings example)

| File | Description |
|------|-------------|
| `hooks/README.md` | Index of all hook scripts with event types, matchers, and usage instructions |
| `hooks/settings-examples.json` | Complete settings.json example wiring all 10 scripts with correct event types and matchers |
| `hooks/scripts/auto-format.sh` | PostToolUse - runs prettier, black, gofmt, or rubocop after a file is saved |
| `hooks/scripts/protect-files.sh` | PreToolUse - blocks edits to .env, lock files, .git/, and secret/credential paths |
| `hooks/scripts/notify-desktop.sh` | Notification - cross-platform desktop notification (macOS, Linux, Windows) |
| `hooks/scripts/lint-on-save.sh` | PostToolUse - runs ESLint, ruff, or rubocop after a file is saved (non-blocking) |
| `hooks/scripts/block-dangerous-commands.sh` | PreToolUse - blocks rm -rf /, DROP TABLE, force-push to main, curl/wget piped to bash |
| `hooks/scripts/log-tool-usage.sh` | PostToolUse - appends JSON lines to ~/.claude/tool-usage.log for every tool call |
| `hooks/scripts/validate-sql.sh` | PreToolUse - blocks SQL mutations (INSERT, UPDATE, DELETE, DROP, etc.); allows SELECT |
| `hooks/scripts/test-after-edit.sh` | PostToolUse - finds and runs related test file after a source file is edited (non-blocking) |
| `hooks/scripts/inject-context.sh` | SessionStart (compact) - re-injects git branch, recent commits, and project reminder after compaction |
| `hooks/scripts/stop-check.sh` | Stop - checks for uncommitted changes and asks Claude to commit before finishing |

### Community Hooks (`hooks/community/`)

Community-contributed hooks from [davila7/claude-code-templates](https://github.com/davila7/claude-code-templates) (MIT) and [disler](https://github.com/disler). See `hooks/community/README.md` for full details.

| Directory | Description |
|-----------|-------------|
| `hooks/community/automation/` | Build, deploy, notification hooks (Slack, Discord, Telegram, Vercel) |
| `hooks/community/development-tools/` | Linting, formatting, debugging, backup, quality gates (TDD gate, plan gate, scope guard) |
| `hooks/community/git/` | Commit validation, branch naming, push protection |
| `hooks/community/monitoring/` | Desktop notifications, LangSmith tracing, performance monitoring |
| `hooks/community/post-tool/` | Format JS/Python, git add, run tests, security scan after tool use |
| `hooks/community/pre-tool/` | Backup before edit, dangerous command blocker, secret scanner, file protection |
| `hooks/community/disler-hooks-mastery/` | Complete Python hooks framework - every event type, LLM summaries, TTS, validators, HITL |

## Agents (`agents/`)

Drop-in subagent files. Copy to `.claude/agents/` in any project or `~/.claude/agents/` for personal use.

### Core Agents (12)

| File | Model | Description |
|------|-------|-------------|
| `agents/code-reviewer.md` | sonnet | Read-only code review - quality, security, best practices. Proactive. |
| `agents/security-auditor.md` | opus | Deep OWASP security audit with severity ratings. Read-only. |
| `agents/test-writer.md` | sonnet | Writes tests matching the project's framework and style. |
| `agents/debugger.md` | inherit | Hypothesis-driven root cause analysis with fix applied. |
| `agents/docs-writer.md` | sonnet | Writes JSDoc, docstrings, and README content matching project conventions. |
| `agents/refactorer.md` | sonnet | Refactors for readability while preserving behavior. Runs tests before and after. |
| `agents/performance-analyst.md` | sonnet | Finds N+1 queries, memory leaks, inefficient algorithms, missing indexes. Read-only. |
| `agents/db-reader.md` | haiku | Read-only database queries. PreToolUse hook blocks all write SQL operations. |
| `agents/api-designer.md` | sonnet | Designs RESTful endpoints following REST conventions with OpenAPI output. |
| `agents/migration-planner.md` | inherit | Phased migration plans with scope analysis and verification steps. |
| `agents/dependency-checker.md` | haiku | Runs npm/pip/bundle/cargo audit and flags vulnerable and outdated packages. |
| `agents/onboarding-guide.md` | sonnet | Generates architecture overviews, key file maps, and setup guides. Uses project memory. |

### Community Agents (185 agents in 14 categories)

Sources: [VoltAgent/awesome-claude-code-subagents](https://github.com/VoltAgent/awesome-claude-code-subagents) (MIT), [disler](https://github.com/disler), [mitsuhiko/agent-prompts](https://github.com/mitsuhiko/agent-prompts), [EveryInc/compound-engineering-plugin](https://github.com/EveryInc/compound-engineering-plugin) (MIT).

| Directory | Count | Description |
|-----------|-------|-------------|
| `agents/core-development/` | 10 | API design, backend, frontend, fullstack, mobile, Electron, GraphQL, microservices, UI, WebSocket |
| `agents/language-specialists/` | 26 | Angular, C++, C#, Django, .NET, Elixir, Flutter, Go, Java, JS, Kotlin, Laravel, Next.js, PHP, PowerShell, Python, Rails, React, Rust, Spring Boot, SQL, Swift, TypeScript, Vue |
| `agents/infrastructure/` | 16 | Azure, cloud architecture, databases, deployment, DevOps, Docker, incidents, Kubernetes, networking, platform, security, SRE, Terraform, Terragrunt, Windows |
| `agents/quality-security/` | 30 | Accessibility, AD security, architecture review, chaos engineering, code review, code simplicity, compliance, data integrity, data migration, debugging, deployment verification, DHH Rails review, frontend races, pattern recognition, penetration testing, performance, Python/Rails/TypeScript review (Kieran), QA, schema drift detection, security auditing, security sentinel, test automation, agent-native review, Bowser QA |
| `agents/data-ai/` | 12 | AI engineering, data analysis, data engineering, data science, database optimization, LLM architecture, ML engineering, MLOps, NLP, PostgreSQL, prompt engineering |
| `agents/developer-experience/` | 18 | Bug reproduction, build systems, CLI tools, dependencies, documentation, DX optimization, Git workflows, legacy modernization, MCP development, PowerShell modules, PR comment resolution, refactoring, Slack, spec flow analysis, tooling, docs scraping, codebase scouting |
| `agents/specialized-domains/` | 12 | API docs, blockchain, embedded systems, fintech, gaming, IoT, M365, mobile apps, payments, quantitative analysis, risk management, SEO |
| `agents/business-product/` | 11 | Business analysis, content marketing, customer success, legal, product management, project management, sales engineering, Scrum, technical writing, UX research, WordPress |
| `agents/meta-orchestration/` | 12 | Agent installation, agent organization, context management, error coordination, IT ops, knowledge synthesis, multi-agent coordination, performance monitoring, task distribution, workflow orchestration, meta-agent creation, work-completion summaries |
| `agents/research-analysis/` | 15 | Best practices research, competitive analysis, data research, framework docs research, git history analysis, learnings research, market research, repo research, research analysis, scientific literature, search, trend analysis, citations, research lead, research subagent |
| `agents/design/` | 4 | Design implementation review, design iteration, Figma design sync, Ankane README writer |
| `agents/lang-engineering/` | 10 | Compiler, coroutine, language analysis, language architect, lexer, memory management, object system, parser, runtime, VM engineering for programming language development |
| `agents/poc-engineering/` | 7 | Architecture design, detailed planning, implementation, problem analysis, programming lead, software architect, task breakdown for proof-of-concept development |
| `agents/team/` | 2 | Builder (executes one task with validation hooks) and validator (read-only task verification) |

## Guides (`guides/`)

| File | Description |
|------|-------------|
| `guides/README.md` | Index of all guides with descriptions and "when to use" guidance |
| `guides/tdd-workflow.md` | Test-Driven Development - red-green-refactor cycle with Claude |
| `guides/security-audit.md` | Security audit using OWASP Top 10, plan mode, and protection hooks |
| `guides/onboarding-new-codebase.md` | First day on a new codebase - safe exploration to first change |
| `guides/migration-playbook.md` | Migrating frameworks or libraries - scope, plan, safety nets, bulk migration |
| `guides/pr-review-workflow.md` | Professional code review with subagents for deep dives |
| `guides/ci-cd-setup.md` | Setting up Claude Code in GitHub Actions or GitLab CI/CD |
| `guides/monorepo-setup.md` | Configuring layered CLAUDE.md files and per-package skills for monorepos |

## Cheatsheets (`cheatsheets/`)

Condensed quick-reference versions of every official doc topic. One file per topic, covering the same ground as `claude-code-docs/` in a shorter format.

| File | Description |
|------|-------------|
| `cheatsheets/README.md` | Index of all cheatsheets |
| `cheatsheets/overview.md` | Claude Code overview |
| `cheatsheets/quickstart.md` | Quickstart guide |
| `cheatsheets/setup.md` | Setup and installation |
| `cheatsheets/how-claude-code-works.md` | Architecture and inner workings |
| `cheatsheets/interactive-mode.md` | Interactive (REPL) mode |
| `cheatsheets/cli-reference.md` | CLI flags, options, commands |
| `cheatsheets/common-workflows.md` | Common workflow patterns |
| `cheatsheets/best-practices.md` | Best practices |
| `cheatsheets/code-review.md` | Code review workflows |
| `cheatsheets/commands.md` | Slash commands |
| `cheatsheets/keybindings.md` | Keyboard shortcuts |
| `cheatsheets/fast-mode.md` | Fast mode |
| `cheatsheets/output-styles.md` | Output formatting styles |
| `cheatsheets/terminal-config.md` | Terminal setup |
| `cheatsheets/memory.md` | Memory and CLAUDE.md files |
| `cheatsheets/settings.md` | Settings reference |
| `cheatsheets/model-config.md` | Model configuration |
| `cheatsheets/permissions.md` | Tool permissions and approval modes |
| `cheatsheets/env-vars.md` | Environment variables |
| `cheatsheets/statusline.md` | Status line display |
| `cheatsheets/features-overview.md` | Extension points overview |
| `cheatsheets/skills.md` | Skills (slash commands) |
| `cheatsheets/sub-agents.md` | Custom subagents |
| `cheatsheets/agent-teams.md` | Agent team orchestration |
| `cheatsheets/plugins.md` | Plugin creation |
| `cheatsheets/plugins-reference.md` | Plugins technical reference |
| `cheatsheets/discover-plugins.md` | Discover and install plugins |
| `cheatsheets/plugin-marketplaces.md` | Plugin marketplace distribution |
| `cheatsheets/hooks.md` | Hooks technical reference |
| `cheatsheets/hooks-guide.md` | Hooks practical guide |
| `cheatsheets/mcp.md` | MCP integration |
| `cheatsheets/vs-code.md` | VS Code integration |
| `cheatsheets/jetbrains.md` | JetBrains integration |
| `cheatsheets/chrome.md` | Chrome integration |
| `cheatsheets/desktop.md` | Desktop app |
| `cheatsheets/desktop-quickstart.md` | Desktop quickstart |
| `cheatsheets/claude-code-on-the-web.md` | Claude Code on the web |
| `cheatsheets/headless.md` | Headless (non-interactive) mode |
| `cheatsheets/github-actions.md` | GitHub Actions |
| `cheatsheets/gitlab-ci-cd.md` | GitLab CI/CD |
| `cheatsheets/remote-control.md` | Remote control |
| `cheatsheets/scheduled-tasks.md` | Scheduled tasks |
| `cheatsheets/slack.md` | Slack integration |
| `cheatsheets/amazon-bedrock.md` | Amazon Bedrock |
| `cheatsheets/google-vertex-ai.md` | Google Vertex AI |
| `cheatsheets/microsoft-foundry.md` | Microsoft Foundry |
| `cheatsheets/llm-gateway.md` | LLM gateway configuration |
| `cheatsheets/authentication.md` | Authentication setup |
| `cheatsheets/security.md` | Security model |
| `cheatsheets/sandboxing.md` | Sandboxing and isolation |
| `cheatsheets/network-config.md` | Enterprise network config |
| `cheatsheets/server-managed-settings.md` | Server-managed settings |
| `cheatsheets/third-party-integrations.md` | Enterprise deployment |
| `cheatsheets/data-usage.md` | Data usage and privacy |
| `cheatsheets/zero-data-retention.md` | Zero data retention |
| `cheatsheets/legal-and-compliance.md` | Legal and compliance |
| `cheatsheets/costs.md` | Cost management |
| `cheatsheets/analytics.md` | Team usage analytics |
| `cheatsheets/monitoring-usage.md` | Usage monitoring |
| `cheatsheets/checkpointing.md` | Checkpointing |
| `cheatsheets/devcontainer.md` | Development containers |
| `cheatsheets/troubleshooting.md` | Troubleshooting |
| `cheatsheets/tools-reference.md` | Built-in tools reference |
| `cheatsheets/changelog.md` | Changelog |

## Docs (`docs/`)

| File | Description |
|------|-------------|
| `docs/brainstorms/2026-03-15-hooks-recipes-brainstorm.md` | Hooks recipes brainstorm and planning document |

## Output Styles (`output-styles/`)

Drop-in output style files. Copy to `.claude/output-styles/` in any project or `~/.claude/output-styles/` for personal use. Select with `/output-style` or `--output-style` CLI flag.

| File | Description |
|------|-------------|
| `output-styles/README.md` | Index of all output styles with usage instructions |
| `output-styles/bullet-points.md` | Hierarchical bullet points for quick scanning |
| `output-styles/genui.md` | Generative UI - self-contained HTML documents with embedded styling, opened in browser |
| `output-styles/html-structured.md` | Clean semantic HTML5 with proper document structure |
| `output-styles/markdown-focused.md` | Full markdown features for maximum readability |
| `output-styles/observable-tools-diffs.md` | Transparent reporting of tools used and git diff summaries after code changes |
| `output-styles/observable-tools-diffs-tts.md` | Tool/diff reporting combined with text-to-speech audio announcements |
| `output-styles/table-based.md` | Markdown tables for organizing comparisons, steps, and analysis results |
| `output-styles/tts-summary-base.md` | Audio task completion announcements via text-to-speech (base version) |
| `output-styles/tts-summary.md` | Audio task completion with git diff reporting and text-to-speech |
| `output-styles/ultra-concise.md` | Minimal words, maximum speed - direct actions only, no filler |
| `output-styles/yaml-structured.md` | Structured YAML format with hierarchical key-value pairs |
