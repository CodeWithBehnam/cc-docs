# How Claude Code Works Cheatsheet

## The Agentic Loop
Three phases that blend together for every task:
1. **Gather context** — read files, search code, understand state
2. **Take action** — edit files, run commands, call tools
3. **Verify results** — run tests, check output, course-correct

You can interrupt at any point. Press `Esc` to stop; redirect with a new message.

## Built-in Tool Categories
| Category | Capabilities |
|---|---|
| File operations | Read, edit, create, rename files |
| Search | Find files by pattern, grep content, explore codebases |
| Execution | Shell commands, git, build tools, test runners |
| Web | Search web, fetch docs, look up errors |
| Code intelligence | Type errors, go-to-definition, find references (needs plugin) |

## What Claude Sees
- All files in your working directory and subdirectories
- Your terminal (any CLI command you could run)
- Current git branch, uncommitted changes, recent commits
- `CLAUDE.md` — project-specific persistent instructions
- `MEMORY.md` — auto-saved learnings (first 200 lines loaded per session)
- Configured MCP servers, skills, subagents

## Execution Environments
| Environment | Where code runs | Use case |
|---|---|---|
| Local | Your machine | Default; full access |
| Cloud | Anthropic VMs | Offload tasks, repos without local clone |
| Remote Control | Your machine, browser UI | Web UI while keeping everything local |

## Permission Modes (Shift+Tab to cycle)
| Mode | Behavior |
|---|---|
| Default | Asks before file edits AND shell commands |
| Auto-accept edits | Edits files without asking; still asks for commands |
| Plan mode | Read-only tools only; produces plan for your approval |

## Sessions
- Each session has its own **context window** (conversation + files read + outputs)
- Sessions are independent — no cross-session memory except CLAUDE.md and auto-memory
- Sessions are stored per project directory

### Session Commands
```bash
claude --continue               # resume most recent session
claude --resume                 # pick from list
claude --continue --fork-session  # branch from current session (new ID, shared history)
```
Use `--fork-session` for parallel experiments from the same starting point; do NOT resume the same session in two terminals (messages interleave).

## Context Window Management
- Use `/context` to see what's using space
- Claude auto-compacts when approaching limit (clears old tool outputs first, then summarizes)
- To control what survives compaction, add a "Compact instructions" section to CLAUDE.md
- MCP servers add tool definitions to every request — run `/mcp` to see per-server costs
- **Skills** load on demand (only their description at startup)
- **Subagents** run in completely separate context windows; return a summary only

## Checkpoints & Undo
- Before every file edit, Claude snapshots the file
- `Esc Esc` or `/rewind` → restore conversation, code, or both
- Checkpoints are local — NOT a replacement for git
- Actions affecting remote systems (DBs, APIs) cannot be checkpointed

## Key Setup Commands
| Command | Purpose |
|---|---|
| `/init` | Generate a starter CLAUDE.md |
| `/agents` | Configure custom subagents |
| `/doctor` | Diagnose installation issues |
| `/hooks` | View configured hooks |
| `/mcp` | View/manage MCP servers |
| `/permissions` | View/manage tool permissions |
| `/sandbox` | Enable sandboxing |

---
> Source: [how-claude-code-works.md](../how-claude-code-works.md)
