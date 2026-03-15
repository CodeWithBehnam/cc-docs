# Plugin Marketplaces Cheatsheet

## What a Marketplace Is

A `marketplace.json` catalog file that lists plugins and where to fetch them. Hosted in a git repo; users add it once, then install individual plugins.

## Minimal `marketplace.json`

```json
// .claude-plugin/marketplace.json
{
  "name": "my-plugins",
  "owner": { "name": "Your Name" },
  "plugins": [
    {
      "name": "quality-review-plugin",
      "source": "./plugins/quality-review-plugin",
      "description": "Adds /quality-review skill"
    }
  ]
}
```

## Required Fields

| Field | Description |
| :--- | :--- |
| `name` | Marketplace identifier (kebab-case); users see this as `@marketplace-name` |
| `owner.name` | Maintainer name |
| `plugins` | Array of plugin entries |

Each plugin entry needs `name` and `source` at minimum.

## Plugin Sources

| Type | Example |
| :--- | :--- |
| Relative path | `"source": "./plugins/my-plugin"` |
| GitHub | `{ "source": "github", "repo": "owner/repo" }` |
| Git URL | `{ "source": "url", "url": "https://gitlab.com/org/repo.git" }` |
| Git subdir | `{ "source": "git-subdir", "url": "...", "path": "tools/plugin" }` |
| npm | `{ "source": "npm", "package": "@org/plugin", "version": "2.1.0" }` |
| pip | `{ "source": "pip", "package": "my-plugin" }` |

Pin to exact commit: add `"sha": "<40-char-sha>"` to any git source.
Pin to branch/tag: add `"ref": "v2.0.0"`.

## Host & Distribute

```bash
# Users add via GitHub shorthand
/plugin marketplace add owner/repo

# Via git URL
/plugin marketplace add https://gitlab.com/org/plugins.git

# Local path (testing)
/plugin marketplace add ./my-marketplace

# Specific branch
/plugin marketplace add https://gitlab.com/org/plugins.git#v1.0.0
```

## Team Auto-Setup (`.claude/settings.json`)

```json
{
  "extraKnownMarketplaces": {
    "company-tools": {
      "source": { "source": "github", "repo": "your-org/claude-plugins" }
    }
  },
  "enabledPlugins": {
    "code-formatter@company-tools": true
  }
}
```

## Managed Marketplace Restrictions (`strictKnownMarketplaces`)

```json
// In managed-settings.json
{ "strictKnownMarketplaces": [] }                    // lock down completely
{ "strictKnownMarketplaces": [{"source":"github","repo":"acme/approved"}] }  // allowlist
{ "strictKnownMarketplaces": [{"source":"hostPattern","hostPattern":"^github\\.internal\\.com$"}] }
{ "strictKnownMarketplaces": [{"source":"pathPattern","pathPattern":"^/opt/approved/"}] }
```

## Strict Mode

| Value | Behavior |
| :--- | :--- |
| `true` (default) | `plugin.json` is authority; marketplace entry supplements it |
| `false` | Marketplace entry is sole authority; plugin must not have component-defining `plugin.json` |

## Validate & Test

```bash
claude plugin validate .              # validate JSON
/plugin validate .                    # same, inside Claude Code
/plugin marketplace add ./my-mktpl   # add local for testing
/plugin install plugin@my-mktpl      # test installation
```

## Version Management

- Set version in `plugin.json` OR `marketplace.json` (not both — plugin manifest wins)
- Must bump version for cached users to receive updates
- Release channels: two marketplace repos pointing to different `ref`s of same plugin repo

## Auth for Private Repos

| Provider | Token env var |
| :--- | :--- |
| GitHub | `GITHUB_TOKEN` or `GH_TOKEN` |
| GitLab | `GITLAB_TOKEN` or `GL_TOKEN` |
| Bitbucket | `BITBUCKET_TOKEN` |

Git clone timeout: 120s. Increase with `CLAUDE_CODE_PLUGIN_GIT_TIMEOUT_MS=300000`.

## Troubleshooting

- Relative paths fail with URL-based marketplaces → switch to GitHub/npm sources or use git-based marketplace
- Files not found after install → plugins are copied to cache; use symlinks for external deps
- `Duplicate plugin name` → give each plugin a unique `name`

---
> Source: [plugin-marketplaces.md](../plugin-marketplaces.md)
