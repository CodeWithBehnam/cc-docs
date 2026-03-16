# Document Index

Full file-by-file index. Referenced from CLAUDE.md.

## Official Docs (`claude-code-docs/`)

### Getting Started

| File | Description |
|------|-------------|
| `overview.md` | What Claude Code is, key capabilities |
| `quickstart.md` | First-time setup |
| `setup.md` | Advanced installation options |
| `how-claude-code-works.md` | Architecture and inner workings |

### Core Usage

| File | Description |
|------|-------------|
| `interactive-mode.md` | Interactive (REPL) mode |
| `cli-reference.md` | CLI flags, options, commands |
| `common-workflows.md` | Common workflow patterns |
| `best-practices.md` | Effective usage practices |
| `code-review.md` | Code review workflows |
| `commands.md` | Slash commands reference |
| `keybindings.md` | Keyboard shortcuts |
| `fast-mode.md` | Fast mode |
| `output-styles.md` | Output formatting |
| `terminal-config.md` | Terminal setup |

### Memory & Settings

| File | Description |
|------|-------------|
| `memory.md` | CLAUDE.md files and auto-memory |
| `settings.md` | All configuration options |
| `model-config.md` | Choosing and switching models |
| `permissions.md` | Tool permissions and approval modes |
| `env-vars.md` | Environment variables |
| `statusline.md` | Status line display |

### Extensibility

| File | Description |
|------|-------------|
| `features-overview.md` | Extension points overview (skills, plugins, hooks, MCP, subagents) |
| `skills.md` | Create and use skills |
| `sub-agents.md` | Custom subagents |
| `agent-teams.md` | Agent team orchestration |
| `plugins.md` | Create plugins |
| `plugins-reference.md` | Plugins technical reference |
| `discover-plugins.md` | Discover and install plugins |
| `plugin-marketplaces.md` | Plugin marketplace distribution |
| `hooks.md` | Hooks technical reference |
| `hooks-guide.md` | Hooks practical guide |
| `mcp.md` | MCP integration |

### IDE Integrations

| File | Description |
|------|-------------|
| `vs-code.md` | VS Code |
| `jetbrains.md` | JetBrains IDEs |
| `chrome.md` | Chrome (beta) |
| `desktop.md` | Desktop app |
| `desktop-quickstart.md` | Desktop quickstart |
| `claude-code-on-the-web.md` | Claude Code on the web |

### CI/CD & Automation

| File | Description |
|------|-------------|
| `headless.md` | Headless (non-interactive) mode |
| `github-actions.md` | GitHub Actions |
| `gitlab-ci-cd.md` | GitLab CI/CD |
| `remote-control.md` | Remote control |
| `scheduled-tasks.md` | Scheduled tasks |
| `slack.md` | Slack |

### Cloud Providers

| File | Description |
|------|-------------|
| `amazon-bedrock.md` | Amazon Bedrock |
| `google-vertex-ai.md` | Google Vertex AI |
| `microsoft-foundry.md` | Microsoft Foundry |
| `llm-gateway.md` | LLM gateway / proxy config |

### Enterprise & Security

| File | Description |
|------|-------------|
| `authentication.md` | Authentication setup |
| `security.md` | Security model |
| `sandboxing.md` | Sandboxing and isolation |
| `network-config.md` | Enterprise network config |
| `server-managed-settings.md` | Server-managed settings |
| `third-party-integrations.md` | Enterprise deployment |
| `data-usage.md` | Data usage and privacy |
| `zero-data-retention.md` | Zero data retention |
| `legal-and-compliance.md` | Legal and compliance |

### Operations

| File | Description |
|------|-------------|
| `costs.md` | Cost management |
| `analytics.md` | Team usage analytics |
| `monitoring-usage.md` | Usage monitoring |
| `checkpointing.md` | Save and restore state |
| `devcontainer.md` | Development containers |
| `troubleshooting.md` | Troubleshooting |

### Reference

| File | Description |
|------|-------------|
| `tools-reference.md` | Built-in tools reference |
| `changelog.md` | Release changelog |
| `llms.txt` | Raw doc index for download script |

## Cheatsheets (`cheatsheets/`)

Condensed quick-reference versions. Filenames mirror `claude-code-docs/` 1:1 (65 files). To find a cheatsheet, use the same filename: `cheatsheets/<topic>.md`. See `cheatsheets/README.md` for the full list.

## Templates (`templates/`)

### Core Extension Templates

| File | Description |
|------|-------------|
| `SKILL-TEMPLATE.md` | Skill patterns: reference, task, research, codegen, script-powered |
| `SUBAGENT-TEMPLATE.md` | Subagent patterns: reviewer, debugger, domain expert, hooks, memory, background, worktree |
| `HOOKS-TEMPLATE.md` | Hook patterns: formatter, protector, notifier, auditor, verifier, all event types |
| `HOOKS-RECIPES.md` | 10 production-ready hook recipes |

### CLAUDE.md Starters (`claude-md-starters/`)

| File | Description |
|------|-------------|
| `CLAUDE-MD-PYTHON.md` | Python (pytest, ruff, uv/pip/poetry, Django/FastAPI) |
| `CLAUDE-MD-TYPESCRIPT.md` | TypeScript/Node.js (ESLint, Prettier, npm/pnpm/bun) |
| `CLAUDE-MD-REACT.md` | React/Next.js (App Router, Tailwind, Vite/shadcn) |
| `CLAUDE-MD-RAILS.md` | Ruby on Rails (RSpec, Rubocop, Hotwire, API-only) |
| `CLAUDE-MD-MONOREPO.md` | Monorepo (path-specific rules, workspace conventions) |

### CI/CD Workflows (`ci-cd/`)

| File | Description |
|------|-------------|
| `GITHUB-ACTIONS-PR-REVIEW.md` | GitHub Actions PR review (custom rules, Bedrock/Vertex) |
| `GITHUB-ACTIONS-ISSUE-IMPL.md` | GitHub Actions auto-implement issues |
| `GITLAB-CI-REVIEW.md` | GitLab CI MR review (MCP, Bedrock OIDC, Vertex WIF) |
| `HEADLESS-SCRIPTS.md` | Shell scripts: batch migration, pre-commit, JSON output, lint-fix |

### MCP Integrations (`mcp-integrations/`)

| File | Description |
|------|-------------|
| `MCP-GITHUB.md` | GitHub API (issues, PRs, code search) |
| `MCP-DATABASE.md` | Database access (PostgreSQL, MySQL, SQLite, read-only) |
| `MCP-SLACK-NOTION.md` | Team tools (Slack, Notion, Linear, Jira, Sentry) |
| `MCP-CUSTOM-SERVER.md` | Custom MCP server (Node.js, Python, HTTP) |

### Plugins (`plugins/`)

| File | Description |
|------|-------------|
| `PLUGIN-MINIMAL.md` | Minimal plugin scaffold |
| `PLUGIN-FULL.md` | Full plugin (skills, agents, hooks, MCP) |
| `PLUGIN-LSP.md` | Code intelligence plugin with LSP |

### Permissions & Security (`permissions-security/`)

| File | Description |
|------|-------------|
| `PERMISSIONS-DEVELOPMENT.md` | Dev presets (balanced, Python, Rails, Go, restrictive, open) |
| `PERMISSIONS-CICD.md` | CI/CD safe mode (read-only, test-running, cost controls) |
| `SANDBOX-DEVCONTAINER.md` | Devcontainer with firewall, sandbox, Codespaces |

### Cloud Providers (`cloud-providers/`)

| File | Description |
|------|-------------|
| `AWS-BEDROCK-SETUP.md` | AWS Bedrock (credentials, SSO, model pinning, guardrails) |
| `GCP-VERTEX-SETUP.md` | Google Vertex AI (gcloud, regions, 1M context) |
| `LLM-GATEWAY-SETUP.md` | LLM gateway/proxy (LiteLLM, key rotation, multi-provider) |

### Agent Teams (`agent-teams/`)

| File | Description |
|------|-------------|
| `AGENT-TEAM-CODE-REVIEW.md` | Multi-agent code review (security + performance + test coverage) |
| `AGENT-TEAM-FEATURE-DEV.md` | Feature dev (architect + implementer + test writer) |
| `AGENT-TEAM-DEBUGGING.md` | Debug team (log analyst + code tracer + hypothesis tester) |

### Workflow Automation (`workflow-automation/`)

| File | Description |
|------|-------------|
| `SCHEDULED-TASKS.md` | Scheduled tasks (monitoring, PR checks, cron, reminders) |
| `REVIEW-MD-TEMPLATE.md` | REVIEW.md templates (TypeScript, Python, Rails, Go, monorepo) |
| `REMOTE-CONTROL-SETUP.md` | Remote control (server mode, mobile access, concurrent sessions) |

### Enterprise (`enterprise/`)

| File | Description |
|------|-------------|
| `ENTERPRISE-NETWORK.md` | Network config (proxy, custom CA, mTLS, firewall) |
| `ENTERPRISE-MANAGED-SETTINGS.md` | Managed settings (org-wide permissions, model restrictions, audit) |

## Rules (`rules/`)

| File | Glob Patterns | Key Rules |
|------|---------------|-----------|
| `typescript.md` | `**/*.ts`, `**/*.tsx` | No `any`, union types over enums, const-first, optional chaining |
| `python.md` | `**/*.py` | Type hints on all signatures, f-strings, pathlib, dataclasses |
| `react.md` | `**/*.tsx`, `**/*.jsx` | Functional components, custom hooks, named exports, accessibility |
| `go.md` | `**/*.go` | Immediate error checks, table-driven tests, context as first param |
| `rails.md` | `**/*.rb`, `**/*.erb` | Fat models/thin controllers, strong params, scopes, service objects |
| `rust.md` | `**/*.rs` | Result over panic, `?` operator, prefer borrows, minimize unsafe |
| `sql.md` | `**/*.sql`, `**/migrations/**` | snake_case, BIGINT IDs, reversible migrations, index foreign keys |
| `testing.md` | `**/*test*`, `**/*spec*` | Arrange-Act-Assert, one concept per test, no sleep/timeouts |

## Tips (`tips/`)

| File | Topic |
|------|-------|
| `productivity.md` | Session management, context control, daily workflow |
| `prompting.md` | Writing effective prompts |
| `debugging.md` | Debugging strategies |
| `cost-optimization.md` | Token usage and API cost reduction |
| `multi-session.md` | Parallel sessions, worktrees, agent coordination |
| `security.md` | Security-first habits and safeguards |

## Skills (`skills/`)

### Core (15)

| Skill | Command | Type | What It Does |
|-------|---------|------|--------------|
| `commit/` | `/commit` | Task | Tests, conventional commit message, commit |
| `pr/` | `/pr [base]` | Task | Push branch, create PR via `gh` |
| `review/` | `/review` | Research | Diff review: bugs, security, style |
| `fix-issue/` | `/fix-issue <n>` | Task | Fetch issue, implement fix, test, commit |
| `tdd/` | `/tdd <feature>` | Task | Red-green-refactor cycle |
| `refactor/` | `/refactor <target>` | Task | Refactor preserving behavior, verify with tests |
| `explain/` | `/explain [target]` | Research | Analogy, ASCII diagram, walkthrough |
| `security-scan/` | `/security-scan [path]` | Research | OWASP Top 10 audit |
| `api-conventions/` | (auto-loaded) | Reference | REST API design conventions |
| `doc-gen/` | `/doc-gen <target>` | Task | Generate/update inline docs and README |
| `migrate/` | `/migrate <path> <target>` | Task | Framework/pattern migration |
| `debug/` | `/debug <error>` | Task | Reproduce, isolate, fix, verify |
| `onboard/` | `/onboard` | Research | Architecture diagram, key files, conventions |
| `changelog/` | `/changelog [version]` | Task | Categorized changelog from git history |
| `perf-audit/` | `/perf-audit [target]` | Research | N+1 queries, slow algorithms, memory issues |

### Community (222 in 16 categories)

| Directory | # | Topics |
|-----------|---|--------|
| `api-architecture/` | 10 | REST, GraphQL, Microservices, CQRS, Event Sourcing |
| `backend-development/` | 20 | Backend patterns, build tools, migrations, Rails, Ruby gems |
| `frontend-development/` | 19 | React, Next.js, design systems, mobile, accessibility |
| `testing-quality/` | 12 | E2E, TDD, code review, verification |
| `security/` | 14 | Threat modeling, SAST, compliance, reverse engineering |
| `devops-infrastructure/` | 21 | CI/CD, K8s, Terraform, cloud, incident response |
| `data-engineering/` | 6 | Airflow, dbt, Spark, data quality, SQL |
| `ai-ml/` | 13 | LLM, RAG, prompt engineering, ML pipelines, embeddings |
| `language-specific/` | 23 | Python, TypeScript, Go, Rust, Shell |
| `content-research/` | 12 | Writing, research, SEO, media, summarization |
| `business/` | 15 | Finance, payments, analytics, hiring |
| `observability/` | 5 | Monitoring, tracing, Grafana, Prometheus, SLOs |
| `team-workflow/` | 11 | Coordination, parallel work, agent teams |
| `game-embedded/` | 3 | Unity, Godot, 3D modeling |
| `blockchain/` | 4 | Solidity, DeFi, NFT, Web3 |
| `productivity/` | 34 | QA, reviews, shipping, git, docs, automation, diagrams |

Browse `skills/<category>/` for individual SKILL.md files.

## Commands (`commands/`)

### Core (12)

| File | Command | Args | What It Does |
|------|---------|------|--------------|
| `commit.md` | `/commit` | - | Tests, stage, conventional commit |
| `pr.md` | `/pr` | - | Summarize branch, push, create PR |
| `review.md` | `/review` | - | Diff vs main: critical/warning/suggestion |
| `fix-issue.md` | `/fix-issue` | `<issue-number>` | Fetch issue, fix, test, commit |
| `tdd.md` | `/tdd` | `<feature>` | Red-green-refactor cycle |
| `deploy.md` | `/deploy` | `<staging\|production>` | Test, build, deploy with safety checks |
| `lint-fix.md` | `/lint-fix` | - | Auto-detect linter, fix, report remaining |
| `deps-update.md` | `/deps-update` | - | Audit, update safe packages, test |
| `explain.md` | `/explain` | `<file or symbol>` | ASCII diagram, analogy, walkthrough |
| `release.md` | `/release` | `<version>` | Changelog, bump, tag, push, GH release |
| `db-migrate.md` | `/db-migrate` | `<description>` | Migration with up/down, test rollback |
| `new-feature.md` | `/new-feature` | `<name>` | Scaffold feature with tests and wiring |

### Community (100 in 12 categories)

| Directory | # | Topics |
|-----------|---|--------|
| `development/` | 20 | Scaffolding, build execution, session priming, agentic loops, coding tutor |
| `review-quality/` | 7 | Code review orchestrator, PR enhancement, multi-agent review |
| `testing/` | 8 | TDD, test generation, API mocking, performance |
| `debugging/` | 6 | Error analysis, tracing, incident response |
| `deployment-infra/` | 7 | CI/CD automation, config validation, cloud cost, SLOs |
| `documentation/` | 4 | Doc generation, C4 architecture, blog creation |
| `git-workflow/` | 12 | Quality gates, onboarding, Conductor (6), worktrees (4) |
| `security/` | 5 | SAST, hardening, vulnerability scanning, compliance |
| `team-management/` | 12 | Agent orchestration, issue resolution, standup, business analysis |
| `data-migration/` | 7 | Data pipelines, SQL migrations, legacy modernization |
| `ai-tools/` | 5 | AI assistants, LangGraph, prompt optimization |
| `refactoring/` | 7 | SOLID refactoring, tech debt, dependency audit |

## Hooks (`hooks/`)

### Core (10 scripts + settings example)

| Script | Event | What It Does |
|--------|-------|--------------|
| `scripts/auto-format.sh` | PostToolUse | Runs prettier/black/gofmt/rubocop after save |
| `scripts/protect-files.sh` | PreToolUse | Blocks edits to .env, lock files, .git/, secrets |
| `scripts/notify-desktop.sh` | Notification | Cross-platform desktop notification |
| `scripts/lint-on-save.sh` | PostToolUse | Runs ESLint/ruff/rubocop after save (non-blocking) |
| `scripts/block-dangerous-commands.sh` | PreToolUse | Blocks rm -rf /, DROP TABLE, force-push, curl\|bash |
| `scripts/log-tool-usage.sh` | PostToolUse | JSON lines to ~/.claude/tool-usage.log |
| `scripts/validate-sql.sh` | PreToolUse | Blocks SQL mutations, allows SELECT |
| `scripts/test-after-edit.sh` | PostToolUse | Runs related test after source edit (non-blocking) |
| `scripts/inject-context.sh` | SessionStart | Re-injects git branch, commits, reminder after compaction |
| `scripts/stop-check.sh` | Stop | Checks for uncommitted changes before exit |

Config: `settings-examples.json` wires all scripts with correct event types and matchers.

### Community (`community/`)

| Directory | What It Does |
|-----------|--------------|
| `automation/` | Build, deploy, notifications (Slack, Discord, Telegram, Vercel) |
| `development-tools/` | Linting, formatting, debugging, quality gates (TDD, plan, scope) |
| `git/` | Commit validation, branch naming, push protection |
| `monitoring/` | Desktop notifications, LangSmith tracing, performance monitoring |
| `post-tool/` | Format JS/Python, git add, tests, security scan after tool use |
| `pre-tool/` | Backup before edit, dangerous command blocker, secret scanner |
| `disler-hooks-mastery/` | Complete Python hooks framework: every event type, LLM summaries, TTS, validators, HITL |

## Agents (`agents/`)

### Core (12)

| Agent | Model | What It Does |
|-------|-------|--------------|
| `code-reviewer.md` | sonnet | Read-only code review: quality, security, practices |
| `security-auditor.md` | opus | Deep OWASP audit with severity ratings (read-only) |
| `test-writer.md` | sonnet | Tests matching project framework and style |
| `debugger.md` | inherit | Hypothesis-driven root cause analysis + fix |
| `docs-writer.md` | sonnet | JSDoc, docstrings, README matching conventions |
| `refactorer.md` | sonnet | Readability refactoring, tests before and after |
| `performance-analyst.md` | sonnet | N+1 queries, memory leaks, missing indexes (read-only) |
| `db-reader.md` | haiku | Read-only DB queries (hook blocks writes) |
| `api-designer.md` | sonnet | RESTful endpoint design with OpenAPI output |
| `migration-planner.md` | inherit | Phased migration plans with verification steps |
| `dependency-checker.md` | haiku | npm/pip/bundle/cargo audit, vulnerability flags |
| `onboarding-guide.md` | sonnet | Architecture overviews, key file maps, setup guides |

### Community (185 in 14 categories)

| Directory | # | Topics |
|-----------|---|--------|
| `core-development/` | 10 | API, backend, frontend, fullstack, mobile, Electron, GraphQL |
| `language-specialists/` | 26 | Angular, C++, C#, Django, .NET, Elixir, Flutter, Go, Java, Kotlin, Laravel, PHP, Python, Rails, React, Rust, Swift, TypeScript, Vue |
| `infrastructure/` | 16 | Azure, cloud, databases, Docker, K8s, Terraform, SRE |
| `quality-security/` | 30 | Accessibility, chaos engineering, code review, compliance, penetration testing, QA |
| `data-ai/` | 12 | AI engineering, data science, DB optimization, LLM, ML, NLP |
| `developer-experience/` | 18 | Bug repro, build systems, CLI tools, docs, DX, Git, MCP, refactoring |
| `specialized-domains/` | 12 | Blockchain, embedded, fintech, gaming, IoT, payments, SEO |
| `business-product/` | 11 | Business analysis, content marketing, legal, PM, Scrum, UX |
| `meta-orchestration/` | 12 | Agent org, context management, multi-agent coordination, workflow |
| `research-analysis/` | 15 | Competitive analysis, framework docs, git history, market research |
| `design/` | 4 | Design review, iteration, Figma sync |
| `lang-engineering/` | 10 | Compiler, lexer, parser, runtime, VM for PL development |
| `poc-engineering/` | 7 | Architecture, planning, implementation for proof-of-concept |
| `team/` | 2 | Builder (full permissions + validation) and validator (read-only) |

## Guides (`guides/`)

| File | When to Use |
|------|-------------|
| `tdd-workflow.md` | Starting TDD on a feature |
| `security-audit.md` | Running OWASP Top 10 audit |
| `onboarding-new-codebase.md` | First day on a new codebase |
| `migration-playbook.md` | Migrating frameworks or libraries |
| `pr-review-workflow.md` | Code review with subagents |
| `ci-cd-setup.md` | Setting up GitHub Actions or GitLab CI/CD |
| `monorepo-setup.md` | Layered CLAUDE.md and per-package skills |

## Output Styles (`output-styles/`)

| File | Format |
|------|--------|
| `bullet-points.md` | Hierarchical bullets for scanning |
| `genui.md` | Self-contained HTML opened in browser |
| `html-structured.md` | Semantic HTML5 |
| `markdown-focused.md` | Full markdown |
| `observable-tools-diffs.md` | Tools used + git diff summaries |
| `observable-tools-diffs-tts.md` | Tools/diffs + text-to-speech |
| `table-based.md` | Markdown tables for comparisons |
| `tts-summary-base.md` | TTS task completion announcements |
| `tts-summary.md` | TTS + git diff reporting |
| `ultra-concise.md` | Minimal words, direct actions only |
| `yaml-structured.md` | Hierarchical YAML key-value |

## Other

| File | Description |
|------|-------------|
| `awesome.md` | Curated resource list: official resources, MCP servers, plugins, tools, enterprise guides |
| `docs/brainstorms/2026-03-15-hooks-recipes-brainstorm.md` | Hooks recipes planning document |
