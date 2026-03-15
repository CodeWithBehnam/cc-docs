# Awesome Claude Code

A curated list of resources, tools, plugins, and guides for Claude Code.

Inspired by the [awesome](https://github.com/sindresorhus/awesome) list tradition.

---

## Contents

- [Official Resources](#official-resources)
- [Official Plugins and Marketplace](#official-plugins-and-marketplace)
- [Community Plugins](#community-plugins)
- [MCP Servers for Claude Code](#mcp-servers-for-claude-code)
- [CLAUDE.md Examples and Starters](#claudemd-examples-and-starters)
- [Guides and Tutorials](#guides-and-tutorials)
- [Videos and Talks](#videos-and-talks)
- [Tools and Utilities](#tools-and-utilities)
- [Cloud Provider Setup](#cloud-provider-setup)
- [Enterprise Resources](#enterprise-resources)
- [Contributing](#contributing)

---

## Official Resources

- [Claude Code Documentation](https://code.claude.com/docs) - The complete official docs, covering installation, CLI reference, hooks, MCP, plugins, and more.
- [Claude Code GitHub](https://github.com/anthropics/claude-code) - Official repository for the Claude Code CLI.
- [Claude Code Examples](https://github.com/anthropics/claude-code/tree/main/examples) - Official example projects and usage samples.
- [Anthropic Cookbook](https://github.com/anthropics/anthropic-cookbook) - Recipes and patterns for building with Anthropic APIs, including agentic workflows.
- [Claude Code Action for GitHub](https://github.com/anthropics/claude-code-action) - Official GitHub Action to run Claude Code in CI pipelines (PR review, issue implementation).
- [Agent Skills Standard](https://agentskills.io) - Specification for the agent skills format used by Claude Code.
- [Anthropic Blog](https://www.anthropic.com/blog) - Announcements, research, and guides from the Anthropic team.
- [Claude Code on the Web](https://code.claude.com) - Browser-based access to Claude Code.

---

## Official Plugins and Marketplace

- [Claude Code Marketplace](https://github.com/anthropics/claude-code-marketplace) - Official plugin marketplace for discovering and distributing Claude Code plugins. <!-- verify URL -->
- **Code Review Plugin** - Managed code review service with multi-agent review, REVIEW.md configuration, and trigger modes. See [code-review docs](claude-code-docs/code-review.md).
- **Code Intelligence - TypeScript** - LSP-powered TypeScript/JavaScript code intelligence plugin.
- **Code Intelligence - Python** - LSP-powered Python code intelligence plugin.
- **Code Intelligence - Go** - LSP-powered Go code intelligence plugin.
- **Code Intelligence - Rust** - LSP-powered Rust code intelligence plugin.

> Find and install plugins with `/plugins` inside Claude Code or browse via the [discover-plugins docs](claude-code-docs/discover-plugins.md).

---

## Community Plugins

Community plugins extend Claude Code for specific frameworks, tools, and workflows. Categories to look for:

- **Formatting plugins** - Auto-run Prettier, Black, gofmt, rustfmt, or other formatters on file save or before commits.
- **Linting plugins** - Integrate ESLint, Ruff, golangci-lint, Clippy, or other linters directly into the Claude Code workflow.
- **Framework-specific plugins** - Rails helpers, Next.js generators, Django scaffolding, Laravel artisan wrappers, and similar.
- **Deployment plugins** - Wrappers around Terraform, Pulumi, Kubernetes, or cloud CLIs that expose deployment actions as Claude Code skills.
- **Testing plugins** - Test runner integrations (Jest, pytest, RSpec, Go test) with structured output and failure summarization.
- **Documentation plugins** - Auto-generate or update inline docs, README files, or changelogs.

> Browse the marketplace or search GitHub for `claude-code-plugin` to find community contributions.

---

## MCP Servers for Claude Code

MCP (Model Context Protocol) servers expose external tools and data sources to Claude Code. Configure them in `.mcp.json`. See the [MCP docs](claude-code-docs/mcp.md) and the [full MCP server directory](https://modelcontextprotocol.io) for more.

### Official and Widely Used

- [GitHub MCP](https://github.com/github/github-mcp-server) - Read and write GitHub issues, pull requests, and code via the GitHub API.
- [Filesystem MCP](https://github.com/modelcontextprotocol/servers/tree/main/src/filesystem) - Expose local directories with configurable read/write access.
- [PostgreSQL MCP](https://github.com/modelcontextprotocol/servers/tree/main/src/postgres) - Read-only query access to PostgreSQL databases.
- [Slack MCP](https://github.com/modelcontextprotocol/servers/tree/main/src/slack) - Post messages, read channels, and interact with Slack workspaces.
- [Playwright/Browser MCP](https://github.com/microsoft/playwright-mcp) - Browser automation and web scraping via Playwright.
- [Notion MCP](https://github.com/makenotion/notion-mcp-server) - Read and write Notion pages and databases.
- [Linear MCP](https://github.com/linear/linear-mcp) <!-- verify URL --> - Manage Linear issues, projects, and cycles.
- [Memory MCP](https://github.com/modelcontextprotocol/servers/tree/main/src/memory) - Persistent key-value memory that survives across sessions.
- [Fetch MCP](https://github.com/modelcontextprotocol/servers/tree/main/src/fetch) - Fetch and parse web pages or API responses.
- [SQLite MCP](https://github.com/modelcontextprotocol/servers/tree/main/src/sqlite) - Query and inspect SQLite databases.

### Templates for Custom MCP Servers

This repository includes ready-to-use MCP configuration templates:

- [MCP-GITHUB.md](templates/mcp-integrations/MCP-GITHUB.md) - GitHub API access (issues, PRs, code search, Enterprise).
- [MCP-DATABASE.md](templates/mcp-integrations/MCP-DATABASE.md) - Database access (PostgreSQL, MySQL, SQLite) with read-only safety patterns.
- [MCP-SLACK-NOTION.md](templates/mcp-integrations/MCP-SLACK-NOTION.md) - Team tools (Slack, Notion, Linear, Jira, Sentry).
- [MCP-CUSTOM-SERVER.md](templates/mcp-integrations/MCP-CUSTOM-SERVER.md) - Build your own MCP server (Node.js, Python, or HTTP transport).

---

## CLAUDE.md Examples and Starters

`CLAUDE.md` files give Claude Code persistent, project-specific instructions. Good `CLAUDE.md` files dramatically improve consistency and reduce repetitive prompting.

### This Repository

- [CLAUDE.md](CLAUDE.md) - The `CLAUDE.md` for this repo. Shows document index conventions, writing rules, and workflow automation notes.

### Framework Starters (from `templates/`)

| Template | Stack |
|----------|-------|
| [CLAUDE-MD-PYTHON.md](templates/claude-md-starters/CLAUDE-MD-PYTHON.md) | Python with pytest, ruff, uv/pip/poetry, Django/FastAPI variants |
| [CLAUDE-MD-TYPESCRIPT.md](templates/claude-md-starters/CLAUDE-MD-TYPESCRIPT.md) | TypeScript/Node.js with ESLint, Prettier, npm/pnpm/bun |
| [CLAUDE-MD-REACT.md](templates/claude-md-starters/CLAUDE-MD-REACT.md) | React/Next.js with App Router, Tailwind, Vite, shadcn |
| [CLAUDE-MD-RAILS.md](templates/claude-md-starters/CLAUDE-MD-RAILS.md) | Ruby on Rails with RSpec, Rubocop, Hotwire, API-only variant |
| [CLAUDE-MD-MONOREPO.md](templates/claude-md-starters/CLAUDE-MD-MONOREPO.md) | Monorepo with path-specific rules, workspace conventions, imports |

### Tips for Writing Effective CLAUDE.md Files

- Define your tech stack, test runner, formatter, and linter at the top.
- Add path-specific rules using `# CLAUDE.md at src/` imports for large repos.
- Use the `memory` section to record architectural decisions that Claude should not override.
- Keep rules concrete and actionable ("always run `ruff check` before committing") rather than vague ("write clean code").
- See the [memory docs](claude-code-docs/memory.md) for full `CLAUDE.md` syntax and features.

---

## Guides and Tutorials

### Official Docs (in this repository)

- [Best Practices](claude-code-docs/best-practices.md) - Verification strategies, prompt techniques, CLAUDE.md tips, multi-session patterns.
- [Common Workflows](claude-code-docs/common-workflows.md) - Explore-fix, refactor, test, PR creation, plan mode, session management.
- [How Claude Code Works](claude-code-docs/how-claude-code-works.md) - Architecture deep dive: agentic loop, context management, tool execution.
- [Hooks Guide](claude-code-docs/hooks-guide.md) - Practical recipes: auto-format, file protection, notifications, verification pipelines.
- [Agent Teams](claude-code-docs/agent-teams.md) - Multi-agent coordination, parallel exploration, task dependencies, quality gates.

### Cheatsheets (in this repository)

The [`cheatsheets/`](cheatsheets/) folder has 64 scannable quick-reference sheets, one per doc page. Useful for finding answers fast without reading full documentation.

### Templates (in this repository)

The [`templates/`](templates/) folder has 33 copy-paste-ready templates across skills, subagents, hooks, CI/CD, MCP, plugins, cloud providers, agent teams, and enterprise configuration.

Key starting points:

- [SKILL-TEMPLATE.md](templates/SKILL-TEMPLATE.md) - Reference, task, research, codegen, and script-powered skill patterns.
- [SUBAGENT-TEMPLATE.md](templates/SUBAGENT-TEMPLATE.md) - Reviewer, debugger, domain expert, hooks, memory, background, and worktree subagent patterns.
- [HOOKS-TEMPLATE.md](templates/HOOKS-TEMPLATE.md) - Formatter, protector, notifier, auditor, verifier, and all hook event types.

---

## Videos and Talks

- **Claude Code Announcement** - See the [Anthropic Blog](https://www.anthropic.com/blog) for the original Claude Code launch post and demonstration videos.
- **Anthropic YouTube Channel** - <!-- verify URL: https://www.youtube.com/@Anthropic --> Official videos on Claude Code features and workflows.

> This section will grow as the community produces tutorials, conference talks, and walkthroughs. If you have a high-quality video to suggest, see [Contributing](#contributing).

---

## Tools and Utilities

### Core CLI

- **claude** - The main Claude Code CLI. Install with `npm install -g @anthropic-ai/claude-code`. See [setup docs](claude-code-docs/setup.md).
- **claude (Desktop)** - Native desktop app with system tray integration. See [desktop docs](claude-code-docs/desktop.md).

### Companion CLI Tools

- [gh](https://cli.github.com/) - GitHub's official CLI. Used by the GitHub MCP server and CI/CD templates for PR and issue automation.
- [jq](https://jqlang.github.io/jq/) - Lightweight JSON processor. Essential for writing hook scripts that parse or transform Claude Code's JSON output.
- [direnv](https://direnv.net/) - Automatically load/unload environment variables per directory. Useful for managing `ANTHROPIC_API_KEY` and cloud provider credentials across projects.

### Debugging and Development

- [MCP Inspector](https://github.com/modelcontextprotocol/inspector) - Visual tool for testing and debugging MCP servers before connecting them to Claude Code.
- [Claude Code DevContainer](claude-code-docs/devcontainer.md) - Pre-configured development container with firewall rules, sandbox settings, and Codespaces support.

---

## Cloud Provider Setup

Use Claude Code through your own cloud provider account instead of Anthropic's API directly.

| Provider | Template | Docs |
|----------|----------|------|
| AWS Bedrock | [AWS-BEDROCK-SETUP.md](templates/cloud-providers/AWS-BEDROCK-SETUP.md) | [amazon-bedrock.md](claude-code-docs/amazon-bedrock.md) |
| Google Vertex AI | [GCP-VERTEX-SETUP.md](templates/cloud-providers/GCP-VERTEX-SETUP.md) | [google-vertex-ai.md](claude-code-docs/google-vertex-ai.md) |
| Microsoft Foundry | (see docs) | [microsoft-foundry.md](claude-code-docs/microsoft-foundry.md) |
| LLM Gateway/Proxy | [LLM-GATEWAY-SETUP.md](templates/cloud-providers/LLM-GATEWAY-SETUP.md) | [llm-gateway.md](claude-code-docs/llm-gateway.md) |

The LLM Gateway template covers LiteLLM-based setups with key rotation, multi-provider routing, and audit logging.

---

## Enterprise Resources

### Configuration Templates

- [ENTERPRISE-NETWORK.md](templates/enterprise/ENTERPRISE-NETWORK.md) - Network configuration: proxy setup, custom CA certificates, mTLS, credential refresh, and firewall rules.
- [ENTERPRISE-MANAGED-SETTINGS.md](templates/enterprise/ENTERPRISE-MANAGED-SETTINGS.md) - Org-wide managed settings: permission enforcement, model restrictions, audit logging.
- [PERMISSIONS-CICD.md](templates/permissions-security/PERMISSIONS-CICD.md) - CI/CD safe permission presets: read-only, test-running, controlled edits, cost controls.
- [SANDBOX-DEVCONTAINER.md](templates/permissions-security/SANDBOX-DEVCONTAINER.md) - DevContainer with built-in firewall, sandbox settings, and GitHub Codespaces support.

### Key Docs

- [Security](claude-code-docs/security.md) - Security model, permission system, threat mitigations.
- [Sandboxing](claude-code-docs/sandboxing.md) - OS-level isolation, filesystem rules, network restrictions, sandbox modes.
- [Server-Managed Settings](claude-code-docs/server-managed-settings.md) - Push org-wide settings to all users (Teams/Enterprise).
- [Network Configuration](claude-code-docs/network-config.md) - Proxy, custom CA, mTLS, credential refresh, domain allowlist.
- [Zero Data Retention](claude-code-docs/zero-data-retention.md) - ZDR configuration and verification.
- [Legal and Compliance](claude-code-docs/legal-and-compliance.md) - Compliance certifications and data processing terms.
- [Authentication](claude-code-docs/authentication.md) - API keys, OAuth, SSO, token management.

---

## Contributing

Suggestions for additions to this list are welcome. To propose a resource:

1. Open an issue on [github.com/CodeWithBehnam/cc-docs](https://github.com/CodeWithBehnam/cc-docs) describing the resource.
2. Include the URL, a one-line description, and which section it belongs in.
3. For plugins and MCP servers, please verify the resource is actively maintained before suggesting.

Guidelines:

- Only suggest real, publicly accessible resources.
- Prefer resources with clear documentation and an open-source license.
- Keep descriptions to one line.
- Do not suggest resources that duplicate an already-listed item without a clear reason.

See [CONTRIBUTING.md](CONTRIBUTING.md) for the full contribution guide.
