# Claude Code Documentation Index

## Writing Rules

- NEVER use em-dashes ('—') in any generated text. Use commas, periods, parentheses, or regular hyphens instead.

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

Ready-to-use templates for creating new Claude Code extensions. **Use these as starting points** when asked to create skills, subagents, or hooks.

| File | Description |
|------|-------------|
| `templates/SKILL-TEMPLATE.md` | Comprehensive skill templates - reference, task, research, codegen, and script-powered patterns |
| `templates/SUBAGENT-TEMPLATE.md` | Comprehensive subagent templates - reviewer, debugger, domain expert, with-hooks, memory, background, and worktree patterns |
| `templates/HOOKS-TEMPLATE.md` | Comprehensive hooks templates - formatter, protector, notifier, auditor, verifier, and all hook event types |

### Reference

| File | Description |
|------|-------------|
| `claude-code-docs/changelog.md` | Full changelog of Claude Code releases |
| `claude-code-docs/llms.txt` | Raw doc index used by the download script |
