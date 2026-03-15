# Plugins Reference Cheatsheet

## Plugin Manifest Schema (`.claude-plugin/plugin.json`)

```json
{
  "name": "plugin-name",          // required; kebab-case; becomes namespace
  "version": "1.2.0",
  "description": "Brief description",
  "author": { "name": "...", "email": "...", "url": "..." },
  "homepage": "https://...",
  "repository": "https://github.com/...",
  "license": "MIT",
  "keywords": ["tag1", "tag2"],
  "commands": "./custom/commands/",
  "agents": "./custom/agents/",
  "skills": "./custom/skills/",
  "hooks": "./config/hooks.json",
  "mcpServers": "./.mcp.json",
  "outputStyles": "./styles/",
  "lspServers": "./.lsp.json"
}
```

Manifest is **optional** — Claude Code auto-discovers components from default locations.

## File Locations Reference

| Component | Default location | Notes |
| :--- | :--- | :--- |
| Manifest | `.claude-plugin/plugin.json` | Only file inside `.claude-plugin/` |
| Commands | `commands/` | Legacy; prefer `skills/` |
| Skills | `skills/<name>/SKILL.md` | Recommended for new skills |
| Agents | `agents/` | Subagent markdown files |
| Hooks | `hooks/hooks.json` | Event handler config |
| MCP servers | `.mcp.json` | MCP server definitions |
| LSP servers | `.lsp.json` | Language server configs |
| Settings | `settings.json` | Default config (only `agent` key supported) |

## Installation Scopes

| Scope | Settings file | Use case |
| :--- | :--- | :--- |
| `user` | `~/.claude/settings.json` | Personal, all projects (default) |
| `project` | `.claude/settings.json` | Team, via version control |
| `local` | `.claude/settings.local.json` | Project-specific, gitignored |
| `managed` | Managed settings | Admin-controlled, read-only |

## CLI Commands

```bash
claude plugin install <plugin>[@marketplace]   # install (default: user scope)
claude plugin install <plugin> --scope project  # install to project
claude plugin uninstall <plugin>               # remove (alias: rm, remove)
claude plugin enable <plugin>                  # re-enable disabled plugin
claude plugin disable <plugin>                 # disable without uninstalling
claude plugin update <plugin>                  # update to latest version
```

## Environment Variable

`${CLAUDE_PLUGIN_ROOT}` — absolute path to plugin directory. Use in hooks and MCP server configs:
```json
{ "command": "${CLAUDE_PLUGIN_ROOT}/scripts/run.sh" }
```

## Path Rules

- All custom paths must be relative and start with `./`
- Custom paths **supplement** (don't replace) default directories
- Installed plugins are copied to `~/.claude/plugins/cache` — cannot reference files outside plugin dir
- Use symlinks inside plugin dir for external shared files

## LSP Server Fields

| Field | Required | Description |
| :--- | :--- | :--- |
| `command` | Yes | LSP binary (must be in PATH) |
| `extensionToLanguage` | Yes | `{ ".ts": "typescript" }` |
| `args` | No | CLI arguments |
| `transport` | No | `stdio` (default) or `socket` |
| `env` | No | Environment variables |
| `restartOnCrash` | No | Auto-restart if server crashes |

## Available LSP Plugins (Official Marketplace)

| Plugin | Language | Binary |
| :--- | :--- | :--- |
| `pyright-lsp` | Python | `pyright-langserver` |
| `typescript-lsp` | TypeScript | `typescript-language-server` |
| `rust-analyzer-lsp` | Rust | `rust-analyzer` |
| `gopls-lsp` | Go | `gopls` |

## Debugging

```bash
claude --debug          # see plugin loading details
/plugin validate .      # validate plugin/marketplace JSON
```

## Common Issues

| Issue | Cause | Fix |
| :--- | :--- | :--- |
| Plugin not loading | Invalid JSON | Run `claude plugin validate` |
| Commands missing | Wrong dir structure | Ensure `commands/` at root, not in `.claude-plugin/` |
| Hooks not firing | Script not executable | `chmod +x script.sh` |
| MCP server fails | Missing `${CLAUDE_PLUGIN_ROOT}` | Use variable for all paths |
| LSP binary not found | Binary not installed | Install e.g. `npm i -g typescript-language-server` |

## Versioning

Follow semantic versioning: `MAJOR.MINOR.PATCH`
- Must bump version in `plugin.json` for cached users to receive updates

---
> Source: [plugins-reference.md](../plugins-reference.md)
