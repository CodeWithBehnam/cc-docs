# Settings Cheatsheet

## Settings Files

| Scope | File | Shared? |
|---|---|---|
| Managed | system-level `managed-settings.json` or MDM/registry | Yes (IT-deployed) |
| User | `~/.claude/settings.json` | No (all your projects) |
| Project | `.claude/settings.json` | Yes (git-committed) |
| Local | `.claude/settings.local.json` | No (gitignored) |

Precedence (highest → lowest): **Managed > CLI args > Local > Project > User**

## Key Settings

| Key | Description | Example |
|---|---|---|
| `model` | Override default model | `"claude-sonnet-4-6"` |
| `effortLevel` | Persist effort level: `low`, `medium`, `high` | `"medium"` |
| `language` | Claude's response language | `"japanese"` |
| `autoUpdatesChannel` | `"latest"` (default) or `"stable"` | `"stable"` |
| `apiKeyHelper` | Shell script to generate API key | `"/bin/gen_key.sh"` |
| `autoMemoryEnabled` | Enable/disable auto memory | `false` |
| `autoMemoryDirectory` | Custom auto-memory storage path | `"~/my-memory"` |
| `cleanupPeriodDays` | Days before sessions are deleted (default: 30) | `20` |
| `env` | Env vars applied to every session | `{"FOO": "bar"}` |
| `outputStyle` | Adjust system prompt style | `"Explanatory"` |
| `forceLoginMethod` | `claudeai` or `console` | `"claudeai"` |
| `disableAllHooks` | Disable all hooks and status line | `true` |
| `alwaysThinkingEnabled` | Enable extended thinking by default | `true` |
| `showTurnDuration` | Show "Cooked for Xm Xs" messages | `false` |
| `includeGitInstructions` | Include built-in git workflow instructions | `false` |
| `respectGitignore` | `@` file picker respects `.gitignore` | `false` |

## Permission Settings (under `permissions`)

```json
{
  "permissions": {
    "allow": ["Bash(npm run *)"],
    "ask":   ["Bash(git push *)"],
    "deny":  ["Read(./.env)", "WebFetch"],
    "additionalDirectories": ["../docs/"],
    "defaultMode": "acceptEdits"
  }
}
```

## Sandbox Settings (under `sandbox`)

```json
{
  "sandbox": {
    "enabled": true,
    "autoAllowBashIfSandboxed": true,
    "excludedCommands": ["docker"],
    "filesystem": {
      "allowWrite": ["//tmp/build", "~/.kube"],
      "denyRead": ["~/.aws/credentials"]
    },
    "network": {
      "allowedDomains": ["github.com", "*.npmjs.org"],
      "allowLocalBinding": true
    }
  }
}
```

## Attribution Settings

```json
{
  "attribution": {
    "commit": "Generated with Claude Code",
    "pr": ""
  }
}
```

## Worktree Settings

```json
{
  "worktree": {
    "symlinkDirectories": ["node_modules", ".cache"],
    "sparsePaths": ["packages/my-app", "shared/utils"]
  }
}
```

## Minimal Example `settings.json`

```json
{
  "$schema": "https://json.schemastore.org/claude-code-settings.json",
  "permissions": {
    "allow": ["Bash(npm run lint)", "Bash(npm run test *)"],
    "deny":  ["Read(./.env)", "Read(./secrets/**)"]
  },
  "env": {
    "CLAUDE_CODE_ENABLE_TELEMETRY": "1"
  }
}
```

## Open Settings UI

```text
/config      # opens Settings interface in Claude Code
```

---
> Source: [settings.md](../settings.md)
