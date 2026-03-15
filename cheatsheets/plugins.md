# Plugins Cheatsheet

## Standalone vs Plugin

| Approach | Skill names | Best for |
| :--- | :--- | :--- |
| Standalone (`.claude/`) | `/hello` | Personal, single-project, quick experiments |
| Plugin (dir with `.claude-plugin/plugin.json`) | `/plugin-name:hello` | Sharing, multi-project, distributing |

## Plugin Structure

```
my-plugin/
├── .claude-plugin/
│   └── plugin.json        # manifest (only file here)
├── commands/              # skills as .md files (legacy)
├── skills/                # skills with SKILL.md dirs
├── agents/                # custom agent definitions
├── hooks/
│   └── hooks.json         # event handlers
├── .mcp.json              # MCP server configs
├── .lsp.json              # LSP server configs
└── settings.json          # default settings
```

> **Common mistake**: `commands/`, `agents/`, `skills/`, `hooks/` go at the **plugin root**, NOT inside `.claude-plugin/`.

## Minimal `plugin.json`

```json
{
  "name": "my-plugin",
  "description": "What it does",
  "version": "1.0.0",
  "author": { "name": "Your Name" }
}
```

`name` is the only required field. It becomes the skill namespace prefix.

## Create & Test Locally

```bash
mkdir my-plugin && mkdir my-plugin/.claude-plugin
# create my-plugin/.claude-plugin/plugin.json
# create my-plugin/skills/hello/SKILL.md

claude --plugin-dir ./my-plugin    # load for testing
/my-plugin:hello                   # run the skill
/reload-plugins                    # reload after changes
```

Load multiple plugins: `claude --plugin-dir ./p1 --plugin-dir ./p2`

## Adding a Skill

```
skills/
└── code-review/
    └── SKILL.md
```

```yaml
---
name: code-review
description: Reviews code. Use when reviewing PRs or analyzing quality.
---

Check for: code organization, error handling, security, test coverage.
```

## Adding an Agent

```markdown
---
name: security-reviewer
description: Reviews code for security issues
---

You are a security specialist. Analyze code for vulnerabilities...
```

## Adding Hooks

```json
// hooks/hooks.json
{
  "hooks": {
    "PostToolUse": [{
      "matcher": "Write|Edit",
      "hooks": [{ "type": "command", "command": "${CLAUDE_PLUGIN_ROOT}/scripts/lint.sh" }]
    }]
  }
}
```

## Default Settings

```json
// settings.json at plugin root
{ "agent": "security-reviewer" }
```
Only the `agent` key is currently supported.

## LSP Server

```json
// .lsp.json
{
  "go": {
    "command": "gopls",
    "args": ["serve"],
    "extensionToLanguage": { ".go": "go" }
  }
}
```
User must install the LSP binary separately.

## Submit to Official Marketplace

- Claude.ai: `claude.ai/settings/plugins/submit`
- Console: `platform.claude.com/plugins/submit`

## Migrating Standalone → Plugin

```bash
mkdir -p my-plugin/.claude-plugin
# create plugin.json
cp -r .claude/commands my-plugin/
cp -r .claude/agents my-plugin/
cp -r .claude/skills my-plugin/
# move hooks from settings.json → my-plugin/hooks/hooks.json
```

After migration: skill names become `/my-plugin:name` (namespaced).

---
> Source: [plugins.md](../plugins.md)
