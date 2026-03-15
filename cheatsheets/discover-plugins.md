# Discover Plugins Cheatsheet

## Official Marketplace

Available automatically as `claude-plugins-official`. No setup needed.

```shell
/plugin install plugin-name@claude-plugins-official
```

Browse: run `/plugin` → **Discover** tab.

## Add a Marketplace

```shell
/plugin marketplace add owner/repo              # GitHub shorthand
/plugin marketplace add https://gitlab.com/org/plugins.git
/plugin marketplace add https://gitlab.com/org/plugins.git#v1.0.0  # pin branch
/plugin marketplace add ./my-local-marketplace  # local path
/plugin marketplace add https://example.com/marketplace.json  # remote URL
```

Demo marketplace: `/plugin marketplace add anthropics/claude-code`

## Plugin Manager UI

Run `/plugin` — tabs:

| Tab | Purpose |
| :--- | :--- |
| **Discover** | Browse available plugins from all marketplaces |
| **Installed** | View/manage installed plugins by scope |
| **Marketplaces** | Add, update, remove marketplaces |
| **Errors** | Plugin loading errors |

## Install Plugins

```shell
/plugin install plugin-name@marketplace-name     # user scope (default)
claude plugin install formatter@my-mktpl --scope project  # project scope
claude plugin install formatter@my-mktpl --scope local    # local scope
```

Installation scopes: `user` (all projects), `project` (team, in `.claude/settings.json`), `local` (gitignored).

## Manage Plugins

```shell
/plugin disable plugin-name@marketplace          # disable without uninstalling
/plugin enable  plugin-name@marketplace          # re-enable
/plugin uninstall plugin-name@marketplace        # remove completely
/reload-plugins                                  # apply changes without restart
```

LSP server changes require a full restart.

## Manage Marketplaces

```shell
/plugin marketplace list                         # list configured marketplaces
/plugin marketplace update marketplace-name      # refresh plugin listings
/plugin marketplace remove marketplace-name      # remove (also uninstalls plugins)
```

## Auto-Updates

- Official Anthropic marketplaces: auto-update **on** by default
- Third-party / local: auto-update **off** by default
- Toggle per-marketplace in `/plugin` → **Marketplaces**
- Disable all updates: `DISABLE_AUTOUPDATER=1`
- Plugin-only updates: `DISABLE_AUTOUPDATER=1` + `FORCE_AUTOUPDATE_PLUGINS=true`

## Official Marketplace Categories

### Code Intelligence (LSP)

| Plugin | Language | Binary needed |
| :--- | :--- | :--- |
| `pyright-lsp` | Python | `pyright-langserver` |
| `typescript-lsp` | TypeScript | `typescript-language-server` |
| `rust-analyzer-lsp` | Rust | `rust-analyzer` |
| `gopls-lsp` | Go | `gopls` |
| `clangd-lsp` | C/C++ | `clangd` |
| `kotlin-lsp` | Kotlin | `kotlin-language-server` |

LSP plugins give Claude: auto-diagnostics after edits + go-to-definition / find-references.

### External Integrations (MCP bundles)

`github`, `gitlab`, `atlassian`, `asana`, `linear`, `notion`, `figma`, `vercel`, `firebase`, `supabase`, `slack`, `sentry`

### Development Workflows

`commit-commands`, `pr-review-toolkit`, `agent-sdk-dev`, `plugin-dev`

### Output Styles

`explanatory-output-style`, `learning-output-style`

## Team Configuration

```json
// .claude/settings.json
{
  "extraKnownMarketplaces": {
    "my-team-tools": {
      "source": { "source": "github", "repo": "your-org/claude-plugins" }
    }
  }
}
```

Members are prompted to install when trusting the project folder.

## Troubleshooting

- `/plugin` not recognized → update to Claude Code v1.0.33+
- Plugin skills not appearing → `rm -rf ~/.claude/plugins/cache` and reinstall
- LSP binary not found → check `/plugin` Errors tab; install the required binary
- High LSP memory usage → `/plugin disable <lsp-plugin>`

---
> Source: [discover-plugins.md](../discover-plugins.md)
