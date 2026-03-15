# CLI Reference Cheatsheet

## Core Commands

| Command | Description |
|---|---|
| `claude` | Start interactive session |
| `claude "query"` | Start session with initial prompt |
| `claude -p "query"` | Print mode: query then exit |
| `cat file \| claude -p "q"` | Process piped content |
| `claude -c` | Continue most recent conversation |
| `claude -c -p "query"` | Continue via print mode |
| `claude -r "name" "query"` | Resume session by ID or name |
| `claude update` | Update to latest version |
| `claude auth login` | Sign in (use `--email`, `--sso`) |
| `claude auth logout` | Sign out |
| `claude auth status` | Show auth status (`--text` for readable) |
| `claude agents` | List configured subagents |
| `claude mcp` | Configure MCP servers |
| `claude remote-control` | Start remote control server |

## Frequently Used Flags

| Flag | Description |
|---|---|
| `-p`, `--print` | Non-interactive print mode |
| `-c`, `--continue` | Load most recent conversation |
| `-r`, `--resume` | Resume by ID/name or show picker |
| `-n`, `--name` | Set session display name |
| `-w`, `--worktree` | Start in isolated git worktree |
| `--model` | Set model (`sonnet`, `opus`, or full ID) |
| `--effort` | Set effort: `low`, `medium`, `high`, `max` |
| `--add-dir` | Add extra working directories |
| `--allowedTools` | Tools that run without permission prompt |
| `--disallowedTools` | Tools that are removed from context |
| `--tools` | Restrict built-in tools (`"Bash,Edit,Read"`) |
| `--permission-mode` | Start in a specific permission mode |
| `--dangerously-skip-permissions` | Skip all permission prompts |
| `--max-turns` | Limit agentic turns (print mode only) |
| `--max-budget-usd` | Spend cap in dollars (print mode only) |
| `--output-format` | `text`, `json`, `stream-json` |
| `--verbose` | Show full turn-by-turn output |
| `--debug` | Enable debug mode (filter: `"api,mcp"`) |
| `--mcp-config` | Load MCP servers from JSON file |
| `--plugin-dir` | Load plugins from directory |

## System Prompt Flags

| Flag | Behavior |
|---|---|
| `--system-prompt` | Replace entire default prompt |
| `--system-prompt-file` | Replace with file contents |
| `--append-system-prompt` | Append to default prompt |
| `--append-system-prompt-file` | Append file contents to default prompt |

> Prefer append flags — they preserve Claude's built-in capabilities.
> `--system-prompt` and `--system-prompt-file` are mutually exclusive.

## Useful Combinations

```bash
# Pipe logs for analysis
tail -f app.log | claude -p "alert me to anomalies"

# CI usage with budget cap
claude -p --max-budget-usd 2.00 "review this PR for bugs"

# Resume named session
claude -r "auth-refactor" "finish the PR"

# JSON structured output
claude -p --output-format json "summarize the codebase"

# Isolated worktree for parallel work
claude -w feature-auth
```

---
> Source: [cli-reference.md](../cli-reference.md)
