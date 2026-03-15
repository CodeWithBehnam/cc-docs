# Permissions Cheatsheet

## Permission Tiers

| Tool type | Example | Approval required | "Don't ask again" |
|---|---|---|---|
| Read-only | File reads, Grep | No | N/A |
| Bash commands | Shell execution | Yes | Permanent per project+command |
| File modification | Edit/write files | Yes | Until session end |

## Permission Modes

| Mode | Behavior |
|---|---|
| `default` | Prompt on first use of each tool |
| `acceptEdits` | Auto-accept file edits for session |
| `plan` | Analyze only — no file edits or command execution |
| `dontAsk` | Auto-deny unless pre-approved |
| `bypassPermissions` | Skip all prompts (safe environments only) |

Set `defaultMode` in `settings.json` or use `--permission-mode <mode>` flag.

## Rule Syntax

Rules follow `Tool` or `Tool(specifier)` format. Evaluated: **deny → ask → allow** (first match wins).

```json
{
  "permissions": {
    "allow": ["Bash(npm run *)", "Bash(git commit *)"],
    "ask":   ["Bash(git push *)"],
    "deny":  ["Bash(curl *)", "Read(./.env)", "WebFetch"]
  }
}
```

## Wildcard Patterns

| Rule | Matches |
|---|---|
| `Bash` | All bash commands |
| `Bash(npm run *)` | Commands starting with `npm run ` |
| `Bash(* --version)` | Any command ending with ` --version` |
| `Bash(git * main)` | `git checkout main`, `git merge main`, etc. |
| `Read(./.env)` | Reading `.env` in current directory |
| `WebFetch(domain:github.com)` | Fetch to github.com |
| `mcp__puppeteer__*` | All tools from puppeteer MCP server |
| `Agent(Explore)` | The Explore subagent |

- `Bash(ls *)` matches `ls -la` but NOT `lsof` (word boundary)
- `Bash(ls*)` matches both `ls -la` AND `lsof` (no boundary)
- Shell operators (`&&`) are NOT matched by prefix rules

## Read/Edit Path Patterns

| Pattern | Meaning |
|---|---|
| `//path` | Absolute path from filesystem root |
| `~/path` | Relative to home directory |
| `/path` | Relative to project root |
| `path` or `./path` | Relative to current directory |

> `/Users/alice/file` is NOT absolute — use `//Users/alice/file` for absolute.

## Settings Precedence (highest → lowest)

1. **Managed** — cannot be overridden by anything
2. **CLI flags** (`--allowedTools`, `--disallowedTools`)
3. **Local project** (`.claude/settings.local.json`)
4. **Shared project** (`.claude/settings.json`)
5. **User** (`~/.claude/settings.json`)

If denied at any level, no other level can allow it.

## Working Directories

```bash
claude --add-dir ../lib ../shared   # at startup
/add-dir ../lib                     # during session
```

Or add to `settings.json`:
```json
{ "permissions": { "additionalDirectories": ["../docs/"] } }
```

## Managed-Only Settings

| Setting | Effect |
|---|---|
| `disableBypassPermissionsMode: "disable"` | Prevent `bypassPermissions` mode org-wide |
| `allowManagedPermissionRulesOnly: true` | Block user/project from adding allow/ask/deny rules |
| `allowManagedHooksOnly: true` | Block user/project hooks |
| `allowManagedMcpServersOnly: true` | Only managed MCP allowlist applies |

## Permissions + Sandboxing
- **Permissions**: control which tools/files/domains Claude can access
- **Sandboxing**: OS-level enforcement for Bash subprocesses
- Use both for defense-in-depth

---
> Source: [permissions.md](../permissions.md)
