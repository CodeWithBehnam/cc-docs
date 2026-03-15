# Output Styles Cheatsheet

## What Output Styles Are

Modify Claude Code's **system prompt** to change how Claude responds — formatting, tone, and behavior. Active for the entire session once set.

## Built-in Styles

| Style | Description |
| :--- | :--- |
| `Default` | Standard software engineering assistant (concise, efficient) |
| `Explanatory` | Adds "Insights" between tasks — explains implementation choices and patterns |
| `Learning` | Interactive mode: shares insights + adds `TODO(human)` markers for you to implement |

## Change Your Style

```bash
/config → Output style    # interactive picker (saved to .claude/settings.local.json)
```

Or edit settings directly:
```json
{ "outputStyle": "Explanatory" }
```

Changes take effect at the **next session start** (system prompt is fixed per session for caching efficiency).

## Create a Custom Style

```markdown
---
name: My Custom Style
description: Brief description shown in /config picker
keep-coding-instructions: false
---

# Custom Style Instructions

You are an interactive CLI tool that helps users...

## Specific Behaviors

Define how the assistant should behave...
```

Save at:
- `~/.claude/output-styles/` — user level (all projects)
- `.claude/output-styles/` — project level

## Frontmatter Fields

| Field | Purpose | Default |
| :--- | :--- | :--- |
| `name` | Style name in picker | File name |
| `description` | Shown in `/config` picker | None |
| `keep-coding-instructions` | Keep Claude Code's coding system prompt (tests, verification, etc.) | `false` |

## How Output Styles Modify the System Prompt

- All styles: remove "respond concisely" type instructions
- Custom styles: remove coding instructions unless `keep-coding-instructions: true`
- All styles: append custom instructions to end of system prompt
- All styles: inject reminders to follow the style during conversation

## Comparison with Similar Features

| Feature | How it works | When active |
| :--- | :--- | :--- |
| **Output styles** | Replaces/modifies system prompt | Always (once set for session) |
| **CLAUDE.md** | Appended as user message after system prompt | Always loaded |
| **`--append-system-prompt`** | Appends to (doesn't replace) system prompt | Always for session |
| **Skills** | Task-specific prompts, invoked on demand | When invoked |
| **Agents** | Custom system prompt + tool config for subtasks | When Claude delegates |

## Key Gotchas

- Style change requires a **new session** — existing sessions unaffected
- Custom styles replace coding instructions by default; set `keep-coding-instructions: true` to keep them
- Style is saved at local project level (`.claude/settings.local.json`) — not shared via version control

---
> Source: [output-styles.md](../output-styles.md)
