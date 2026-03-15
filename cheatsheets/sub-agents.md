# Sub-Agents Cheatsheet

## What Subagents Are

Specialized AI assistants with custom system prompts, tool access, and permissions. Run in isolated context windows. Claude delegates tasks automatically based on descriptions.

## Built-in Subagents

| Agent | Model | Tools | Purpose |
| :--- | :--- | :--- | :--- |
| `Explore` | Haiku | Read-only | Fast codebase search & analysis |
| `Plan` | Inherits | Read-only | Research during plan mode |
| `general-purpose` | Inherits | All | Complex multi-step tasks |
| `Bash` | Inherits | Bash | Terminal commands |

## Create a Subagent

### Via `/agents` command (recommended)

```text
/agents → Create new agent → User-level → Generate with Claude
```

### Manual file

```markdown
---
name: code-reviewer
description: Expert code reviewer. Use proactively after code changes.
tools: Read, Grep, Glob, Bash
model: sonnet
---

You are a senior code reviewer. Analyze code for quality, security, and best practices.
```

## Subagent Locations & Priority

| Location | Scope | Priority |
| :--- | :--- | :--- |
| `--agents` CLI flag | Current session only | 1 (highest) |
| `.claude/agents/` | Current project | 2 |
| `~/.claude/agents/` | All projects | 3 |
| Plugin `agents/` | Where plugin enabled | 4 (lowest) |

## Frontmatter Fields

| Field | Required | Description |
| :--- | :--- | :--- |
| `name` | Yes | Unique ID (lowercase, hyphens) |
| `description` | Yes | When Claude should delegate here |
| `tools` | No | Allowlist of tools; inherits all if omitted |
| `disallowedTools` | No | Denylist (removed from inherited/specified) |
| `model` | No | `sonnet`, `opus`, `haiku`, full model ID, or `inherit` |
| `permissionMode` | No | `default`, `acceptEdits`, `dontAsk`, `bypassPermissions`, `plan` |
| `maxTurns` | No | Max agentic turns before stopping |
| `skills` | No | Skills preloaded into context at startup |
| `mcpServers` | No | MCP servers (inline or by name reference) |
| `hooks` | No | Lifecycle hooks scoped to this agent |
| `memory` | No | Persistent memory: `user`, `project`, or `local` |
| `background` | No | `true` = always run as background task |
| `isolation` | No | `worktree` = isolated git worktree |

## Tool Restrictions

```yaml
tools: Read, Grep, Glob, Bash    # allowlist
disallowedTools: Write, Edit      # denylist
```

Restrict spawnable subagent types:
```yaml
tools: Agent(worker, researcher), Read, Bash   # only these agent types
```

## Permission Modes

| Mode | Behavior |
| :--- | :--- |
| `default` | Standard prompts |
| `acceptEdits` | Auto-accept file edits |
| `dontAsk` | Auto-deny prompts (allowed tools still work) |
| `bypassPermissions` | Skip all checks (use with caution) |
| `plan` | Read-only plan mode |

## Persistent Memory

```yaml
memory: user    # ~/.claude/agent-memory/<name>/
memory: project # .claude/agent-memory/<name>/  (shareable)
memory: local   # .claude/agent-memory-local/<name>/  (gitignored)
```

When enabled: agent reads/writes `MEMORY.md` in the memory dir; first 200 lines injected into context.

## Preload Skills

```yaml
skills:
  - api-conventions
  - error-handling-patterns
```

Full skill content is injected at startup (not just made available).

## Foreground vs Background

- **Foreground**: blocks main conversation; permission prompts pass through
- **Background**: concurrent; permissions pre-approved at spawn; press `Ctrl+B` to background
- Disable all background tasks: `CLAUDE_CODE_DISABLE_BACKGROUND_TASKS=1`

## Disable Specific Subagents

```json
// settings.json
{ "permissions": { "deny": ["Agent(Explore)", "Agent(my-custom-agent)"] } }
```

Or: `claude --disallowedTools "Agent(Explore)"`

## CLI-Defined Subagents (session only)

```bash
claude --agents '{
  "code-reviewer": {
    "description": "Expert reviewer. Use proactively after code changes.",
    "prompt": "You are a senior code reviewer...",
    "tools": ["Read", "Grep", "Glob"],
    "model": "sonnet"
  }
}'
```

## Resume a Subagent

```text
Use the code-reviewer subagent to review auth module
[completes]
Continue that review and check the authorization logic
```

Transcripts: `~/.claude/projects/{project}/{sessionId}/subagents/agent-{id}.jsonl`

## When to Use Subagents vs Main Conversation

Use **subagents** when:
- Task produces verbose output you don't need in main context
- Need specific tool restrictions or permissions
- Work is self-contained and can return a summary

Use **main conversation** when:
- Needs iterative back-and-forth
- Multiple phases share significant context
- Quick targeted change

---
> Source: [sub-agents.md](../sub-agents.md)
