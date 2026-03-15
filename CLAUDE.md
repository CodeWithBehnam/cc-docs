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
