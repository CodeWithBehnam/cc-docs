# Claude Code Templates

Ready-to-use, copy-paste-able templates for setting up Claude Code. Organized by category so you can find what you need fast.

## Core Extension Templates

Generic patterns for building skills, subagents, and hooks from scratch.

| Template | Description |
| --- | --- |
| [SKILL-TEMPLATE.md](SKILL-TEMPLATE.md) | Skill patterns: reference, task, research, codegen, script-powered |
| [SUBAGENT-TEMPLATE.md](SUBAGENT-TEMPLATE.md) | Subagent patterns: reviewer, debugger, domain expert, hooks, memory, background, worktree |
| [HOOKS-TEMPLATE.md](HOOKS-TEMPLATE.md) | Hook patterns: formatter, protector, notifier, auditor, verifier, all event types |

## CLAUDE.md Starters (`claude-md-starters/`)

Project-specific CLAUDE.md files, ready to drop into your repo and customize.

| Template | Description |
| --- | --- |
| [CLAUDE-MD-PYTHON.md](claude-md-starters/CLAUDE-MD-PYTHON.md) | Python starter: pytest, ruff, uv/pip/poetry, type hints, Django/FastAPI variants |
| [CLAUDE-MD-TYPESCRIPT.md](claude-md-starters/CLAUDE-MD-TYPESCRIPT.md) | TypeScript/Node.js starter: ESLint, Prettier, npm/pnpm/bun, Express/CLI variants |
| [CLAUDE-MD-REACT.md](claude-md-starters/CLAUDE-MD-REACT.md) | React/Next.js starter: App Router, Tailwind, testing-library, Vite/shadcn variants |
| [CLAUDE-MD-RAILS.md](claude-md-starters/CLAUDE-MD-RAILS.md) | Ruby on Rails starter: RSpec, Rubocop, migrations, Hotwire, API-only variant |
| [CLAUDE-MD-MONOREPO.md](claude-md-starters/CLAUDE-MD-MONOREPO.md) | Monorepo starter: path-specific rules, workspace conventions, CLAUDE.md imports |

## CI/CD Workflows (`ci-cd/`)

Copy-paste GitHub Actions and GitLab CI configs, plus headless scripting patterns.

| Template | Description |
| --- | --- |
| [GITHUB-ACTIONS-PR-REVIEW.md](ci-cd/GITHUB-ACTIONS-PR-REVIEW.md) | GitHub Actions PR review: auto-review on push, custom rules, Bedrock/Vertex |
| [GITHUB-ACTIONS-ISSUE-IMPL.md](ci-cd/GITHUB-ACTIONS-ISSUE-IMPL.md) | GitHub Actions issue implementation: auto-create PRs from labeled issues |
| [GITLAB-CI-REVIEW.md](ci-cd/GITLAB-CI-REVIEW.md) | GitLab CI MR review: manual/auto triggers, MCP integration, Bedrock OIDC, Vertex WIF |
| [HEADLESS-SCRIPTS.md](ci-cd/HEADLESS-SCRIPTS.md) | Shell scripts: batch migration, pre-commit, JSON schema output, lint-fix, doc generation |

## MCP Integrations (`mcp-integrations/`)

Connect Claude Code to external tools and services via MCP.

| Template | Description |
| --- | --- |
| [MCP-GITHUB.md](mcp-integrations/MCP-GITHUB.md) | GitHub API access: issues, PRs, code search, GitHub Enterprise |
| [MCP-DATABASE.md](mcp-integrations/MCP-DATABASE.md) | Database access: PostgreSQL, MySQL, SQLite with read-only safety |
| [MCP-SLACK-NOTION.md](mcp-integrations/MCP-SLACK-NOTION.md) | Team tools: Slack, Notion, Linear, Jira, Sentry, multi-tool setup |
| [MCP-CUSTOM-SERVER.md](mcp-integrations/MCP-CUSTOM-SERVER.md) | Build your own: Node.js stdio, Python FastMCP, HTTP/SSE server patterns |

## Plugins (`plugins/`)

Plugin scaffolding from minimal to full-featured.

| Template | Description |
| --- | --- |
| [PLUGIN-MINIMAL.md](plugins/PLUGIN-MINIMAL.md) | Minimal plugin: single skill, plugin.json, install and publish |
| [PLUGIN-FULL.md](plugins/PLUGIN-FULL.md) | Full plugin: skills + agents + hooks + MCP, marketplace-ready |
| [PLUGIN-LSP.md](plugins/PLUGIN-LSP.md) | LSP plugin: code intelligence for TypeScript, Python, Go, Rust, Ruby |

## Permissions & Security (`permissions-security/`)

Permission presets and sandboxing configurations.

| Template | Description |
| --- | --- |
| [PERMISSIONS-DEVELOPMENT.md](permissions-security/PERMISSIONS-DEVELOPMENT.md) | Dev presets: balanced, Python, Rails, Go, restrictive, open |
| [PERMISSIONS-CICD.md](permissions-security/PERMISSIONS-CICD.md) | CI/CD presets: read-only, test-running, controlled edits, cost controls |
| [SANDBOX-DEVCONTAINER.md](permissions-security/SANDBOX-DEVCONTAINER.md) | Devcontainer: Dockerfile, firewall rules, sandbox settings, Codespaces |

## Cloud Providers (`cloud-providers/`)

Setup guides for running Claude Code through cloud provider APIs.

| Template | Description |
| --- | --- |
| [AWS-BEDROCK-SETUP.md](cloud-providers/AWS-BEDROCK-SETUP.md) | AWS Bedrock: credentials, SSO refresh, model pinning, guardrails, IAM policy |
| [GCP-VERTEX-SETUP.md](cloud-providers/GCP-VERTEX-SETUP.md) | Google Vertex AI: gcloud auth, regions, 1M context, model pinning |
| [LLM-GATEWAY-SETUP.md](cloud-providers/LLM-GATEWAY-SETUP.md) | LLM gateway: LiteLLM, key rotation, multi-provider routing, corporate proxy |

## Agent Teams (`agent-teams/`)

Multi-agent coordination templates for parallel work.

| Template | Description |
| --- | --- |
| [AGENT-TEAM-CODE-REVIEW.md](agent-teams/AGENT-TEAM-CODE-REVIEW.md) | Review team: security + performance + test coverage agents in parallel |
| [AGENT-TEAM-FEATURE-DEV.md](agent-teams/AGENT-TEAM-FEATURE-DEV.md) | Feature dev team: architect + implementer + test writer with plan approval |
| [AGENT-TEAM-DEBUGGING.md](agent-teams/AGENT-TEAM-DEBUGGING.md) | Debug team: log analyst + code tracer + hypothesis tester, competing approaches |

## Workflow Automation (`workflow-automation/`)

Recurring tasks, review customization, and remote access patterns.

| Template | Description |
| --- | --- |
| [SCHEDULED-TASKS.md](workflow-automation/SCHEDULED-TASKS.md) | Scheduled tasks: build monitoring, PR checks, cron expressions, reminders |
| [REVIEW-MD-TEMPLATE.md](workflow-automation/REVIEW-MD-TEMPLATE.md) | REVIEW.md templates: TypeScript, Python, Rails, Go, monorepo review rules |
| [REMOTE-CONTROL-SETUP.md](workflow-automation/REMOTE-CONTROL-SETUP.md) | Remote control: server mode, mobile access, concurrent sessions |

## Enterprise (`enterprise/`)

Network and policy configuration for enterprise deployments.

| Template | Description |
| --- | --- |
| [ENTERPRISE-NETWORK.md](enterprise/ENTERPRISE-NETWORK.md) | Network config: proxy, custom CA, mTLS, credential refresh, firewall allowlist |
| [ENTERPRISE-MANAGED-SETTINGS.md](enterprise/ENTERPRISE-MANAGED-SETTINGS.md) | Managed settings: org-wide permissions, model restrictions, hook policies, audit |

## Usage

1. Find the template that matches your use case
2. Copy the relevant code blocks into your project
3. Replace placeholders (`<project-name>`, `<language>`, etc.) with your values
4. See the full docs in [`claude-code-docs/`](../claude-code-docs/) for detailed reference
