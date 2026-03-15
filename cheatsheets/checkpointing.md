# Checkpointing Cheatsheet

## What It Is

Automatic tracking of Claude's file edits during a session, allowing you to undo changes and rewind to previous states.

- Every user prompt creates a checkpoint
- Persists across sessions (accessible in resumed conversations)
- Auto-cleaned after 30 days (configurable)

## How to Rewind

**Press `Esc` twice** or run `/rewind` to open the rewind menu.

Select a past prompt, then choose an action:

| Action | Effect |
|---|---|
| Restore code and conversation | Revert both files and conversation to that point |
| Restore conversation | Rewind messages only, keep current code |
| Restore code | Revert files only, keep full conversation |
| Summarize from here | Compress conversation from this point forward (frees context) |
| Never mind | Cancel, return to message list |

After restoring or summarizing, the original prompt is restored to the input field so you can re-send or edit it.

## Summarize vs Restore

- **Restore**: undo — reverts code, conversation, or both
- **Summarize from here**: compresses selected message + all subsequent messages into an AI summary
  - No files changed on disk
  - Original messages preserved in transcript (Claude can still reference details)
  - Targeted alternative to `/compact` (keeps early context intact, compresses only later parts)
  - You can add instructions to guide the summary focus

## VS Code: Rewind Button

Hover over any message to reveal the rewind button, then choose:
- **Fork conversation from here** — new branch, code unchanged
- **Rewind code to here** — revert files, keep conversation
- **Fork conversation and rewind code** — new branch + revert files

## Common Use Cases

- Exploring alternative implementations (revert to try again)
- Recovering from a bad edit that introduced bugs
- Freeing context after a verbose debugging session (summarize the debug portion)
- Branching off to try a different approach

## Limitations

| Not tracked | Notes |
|---|---|
| Bash command side-effects | `rm`, `mv`, `cp` via shell are not reversible |
| External changes | Files you edit manually outside Claude Code |
| Other sessions | Changes from concurrent sessions not captured unless they touch the same files |

**Checkpointing is not a replacement for git.**
- Checkpoints = session-level "local undo"
- Git = permanent version history and collaboration

---
> Source: [checkpointing.md](../checkpointing.md)
