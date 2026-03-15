# Features Overview Cheatsheet

## Extension Comparison

| Feature | What it does | When to use | Example |
|---|---|---|---|
| **CLAUDE.md** | Persistent context, every session | "Always do X" rules, project conventions | "Use pnpm, not npm" |
| **Skill** | Reusable instructions/workflows | Reference docs, repeatable tasks | `/deploy` runs deployment checklist |
| **Subagent** | Isolated worker, returns summary | Context isolation, parallel tasks | Research task reading many files |
| **Agent teams** | Multiple independent sessions | Parallel research, competing hypotheses | Spawn security + perf reviewers |
| **MCP** | Connects to external services | External data/actions | Query DB, post to Slack |
| **Hook** | Deterministic script on events | Predictable automation, no LLM | Run ESLint after every file edit |
| **Plugin** | Bundles skills/hooks/MCP/agents | Share setup across repos | Publish to marketplace |

## Decision Guide

**CLAUDE.md vs Skill**
- CLAUDE.md: loads every session automatically → always-on rules
- Skill: loads on demand / when invoked → reference material, `/<name>` workflows
- Keep CLAUDE.md under 200 lines; move excess to skills or `.claude/rules/`

**Subagent vs Agent team**
- Subagent: focused worker, result returns to main context; lower token cost
- Agent team: teammates message each other, self-coordinate; higher cost
- Use agent teams when subagents need to communicate with each other

**MCP vs Skill**
- MCP: provides tool access to external systems (without it, Claude can't query your DB)
- Skill: teaches Claude how to use those tools effectively
- Combine: MCP for connection + skill for schema/patterns

## Context Costs

| Feature | Loads when | Cost |
|---|---|---|
| CLAUDE.md | Session start | Every request (full content) |
| Skills | Start (descriptions) + on use (full) | Low; zero if `disable-model-invocation: true` |
| MCP servers | Session start | Every request (tool definitions) |
| Subagents | When spawned | Isolated from main session |
| Hooks | On trigger | Zero (external scripts) |

## Layering Priority

- **CLAUDE.md**: additive — all levels contribute; more specific takes precedence
- **Skills/Subagents**: override by name (managed > user > project)
- **MCP servers**: local > project > user
- **Hooks**: all registered hooks fire for matching events

## Combining Patterns

| Pattern | How it works |
|---|---|
| Skill + MCP | MCP connects; skill documents schema and usage |
| Skill + Subagent | Skill spawns subagents for parallel isolated work |
| CLAUDE.md + Skills | CLAUDE.md = always-on rules; Skills = on-demand reference |
| Hook + MCP | Post-edit hook triggers Slack notification via MCP |

---
> Source: [features-overview.md](../features-overview.md)
