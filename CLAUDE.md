# Claude Code Documentation Index

## Writing Rules

- NEVER use em-dashes ('—') in any generated text. Use commas, periods, parentheses, or regular hyphens instead.

This folder contains the official Claude Code documentation, downloaded from <https://code.claude.com/docs>.

## Maintenance

When updating these docs (via `/.claude/scripts/companions/download-cc-docs.sh`), **you must also update this index file** to reflect any added, removed, or renamed pages.

## Document Index

### Getting Started

| File | Description |
|------|-------------|
| `overview.md` | Claude Code overview — what it is, key capabilities |
| `quickstart.md` | Quickstart guide for first-time setup |
| `setup.md` | Advanced setup and installation options |
| `how-claude-code-works.md` | Architecture and inner workings of Claude Code |

### Core Usage

| File | Description |
|------|-------------|
| `interactive-mode.md` | Interactive (REPL) mode usage and commands |
| `cli-reference.md` | Full CLI reference — flags, options, commands |
| `common-workflows.md` | Common workflows and usage patterns |
| `best-practices.md` | Best practices for effective Claude Code usage |
| `keybindings.md` | Customize keyboard shortcuts |
| `fast-mode.md` | Speed up responses with fast mode |
| `output-styles.md` | Configure output formatting styles |
| `terminal-config.md` | Optimize terminal setup for Claude Code |

### Memory & Settings

| File | Description |
|------|-------------|
| `memory.md` | Manage Claude's memory (CLAUDE.md files, auto-memory) |
| `settings.md` | Full settings reference — all configuration options |
| `model-config.md` | Model configuration — choosing and switching models |
| `permissions.md` | Configure tool permissions and approval modes |
| `statusline.md` | Customize the status line display |

### Extensibility

| File | Description |
|------|-------------|
| `features-overview.md` | Overview of extension points (skills, plugins, hooks, MCP, subagents) |
| `skills.md` | Create and use skills (slash commands) |
| `sub-agents.md` | Create custom subagents for specialized tasks |
| `agent-teams.md` | Orchestrate teams of Claude Code sessions |
| `plugins.md` | Create plugins to extend Claude Code |
| `plugins-reference.md` | Plugins technical reference |
| `discover-plugins.md` | Discover and install prebuilt plugins |
| `plugin-marketplaces.md` | Create and distribute plugin marketplaces |
| `hooks.md` | Hooks technical reference |
| `hooks-guide.md` | Practical guide to automating workflows with hooks |
| `mcp.md` | Connect Claude Code to external tools via MCP |

### IDE Integrations

| File | Description |
|------|-------------|
| `vs-code.md` | Use Claude Code in VS Code |
| `jetbrains.md` | Use Claude Code in JetBrains IDEs |
| `chrome.md` | Use Claude Code with Chrome (beta) |
| `desktop.md` | Use Claude Code Desktop app |
| `desktop-quickstart.md` | Get started with the desktop app |
| `claude-code-on-the-web.md` | Claude Code on the web |

### CI/CD & Automation

| File | Description |
|------|-------------|
| `headless.md` | Run Claude Code programmatically (non-interactive) |
| `github-actions.md` | Claude Code in GitHub Actions |
| `gitlab-ci-cd.md` | Claude Code in GitLab CI/CD |
| `remote-control.md` | Continue local sessions from any device |
| `slack.md` | Claude Code in Slack |

### Cloud Providers

| File | Description |
|------|-------------|
| `amazon-bedrock.md` | Claude Code on Amazon Bedrock |
| `google-vertex-ai.md` | Claude Code on Google Vertex AI |
| `microsoft-foundry.md` | Claude Code on Microsoft Foundry |
| `llm-gateway.md` | LLM gateway configuration for proxies |

### Enterprise & Security

| File | Description |
|------|-------------|
| `authentication.md` | Authentication setup |
| `security.md` | Security model and practices |
| `sandboxing.md` | Sandboxing and isolation |
| `network-config.md` | Enterprise network configuration |
| `server-managed-settings.md` | Server-managed settings (public beta) |
| `third-party-integrations.md` | Enterprise deployment overview |
| `data-usage.md` | Data usage and privacy |
| `legal-and-compliance.md` | Legal and compliance information |

### Operations

| File | Description |
|------|-------------|
| `costs.md` | Manage costs effectively |
| `analytics.md` | Track team usage with analytics |
| `monitoring-usage.md` | Monitor usage and performance |
| `checkpointing.md` | Checkpointing — save and restore state |
| `devcontainer.md` | Development containers setup |
| `troubleshooting.md` | Troubleshooting common issues |

### Templates (`templates/`)

Ready-to-use templates for creating new Claude Code extensions. **Use these as starting points** when asked to create skills, subagents, or hooks.

| File | Description |
|------|-------------|
| `templates/SKILL-TEMPLATE.md` | Comprehensive skill templates — reference, task, research, codegen, and script-powered patterns |
| `templates/SUBAGENT-TEMPLATE.md` | Comprehensive subagent templates — reviewer, debugger, domain expert, with-hooks, memory, background, and worktree patterns |
| `templates/HOOKS-TEMPLATE.md` | Comprehensive hooks templates — formatter, protector, notifier, auditor, verifier, and all hook event types |

### Reference

| File | Description |
|------|-------------|
| `changelog.md` | Full changelog of Claude Code releases |
| `llms.txt` | Raw doc index used by the download script |
