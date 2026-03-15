# Skills Cheatsheet

## What Skills Are

Reusable instructions in `SKILL.md` files. Invoke with `/skill-name` or let Claude load automatically. Custom commands (`.claude/commands/`) work the same way; skills add extra features.

## Skill Locations

| Location | Path | Scope |
| :--- | :--- | :--- |
| Personal | `~/.claude/skills/<name>/SKILL.md` | All your projects |
| Project | `.claude/skills/<name>/SKILL.md` | This project only |
| Plugin | `<plugin>/skills/<name>/SKILL.md` | Where plugin enabled |
| Enterprise | Managed settings | Org-wide |

Priority: enterprise > personal > project. Plugin skills are namespaced (`plugin:skill`).

## Minimal `SKILL.md`

```yaml
---
name: my-skill
description: What it does and when Claude should use it.
---

Instructions for Claude here...
```

## Frontmatter Reference

| Field | Description | Default |
| :--- | :--- | :--- |
| `name` | Slash-command name (lowercase, hyphens) | Directory name |
| `description` | When Claude should use it (also for autocomplete) | First paragraph |
| `argument-hint` | Autocomplete hint: `[issue-number]` | — |
| `disable-model-invocation` | `true` = user-only, Claude won't auto-invoke | `false` |
| `user-invocable` | `false` = Claude-only, hidden from `/` menu | `true` |
| `allowed-tools` | Tools Claude can use without permission when skill is active | — |
| `model` | Model to use when skill runs | — |
| `context` | `fork` = run in isolated subagent | — |
| `agent` | Which agent type to use with `context: fork` | `general-purpose` |
| `hooks` | Lifecycle hooks scoped to this skill | — |

## Invocation Control

| Setting | You can invoke | Claude can invoke | Context loaded |
| :--- | :--- | :--- | :--- |
| (default) | Yes | Yes | Description always; full on invoke |
| `disable-model-invocation: true` | Yes | No | Not in context until you invoke |
| `user-invocable: false` | No | Yes | Description always; full on invoke |

## Arguments

```yaml
---
name: fix-issue
---
Fix GitHub issue $ARGUMENTS following our coding standards.
```

- `$ARGUMENTS` — all args as string
- `$ARGUMENTS[0]`, `$0` — first arg
- `$ARGUMENTS[1]`, `$1` — second arg

Usage: `/fix-issue 123` → Claude sees "Fix GitHub issue 123..."

## Dynamic Context Injection

```yaml
---
name: pr-summary
context: fork
agent: Explore
allowed-tools: Bash(gh *)
---

PR diff: !`gh pr diff`
PR comments: !`gh pr view --comments`

Summarize this pull request...
```

`!`command`` runs before Claude sees the skill — output replaces the placeholder.

## Run in Subagent (`context: fork`)

```yaml
---
name: deep-research
context: fork
agent: Explore     # Explore | Plan | general-purpose | custom-agent-name
---

Research $ARGUMENTS: find files, analyze, summarize with file references.
```

Runs in isolated context; results returned to main conversation.

## Bundled Skills

| Skill | Purpose |
| :--- | :--- |
| `/batch <instruction>` | Parallel large-scale codebase changes via worktrees |
| `/claude-api` | Load Claude API reference for current language |
| `/debug [desc]` | Troubleshoot current session |
| `/loop [interval] <prompt>` | Run a prompt repeatedly on schedule |
| `/simplify [focus]` | Review and fix code quality in parallel |

## Restrict Claude's Skill Access

```text
# In /permissions — deny all skills:
Skill

# Allow only specific skills:
Skill(commit)
Skill(review-pr *)

# Deny specific skills:
Skill(deploy *)
```

## Skill Directory Structure

```
my-skill/
├── SKILL.md           # required
├── reference.md       # detailed docs (loaded on demand)
├── examples.md        # usage examples
└── scripts/
    └── helper.py      # executable scripts
```

Reference supporting files from `SKILL.md` so Claude knows when to load them.

## Sharing

- Project skills: commit `.claude/skills/` to version control
- Plugin skills: create `skills/` dir in plugin
- Org-wide: managed settings deployment

## Troubleshooting

- Skill not triggering → add keywords the user would say; try `/skill-name` directly
- Triggers too often → make description more specific; add `disable-model-invocation: true`
- Too many skills for context → set `SLASH_COMMAND_TOOL_CHAR_BUDGET` env var; run `/context` to check

---
> Source: [skills.md](../skills.md)
