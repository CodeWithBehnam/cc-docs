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
  <img src="https://img.shields.io/badge/updates-hourly-blue?style=flat-square" alt="Hourly Updates">
</p>

---

A GitHub Actions workflow runs every hour, downloads the latest docs, and commits any changes automatically.

## What's Included

- 65+ markdown doc pages covering CLI reference, hooks, plugins, settings, MCP, desktop, and more
- `cheatsheets/` - concise quick-reference for every doc page
- `claude-code-docs/llms.txt` index file
- `claude-code-docs/` - 65+ markdown doc pages
- `templates/` with CLAUDE.md templates for hooks, skills, and sub-agents

## Documentation

The [`claude-code-docs/`](claude-code-docs/) folder contains all doc pages, organized by category.

| Category | Docs |
|---|---|
| **Getting Started** | [overview](claude-code-docs/overview.md) &#183; [quickstart](claude-code-docs/quickstart.md) &#183; [setup](claude-code-docs/setup.md) &#183; [how-claude-code-works](claude-code-docs/how-claude-code-works.md) |
| **Core Usage** | [interactive-mode](claude-code-docs/interactive-mode.md) &#183; [cli-reference](claude-code-docs/cli-reference.md) &#183; [commands](claude-code-docs/commands.md) &#183; [common-workflows](claude-code-docs/common-workflows.md) &#183; [best-practices](claude-code-docs/best-practices.md) &#183; [code-review](claude-code-docs/code-review.md) &#183; [keybindings](claude-code-docs/keybindings.md) &#183; [fast-mode](claude-code-docs/fast-mode.md) &#183; [output-styles](claude-code-docs/output-styles.md) &#183; [terminal-config](claude-code-docs/terminal-config.md) |
| **Memory & Settings** | [memory](claude-code-docs/memory.md) &#183; [settings](claude-code-docs/settings.md) &#183; [model-config](claude-code-docs/model-config.md) &#183; [permissions](claude-code-docs/permissions.md) &#183; [env-vars](claude-code-docs/env-vars.md) &#183; [statusline](claude-code-docs/statusline.md) |
| **Extensibility** | [features-overview](claude-code-docs/features-overview.md) &#183; [skills](claude-code-docs/skills.md) &#183; [sub-agents](claude-code-docs/sub-agents.md) &#183; [agent-teams](claude-code-docs/agent-teams.md) &#183; [plugins](claude-code-docs/plugins.md) &#183; [plugins-reference](claude-code-docs/plugins-reference.md) &#183; [discover-plugins](claude-code-docs/discover-plugins.md) &#183; [plugin-marketplaces](claude-code-docs/plugin-marketplaces.md) &#183; [hooks](claude-code-docs/hooks.md) &#183; [hooks-guide](claude-code-docs/hooks-guide.md) &#183; [mcp](claude-code-docs/mcp.md) |
| **IDE Integrations** | [vs-code](claude-code-docs/vs-code.md) &#183; [jetbrains](claude-code-docs/jetbrains.md) &#183; [chrome](claude-code-docs/chrome.md) &#183; [desktop](claude-code-docs/desktop.md) &#183; [desktop-quickstart](claude-code-docs/desktop-quickstart.md) &#183; [claude-code-on-the-web](claude-code-docs/claude-code-on-the-web.md) |
| **CI/CD & Automation** | [headless](claude-code-docs/headless.md) &#183; [github-actions](claude-code-docs/github-actions.md) &#183; [gitlab-ci-cd](claude-code-docs/gitlab-ci-cd.md) &#183; [remote-control](claude-code-docs/remote-control.md) &#183; [scheduled-tasks](claude-code-docs/scheduled-tasks.md) &#183; [slack](claude-code-docs/slack.md) |
| **Cloud Providers** | [amazon-bedrock](claude-code-docs/amazon-bedrock.md) &#183; [google-vertex-ai](claude-code-docs/google-vertex-ai.md) &#183; [microsoft-foundry](claude-code-docs/microsoft-foundry.md) &#183; [llm-gateway](claude-code-docs/llm-gateway.md) |
| **Enterprise & Security** | [authentication](claude-code-docs/authentication.md) &#183; [security](claude-code-docs/security.md) &#183; [sandboxing](claude-code-docs/sandboxing.md) &#183; [network-config](claude-code-docs/network-config.md) &#183; [server-managed-settings](claude-code-docs/server-managed-settings.md) &#183; [third-party-integrations](claude-code-docs/third-party-integrations.md) &#183; [data-usage](claude-code-docs/data-usage.md) &#183; [zero-data-retention](claude-code-docs/zero-data-retention.md) &#183; [legal-and-compliance](claude-code-docs/legal-and-compliance.md) |
| **Operations** | [costs](claude-code-docs/costs.md) &#183; [analytics](claude-code-docs/analytics.md) &#183; [monitoring-usage](claude-code-docs/monitoring-usage.md) &#183; [checkpointing](claude-code-docs/checkpointing.md) &#183; [devcontainer](claude-code-docs/devcontainer.md) &#183; [troubleshooting](claude-code-docs/troubleshooting.md) |
| **Reference** | [tools-reference](claude-code-docs/tools-reference.md) &#183; [changelog](claude-code-docs/changelog.md) &#183; [llms.txt](claude-code-docs/llms.txt) |

## Cheatsheets

The [`cheatsheets/`](cheatsheets/) folder has a scannable quick-reference for every doc page - tables, key commands, and gotchas at a glance.

| Category | Cheatsheets |
|---|---|
| **Getting Started** | [overview](cheatsheets/overview.md) &#183; [quickstart](cheatsheets/quickstart.md) &#183; [setup](cheatsheets/setup.md) &#183; [authentication](cheatsheets/authentication.md) &#183; [features-overview](cheatsheets/features-overview.md) |
| **Usage** | [interactive-mode](cheatsheets/interactive-mode.md) &#183; [cli-reference](cheatsheets/cli-reference.md) &#183; [commands](cheatsheets/commands.md) &#183; [keybindings](cheatsheets/keybindings.md) &#183; [common-workflows](cheatsheets/common-workflows.md) |
| **Configuration** | [settings](cheatsheets/settings.md) &#183; [env-vars](cheatsheets/env-vars.md) &#183; [memory](cheatsheets/memory.md) &#183; [permissions](cheatsheets/permissions.md) &#183; [model-config](cheatsheets/model-config.md) &#183; [output-styles](cheatsheets/output-styles.md) &#183; [fast-mode](cheatsheets/fast-mode.md) &#183; [statusline](cheatsheets/statusline.md) &#183; [server-managed-settings](cheatsheets/server-managed-settings.md) |
| **Extensions** | [hooks](cheatsheets/hooks.md) &#183; [hooks-guide](cheatsheets/hooks-guide.md) &#183; [mcp](cheatsheets/mcp.md) &#183; [plugins](cheatsheets/plugins.md) &#183; [plugins-reference](cheatsheets/plugins-reference.md) &#183; [discover-plugins](cheatsheets/discover-plugins.md) &#183; [plugin-marketplaces](cheatsheets/plugin-marketplaces.md) &#183; [skills](cheatsheets/skills.md) |
| **Agents** | [sub-agents](cheatsheets/sub-agents.md) &#183; [agent-teams](cheatsheets/agent-teams.md) &#183; [headless](cheatsheets/headless.md) &#183; [remote-control](cheatsheets/remote-control.md) &#183; [scheduled-tasks](cheatsheets/scheduled-tasks.md) |
| **IDEs & Platforms** | [vs-code](cheatsheets/vs-code.md) &#183; [jetbrains](cheatsheets/jetbrains.md) &#183; [chrome](cheatsheets/chrome.md) &#183; [desktop](cheatsheets/desktop.md) &#183; [desktop-quickstart](cheatsheets/desktop-quickstart.md) &#183; [claude-code-on-the-web](cheatsheets/claude-code-on-the-web.md) &#183; [terminal-config](cheatsheets/terminal-config.md) |
| **CI/CD** | [github-actions](cheatsheets/github-actions.md) &#183; [gitlab-ci-cd](cheatsheets/gitlab-ci-cd.md) &#183; [slack](cheatsheets/slack.md) &#183; [devcontainer](cheatsheets/devcontainer.md) |
| **Cloud Providers** | [amazon-bedrock](cheatsheets/amazon-bedrock.md) &#183; [google-vertex-ai](cheatsheets/google-vertex-ai.md) &#183; [microsoft-foundry](cheatsheets/microsoft-foundry.md) &#183; [llm-gateway](cheatsheets/llm-gateway.md) |
| **Security & Privacy** | [security](cheatsheets/security.md) &#183; [sandboxing](cheatsheets/sandboxing.md) &#183; [data-usage](cheatsheets/data-usage.md) &#183; [zero-data-retention](cheatsheets/zero-data-retention.md) &#183; [network-config](cheatsheets/network-config.md) &#183; [legal-and-compliance](cheatsheets/legal-and-compliance.md) &#183; [third-party-integrations](cheatsheets/third-party-integrations.md) |
| **Monitoring** | [costs](cheatsheets/costs.md) &#183; [monitoring-usage](cheatsheets/monitoring-usage.md) &#183; [analytics](cheatsheets/analytics.md) &#183; [checkpointing](cheatsheets/checkpointing.md) |
| **Reference** | [tools-reference](cheatsheets/tools-reference.md) &#183; [best-practices](cheatsheets/best-practices.md) &#183; [code-review](cheatsheets/code-review.md) &#183; [troubleshooting](cheatsheets/troubleshooting.md) &#183; [how-claude-code-works](cheatsheets/how-claude-code-works.md) &#183; [changelog](cheatsheets/changelog.md) |

## Templates

The [`templates/`](templates/) folder has ready-to-use templates for creating Claude Code extensions. Copy them into your project's `.claude/` directory and customize.

| Template | Description |
|---|---|
| [SKILL-TEMPLATE.md](templates/SKILL-TEMPLATE.md) | Skill templates - reference, task, research, codegen, and script-powered patterns |
| [SUBAGENT-TEMPLATE.md](templates/SUBAGENT-TEMPLATE.md) | Subagent templates - reviewer, debugger, domain expert, with-hooks, memory, background, and worktree patterns |
| [HOOKS-TEMPLATE.md](templates/HOOKS-TEMPLATE.md) | Hooks templates - formatter, protector, notifier, auditor, verifier, and all hook event types |

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
