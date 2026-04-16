<p align="center">
  <img src="https://mintcdn.com/claude-code/c5r9_6tjPMzFdDDT/logo/light.svg?fit=max&auto=format&n=c5r9_6tjPMzFdDDT&q=85&s=78fd01ff4f4340295a4f66e2ea54903c" alt="Claude Code" width="360">
</p>

<p align="center">
  Auto-updated mirror of the <a href="https://code.claude.com">Claude Code</a> documentation, sourced from <code>code.claude.com/docs/en/</code>
</p>

<p align="center">
  <a href="https://codewithbehnam.github.io/cc-docs/"><strong>Browse all 666 resources on the web</strong></a>
</p>

<p align="center">
  <a href="https://github.com/CodeWithBehnam/cc-docs/actions/workflows/update-docs.yml"><img src="https://img.shields.io/github/actions/workflow/status/CodeWithBehnam/cc-docs/update-docs.yml?label=docs%20sync&style=flat-square" alt="Docs Sync"></a>
  <a href="https://github.com/CodeWithBehnam/cc-docs/commits"><img src="https://img.shields.io/github/last-commit/CodeWithBehnam/cc-docs?style=flat-square" alt="Last Commit"></a>
  <a href="LICENSE"><img src="https://img.shields.io/github/license/CodeWithBehnam/cc-docs?style=flat-square" alt="License"></a>
  <img src="https://img.shields.io/badge/docs-65%2B%20pages-5A29E0?style=flat-square" alt="65+ Doc Pages">
  <img src="https://img.shields.io/badge/cheatsheets-64-29E05A?style=flat-square" alt="64 Cheatsheets">
  <img src="https://img.shields.io/badge/templates-33-E05A29?style=flat-square" alt="33 Templates">
  <img src="https://img.shields.io/badge/skills-237_(15%20core%20%2B%20222%20community)-FF6B6B?style=flat-square" alt="237 Skills">
  <img src="https://img.shields.io/badge/agents-197_(12%20core%20%2B%20185%20community)-6B6BFF?style=flat-square" alt="197 Agents">
  <img src="https://img.shields.io/badge/commands-112_(12%20core%20%2B%20100%20community)-FFB86B?style=flat-square" alt="112 Commands">
  <img src="https://img.shields.io/badge/hooks-108_(10%20core%20%2B%2098%20community)-6BFFB8?style=flat-square" alt="108 Hook Scripts">
  <img src="https://img.shields.io/badge/output--styles-11-B86BFF?style=flat-square" alt="11 Output Styles">
  <img src="https://img.shields.io/badge/rules-8-FF6BFF?style=flat-square" alt="8 Rules">
  <img src="https://img.shields.io/badge/updates-hourly-blue?style=flat-square" alt="Hourly Updates">
</p>

---

> **Last docs pull:** <!-- LAST_UPDATED -->2026-04-16 21:21 UTC / 14:21 PT / 17:21 ET / 23:21 CET / 02:51+1 IST / 06:21+1 JST<!-- /LAST_UPDATED -->

A GitHub Actions workflow runs every hour, downloads the latest docs, and commits any changes automatically.

## What's Included

| Folder | Contents |
|---|---|
| `claude-code-docs/` | 65+ full doc pages mirrored from code.claude.com/docs |
| `cheatsheets/` | 64 scannable quick-reference sheets (one per doc page) |
| `templates/` | 33 copy-paste-able templates across 9 categories |
| `skills/` | **237 skills** - 15 core + 222 community skills in 16 categories |
| `agents/` | **197 agents** - 12 core + 185 community agents in 14 categories |
| `commands/` | **112 commands** - 12 core + 100 community commands in 12 categories |
| `hooks/` | **108 hooks** - 10 core scripts + 98 community hooks (6 categories + Python hooks mastery) |
| `output-styles/` | 11 drop-in output style configurations for Claude Code |
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

The [`skills/`](skills/) folder has **237 skills** - 15 core skills plus 222 community skills organized into 16 categories. Copy any skill to `.claude/skills/` in your project (or `~/.claude/skills/` for all projects). Invoke with `/skill-name` or let Claude auto-invoke when relevant.

> **Skills vs Commands:** Skills support directories with supporting files, frontmatter for invocation control, and subagent execution. Commands are simpler single-file alternatives. Both create slash commands.

<details>
<summary><b>Core Task Skills</b> (10 skills) - Workflows you invoke manually</summary>

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
<summary><b>Core Research Skills</b> (5 skills) - Run in isolated subagents</summary>

| Skill | Command | Description |
|---|---|---|
| [review](skills/review/SKILL.md) | `/review` | Review current diff for bugs, security, and style |
| [explain](skills/explain/SKILL.md) | `/explain [target]` | Explain code with diagrams and analogies |
| [security-scan](skills/security-scan/SKILL.md) | `/security-scan [path]` | OWASP Top 10 vulnerability audit |
| [onboard](skills/onboard/SKILL.md) | `/onboard` | Generate codebase overview for new team members |
| [perf-audit](skills/perf-audit/SKILL.md) | `/perf-audit [target]` | Find performance bottlenecks |

</details>

<details>
<summary><b>Core Reference Skills</b> (1 skill) - Auto-loaded background knowledge</summary>

| Skill | Description |
|---|---|
| [api-conventions](skills/api-conventions/SKILL.md) | REST API design conventions (auto-loaded when writing API code) |

</details>

<details>
<summary><b>Community Skills</b> (222 skills in 16 categories) - From community repos</summary>

Sources: [wshobson/agents](https://github.com/wshobson/agents), [affaan-m/everything-claude-code](https://github.com/affaan-m/everything-claude-code), [garrytan/gstack](https://github.com/garrytan/gstack), [disler](https://github.com/disler), [mitsuhiko/agent-stuff](https://github.com/mitsuhiko/agent-stuff), [EveryInc/compound-engineering-plugin](https://github.com/EveryInc/compound-engineering-plugin). Each skill is in its own subdirectory with a `SKILL.md` file and optional reference files.

| Category | Count | What's Inside |
|---|---|---|
| [`api-architecture/`](skills/api-architecture/) | 10 | REST/GraphQL design, microservices, CQRS, event sourcing, saga orchestration, OpenAPI |
| [`backend-development/`](skills/backend-development/) | 20 | Workflow orchestration, error handling, auth patterns, .NET, Node.js, DHH Rails style, Andrew Kane gems, DSPy.rb |
| [`frontend-development/`](skills/frontend-development/) | 19 | Next.js App Router, React state, Tailwind, design systems, accessibility, mobile UI, agent-browser, frontend-design |
| [`language-specific/`](skills/language-specific/) | 23 | Python (15 skills), TypeScript, Go concurrency, Rust async, Bash defensive scripting |
| [`devops-infrastructure/`](skills/devops-infrastructure/) | 21 | CI/CD pipelines, K8s, Terraform, GitOps, service mesh, secrets, agent sandboxes, rclone |
| [`testing-quality/`](skills/testing-quality/) | 12 | E2E testing, TDD, code review, JS/Python testing, browser automation, test-browser |
| [`security/`](skills/security/) | 14 | STRIDE threat modeling, SAST, PCI/GDPR compliance, binary analysis, damage control, Ghidra RE |
| [`ai-ml/`](skills/ai-ml/) | 13 | RAG, prompt engineering, LangChain, LLM eval, embeddings, vector search, agent-native architecture, Gemini imagegen |
| [`business/`](skills/business/) | 15 | Market sizing, financial modeling, Stripe/PayPal, risk metrics, investor materials |
| [`content-research/`](skills/content-research/) | 12 | Article writing, deep research, market research, content engine, video editing, web search, summarization, style editing, Proof docs |
| [`productivity/`](skills/productivity/) | 35 | QA, code reviews, shipping, justfile, worktrees, fork-terminal, meta-skill, library, Mac control, tmux, mermaid, Google Workspace, CE workflow (brainstorm/plan/review/work/compound), create-agent-skills, coding-tutor |
| [`team-workflow/`](skills/team-workflow/) | 11 | Multi-reviewer coordination, parallel debugging, task decomposition, agent orchestration |
| [`data-engineering/`](skills/data-engineering/) | 6 | Airflow DAGs, dbt, Spark optimization, SQL tuning, PostgreSQL |
| [`observability/`](skills/observability/) | 5 | Distributed tracing, Grafana dashboards, Prometheus, SLO/SLI, Sentry error tracking |
| [`blockchain/`](skills/blockchain/) | 4 | Solidity security, DeFi protocols, NFT standards, Web3 testing |
| [`game-embedded/`](skills/game-embedded/) | 3 | Godot GDScript, Unity ECS patterns, OpenSCAD 3D modeling |

</details>

## Agents

The [`agents/`](agents/) folder has **197 agents** - 12 core agents plus 185 community agents organized into 14 categories. Copy any `.md` file to `.claude/agents/` in your project (or `~/.claude/agents/` for all projects).

<details>
<summary><b>Core Agents</b> (12 agents) - Battle-tested, ready to use</summary>

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

<details>
<summary><b>Community Agents</b> (185 agents in 14 categories) - From VoltAgent, disler, mitsuhiko, and EveryInc</summary>

Sources: [VoltAgent/awesome-claude-code-subagents](https://github.com/VoltAgent/awesome-claude-code-subagents), [disler](https://github.com/disler), [mitsuhiko/agent-prompts](https://github.com/mitsuhiko/agent-prompts), [EveryInc/compound-engineering-plugin](https://github.com/EveryInc/compound-engineering-plugin) (MIT license).

| Category | Count | What's Inside |
|---|---|---|
| [`core-development/`](agents/core-development/) | 10 | API designer, backend/frontend/fullstack developer, mobile, Electron, GraphQL, microservices, UI, WebSocket |
| [`language-specialists/`](agents/language-specialists/) | 26 | Angular, C++, C#, Django, .NET, Elixir, Flutter, Go, Java, JS, Kotlin, Laravel, Next.js, PHP, PowerShell, Python, Rails, React, Rust, Spring Boot, SQL, Swift, TypeScript, Vue |
| [`infrastructure/`](agents/infrastructure/) | 16 | Azure, cloud architecture, databases, deployment, DevOps, Docker, incidents, K8s, networking, platform, security, SRE, Terraform, Terragrunt, Windows |
| [`quality-security/`](agents/quality-security/) | 30 | Architecture review, code simplicity, data integrity/migration, deployment verification, DHH Rails, Kieran Python/Rails/TypeScript, pattern recognition, performance oracle, schema drift, security sentinel, frontend races, agent-native, plus original VoltAgent agents |
| [`data-ai/`](agents/data-ai/) | 12 | AI engineering, data analysis/engineering/science, database optimization, LLM architecture, ML/MLOps, NLP, PostgreSQL, prompt engineering |
| [`developer-experience/`](agents/developer-experience/) | 18 | Build systems, CLI tools, dependencies, documentation, DX optimization, Git workflows, legacy modernization, MCP, refactoring, docs scraping, scout reports, bug reproduction, PR comment resolution, spec flow analysis |
| [`specialized-domains/`](agents/specialized-domains/) | 12 | API docs, blockchain, embedded systems, fintech, gaming, IoT, M365, mobile apps, payments, quant analysis, risk management, SEO |
| [`business-product/`](agents/business-product/) | 11 | Business analysis, content marketing, customer success, legal, product/project management, sales engineering, Scrum, technical writing, UX research, WordPress |
| [`meta-orchestration/`](agents/meta-orchestration/) | 12 | Agent installation/organization, context management, error coordination, IT ops, knowledge synthesis, multi-agent coordination, performance monitoring, task distribution, workflows, meta-agent, work-completion-summary |
| [`research-analysis/`](agents/research-analysis/) | 15 | Competitive analysis, data/market research, research analysis, scientific literature, search, trend analysis, citations, research lead/subagent, best-practices researcher, framework docs, git history, learnings, repo analyst |
| [`lang-engineering/`](agents/lang-engineering/) | 10 | Compiler, lexer, parser, runtime, VM, coroutine, memory, object system, language analysis, language architect |
| [`poc-engineering/`](agents/poc-engineering/) | 7 | Architecture design, detailed planning, implementation, problem analysis, programming lead, software architect, task breakdown |
| [`design/`](agents/design/) | 4 | Design implementation reviewer, design iterator, Figma design sync, Ankane README writer |
| [`team/`](agents/team/) | 2 | Builder (implementation) and validator (quality assurance) team agents for paired workflows |

</details>

## Commands

The [`commands/`](commands/) folder has **112 commands** - 12 core commands plus 100 community commands organized into 12 categories. Copy any `.md` file to `.claude/commands/` in your project.

<details>
<summary><b>Core Commands</b> (12 commands) - Essential daily workflows</summary>

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

<details>
<summary><b>Community Commands</b> (100 commands in 12 categories) - From community repos</summary>

Sources: [wshobson/agents](https://github.com/wshobson/agents), [davila7/claude-code-templates](https://github.com/davila7/claude-code-templates), [disler](https://github.com/disler), [EveryInc/compound-engineering-plugin](https://github.com/EveryInc/compound-engineering-plugin) (MIT license).

| Category | Count | What's Inside |
|---|---|---|
| [`development/`](commands/development/) | 20 | Feature scaffolding, build, cook, prime, plan, quick-plan, start, infinite loop, quiz-me, teach-me, sync-tutorials |
| [`git-workflow/`](commands/git-workflow/) | 12 | Git quality gates, onboarding, Conductor project management (6), worktree management (4) |
| [`team-management/`](commands/team-management/) | 12 | Agent team orchestration (spawn/status/delegate/feature/review/debug/shutdown), standup notes |
| [`testing/`](commands/testing/) | 8 | TDD cycle (red/green/refactor), test generation, API mocking, performance testing |
| [`refactoring/`](commands/refactoring/) | 7 | Refactor with SOLID principles, tech debt analysis, dependency audit, context save/restore |
| [`data-migration/`](commands/data-migration/) | 7 | Data pipelines, SQL migrations, code migration, dependency upgrades, legacy modernization |
| [`debugging/`](commands/debugging/) | 6 | Error analysis, error tracing, smart debug, distributed tracing, incident response |
| [`review-quality/`](commands/review-quality/) | 7 | Full review orchestrator, PR enhancement, AI-powered review, multi-agent review, UI review |
| [`ai-tools/`](commands/ai-tools/) | 5 | AI assistant building, LangGraph agents, prompt optimization, agent improvement |
| [`deployment-infra/`](commands/deployment-infra/) | 7 | CI/CD automation, config validation, cost optimization, monitoring, SLO, install, maintenance |
| [`security/`](commands/security/) | 5 | SAST scanning, security hardening, dependency vulnerabilities, compliance, XSS scanning |
| [`documentation/`](commands/documentation/) | 4 | Doc generation, code explanation, C4 architecture docs, blog articles |

</details>

## Hook Scripts

The [`hooks/`](hooks/) folder has **108 hooks** - 10 core bash scripts plus 98 community hook configurations organized into 6 categories plus a comprehensive Python hooks mastery system. Wire them into `.claude/settings.json`.

<details>
<summary><b>Core Hook Scripts</b> (10 scripts) - Production-ready workflow enforcement</summary>

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

<details>
<summary><b>Community Hooks</b> (98 hooks in 7 sections) - From davila7 and disler</summary>

Sources: [davila7/claude-code-templates](https://github.com/davila7/claude-code-templates), [disler/claude-code-hooks-mastery](https://github.com/disler/claude-code-hooks-mastery) (MIT license). See [`hooks/community/README.md`](hooks/community/README.md) for installation instructions.

| Category | Count | What's Inside |
|---|---|---|
| [`automation/`](hooks/community/automation/) | 20 | Discord/Slack/Telegram notifications (simple, detailed, error), Vercel auto-deploy, build-on-change, dependency checker, deployment health monitor |
| [`development-tools/`](hooks/community/development-tools/) | 16 | Smart formatting, lint-on-save, file backup, debug window, TDD gate, plan gate, scope guard, Next.js code quality enforcer, worktree Ghostty layout |
| [`pre-tool/`](hooks/community/pre-tool/) | 9 | Backup before edit, console.log cleaner, dangerous command blocker, file protection, secret scanner (30+ providers), WebSearch year updater |
| [`git/`](hooks/community/git/) | 8 | Conventional commits enforcer, prevent direct push to main, branch name validation, auto-git-add, smart commit |
| [`post-tool/`](hooks/community/post-tool/) | 6 | JS/Python formatters, git-add-changes, test runner (multi-framework), security scanner (semgrep/bandit/gitleaks) |
| [`monitoring/`](hooks/community/monitoring/) | 5 | Desktop notification on stop, LangSmith tracing, performance budget guard, CPU/memory performance monitor |
| [`disler-hooks-mastery/`](hooks/community/disler-hooks-mastery/) | 33 | Complete Python hooks system: 13 lifecycle hooks (all event types), 4 validators (ruff, ty, file content, new file), LLM integrations (Anthropic, OpenAI, Ollama), TTS (ElevenLabs, OpenAI, pyttsx3), human-in-the-loop patterns, observability |

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

## Output Styles

The [`output-styles/`](output-styles/) folder has **11 drop-in output style files** from [disler](https://github.com/disler). Copy to `.claude/output-styles/` and select via `/output-style` in Claude Code.

<details>
<summary><b>All 11 Output Styles</b> - Customize Claude's response format</summary>

| Style | Description |
|---|---|
| [bullet-points](output-styles/bullet-points.md) | Concise bullet-point format for scannable output |
| [genui](output-styles/genui.md) | Generative UI components in responses |
| [html-structured](output-styles/html-structured.md) | HTML-structured output for rich formatting |
| [markdown-focused](output-styles/markdown-focused.md) | Clean markdown with headers and code blocks |
| [observable-tools-diffs](output-styles/observable-tools-diffs.md) | Show tool calls and diffs visibly |
| [observable-tools-diffs-tts](output-styles/observable-tools-diffs-tts.md) | Observable output with text-to-speech summaries |
| [table-based](output-styles/table-based.md) | Tabular output format for structured data |
| [tts-summary-base](output-styles/tts-summary-base.md) | Base template for TTS-friendly summaries |
| [tts-summary](output-styles/tts-summary.md) | Text-to-speech optimized summary output |
| [ultra-concise](output-styles/ultra-concise.md) | Minimal output, maximum signal |
| [yaml-structured](output-styles/yaml-structured.md) | YAML-structured output format |

</details>

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

## Related Projects

Other great Claude Code community projects worth checking out:

| Repository | Stars | Focus |
|---|---|---|
| [anthropics/claude-code](https://github.com/anthropics/claude-code) | 78k+ | Official Claude Code repository |
| [anthropics/claude-plugins-official](https://github.com/anthropics/claude-plugins-official) | 11k+ | Official Anthropic-managed plugin directory |
| [affaan-m/everything-claude-code](https://github.com/affaan-m/everything-claude-code) | 77k+ | Skills, instincts, memory, and security optimization system |
| [hesreallyhim/awesome-claude-code](https://github.com/hesreallyhim/awesome-claude-code) | 28k+ | Curated list of skills, hooks, commands, and plugins |
| [sickn33/antigravity-awesome-skills](https://github.com/sickn33/antigravity-awesome-skills) | 24k+ | 1000+ agentic skills collection |
| [VoltAgent/awesome-claude-code-subagents](https://github.com/VoltAgent/awesome-claude-code-subagents) | 13k+ | 100+ specialized subagents |
| [VoltAgent/awesome-agent-skills](https://github.com/VoltAgent/awesome-agent-skills) | 11k+ | 500+ agent skills from dev teams and community |
| [SuperClaude-Org/SuperClaude_Framework](https://github.com/SuperClaude-Org/SuperClaude_Framework) | 21k+ | Configuration framework with specialized commands and personas |
| [wshobson/agents](https://github.com/wshobson/agents) | 31k+ | Multi-agent orchestration for Claude Code |
| [shanraisshan/claude-code-best-practice](https://github.com/shanraisshan/claude-code-best-practice) | 16k+ | Best practices collection |
| [coleam00/context-engineering-intro](https://github.com/coleam00/context-engineering-intro) | 12k+ | Context engineering strategies for Claude Code |
| [davila7/claude-code-templates](https://github.com/davila7/claude-code-templates) | 22k+ | CLI tool for configuring and monitoring Claude Code |
| [garrytan/gstack](https://github.com/garrytan/gstack) | 13k+ | Opinionated Claude Code setup with 6 tools |
| [disler/claude-code-hooks-mastery](https://github.com/disler/claude-code-hooks-mastery) | 3.3k+ | Master Claude Code hooks with Python-based system, validators, LLM/TTS integrations |
| [disler/claude-code-damage-control](https://github.com/disler/claude-code-damage-control) | 428+ | Safety skill preventing destructive actions with pattern-based damage control |
| [disler/agent-sandbox-skill](https://github.com/disler/agent-sandbox-skill) | 340+ | Manage isolated sandbox environments for agent execution |
| [disler/bowser](https://github.com/disler/bowser) | 193+ | Browser automation with composable skills, subagents, and justfile architecture |
| [disler/fork-repository-skill](https://github.com/disler/fork-repository-skill) | 138+ | Fork agent to work in parallel terminals |
| [mitsuhiko/agent-stuff](https://github.com/mitsuhiko/agent-stuff) | 1.6k+ | Script-powered skills from the creator of Flask: Ghidra RE, Sentry, tmux, web-browser, OpenSCAD |
| [mitsuhiko/agent-prompts](https://github.com/mitsuhiko/agent-prompts) | 101+ | Specialized agents for language engineering (compiler, lexer, parser, VM) and POC engineering |
| [EveryInc/compound-engineering-plugin](https://github.com/EveryInc/compound-engineering-plugin) | - | Compound engineering workflow: 27 review/research/design agents, 46 skills, CE brainstorm-plan-review-work cycle |

## Star History

[![Star History Chart](https://api.star-history.com/svg?repos=CodeWithBehnam/cc-docs&type=Date)](https://star-history.com/#CodeWithBehnam/cc-docs&Date)

---

`claude` `claude-code` `anthropic` `documentation` `ai-coding` `developer-tools` `cheatsheet`
