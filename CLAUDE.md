# Claude Code Documentation Index

## Writing Rules

- NEVER use em-dashes ('—') in any generated text. Use commas, periods, parentheses, or regular hyphens instead.

## Workflow Rules

- After making changes, always update this CLAUDE.md file to reflect any added, removed, or renamed files, then commit and push to the remote repository.

This repo contains the official Claude Code documentation, downloaded from <https://code.claude.com/docs>. Doc files live in the `claude-code-docs/` folder.

## Maintenance

When updating these docs (via `Scripts/download-cc-docs.sh`), **you must also update this index file** to reflect any added, removed, or renamed pages.

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

### Templates (`templates/`)

Ready-to-use, copy-paste-able templates. **Use these as starting points** when asked to create skills, subagents, hooks, or set up any Claude Code feature.

#### Core Extension Templates

| File | Description |
|------|-------------|
| `templates/SKILL-TEMPLATE.md` | Skill patterns - reference, task, research, codegen, script-powered |
| `templates/SUBAGENT-TEMPLATE.md` | Subagent patterns - reviewer, debugger, domain expert, hooks, memory, background, worktree |
| `templates/HOOKS-TEMPLATE.md` | Hook patterns - formatter, protector, notifier, auditor, verifier, all event types |
| `templates/HOOKS-RECIPES.md` | 10 production-ready hook recipes - dangerous command blocker, network guard, git safety, auto-lint, test runner, commit validator, audit logger, Slack notifier, context injector, auto-commit |

#### CLAUDE.md Starters (`templates/claude-md-starters/`)

| File | Description |
|------|-------------|
| `CLAUDE-MD-PYTHON.md` | Python project starter with pytest, ruff, uv/pip/poetry, Django/FastAPI variants |
| `CLAUDE-MD-TYPESCRIPT.md` | TypeScript/Node.js starter with ESLint, Prettier, npm/pnpm/bun variants |
| `CLAUDE-MD-REACT.md` | React/Next.js starter with App Router, Tailwind, Vite/shadcn variants |
| `CLAUDE-MD-RAILS.md` | Ruby on Rails starter with RSpec, Rubocop, Hotwire, API-only variant |
| `CLAUDE-MD-MONOREPO.md` | Monorepo starter with path-specific rules, workspace conventions, imports |

#### CI/CD Workflows (`templates/ci-cd/`)

| File | Description |
|------|-------------|
| `GITHUB-ACTIONS-PR-REVIEW.md` | GitHub Actions PR review with custom rules, Bedrock/Vertex options |
| `GITHUB-ACTIONS-ISSUE-IMPL.md` | GitHub Actions auto-implement issues and create PRs |
| `GITLAB-CI-REVIEW.md` | GitLab CI MR review with MCP, Bedrock OIDC, Vertex WIF |
| `HEADLESS-SCRIPTS.md` | Shell scripts for batch migration, pre-commit, JSON output, lint-fix |

#### MCP Integrations (`templates/mcp-integrations/`)

| File | Description |
|------|-------------|
| `MCP-GITHUB.md` | GitHub API access via MCP (issues, PRs, code search) |
| `MCP-DATABASE.md` | Database access (PostgreSQL, MySQL, SQLite) with read-only safety |
| `MCP-SLACK-NOTION.md` | Team tools (Slack, Notion, Linear, Jira, Sentry) |
| `MCP-CUSTOM-SERVER.md` | Build your own MCP server (Node.js, Python, HTTP) |

#### Plugins (`templates/plugins/`)

| File | Description |
|------|-------------|
| `PLUGIN-MINIMAL.md` | Minimal plugin scaffold with single skill |
| `PLUGIN-FULL.md` | Full plugin with skills, agents, hooks, MCP |
| `PLUGIN-LSP.md` | Code intelligence plugin with LSP server |

#### Permissions & Security (`templates/permissions-security/`)

| File | Description |
|------|-------------|
| `PERMISSIONS-DEVELOPMENT.md` | Dev permission presets (balanced, Python, Rails, Go, restrictive, open) |
| `PERMISSIONS-CICD.md` | CI/CD safe mode (read-only, test-running, controlled edits, cost controls) |
| `SANDBOX-DEVCONTAINER.md` | Devcontainer with firewall, sandbox settings, Codespaces |

#### Cloud Providers (`templates/cloud-providers/`)

| File | Description |
|------|-------------|
| `AWS-BEDROCK-SETUP.md` | AWS Bedrock setup (credentials, SSO, model pinning, guardrails) |
| `GCP-VERTEX-SETUP.md` | Google Vertex AI setup (gcloud, regions, 1M context) |
| `LLM-GATEWAY-SETUP.md` | LLM gateway/proxy setup (LiteLLM, key rotation, multi-provider) |

#### Agent Teams (`templates/agent-teams/`)

| File | Description |
|------|-------------|
| `AGENT-TEAM-CODE-REVIEW.md` | Multi-agent code review (security + performance + test coverage) |
| `AGENT-TEAM-FEATURE-DEV.md` | Feature dev team (architect + implementer + test writer) |
| `AGENT-TEAM-DEBUGGING.md` | Debug team (log analyst + code tracer + hypothesis tester) |

#### Workflow Automation (`templates/workflow-automation/`)

| File | Description |
|------|-------------|
| `SCHEDULED-TASKS.md` | Scheduled tasks (monitoring, PR checks, cron, reminders) |
| `REVIEW-MD-TEMPLATE.md` | REVIEW.md templates for TypeScript, Python, Rails, Go, monorepo |
| `REMOTE-CONTROL-SETUP.md` | Remote control (server mode, mobile access, concurrent sessions) |

#### Enterprise (`templates/enterprise/`)

| File | Description |
|------|-------------|
| `ENTERPRISE-NETWORK.md` | Network config (proxy, custom CA, mTLS, credential refresh, firewall) |
| `ENTERPRISE-MANAGED-SETTINGS.md` | Managed settings (org-wide permissions, model restrictions, audit) |

### Rules (`rules/`)

Drop-in path-specific rules files. Copy to `.claude/rules/` in any project. Claude loads a rules file automatically when working with files that match its `globs` pattern.

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

### Tips (`tips/`)

Curated practical tips from daily Claude Code usage. Each file is focused on a specific area with actionable, immediately useful techniques.

| File | Description |
|------|-------------|
| `tips/README.md` | Index of all tips files with quick-reference examples |
| `tips/productivity.md` | Session management, context control, and daily workflow shortcuts |
| `tips/prompting.md` | How to write prompts that get better results faster |
| `tips/debugging.md` | Debugging strategies that save time and preserve context |
| `tips/cost-optimization.md` | Reduce token usage and API costs without slowing down |
| `tips/multi-session.md` | Parallel sessions, worktrees, and agent coordination |
| `tips/security.md` | Security-first habits and safeguards for safe automation |

### Skills (`skills/`)

Drop-in skill directories. Copy a skill directory to `.claude/skills/` in any project, or to `~/.claude/skills/` for personal use across all projects. Invoke with `/skill-name` or let Claude auto-invoke when relevant.

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

#### Community Skills (222 skills in 16 categories)

Imported from community repos: [wshobson/agents](https://github.com/wshobson/agents) (MIT), [affaan-m/everything-claude-code](https://github.com/affaan-m/everything-claude-code), [garrytan/gstack](https://github.com/garrytan/gstack), [mitsuhiko/agent-stuff](https://github.com/mitsuhiko/agent-stuff), [EveryInc/compound-engineering-plugin](https://github.com/EveryInc/compound-engineering-plugin) (MIT). Each skill is in its own subdirectory under the category with a `SKILL.md` file and optional reference files.

##### `skills/api-architecture/` - API Design, REST, GraphQL, Microservices, CQRS, Event Sourcing (10 skills)

| Skill | Source | Description |
|-------|--------|-------------|
| `api-design-principles` | agents | REST/GraphQL API design principles with checklists and templates |
| `microservices-patterns` | agents | Microservices communication, decomposition, and resilience patterns |
| `cqrs-implementation` | agents | Command Query Responsibility Segregation for scalable architectures |
| `event-store-design` | agents | Event store design for event-sourced systems |
| `saga-orchestration` | agents | Saga pattern for distributed transaction orchestration |
| `projection-patterns` | agents | Read model projection patterns for CQRS |
| `architecture-patterns` | agents | Software architecture patterns (hexagonal, clean, layered) |
| `fastapi-templates` | agents | FastAPI project scaffolding templates |
| `openapi-spec-generation` | agents | Generate OpenAPI/Swagger specifications from code |
| `api-design` | ecc | REST API design patterns (naming, status codes, pagination, versioning) |

##### `skills/backend-development/` - Backend Patterns, Build Tools, Migrations, Rails, Ruby Gems (20 skills)

| Skill | Source | Description |
|-------|--------|-------------|
| `workflow-orchestration-patterns` | agents | Workflow orchestration patterns (Temporal, step functions) |
| `temporal-python-testing` | agents | Testing Temporal workflows in Python (unit, integration, replay) |
| `error-handling-patterns` | agents | Error handling strategies across languages and frameworks |
| `auth-implementation-patterns` | agents | Authentication and authorization implementation patterns |
| `debugging-strategies` | agents | Systematic debugging strategies and techniques |
| `dotnet-backend-patterns` | agents | .NET backend patterns with EF Core and Dapper |
| `nodejs-backend-patterns` | agents | Node.js backend architecture and patterns |
| `monorepo-management` | agents | Monorepo tooling and management strategies |
| `bazel-build-optimization` | agents | Bazel build system optimization techniques |
| `nx-workspace-patterns` | agents | Nx workspace configuration and patterns |
| `turborepo-caching` | agents | Turborepo caching strategies for monorepos |
| `angular-migration` | agents | Angular version migration strategies |
| `database-migration` | agents | Database migration planning and execution |
| `dependency-upgrade` | agents | Safe dependency upgrade workflows |
| `react-modernization` | agents | React class-to-hooks modernization patterns |
| `backend-patterns` | ecc | Backend architecture patterns and best practices |
| `coding-standards` | ecc | Code style and standards enforcement |
| `dhh-rails-style` | ce | DHH's 37signals Rails coding style with REST purity, fat models, thin controllers |
| `andrew-kane-gem-writer` | ce | Ruby gems following Andrew Kane patterns with clean, minimal APIs |
| `dspy-ruby` | ce | DSPy.rb for building type-safe LLM applications in Ruby |

##### `skills/frontend-development/` - React, Next.js, Design Systems, Mobile, Accessibility, Browser Automation (19 skills)

| Skill | Source | Description |
|-------|--------|-------------|
| `nextjs-app-router-patterns` | agents | Next.js App Router patterns (RSC, layouts, streaming) |
| `react-state-management` | agents | React state management strategies (Context, Zustand, Jotai) |
| `tailwind-design-system` | agents | Tailwind CSS design system architecture |
| `react-native-architecture` | agents | React Native app architecture patterns |
| `design-system-patterns` | agents | Design system component architecture and theming |
| `responsive-design` | agents | Responsive design with container queries and fluid layouts |
| `interaction-design` | agents | Microinteractions, scroll animations, and motion design |
| `visual-design-foundations` | agents | Typography, color systems, spacing, and iconography |
| `web-component-design` | agents | Web component patterns, CSS styling, and accessibility |
| `ui-accessibility-compliance` | agents | WCAG compliance, ARIA patterns, and mobile accessibility |
| `mobile-ios-design` | agents | iOS HIG patterns and SwiftUI components |
| `mobile-android-design` | agents | Material 3 theming and Compose components |
| `react-native-design` | agents | React Native styling, navigation, and Reanimated patterns |
| `wcag-audit-patterns` | agents | WCAG audit methodology and testing patterns |
| `screen-reader-testing` | agents | Screen reader testing across platforms |
| `frontend-patterns` | ecc | Frontend architecture patterns and best practices |
| `frontend-slides` | ecc | Presentation slide generation with style presets |
| `frontend-design` | ce | Distinctive production-grade frontend interfaces with high design quality |
| `agent-browser` | ce | Browser automation using ref-based element selection for forms, screenshots, scraping |

##### `skills/testing-quality/` - E2E Testing, TDD, Code Review, Verification, Browser Automation (12 skills)

| Skill | Source | Description |
|-------|--------|-------------|
| `e2e-testing-patterns` | agents | End-to-end testing patterns and strategies |
| `code-review-excellence` | agents | Code review best practices and checklists |
| `javascript-testing-patterns` | agents | JavaScript/TypeScript testing patterns (Jest, Vitest) |
| `python-testing-patterns` | agents | Python testing patterns (pytest fixtures, mocking) |
| `ecc-e2e-testing` | ecc | E2E testing workflows and automation |
| `ecc-tdd-workflow` | ecc | Test-driven development workflow automation |
| `verification-loop` | ecc | Iterative verification loop for code correctness |
| `eval-harness` | ecc | Evaluation harness for testing AI outputs |
| `claude-bowser` | disler | Observable browser automation using Chrome MCP tools for UI testing and screenshots |
| `playwright-bowser` | disler | Headless browser automation via Playwright CLI for parallel UI testing and scraping |
| `web-browser` | mitsuhiko | CDP-based browser automation: navigate, screenshot, click, evaluate JS, monitor network |
| `test-browser` | ce | Run browser tests on pages affected by current PR or branch |

##### `skills/security/` - Threat Modeling, SAST, Compliance, Reverse Engineering, Damage Control (14 skills)

| Skill | Source | Description |
|-------|--------|-------------|
| `sast-configuration` | agents | Static application security testing configuration |
| `stride-analysis-patterns` | agents | STRIDE threat modeling methodology |
| `attack-tree-construction` | agents | Attack tree construction for threat analysis |
| `security-requirement-extraction` | agents | Extract security requirements from specifications |
| `threat-mitigation-mapping` | agents | Map threats to mitigations and controls |
| `pci-compliance` | agents | PCI DSS compliance patterns for payment processing |
| `gdpr-data-handling` | agents | GDPR-compliant data handling patterns |
| `anti-reversing-techniques` | agents | Anti-reverse-engineering protection techniques |
| `binary-analysis-patterns` | agents | Binary analysis and disassembly patterns |
| `memory-forensics` | agents | Memory forensics investigation techniques |
| `protocol-reverse-engineering` | agents | Network protocol reverse engineering methods |
| `security-review` | ecc | Security review workflow and checklist |
| `damage-control` | disler | Defense-in-depth protection via PreToolUse hooks: blocks dangerous commands, protects sensitive files, supports ask patterns |
| `ghidra` | mitsuhiko | Reverse engineer binaries using Ghidra headless analyzer: decompile, extract functions, strings, symbols, call graphs |

##### `skills/devops-infrastructure/` - CI/CD, K8s, Terraform, Cloud, Incident Response, Sandboxes, Cloud Storage (21 skills)

| Skill | Source | Description |
|-------|--------|-------------|
| `deployment-pipeline-design` | agents | CI/CD pipeline architecture and design |
| `github-actions-templates` | agents | GitHub Actions workflow templates |
| `gitlab-ci-patterns` | agents | GitLab CI/CD pipeline patterns |
| `secrets-management` | agents | Secrets management strategies (Vault, AWS SM, SOPS) |
| `gitops-workflow` | agents | GitOps with ArgoCD setup and sync policies |
| `helm-chart-scaffolding` | agents | Helm chart scaffolding with validation scripts |
| `k8s-manifest-generator` | agents | Kubernetes manifest generation (deployments, services, configmaps) |
| `k8s-security-policies` | agents | Kubernetes RBAC and network policy patterns |
| `terraform-module-library` | agents | Terraform module library (AWS-focused) |
| `multi-cloud-architecture` | agents | Multi-cloud deployment architecture |
| `cloud-cost-optimization` | agents | Cloud cost optimization strategies |
| `hybrid-cloud-networking` | agents | Hybrid cloud networking patterns |
| `istio-traffic-management` | agents | Istio service mesh traffic management |
| `linkerd-patterns` | agents | Linkerd service mesh patterns |
| `mtls-configuration` | agents | Mutual TLS configuration for service-to-service auth |
| `service-mesh-observability` | agents | Service mesh observability and monitoring |
| `incident-runbook-templates` | agents | Incident response runbook templates |
| `on-call-handoff-patterns` | agents | On-call handoff and escalation patterns |
| `postmortem-writing` | agents | Blameless postmortem writing templates |
| `agent-sandboxes` | disler | E2B sandbox management for isolated code execution, testing, and file operations |
| `rclone` | ce | Upload and sync files across cloud storage providers (S3, R2, B2, GDrive, Dropbox) |

##### `skills/data-engineering/` - Airflow, dbt, Spark, Data Quality, SQL (6 skills)

| Skill | Source | Description |
|-------|--------|-------------|
| `airflow-dag-patterns` | agents | Apache Airflow DAG design patterns |
| `data-quality-frameworks` | agents | Data quality validation frameworks |
| `dbt-transformation-patterns` | agents | dbt transformation and modeling patterns |
| `spark-optimization` | agents | Apache Spark performance optimization |
| `sql-optimization-patterns` | agents | SQL query optimization and indexing strategies |
| `postgresql` | agents | PostgreSQL-specific patterns and best practices |

##### `skills/ai-ml/` - LLM, RAG, Prompt Engineering, ML Pipelines, Embeddings, Agent Architecture, Image Generation (13 skills)

| Skill | Source | Description |
|-------|--------|-------------|
| `rag-implementation` | agents | Retrieval-Augmented Generation implementation patterns |
| `prompt-engineering-patterns` | agents | Prompt engineering with templates, few-shot, and chain-of-thought |
| `langchain-architecture` | agents | LangChain application architecture patterns |
| `llm-evaluation` | agents | LLM output evaluation methodologies |
| `embedding-strategies` | agents | Text embedding strategies and model selection |
| `hybrid-search-implementation` | agents | Hybrid search combining vector and keyword retrieval |
| `similarity-search-patterns` | agents | Similarity search algorithms and optimization |
| `vector-index-tuning` | agents | Vector index tuning (HNSW, IVF, PQ) |
| `ml-pipeline-workflow` | agents | ML pipeline workflow orchestration |
| `claude-api` | ecc | Claude API integration patterns and usage |
| `fal-ai-media` | ecc | fal.ai media generation API integration |
| `agent-native-architecture` | ce | Agent-native app architecture with MCP tools, self-modification, and execution patterns |
| `gemini-imagegen` | ce | Gemini API image generation and editing (text-to-image, style transfer, composition) |

##### `skills/language-specific/` - Python, TypeScript, Go, Rust, Shell (23 skills)

| Skill | Source | Description |
|-------|--------|-------------|
| `python-performance-optimization` | agents | Python performance profiling and optimization |
| `python-resilience` | agents | Python resilience patterns (retries, circuit breakers) |
| `python-project-structure` | agents | Python project layout and structure conventions |
| `python-configuration` | agents | Python configuration management patterns |
| `python-background-jobs` | agents | Python background job processing (Celery, RQ) |
| `python-observability` | agents | Python observability (logging, metrics, tracing) |
| `python-error-handling` | agents | Python error handling best practices |
| `python-anti-patterns` | agents | Common Python anti-patterns and fixes |
| `python-code-style` | agents | Python code style and formatting conventions |
| `python-resource-management` | agents | Python resource management (context managers, cleanup) |
| `python-type-safety` | agents | Python type hints and mypy configuration |
| `uv-package-manager` | agents | uv package manager usage patterns |
| `python-design-patterns` | agents | Python design patterns (factory, strategy, observer) |
| `python-packaging` | agents | Python packaging and distribution (pyproject.toml, wheels) |
| `async-python-patterns` | agents | Async Python patterns (asyncio, aiohttp) |
| `modern-javascript-patterns` | agents | Modern JavaScript patterns (ES2024+, modules, iterators) |
| `typescript-advanced-types` | agents | TypeScript advanced types (conditional, mapped, template literal) |
| `go-concurrency-patterns` | agents | Go concurrency patterns (goroutines, channels, sync) |
| `memory-safety-patterns` | agents | Memory safety patterns for systems programming |
| `rust-async-patterns` | agents | Rust async patterns (tokio, futures, streams) |
| `bash-defensive-patterns` | agents | Bash defensive scripting (set -euo, traps, quoting) |
| `bats-testing-patterns` | agents | Bash testing with BATS framework |
| `shellcheck-configuration` | agents | ShellCheck linter configuration and usage |

##### `skills/content-research/` - Writing, Research, SEO, Media, Web Search, Summarization, Style Editing, Document Sharing (12 skills)

| Skill | Source | Description |
|-------|--------|-------------|
| `article-writing` | ecc | Long-form article writing workflow |
| `deep-research` | ecc | Deep research with structured analysis |
| `market-research` | ecc | Market research and competitive analysis |
| `content-engine` | ecc | Content production pipeline automation |
| `exa-search` | ecc | Exa search API integration for research |
| `crosspost` | ecc | Cross-platform content distribution |
| `x-api` | ecc | X (Twitter) API integration for posting |
| `video-editing` | ecc | Video editing workflow automation |
| `native-web-search` | mitsuhiko | Native web search with concise summaries and full source URLs |
| `summarize` | mitsuhiko | Convert URLs, PDFs, DOCX, HTML to Markdown via markitdown, with optional summarization |
| `every-style-editor` | ce | Copy editing with style guide compliance and systematic line-by-line review |
| `proof` | ce | Create, edit, comment on, and share markdown documents via Proof's web API |

##### `skills/business/` - Finance, Payments, Analytics, Hiring (15 skills)

| Skill | Source | Description |
|-------|--------|-------------|
| `market-sizing-analysis` | agents | TAM/SAM/SOM market sizing with data sources |
| `startup-financial-modeling` | agents | Startup financial modeling and projections |
| `startup-metrics-framework` | agents | Startup KPI and metrics framework |
| `competitive-landscape` | agents | Competitive landscape analysis |
| `team-composition-analysis` | agents | Team composition and hiring analysis |
| `data-storytelling` | agents | Data storytelling and visualization narratives |
| `kpi-dashboard-design` | agents | KPI dashboard design patterns |
| `stripe-integration` | agents | Stripe payment integration patterns |
| `paypal-integration` | agents | PayPal payment integration patterns |
| `billing-automation` | agents | Billing and subscription automation |
| `backtesting-frameworks` | agents | Quantitative trading backtesting frameworks |
| `risk-metrics-calculation` | agents | Financial risk metrics (VaR, Sharpe, drawdown) |
| `employment-contract-templates` | agents | Employment contract templates and patterns |
| `investor-materials` | ecc | Investor deck and materials preparation |
| `investor-outreach` | ecc | Investor outreach workflow automation |

##### `skills/observability/` - Monitoring, Tracing, Grafana, Prometheus, SLOs, Sentry (5 skills)

| Skill | Source | Description |
|-------|--------|-------------|
| `distributed-tracing` | agents | Distributed tracing setup (OpenTelemetry, Jaeger) |
| `grafana-dashboards` | agents | Grafana dashboard design and provisioning |
| `prometheus-configuration` | agents | Prometheus configuration and alerting rules |
| `slo-implementation` | agents | SLO/SLI definition and error budget policies |
| `sentry` | mitsuhiko | Fetch and analyze Sentry issues, events, transactions, and logs for debugging and root cause analysis |

##### `skills/team-workflow/` - Coordination, Parallel Work, Agent Teams (11 skills)

| Skill | Source | Description |
|-------|--------|-------------|
| `multi-reviewer-patterns` | agents | Multi-reviewer code review coordination |
| `parallel-debugging` | agents | Parallel debugging with hypothesis testing |
| `parallel-feature-development` | agents | Parallel feature development with file ownership |
| `task-coordination-strategies` | agents | Task decomposition and dependency management |
| `team-communication-protocols` | agents | Team communication and messaging patterns |
| `team-composition-patterns` | agents | Agent team composition and role selection |
| `context-driven-development` | agents | Context-driven development with artifact templates |
| `track-management` | agents | Development track management and switching |
| `workflow-patterns` | agents | Workflow patterns for agent orchestration |
| `dmux-workflows` | ecc | Dmux parallel session workflows |
| `strategic-compact` | ecc | Strategic context compaction for long sessions |

##### `skills/game-embedded/` - Game Development (Unity, Godot), 3D Modeling (3 skills)

| Skill | Source | Description |
|-------|--------|-------------|
| `godot-gdscript-patterns` | agents | Godot GDScript patterns and best practices |
| `unity-ecs-patterns` | agents | Unity ECS architecture patterns |
| `openscad` | mitsuhiko | 3D modeling with OpenSCAD: preview, validate, extract params, export STL for 3D printing |

##### `skills/blockchain/` - Solidity, DeFi, NFT, Web3 (4 skills)

| Skill | Source | Description |
|-------|--------|-------------|
| `solidity-security` | agents | Solidity smart contract security patterns |
| `defi-protocol-templates` | agents | DeFi protocol implementation templates |
| `nft-standards` | agents | NFT standard implementations (ERC-721, ERC-1155) |
| `web3-testing` | agents | Web3 and smart contract testing patterns |

##### `skills/productivity/` - QA, Reviews, Shipping, Git, Documentation, Parallel Work, Mac Automation, Diagrams, Email, Planning, Brainstorming, Skill Authoring, Coding Tutor (34 skills)

| Skill | Source | Description |
|-------|--------|-------------|
| `qa` | gstack | Systematic QA testing with diff-aware, full, quick, and regression modes |
| `browse` | gstack | Fast headless browser for QA testing and site dogfooding |
| `gstack-review` | gstack | Code review with checklist, triage, and TODO formatting |
| `ship` | gstack | Ship workflow - tests, build, deploy with safety checks |
| `retro` | gstack | Sprint retrospective facilitation |
| `plan-ceo-review` | gstack | CEO-level plan review and feedback |
| `plan-eng-review` | gstack | Engineering plan review and feedback |
| `setup-browser-cookies` | gstack | Browser cookie setup for authenticated testing |
| `gstack-upgrade` | gstack | Gstack self-upgrade workflow |
| `git-advanced-workflows` | agents | Advanced Git workflows (rebase, bisect, worktrees) |
| `architecture-decision-records` | agents | ADR creation and management |
| `changelog-automation` | agents | Automated changelog generation from commits |
| `fork-terminal` | disler | Fork agent sessions to parallel terminal windows using Claude Code, Codex, or Gemini CLI |
| `just` | disler | Justfile task runner patterns with examples for Python, TypeScript, and Docker projects |
| `meta-skill` | disler | Meta-skill for creating new Claude Code skills following best practices and documentation |
| `the-library` | disler | Private-first distribution of skills, agents, and prompts across devices and teams |
| `create-worktree-skill` | disler | Create fully configured git worktrees for parallel development with isolated ports and config |
| `drive` | disler | Terminal automation CLI for AI agents via tmux sessions, commands, and parallel workloads |
| `steer` | disler | macOS GUI automation via accessibility APIs: screenshots, clicks, typing, hotkeys, window management |
| `tmux` | mitsuhiko | Remote control tmux sessions for interactive CLIs (python, gdb, etc.) via keystrokes and pane scraping |
| `mermaid` | mitsuhiko | Mermaid diagram validation and rendering using official Mermaid CLI |
| `google-workspace` | mitsuhiko | Google Workspace APIs (Drive, Docs, Calendar, Gmail, Sheets, Slides) via local OAuth scripts |
| `apple-mail` | mitsuhiko | Search, read, and extract attachments from Apple Mail local storage on macOS |
| `ce-brainstorm` | ce | Collaborative brainstorming before planning implementation |
| `ce-plan` | ce | Transform features into structured project plans |
| `ce-review` | ce | Exhaustive multi-agent code reviews with worktrees |
| `ce-work` | ce | Execute work plans efficiently while maintaining quality |
| `ce-compound` | ce | Document solved problems to compound team knowledge |
| `deepen-plan` | ce | Enhance plans with parallel research agents for depth and best practices |
| `brainstorming` | ce | Pre-implementation brainstorming to explore intent and approaches |
| `document-review` | ce | Refine brainstorm or plan documents before next workflow step |
| `git-worktree` | ce | Git worktree management for isolated parallel development |
| `create-agent-skills` | ce | Expert guidance for creating Claude Code skills and slash commands |
| `coding-tutor` | ce | Personalized coding tutorials with spaced repetition and quizzes |

### Commands (`commands/`)

Drop-in slash command files. Copy to `.claude/commands/` in any project. Invoke with `/command-name` (or `/command-name <argument>`) inside a Claude Code session.

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

#### Community Commands (100 commands in 12 categories)

Sources: [wshobson/agents](https://github.com/wshobson/agents) (MIT), [davila7/claude-code-templates](https://github.com/davila7/claude-code-templates) (MIT), [disler](https://github.com/disler), [EveryInc/compound-engineering-plugin](https://github.com/EveryInc/compound-engineering-plugin) (MIT). Deduplicated where the same command appeared in multiple plugins; best version kept.

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

### Hook Scripts (`hooks/`)

Production-ready bash hook scripts and a settings example. Copy scripts to `.claude/hooks/` in any project and wire them up via `.claude/settings.json`.

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

Community-contributed hook configurations and scripts from [davila7/claude-code-templates](https://github.com/davila7/claude-code-templates) (MIT). Each `.json` file is a hook configuration and each `.sh`/`.py` file is a supporting script. See `hooks/community/README.md` for installation instructions and a settings.json example.

#### automation/ - Build, Deploy, and Notification Hooks

| File | Event Type | Description |
|------|-----------|-------------|
| `agents-md-loader.json` | SessionStart | Loads AGENTS.md at session start for cross-platform AI assistant compatibility |
| `build-on-change.json` | PostToolUse | Triggers build (npm, make, cargo, maven, gradle) on source file changes |
| `change-logger.json` + `.py` | PostToolUse | Logs file mutations to CSV for session review |
| `dependency-checker.json` | PostToolUse | Runs security audits when dependency files are modified |
| `deployment-health-monitor.json` | PostToolUse, SessionStart | Monitors Vercel deployment status and health |
| `discord-notifications.json` | Stop, SubagentStop | Simple Discord notification on session end |
| `discord-detailed-notifications.json` | SessionStart, Stop | Detailed Discord notifications with duration and memory |
| `discord-error-notifications.json` | PreToolUse, PostToolUse, Notification | Discord alerts for long-running operations |
| `simple-notifications.json` | PostToolUse | Cross-platform desktop notifications on tool completion |
| `slack-notifications.json` | Stop, SubagentStop | Simple Slack notification on session end |
| `slack-detailed-notifications.json` | SessionStart, Stop | Detailed Slack notifications with duration and memory |
| `slack-error-notifications.json` | PreToolUse, PostToolUse, Notification | Slack alerts for long-running operations |
| `telegram-notifications.json` | Stop, SubagentStop | Simple Telegram notification on session end |
| `telegram-detailed-notifications.json` | SessionStart, Stop | Detailed Telegram notifications with duration and memory |
| `telegram-error-notifications.json` | PreToolUse, PostToolUse, Notification | Telegram alerts for long-running operations |
| `telegram-pr-webhook.json` + `.py` | PostToolUse | Sends PR URL and Vercel preview link to Telegram |
| `vercel-auto-deploy.json` | PostToolUse | Auto-triggers Vercel deployments on code changes |
| `vercel-environment-sync.json` | PostToolUse, SessionStart | Validates .env files and provides Vercel sync options |

#### development-tools/ - Linting, Formatting, Debugging, Backup, Quality Gates

| File | Event Type | Description |
|------|-----------|-------------|
| `change-tracker.json` | PostToolUse | Logs file changes to ~/.claude/changes.log |
| `command-logger.json` | PreToolUse | Logs tool usage to ~/.claude/command-log.txt |
| `debug-window.json` + `.sh` | SessionStart, SessionEnd | Opens live debug log window with --debug flag |
| `file-backup.json` | PreToolUse | Timestamped backups in .backups/ before edits |
| `lint-on-save.json` | PostToolUse | Runs ESLint, Pylint, or RuboCop after edits |
| `nextjs-code-quality-enforcer.json` | PostToolUse | Enforces Next.js App Router and component patterns |
| `smart-formatting.json` | PostToolUse | Auto-formats with Prettier, Black, gofmt, rustfmt, php-cs-fixer |
| `worktree-ghostty.json` + `.sh` | WorktreeCreate, WorktreeRemove | 3-panel Ghostty layout for worktrees (macOS) |
| `plan-gate.json` + `.sh` | PreToolUse | Warns if editing without an approved .spec.md (non-blocking) |
| `scope-guard.json` + `.sh` | Stop | Detects out-of-scope file modifications (non-blocking) |
| `tdd-gate.json` + `.sh` | PreToolUse | Blocks production code edits without a test file (TDD enforcement) |

#### git/ - Commit Validation, Branch Naming, Push Protection

| File | Event Type | Description |
|------|-----------|-------------|
| `conventional-commits.json` + `.py` | PreToolUse | Enforces conventional commit format (feat, fix, docs, etc.) |
| `prevent-direct-push.json` + `.py` | PreToolUse | Blocks direct pushes to main/develop, enforces Git Flow |
| `validate-branch-name.json` + `.py` | PreToolUse | Validates Git Flow branch naming on checkout |
| `auto-git-add.json` | PostToolUse | Auto-stages modified files with git add |
| `smart-commit.json` | PostToolUse | Auto-generates commit messages and creates commits |

#### monitoring/ - Notifications, Tracing, Performance

| File | Event Type | Description |
|------|-----------|-------------|
| `desktop-notification-on-stop.json` | Stop | Desktop notification when Claude finishes responding |
| `langsmith-tracing.json` + `.sh` | Stop | Sends conversation traces to LangSmith for analysis |
| `performance-budget-guard.json` | PostToolUse | Monitors Next.js bundle size against budget limits |
| `performance-monitor.json` | PreToolUse, PostToolUse | Records CPU, memory, and timing to CSV |

#### post-tool/ - After Tool Execution

| File | Event Type | Description |
|------|-----------|-------------|
| `format-javascript-files.json` | PostToolUse | Prettier formatting on JS/TS files after edits |
| `format-python-files.json` | PostToolUse | Black formatting on Python files after edits |
| `git-add-changes.json` | PostToolUse | git add on files after Edit or Write |
| `run-tests-after-changes.json` | PostToolUse | Runs test:quick after edits if package.json exists |
| `security-scanner.json` | PostToolUse | Scans for vulnerabilities using semgrep, bandit, gitleaks |
| `test-runner.json` | PostToolUse | Runs tests (npm, pytest, rspec) based on file type |

#### pre-tool/ - Before Tool Execution

| File | Event Type | Description |
|------|-----------|-------------|
| `backup-before-edit.json` | PreToolUse | Timestamped backup before any Edit operation |
| `console-log-cleaner.json` | PreToolUse | Warns about console.log on production branches |
| `dangerous-command-blocker.json` + `.py` | PreToolUse | Multi-level security: blocks catastrophic commands, protects critical paths |
| `file-protection.json` | PreToolUse | Blocks edits to system paths, production configs, vendor dirs |
| `notify-before-bash.json` | PreToolUse | Notification before Bash command execution |
| `secret-scanner.json` + `.py` | PreToolUse | Scans for hardcoded secrets from 30+ providers before commits |
| `update-search-year.json` | PreToolUse | Appends current year to WebSearch queries |

#### disler-hooks-mastery/ - Comprehensive Python Hooks System

Complete Python-based hooks framework by [disler](https://github.com/disler) (github.com/disler/claude-code-hooks-mastery, 3300+ stars). Covers every Claude Code hook event type with LLM-powered summaries, TTS announcements, automated code quality validation, multi-agent observability, and human-in-the-loop patterns. All scripts use `uv run --script`. See `hooks/community/disler-hooks-mastery/README.md` for full details.

| File | Event Type | Description |
|------|-----------|-------------|
| `notification.py` | Notification | TTS alerts when agent needs user input |
| `permission_request.py` | PermissionRequest | Auto-allows read-only ops, logs and optionally denies requests |
| `post_tool_use.py` | PostToolUse | Logs all tool invocations to JSON |
| `post_tool_use_failure.py` | PostToolUseFailure | Structured error logging with timestamps |
| `pre_compact.py` | PreCompact | Logs compaction events, optional transcript backup |
| `pre_tool_use.py` | PreToolUse | Blocks dangerous rm commands and .env access |
| `session_end.py` | SessionEnd | Logs session end, optional cleanup |
| `session_start.py` | SessionStart | Loads git/dev context, optional TTS |
| `setup.py` | Setup | Detects project type, checks deps, installs |
| `stop.py` | Stop | Transcript to chat.json, LLM completion via TTS |
| `subagent_start.py` | SubagentStart | Logs agent spawn, optional TTS |
| `subagent_stop.py` | SubagentStop | AI-summarized task completion, TTS with lock queue |
| `user_prompt_submit.py` | UserPromptSubmit | Logs prompts, session data, LLM agent naming |
| `send_event.py` | Any | Sends events to observability server |
| `setup_init.py` | Setup (init) | Repo initialization (uv, npm, SQLite) |
| `setup_maintenance.py` | Setup (maintenance) | Dependency upgrades, DB maintenance |
| `validators/ruff_validator.py` | PostToolUse | Ruff linter validation on Python files |
| `validators/ty_validator.py` | PostToolUse | Type checker validation on Python files |
| `validators/validate_new_file.py` | Stop | Validates new file creation in a directory |
| `validators/validate_file_contains.py` | Stop | Validates file contains required content |
| `utils/llm/anth.py` | - | Anthropic API integration (haiku) |
| `utils/llm/oai.py` | - | OpenAI API integration (gpt-4.1-nano) |
| `utils/llm/ollama.py` | - | Ollama local LLM integration |
| `utils/llm/task_summarizer.py` | - | Task summarization for TTS |
| `utils/tts/elevenlabs_tts.py` | - | ElevenLabs TTS |
| `utils/tts/openai_tts.py` | - | OpenAI TTS with streaming |
| `utils/tts/pyttsx3_tts.py` | - | Offline pyttsx3 TTS |
| `utils/tts/tts_queue.py` | - | File-based TTS lock for concurrent agents |
| `utils/constants.py` | - | Shared constants and log helpers |
| `utils/hitl.py` | - | Human-in-the-loop via WebSocket |
| `utils/model_extractor.py` | - | Extract model name from transcripts |
| `utils/summarizer.py` | - | Event summary generation |
| `examples/hitl_example.py` | - | HITL usage example |

### Agents (`agents/`)

Drop-in subagent files. Copy any `.md` file to `.claude/agents/` in your project (or `~/.claude/agents/` for personal use) and it becomes available immediately. See `agents/README.md` for installation instructions and full descriptions.

#### Core Agents

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

#### Community Agents (185 agents in 14 categories)

Sources: [VoltAgent/awesome-claude-code-subagents](https://github.com/VoltAgent/awesome-claude-code-subagents) (MIT license), [disler](https://github.com/disler), [mitsuhiko/agent-prompts](https://github.com/mitsuhiko/agent-prompts), [EveryInc/compound-engineering-plugin](https://github.com/EveryInc/compound-engineering-plugin) (MIT license).

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

### Guides (`guides/`)

Step-by-step workflow guides for specific development scenarios. Each guide includes exact prompts to type, expected outcomes at each step, and references to relevant skills, agents, and hooks.

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

### Output Styles (`output-styles/`)

Drop-in output style files that control how Claude Code formats responses. Copy to `.claude/output-styles/` in any project (or `~/.claude/output-styles/` for personal use). Select with `/output-style` or the `--output-style` CLI flag. Source: [disler](https://github.com/disler).

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
