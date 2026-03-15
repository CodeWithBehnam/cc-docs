<p align="center">
  <img src="https://mintcdn.com/claude-code/c5r9_6tjPMzFdDDT/logo/light.svg?fit=max&auto=format&n=c5r9_6tjPMzFdDDT&q=85&s=78fd01ff4f4340295a4f66e2ea54903c" alt="Claude Code" width="360">
</p>

<p align="center">
  Auto-updated mirror of the <a href="https://code.claude.com">Claude Code</a> documentation, sourced from <code>code.claude.com/docs/en/</code>
</p>

<p align="center">
  <a href="https://github.com/CodeWithBehnam/cc-docs/actions/workflows/update-docs.yml"><img src="https://img.shields.io/github/actions/workflow/status/CodeWithBehnam/cc-docs/update-docs.yml?label=docs%20sync&style=flat-square" alt="Docs Sync"></a>
  <a href="https://github.com/CodeWithBehnam/cc-docs/commits"><img src="https://img.shields.io/github/last-commit/CodeWithBehnam/cc-docs?style=flat-square" alt="Last Commit"></a>
  <a href="LICENSE"><img src="https://img.shields.io/github/license/CodeWithBehnam/cc-docs?style=flat-square" alt="License"></a>
  <img src="https://img.shields.io/badge/docs-65%2B%20pages-5A29E0?style=flat-square" alt="65+ Doc Pages">
  <img src="https://img.shields.io/badge/cheatsheets-64-29E05A?style=flat-square" alt="64 Cheatsheets">
  <img src="https://img.shields.io/badge/templates-33-E05A29?style=flat-square" alt="33 Templates">
  <img src="https://img.shields.io/badge/skills-15-FF6B6B?style=flat-square" alt="15 Skills">
  <img src="https://img.shields.io/badge/agents-12-6B6BFF?style=flat-square" alt="12 Agents">
  <img src="https://img.shields.io/badge/commands-12-FFB86B?style=flat-square" alt="12 Commands">
  <img src="https://img.shields.io/badge/hooks-10-6BFFB8?style=flat-square" alt="10 Hook Scripts">
  <img src="https://img.shields.io/badge/rules-8-FF6BFF?style=flat-square" alt="8 Rules">
  <img src="https://img.shields.io/badge/updates-hourly-blue?style=flat-square" alt="Hourly Updates">
</p>

---

> **Last docs pull:** <!-- LAST_UPDATED -->2026-03-15 22:10 UTC / 15:10 PT / 18:10 ET / 23:10 CET / 03:40+1 IST / 07:10+1 JST<!-- /LAST_UPDATED -->

A GitHub Actions workflow runs every hour, downloads the latest docs, and commits any changes automatically.

## What's Included

| Folder | Contents |
|---|---|
| `claude-code-docs/` | 65+ full doc pages mirrored from code.claude.com/docs |
| `cheatsheets/` | 64 scannable quick-reference sheets (one per doc page) |
| `templates/` | 33 copy-paste-able templates across 9 categories |
| `skills/` | 15 drop-in skills (`.claude/skills/`) for commit, PR, review, TDD, security, and more |
| `agents/` | 12 drop-in subagents (`.claude/agents/`) for code review, debugging, testing, and more |
| `commands/` | 12 drop-in slash commands (`.claude/commands/`) for common workflows |
| `hooks/` | 10 executable hook scripts with settings.json wiring examples |
| `rules/` | 8 language-specific coding rules (`.claude/rules/`) for TypeScript, Python, Go, and more |
| `tips/` | 7 curated tips files covering productivity, prompting, debugging, cost optimization |
| `guides/` | 7 step-by-step workflow guides (TDD, security audit, onboarding, CI/CD setup) |
| `awesome.md` | Curated list of the best Claude Code resources, plugins, and tools |

## Documentation

The [`claude-code-docs/`](claude-code-docs/) folder contains the **complete official Claude Code documentation** - 65+ pages mirrored from [code.claude.com/docs](https://code.claude.com/docs) and updated hourly. These are the full, unabridged docs with all details, examples, and edge cases.

> **Start here** if you're new: [overview](claude-code-docs/overview.md) -> [quickstart](claude-code-docs/quickstart.md) -> [best-practices](claude-code-docs/best-practices.md)

<details>
<summary><b>Getting Started</b> (4 pages) - Install, understand, get productive</summary>

| Doc | What You'll Learn |
|---|---|
| [overview](claude-code-docs/overview.md) | What Claude Code is, key capabilities, agentic coding workflow |
| [quickstart](claude-code-docs/quickstart.md) | Install, authenticate, first session, essential slash commands |
| [setup](claude-code-docs/setup.md) | Advanced install options, shell completion, system requirements, updating |
| [how-claude-code-works](claude-code-docs/how-claude-code-works.md) | Architecture deep dive: agentic loop, context management, tool execution |

</details>

<details>
<summary><b>Core Usage</b> (10 pages) - Daily workflow, commands, shortcuts</summary>

| Doc | What You'll Learn |
|---|---|
| [interactive-mode](claude-code-docs/interactive-mode.md) | REPL interface, slash commands, @-mentions, multi-turn conversations |
| [cli-reference](claude-code-docs/cli-reference.md) | Every CLI flag, option, and command with examples |
| [commands](claude-code-docs/commands.md) | All slash commands: /help, /model, /permissions, /memory, and more |
| [common-workflows](claude-code-docs/common-workflows.md) | Explore-fix, refactor, test, PR creation, plan mode, session management |
| [best-practices](claude-code-docs/best-practices.md) | Verification strategies, prompt techniques, CLAUDE.md tips, multi-session patterns |
| [code-review](claude-code-docs/code-review.md) | Managed review service, multi-agent review, REVIEW.md, trigger modes |
| [keybindings](claude-code-docs/keybindings.md) | Keyboard shortcuts and custom keybinding configuration |
| [fast-mode](claude-code-docs/fast-mode.md) | Faster output with same model, toggle behavior |
| [output-styles](claude-code-docs/output-styles.md) | Output formatting: markdown rendering, verbosity, width control |
| [terminal-config](claude-code-docs/terminal-config.md) | Terminal optimization: fonts, colors, Unicode support, recommended terminals |

</details>

<details>
<summary><b>Memory & Settings</b> (6 pages) - Configuration, permissions, environment</summary>

| Doc | What You'll Learn |
|---|---|
| [memory](claude-code-docs/memory.md) | CLAUDE.md files, path-specific rules, auto-memory, imports, organization-wide policies |
| [settings](claude-code-docs/settings.md) | All config options, settings scopes (user/project/managed), precedence rules |
| [model-config](claude-code-docs/model-config.md) | Model aliases (opus/sonnet/haiku), effort levels, extended context (1M), switching |
| [permissions](claude-code-docs/permissions.md) | Permission modes, allow/deny/ask rules, wildcard patterns, file path restrictions |
| [env-vars](claude-code-docs/env-vars.md) | Every environment variable: auth, proxy, debug, model overrides, feature flags |
| [statusline](claude-code-docs/statusline.md) | Customize the status bar: model, cost, token count, session info |

</details>

<details>
<summary><b>Extensibility</b> (11 pages) - Skills, hooks, MCP, plugins, agents</summary>

| Doc | What You'll Learn |
|---|---|
| [features-overview](claude-code-docs/features-overview.md) | Extension architecture overview: how skills, hooks, MCP, agents, and plugins layer |
| [skills](claude-code-docs/skills.md) | Create slash commands with frontmatter, templates, scripts, invocation control |
| [sub-agents](claude-code-docs/sub-agents.md) | Create specialized agents with restricted tools, memory, isolation, hooks |
| [agent-teams](claude-code-docs/agent-teams.md) | Multi-agent coordination, parallel exploration, task dependencies, quality gates |
| [plugins](claude-code-docs/plugins.md) | Create plugins bundling skills, agents, hooks, MCP, and LSP servers |
| [plugins-reference](claude-code-docs/plugins-reference.md) | Plugin manifest schema, component types, CLI commands, lifecycle |
| [discover-plugins](claude-code-docs/discover-plugins.md) | Find and install community plugins, marketplace browsing |
| [plugin-marketplaces](claude-code-docs/plugin-marketplaces.md) | Create and host plugin marketplaces for distribution |
| [hooks](claude-code-docs/hooks.md) | Hook events reference, types (command/prompt/agent), exit codes, matchers, JSON output |
| [hooks-guide](claude-code-docs/hooks-guide.md) | Practical recipes: auto-format, file protection, notifications, verification |
| [mcp](claude-code-docs/mcp.md) | Connect external tools via MCP: setup, .mcp.json, OAuth, popular integrations |

</details>

<details>
<summary><b>IDE Integrations</b> (6 pages) - VS Code, JetBrains, Chrome, Desktop, Web</summary>

| Doc | What You'll Learn |
|---|---|
| [vs-code](claude-code-docs/vs-code.md) | VS Code extension: inline chat, terminal integration, keybindings |
| [jetbrains](claude-code-docs/jetbrains.md) | JetBrains plugin: IntelliJ, PyCharm, WebStorm, and other IDEs |
| [chrome](claude-code-docs/chrome.md) | Chrome extension for web-based Claude Code (beta) |
| [desktop](claude-code-docs/desktop.md) | Desktop app: features, configuration, native integration |
| [desktop-quickstart](claude-code-docs/desktop-quickstart.md) | Get running with the desktop app in minutes |
| [claude-code-on-the-web](claude-code-docs/claude-code-on-the-web.md) | Browser-based Claude Code experience |

</details>

<details>
<summary><b>CI/CD & Automation</b> (6 pages) - GitHub Actions, GitLab, headless, Slack</summary>

| Doc | What You'll Learn |
|---|---|
| [headless](claude-code-docs/headless.md) | Non-interactive mode: `-p` flag, JSON output, streaming, JSON schema validation |
| [github-actions](claude-code-docs/github-actions.md) | claude-code-action: PR review, issue implementation, triggers, Bedrock/Vertex |
| [gitlab-ci-cd](claude-code-docs/gitlab-ci-cd.md) | GitLab CI pipelines: MR review, comment triggers, OIDC auth, MCP integration |
| [remote-control](claude-code-docs/remote-control.md) | Access local sessions from phone/tablet/browser, server mode, QR codes |
| [scheduled-tasks](claude-code-docs/scheduled-tasks.md) | /loop for recurring tasks, cron scheduling, reminders, skill re-invocation |
| [slack](claude-code-docs/slack.md) | Slack integration: coding tasks from channels, status updates, PR creation |

</details>

<details>
<summary><b>Cloud Providers</b> (4 pages) - Bedrock, Vertex AI, Foundry, gateways</summary>

| Doc | What You'll Learn |
|---|---|
| [amazon-bedrock](claude-code-docs/amazon-bedrock.md) | AWS Bedrock setup: credentials, SSO, cross-region inference, guardrails, IAM |
| [google-vertex-ai](claude-code-docs/google-vertex-ai.md) | Google Vertex AI setup: gcloud auth, regions, 1M context, model pinning |
| [microsoft-foundry](claude-code-docs/microsoft-foundry.md) | Microsoft Foundry integration and configuration |
| [llm-gateway](claude-code-docs/llm-gateway.md) | LLM gateway proxies: LiteLLM, key rotation, multi-provider routing, audit |

</details>

<details>
<summary><b>Enterprise & Security</b> (9 pages) - Auth, sandboxing, compliance, privacy</summary>

| Doc | What You'll Learn |
|---|---|
| [authentication](claude-code-docs/authentication.md) | Auth methods: API keys, OAuth, SSO, token management |
| [security](claude-code-docs/security.md) | Security model, permission system, threat mitigations, safe practices |
| [sandboxing](claude-code-docs/sandboxing.md) | OS-level isolation: filesystem rules, network restrictions, sandbox modes |
| [network-config](claude-code-docs/network-config.md) | Proxy setup, custom CA certificates, mTLS, credential refresh, domain allowlist |
| [server-managed-settings](claude-code-docs/server-managed-settings.md) | Org-wide settings delivery, policy enforcement, model restrictions (Teams/Enterprise) |
| [third-party-integrations](claude-code-docs/third-party-integrations.md) | Enterprise deployment options and partner integrations |
| [data-usage](claude-code-docs/data-usage.md) | What data is collected, how it's used, privacy controls |
| [zero-data-retention](claude-code-docs/zero-data-retention.md) | ZDR configuration, verification, and limitations |
| [legal-and-compliance](claude-code-docs/legal-and-compliance.md) | Compliance certifications, data processing terms |

</details>

<details>
<summary><b>Operations</b> (6 pages) - Costs, monitoring, debugging, containers</summary>

| Doc | What You'll Learn |
|---|---|
| [costs](claude-code-docs/costs.md) | Cost tracking, budget limits (`--max-budget-usd`), optimization strategies |
| [analytics](claude-code-docs/analytics.md) | Team usage analytics dashboard, reports, tracking |
| [monitoring-usage](claude-code-docs/monitoring-usage.md) | Usage metrics, API monitoring, performance tracking |
| [checkpointing](claude-code-docs/checkpointing.md) | Auto-checkpoints, /rewind, restore options, session forking, summarization |
| [devcontainer](claude-code-docs/devcontainer.md) | Dev container setup with pre-configured security, firewall, isolation |
| [troubleshooting](claude-code-docs/troubleshooting.md) | Common errors, diagnostic commands, fixes, debug mode |

</details>

<details>
<summary><b>Reference</b> (3 pages)</summary>

| Doc | What You'll Learn |
|---|---|
| [tools-reference](claude-code-docs/tools-reference.md) | Every built-in tool: Read, Edit, Bash, Grep, Glob, Agent, and more |
| [changelog](claude-code-docs/changelog.md) | Full release history with features, fixes, and breaking changes |
| [llms.txt](claude-code-docs/llms.txt) | Raw doc index used by the download script |

</details>

## Cheatsheets

The [`cheatsheets/`](cheatsheets/) folder has **64 quick-reference sheets** - one for every doc page. Each distills the full documentation into scannable tables, essential commands, config snippets, and common gotchas. Perfect for when you know *what* you need but want the answer fast.

> **Full docs** give you the complete picture. **Cheatsheets** give you the answer in 30 seconds.

<details>
<summary><b>Getting Started</b> (5 sheets)</summary>

| Cheatsheet | Key Content |
|---|---|
| [overview](cheatsheets/overview.md) | What Claude Code is, key capabilities, how it differs from other tools |
| [quickstart](cheatsheets/quickstart.md) | Install command, first run, essential keybindings |
| [setup](cheatsheets/setup.md) | System requirements, install methods, shell completion, updating |
| [authentication](cheatsheets/authentication.md) | Auth methods, API keys, OAuth, token management |
| [features-overview](cheatsheets/features-overview.md) | Extension points at a glance: skills, hooks, MCP, agents, plugins |

</details>

<details>
<summary><b>Usage</b> (5 sheets) - Commands, workflows, keyboard shortcuts</summary>

| Cheatsheet | Key Content |
|---|---|
| [interactive-mode](cheatsheets/interactive-mode.md) | REPL commands, slash commands, context management, multi-turn patterns |
| [cli-reference](cheatsheets/cli-reference.md) | All CLI flags and options in one table |
| [commands](cheatsheets/commands.md) | Every slash command with description and usage |
| [keybindings](cheatsheets/keybindings.md) | Keyboard shortcuts, custom keybinding config |
| [common-workflows](cheatsheets/common-workflows.md) | Explore-fix, refactor, test, PR creation, session management recipes |

</details>

<details>
<summary><b>Configuration</b> (9 sheets) - Settings, permissions, environment, models</summary>

| Cheatsheet | Key Content |
|---|---|
| [settings](cheatsheets/settings.md) | Settings file locations, scopes, precedence, all config keys |
| [env-vars](cheatsheets/env-vars.md) | Every environment variable with description and default |
| [memory](cheatsheets/memory.md) | CLAUDE.md structure, path-specific rules, auto-memory, imports |
| [permissions](cheatsheets/permissions.md) | Permission modes, rule syntax, wildcard patterns, file path patterns |
| [model-config](cheatsheets/model-config.md) | Model aliases, effort levels, extended context, model switching |
| [output-styles](cheatsheets/output-styles.md) | Output formatting options, verbosity levels |
| [fast-mode](cheatsheets/fast-mode.md) | Fast mode toggle, behavior differences |
| [statusline](cheatsheets/statusline.md) | Status line customization options |
| [server-managed-settings](cheatsheets/server-managed-settings.md) | Org-wide settings delivery, policy enforcement |

</details>

<details>
<summary><b>Extensions</b> (8 sheets) - Hooks, MCP, plugins, skills</summary>

| Cheatsheet | Key Content |
|---|---|
| [hooks](cheatsheets/hooks.md) | All hook events, types, exit codes, JSON output format, matchers |
| [hooks-guide](cheatsheets/hooks-guide.md) | Practical hook recipes: formatters, protectors, verifiers |
| [mcp](cheatsheets/mcp.md) | MCP server setup, .mcp.json format, popular integrations |
| [plugins](cheatsheets/plugins.md) | Plugin structure, manifest format, installation, testing |
| [plugins-reference](cheatsheets/plugins-reference.md) | Plugin API details, component types, CLI commands |
| [discover-plugins](cheatsheets/discover-plugins.md) | Finding and installing community plugins |
| [plugin-marketplaces](cheatsheets/plugin-marketplaces.md) | Creating and distributing plugin marketplaces |
| [skills](cheatsheets/skills.md) | Skill frontmatter, invocation control, string substitutions |

</details>

<details>
<summary><b>Agents</b> (5 sheets) - Subagents, teams, headless, scheduling</summary>

| Cheatsheet | Key Content |
|---|---|
| [sub-agents](cheatsheets/sub-agents.md) | Agent frontmatter, tool access, memory, isolation modes |
| [agent-teams](cheatsheets/agent-teams.md) | Multi-agent coordination, task lists, display modes, quality gates |
| [headless](cheatsheets/headless.md) | Non-interactive mode, JSON output, streaming, session continuation |
| [remote-control](cheatsheets/remote-control.md) | Remote access, server mode, QR codes, concurrent sessions |
| [scheduled-tasks](cheatsheets/scheduled-tasks.md) | /loop syntax, cron expressions, reminders, task management |

</details>

<details>
<summary><b>IDEs & Platforms</b> (7 sheets)</summary>

| Cheatsheet | Key Content |
|---|---|
| [vs-code](cheatsheets/vs-code.md) | VS Code integration, keybindings, panel usage |
| [jetbrains](cheatsheets/jetbrains.md) | JetBrains IDE integration, setup, features |
| [chrome](cheatsheets/chrome.md) | Chrome extension features and setup |
| [desktop](cheatsheets/desktop.md) | Desktop app features, installation, configuration |
| [desktop-quickstart](cheatsheets/desktop-quickstart.md) | Getting started with the desktop app |
| [claude-code-on-the-web](cheatsheets/claude-code-on-the-web.md) | Web-based Claude Code usage |
| [terminal-config](cheatsheets/terminal-config.md) | Terminal setup, font rendering, color support |

</details>

<details>
<summary><b>CI/CD</b> (4 sheets)</summary>

| Cheatsheet | Key Content |
|---|---|
| [github-actions](cheatsheets/github-actions.md) | Action parameters, trigger modes, common claude_args |
| [gitlab-ci-cd](cheatsheets/gitlab-ci-cd.md) | Pipeline config, MR events, Bedrock OIDC, Vertex WIF |
| [slack](cheatsheets/slack.md) | Slack integration, routing modes, task triggers |
| [devcontainer](cheatsheets/devcontainer.md) | Devcontainer config, firewall rules, isolation |

</details>

<details>
<summary><b>Cloud Providers</b> (4 sheets)</summary>

| Cheatsheet | Key Content |
|---|---|
| [amazon-bedrock](cheatsheets/amazon-bedrock.md) | Bedrock env vars, auth methods, model pinning, guardrails |
| [google-vertex-ai](cheatsheets/google-vertex-ai.md) | Vertex AI env vars, regions, 1M context, model versions |
| [microsoft-foundry](cheatsheets/microsoft-foundry.md) | Microsoft Foundry setup and configuration |
| [llm-gateway](cheatsheets/llm-gateway.md) | Gateway endpoints, key rotation, provider routing |

</details>

<details>
<summary><b>Security & Privacy</b> (7 sheets)</summary>

| Cheatsheet | Key Content |
|---|---|
| [security](cheatsheets/security.md) | Security model, threat mitigations, safe practices |
| [sandboxing](cheatsheets/sandboxing.md) | Sandbox modes, filesystem rules, network restrictions |
| [data-usage](cheatsheets/data-usage.md) | What data is collected, retention, privacy controls |
| [zero-data-retention](cheatsheets/zero-data-retention.md) | ZDR configuration, verification, limitations |
| [network-config](cheatsheets/network-config.md) | Proxy, custom CA, mTLS, credential refresh, domain allowlist |
| [legal-and-compliance](cheatsheets/legal-and-compliance.md) | Compliance certifications, data processing terms |
| [third-party-integrations](cheatsheets/third-party-integrations.md) | Enterprise deployment options, partner integrations |

</details>

<details>
<summary><b>Monitoring</b> (4 sheets)</summary>

| Cheatsheet | Key Content |
|---|---|
| [costs](cheatsheets/costs.md) | Cost tracking, budget limits, optimization strategies |
| [monitoring-usage](cheatsheets/monitoring-usage.md) | Usage metrics, API monitoring, performance tracking |
| [analytics](cheatsheets/analytics.md) | Team analytics dashboard, usage reports |
| [checkpointing](cheatsheets/checkpointing.md) | Checkpoint management, rewind options, session forking |

</details>

<details>
<summary><b>Reference</b> (6 sheets)</summary>

| Cheatsheet | Key Content |
|---|---|
| [tools-reference](cheatsheets/tools-reference.md) | Every built-in tool with permission level and description |
| [best-practices](cheatsheets/best-practices.md) | Verification strategies, prompt tips, context management |
| [code-review](cheatsheets/code-review.md) | Review service config, trigger modes, REVIEW.md format |
| [troubleshooting](cheatsheets/troubleshooting.md) | Common errors, diagnostic commands, fixes |
| [how-claude-code-works](cheatsheets/how-claude-code-works.md) | Architecture, agentic loop, context management internals |
| [changelog](cheatsheets/changelog.md) | Latest release highlights and breaking changes |

</details>

## Templates

The [`templates/`](templates/) folder has 33 ready-to-use, copy-paste-able templates. Find what you need, copy it into your project, and customize the placeholders.

### Core Extension Patterns

| Template | Description |
|---|---|
| [SKILL-TEMPLATE.md](templates/SKILL-TEMPLATE.md) | Skill patterns - reference, task, research, codegen, script-powered |
| [SUBAGENT-TEMPLATE.md](templates/SUBAGENT-TEMPLATE.md) | Subagent patterns - reviewer, debugger, domain expert, hooks, memory, background, worktree |
| [HOOKS-TEMPLATE.md](templates/HOOKS-TEMPLATE.md) | Hook patterns - formatter, protector, notifier, auditor, verifier, all event types |

### CLAUDE.md Starters

| Template | Description |
|---|---|
| [CLAUDE-MD-PYTHON.md](templates/claude-md-starters/CLAUDE-MD-PYTHON.md) | Python starter with pytest, ruff, uv/pip/poetry, Django/FastAPI variants |
| [CLAUDE-MD-TYPESCRIPT.md](templates/claude-md-starters/CLAUDE-MD-TYPESCRIPT.md) | TypeScript/Node.js starter with ESLint, Prettier, npm/pnpm/bun variants |
| [CLAUDE-MD-REACT.md](templates/claude-md-starters/CLAUDE-MD-REACT.md) | React/Next.js starter with App Router, Tailwind, Vite/shadcn variants |
| [CLAUDE-MD-RAILS.md](templates/claude-md-starters/CLAUDE-MD-RAILS.md) | Ruby on Rails starter with RSpec, Rubocop, Hotwire, API-only variant |
| [CLAUDE-MD-MONOREPO.md](templates/claude-md-starters/CLAUDE-MD-MONOREPO.md) | Monorepo starter with path-specific rules, workspace conventions, imports |

### CI/CD Workflows

| Template | Description |
|---|---|
| [GITHUB-ACTIONS-PR-REVIEW.md](templates/ci-cd/GITHUB-ACTIONS-PR-REVIEW.md) | GitHub Actions PR review with custom rules, Bedrock/Vertex options |
| [GITHUB-ACTIONS-ISSUE-IMPL.md](templates/ci-cd/GITHUB-ACTIONS-ISSUE-IMPL.md) | GitHub Actions auto-implement issues and create PRs |
| [GITLAB-CI-REVIEW.md](templates/ci-cd/GITLAB-CI-REVIEW.md) | GitLab CI MR review with MCP, Bedrock OIDC, Vertex WIF |
| [HEADLESS-SCRIPTS.md](templates/ci-cd/HEADLESS-SCRIPTS.md) | Shell scripts for batch migration, pre-commit, JSON output, lint-fix, docs |

### MCP Integrations

| Template | Description |
|---|---|
| [MCP-GITHUB.md](templates/mcp-integrations/MCP-GITHUB.md) | GitHub API access (issues, PRs, code search, Enterprise) |
| [MCP-DATABASE.md](templates/mcp-integrations/MCP-DATABASE.md) | Database access (PostgreSQL, MySQL, SQLite) with read-only safety |
| [MCP-SLACK-NOTION.md](templates/mcp-integrations/MCP-SLACK-NOTION.md) | Team tools (Slack, Notion, Linear, Jira, Sentry) |
| [MCP-CUSTOM-SERVER.md](templates/mcp-integrations/MCP-CUSTOM-SERVER.md) | Build your own MCP server (Node.js, Python, HTTP) |

### Plugins

| Template | Description |
|---|---|
| [PLUGIN-MINIMAL.md](templates/plugins/PLUGIN-MINIMAL.md) | Minimal plugin scaffold with single skill |
| [PLUGIN-FULL.md](templates/plugins/PLUGIN-FULL.md) | Full plugin with skills, agents, hooks, MCP |
| [PLUGIN-LSP.md](templates/plugins/PLUGIN-LSP.md) | Code intelligence plugin with LSP server |

### Permissions & Security

| Template | Description |
|---|---|
| [PERMISSIONS-DEVELOPMENT.md](templates/permissions-security/PERMISSIONS-DEVELOPMENT.md) | Dev presets (balanced, Python, Rails, Go, restrictive, open) |
| [PERMISSIONS-CICD.md](templates/permissions-security/PERMISSIONS-CICD.md) | CI/CD safe mode (read-only, test-running, controlled edits, cost controls) |
| [SANDBOX-DEVCONTAINER.md](templates/permissions-security/SANDBOX-DEVCONTAINER.md) | Devcontainer with firewall, sandbox settings, Codespaces |

### Cloud Providers

| Template | Description |
|---|---|
| [AWS-BEDROCK-SETUP.md](templates/cloud-providers/AWS-BEDROCK-SETUP.md) | AWS Bedrock (credentials, SSO refresh, model pinning, guardrails) |
| [GCP-VERTEX-SETUP.md](templates/cloud-providers/GCP-VERTEX-SETUP.md) | Google Vertex AI (gcloud auth, regions, 1M context, model pinning) |
| [LLM-GATEWAY-SETUP.md](templates/cloud-providers/LLM-GATEWAY-SETUP.md) | LLM gateway/proxy (LiteLLM, key rotation, multi-provider routing) |

### Agent Teams

| Template | Description |
|---|---|
| [AGENT-TEAM-CODE-REVIEW.md](templates/agent-teams/AGENT-TEAM-CODE-REVIEW.md) | Multi-agent code review (security + performance + test coverage) |
| [AGENT-TEAM-FEATURE-DEV.md](templates/agent-teams/AGENT-TEAM-FEATURE-DEV.md) | Feature dev team (architect + implementer + test writer) |
| [AGENT-TEAM-DEBUGGING.md](templates/agent-teams/AGENT-TEAM-DEBUGGING.md) | Debug team (log analyst + code tracer + hypothesis tester) |

### Workflow Automation

| Template | Description |
|---|---|
| [SCHEDULED-TASKS.md](templates/workflow-automation/SCHEDULED-TASKS.md) | Scheduled tasks (build monitoring, PR checks, cron, reminders) |
| [REVIEW-MD-TEMPLATE.md](templates/workflow-automation/REVIEW-MD-TEMPLATE.md) | REVIEW.md templates for TypeScript, Python, Rails, Go, monorepo |
| [REMOTE-CONTROL-SETUP.md](templates/workflow-automation/REMOTE-CONTROL-SETUP.md) | Remote control (server mode, mobile access, concurrent sessions) |

### Enterprise

| Template | Description |
|---|---|
| [ENTERPRISE-NETWORK.md](templates/enterprise/ENTERPRISE-NETWORK.md) | Network config (proxy, custom CA, mTLS, credential refresh, firewall) |
| [ENTERPRISE-MANAGED-SETTINGS.md](templates/enterprise/ENTERPRISE-MANAGED-SETTINGS.md) | Managed settings (org-wide permissions, model restrictions, audit) |

## Skills

The [`skills/`](skills/) folder has **15 ready-to-use skill directories**. Copy any skill to `.claude/skills/` in your project (or `~/.claude/skills/` for all projects). Invoke with `/skill-name` or let Claude auto-invoke when relevant.

> **Skills vs Commands:** Skills support directories with supporting files, frontmatter for invocation control, and subagent execution. Commands are simpler single-file alternatives. Both create slash commands.

<details>
<summary><b>Task Skills</b> (10 skills) - Workflows you invoke manually</summary>

| Skill | Command | Description |
|---|---|---|
| [commit](skills/commit/SKILL.md) | `/commit` | Run tests, generate conventional commit message, stage and commit |
| [pr](skills/pr/SKILL.md) | `/pr [base]` | Push branch and create PR with auto-generated description via gh |
| [fix-issue](skills/fix-issue/SKILL.md) | `/fix-issue <number>` | Read GitHub issue, implement fix, write tests, commit |
| [tdd](skills/tdd/SKILL.md) | `/tdd <feature>` | Red-green-refactor TDD cycle |
| [refactor](skills/refactor/SKILL.md) | `/refactor <target>` | Refactor while preserving behavior, with test verification |
| [doc-gen](skills/doc-gen/SKILL.md) | `/doc-gen <target>` | Generate or update documentation for a module |
| [migrate](skills/migrate/SKILL.md) | `/migrate <path> <target>` | Migrate code from one framework to another |
| [debug](skills/debug/SKILL.md) | `/debug <error>` | Systematic debugging with hypothesis testing |
| [changelog](skills/changelog/SKILL.md) | `/changelog [version]` | Generate changelog from git history |

</details>

<details>
<summary><b>Research Skills</b> (4 skills) - Run in isolated subagents</summary>

| Skill | Command | Description |
|---|---|---|
| [review](skills/review/SKILL.md) | `/review` | Review current diff for bugs, security, and style |
| [explain](skills/explain/SKILL.md) | `/explain [target]` | Explain code with diagrams and analogies |
| [security-scan](skills/security-scan/SKILL.md) | `/security-scan [path]` | OWASP Top 10 vulnerability audit |
| [onboard](skills/onboard/SKILL.md) | `/onboard` | Generate codebase overview for new team members |
| [perf-audit](skills/perf-audit/SKILL.md) | `/perf-audit [target]` | Find performance bottlenecks |

</details>

<details>
<summary><b>Reference Skills</b> (1 skill) - Auto-loaded background knowledge</summary>

| Skill | Description |
|---|---|
| [api-conventions](skills/api-conventions/SKILL.md) | REST API design conventions (auto-loaded when writing API code) |

</details>

## Agents

The [`agents/`](agents/) folder has **12 ready-to-use subagent files**. Copy any `.md` file to `.claude/agents/` in your project (or `~/.claude/agents/` for all projects).

<details>
<summary><b>All 12 Agents</b> - Specialized AI assistants for delegation</summary>

| Agent | Model | Description |
|---|---|---|
| [code-reviewer](agents/code-reviewer.md) | sonnet | Read-only code review for quality, security, best practices |
| [security-auditor](agents/security-auditor.md) | opus | Deep OWASP security audit with severity ratings |
| [test-writer](agents/test-writer.md) | sonnet | Write tests matching project framework and style |
| [debugger](agents/debugger.md) | inherit | Hypothesis-driven root cause analysis |
| [docs-writer](agents/docs-writer.md) | sonnet | Write JSDoc, docstrings, README content |
| [refactorer](agents/refactorer.md) | sonnet | Refactor for readability, runs tests before/after |
| [performance-analyst](agents/performance-analyst.md) | sonnet | Find N+1 queries, memory leaks, slow algorithms |
| [db-reader](agents/db-reader.md) | haiku | Read-only database queries (blocks write SQL via hook) |
| [api-designer](agents/api-designer.md) | sonnet | Design RESTful endpoints with OpenAPI output |
| [migration-planner](agents/migration-planner.md) | inherit | Phased migration plans with scope analysis |
| [dependency-checker](agents/dependency-checker.md) | haiku | Audit npm/pip/bundle/cargo for vulnerabilities |
| [onboarding-guide](agents/onboarding-guide.md) | sonnet | Generate architecture overviews (uses project memory) |

</details>

## Commands

The [`commands/`](commands/) folder has **12 ready-to-use slash command files**. Copy any `.md` file to `.claude/commands/` in your project.

<details>
<summary><b>All 12 Commands</b> - Slash commands for common workflows</summary>

| Command | Argument | Description |
|---|---|---|
| [/commit](commands/commit.md) | - | Run tests, stage, generate conventional commit message |
| [/pr](commands/pr.md) | - | Summarize changes, push, create PR with gh |
| [/review](commands/review.md) | - | Diff against main, report by priority |
| [/fix-issue](commands/fix-issue.md) | `<issue-number>` | Fetch issue, implement fix, write tests, commit |
| [/tdd](commands/tdd.md) | `<feature>` | Red-green-refactor TDD cycle |
| [/deploy](commands/deploy.md) | `<staging\|production>` | Run tests, build, deploy with safety checks |
| [/lint-fix](commands/lint-fix.md) | - | Auto-detect linter, fix issues, report remainder |
| [/deps-update](commands/deps-update.md) | - | Audit, list outdated, update safe ones, run tests |
| [/explain](commands/explain.md) | `<file or symbol>` | ASCII diagram, analogy, walkthrough, gotchas |
| [/release](commands/release.md) | `<version>` | Changelog, version bump, tag, push, GitHub release |
| [/db-migrate](commands/db-migrate.md) | `<description>` | Generate migration with up/down, test rollback |
| [/new-feature](commands/new-feature.md) | `<feature name>` | Scaffold following existing patterns |

</details>

## Hook Scripts

The [`hooks/`](hooks/) folder has **10 executable bash scripts** and a [settings-examples.json](hooks/settings-examples.json) showing how to wire them into `.claude/settings.json`.

<details>
<summary><b>All 10 Hook Scripts</b> - Automated workflow enforcement</summary>

| Script | Event | Description |
|---|---|---|
| [auto-format.sh](hooks/scripts/auto-format.sh) | PostToolUse | Run prettier/black/gofmt/rubocop after file edits |
| [protect-files.sh](hooks/scripts/protect-files.sh) | PreToolUse | Block edits to .env, lockfiles, .git/, secrets |
| [notify-desktop.sh](hooks/scripts/notify-desktop.sh) | Notification | Cross-platform desktop notification |
| [lint-on-save.sh](hooks/scripts/lint-on-save.sh) | PostToolUse | Run linter after file edits (non-blocking) |
| [block-dangerous-commands.sh](hooks/scripts/block-dangerous-commands.sh) | PreToolUse | Block rm -rf /, DROP TABLE, force-push to main |
| [log-tool-usage.sh](hooks/scripts/log-tool-usage.sh) | PostToolUse | Append JSON lines to audit log |
| [validate-sql.sh](hooks/scripts/validate-sql.sh) | PreToolUse | Block SQL mutations, allow SELECT only |
| [test-after-edit.sh](hooks/scripts/test-after-edit.sh) | PostToolUse | Auto-run related test file after edits |
| [inject-context.sh](hooks/scripts/inject-context.sh) | SessionStart | Re-inject context after compaction |
| [stop-check.sh](hooks/scripts/stop-check.sh) | Stop | Check for uncommitted changes before stopping |

</details>

## Rules

The [`rules/`](rules/) folder has **8 language-specific coding rules**. Copy to `.claude/rules/` in your project. Claude auto-loads a rule when working with files matching its glob patterns.

<details>
<summary><b>All 8 Rules</b> - Path-specific coding conventions</summary>

| Rule | Globs | Description |
|---|---|---|
| [typescript](rules/typescript.md) | `**/*.ts`, `**/*.tsx` | Strict mode, no any, union types over enums, optional chaining |
| [python](rules/python.md) | `**/*.py` | PEP 8, type hints, f-strings, pathlib, dataclasses |
| [react](rules/react.md) | `**/*.tsx`, `**/*.jsx` | Functional components, hooks, accessibility, error boundaries |
| [go](rules/go.md) | `**/*.go` | Error checks, table-driven tests, context first param |
| [rails](rules/rails.md) | `**/*.rb`, `**/*.erb` | Fat models, thin controllers, scopes, service objects |
| [rust](rules/rust.md) | `**/*.rs` | Result over panic, ? operator, minimize unsafe |
| [sql](rules/sql.md) | `**/*.sql`, `**/migrations/**` | Reversible migrations, index foreign keys, BIGINT IDs |
| [testing](rules/testing.md) | `**/*test*`, `**/*spec*` | Arrange-Act-Assert, one concept per test, no sleep |

</details>

## Tips & Tricks

The [`tips/`](tips/) folder has **7 curated tips files** organized by topic. Practical, actionable techniques from daily Claude Code usage.

| Topic | What You'll Learn |
|---|---|
| [Productivity](tips/productivity.md) | Session management, context control, keyboard shortcuts, /btw, /fork |
| [Prompting](tips/prompting.md) | Prompt engineering specific to Claude Code, verification criteria, plan mode |
| [Debugging](tips/debugging.md) | Systematic debugging, hypothesis testing, /rewind after failed fixes |
| [Cost Optimization](tips/cost-optimization.md) | Token management, subagents for research, /effort, /fast, budget limits |
| [Multi-Session](tips/multi-session.md) | Worktrees, fan-out patterns, writer/reviewer, agent teams |
| [Security](tips/security.md) | Permission deny rules, /sandbox, hook-based protections, devcontainers |

## Guides

The [`guides/`](guides/) folder has **7 step-by-step workflow guides**. Each includes exact prompts to type and expected outcomes at each step.

| Guide | When to Use |
|---|---|
| [TDD Workflow](guides/tdd-workflow.md) | Implementing features test-first with Claude Code |
| [Security Audit](guides/security-audit.md) | Running a comprehensive security review |
| [Onboarding a New Codebase](guides/onboarding-new-codebase.md) | First day on an unfamiliar project |
| [Migration Playbook](guides/migration-playbook.md) | Migrating frameworks, libraries, or patterns |
| [PR Review Workflow](guides/pr-review-workflow.md) | Professional code review with subagents |
| [CI/CD Setup](guides/ci-cd-setup.md) | Adding Claude Code to GitHub Actions or GitLab CI |
| [Monorepo Setup](guides/monorepo-setup.md) | Configuring layered CLAUDE.md and per-package skills |

## Awesome Claude Code

The [`awesome.md`](awesome.md) file is a curated list of the best Claude Code resources: official docs, community plugins, MCP servers, CLAUDE.md examples, guides, tools, and enterprise resources.

## How it works

1. `Scripts/download-cc-docs.sh` fetches the doc index from `code.claude.com/docs/llms.txt`
2. Extracts all `.md` URLs and downloads each page
3. Cleans up JSX/MDX artifacts (component tags, `theme={null}`, etc.)
4. The GitHub Actions workflow commits and pushes if anything changed

## Using these docs with Claude Code

Add this repo as a reference in your `CLAUDE.md`:

```markdown
See https://github.com/CodeWithBehnam/cc-docs for Claude Code documentation.
```

Or clone it locally and point to specific files for context.

## Manual Update

```bash
bash Scripts/download-cc-docs.sh
```

## Contributing

Contributions are welcome! See [CONTRIBUTING.md](CONTRIBUTING.md) for guidelines.

This project follows the [Contributor Covenant Code of Conduct](CODE_OF_CONDUCT.md) and is licensed under [MIT](LICENSE).

## Star History

[![Star History Chart](https://api.star-history.com/svg?repos=CodeWithBehnam/cc-docs&type=Date)](https://star-history.com/#CodeWithBehnam/cc-docs&Date)

---

`claude` `claude-code` `anthropic` `documentation` `ai-coding` `developer-tools` `cheatsheet`
