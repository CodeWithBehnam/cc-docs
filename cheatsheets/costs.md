# Costs Cheatsheet

## Typical Spend
- Average: ~$6/dev/day; 90% of users stay under $12/day
- Monthly average: ~$100-200/dev/month (Sonnet 4.6)
- Background tasks: < $0.04/session

## In-Session Commands
| Command | Purpose |
|---|---|
| `/cost` | Show token usage & cost for current session (API users) |
| `/stats` | View usage patterns (Max/Pro subscribers) |
| `/clear` | Reset context to stop accruing stale tokens |
| `/compact [instructions]` | Summarize history; e.g. `/compact Focus on API changes` |
| `/context` | Inspect what is consuming context space |
| `/model` | Switch models mid-session |
| `/effort` | Adjust thinking depth (Opus 4.6 / Sonnet 4.6) |

## Rate Limits (TPM/RPM per user)
| Team size | TPM/user | RPM/user |
|---|---|---|
| 1-5 | 200k-300k | 5-7 |
| 5-20 | 100k-150k | 2.5-3.5 |
| 20-50 | 50k-75k | 1.25-1.75 |
| 50-100 | 25k-35k | 0.62-0.87 |
| 100-500 | 15k-20k | 0.37-0.47 |
| 500+ | 10k-15k | 0.25-0.35 |

## Reduce Token Usage

### Context management
- `/clear` between unrelated tasks
- `/rename` sessions before clearing so you can `/resume` later
- Add compaction hints in `CLAUDE.md`:
  ```markdown
  # Compact instructions
  When you are using compact, please focus on test output and code changes
  ```

### Model selection
- Use **Sonnet** for most tasks; reserve **Opus** for complex architecture
- Use `model: haiku` in subagent config for simple subtasks
- Disable/lower extended thinking for simple tasks: `MAX_THINKING_TOKENS=8000`

### MCP & tools
- Prefer CLI tools (`gh`, `aws`, `gcloud`) over MCP servers when available
- Disable unused MCP servers via `/mcp`
- Tool search auto-defers tools when they exceed 10% of context; lower threshold: `ENABLE_TOOL_SEARCH=auto:5`

### Agent teams
- Use Sonnet for teammates; keep teams small
- Clean up idle teammates (each keeps its own context window open)
- Enable: `CLAUDE_CODE_EXPERIMENTAL_AGENT_TEAMS=1`
- Agent teams use ~7x more tokens than standard sessions

### Other tips
- Move CLAUDE.md under ~500 lines; put specialized instructions in skills (load on demand)
- Use hooks to preprocess data before Claude sees it (e.g. filter test output to failures only)
- Use subagents for verbose operations (logs, test runs) so output stays out of main context
- Write specific prompts: "add validation to login in auth.ts" beats "improve this codebase"
- Use plan mode (Shift+Tab) before implementation to avoid expensive re-work

## Team Cost Management
- Set workspace spend limits: [platform.claude.com](https://platform.claude.com/docs/en/build-with-claude/workspaces#workspace-limits)
- On Bedrock/Vertex/Foundry: use LiteLLM for spend-by-key tracking

---
> Source: [costs.md](../costs.md)
