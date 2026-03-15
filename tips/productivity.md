# Productivity Tips

Session management, context control, and daily workflow shortcuts that keep you moving fast.

---

## Clear context between unrelated tasks

Context carries over between requests in the same session. Switching topics without clearing it wastes tokens and can confuse Claude with irrelevant history.

```
/clear
```

Use `/clear` any time you pivot to a completely different task in the same terminal window.

---

## Name sessions so you can resume them

Give every session a meaningful name when you start it. This lets you resume it later by name instead of hunting through history.

```bash
claude -n auth-refactor
```

To resume later:

```bash
claude --continue auth-refactor
```

---

## Open the plan in your editor with Ctrl+G

When Claude produces a plan or a long response, press `Ctrl+G` to open it directly in your configured editor. This is useful for editing multi-step plans before Claude executes them, or for copying output into another document.

---

## Cycle permission modes with Shift+Tab

Press `Shift+Tab` to rotate through permission modes without typing any command:

- **normal** - asks before every tool call
- **accept-edits** - auto-approves file edits, still asks for shell commands
- **plan** - no execution, just planning and analysis

This is faster than typing `/mode` and useful when switching between exploration and execution.

---

## Compact with a focus hint

`/compact` alone summarizes everything equally. Adding a focus instruction tells Claude what matters most to preserve.

```
/compact focus on API changes and migration steps
/compact focus on the failing test and the hypothesis we formed
```

The compacted summary will emphasize those areas, keeping the most relevant context intact.

---

## Use /btw for quick side questions

`/btw` (or `/aside`) lets you ask a quick question that does not get added to the main conversation context. Use it when you are curious about something but do not want to pollute the task thread.

```
/btw what does the --depth flag do in this git command?
/btw is this a common pattern in Go?
```

---

## Rewind with double-Esc or /rewind

If the last response made things worse, or you want to try a different approach:

- Press `Esc` twice quickly to undo the last exchange
- Or type `/rewind` to step back to a previous state

This is faster than manually reverting files and re-prompting.

---

## Fork the session for experimental approaches

`/fork` creates a copy of the current session state. Use it before trying a risky or speculative approach so you can always return to the fork point if things go wrong.

```
/fork
```

The original session remains unchanged. Explore freely in the fork.

---

## Reference files directly in prompts with @

Instead of describing a file by name, use `@` to include it inline. Claude reads it directly and you avoid copy-paste errors.

```
Can you explain what @src/auth/token.ts does?
Update @config/routes.json to add a /health endpoint
```

---

## Pipe data directly into Claude

You do not have to paste logs or file contents manually. Pipe them in from the shell.

```bash
cat error.log | claude "what is causing this error?"
git diff HEAD~1 | claude "summarize these changes for a PR description"
```

This keeps prompts clean and works well in scripts.

---

## Resume the last session without knowing its name

If you forgot the session name, `--continue` without an argument resumes the most recent session.

```bash
claude --continue
```

---

## Configure /statusline for at-a-glance info

The status line at the bottom of the Claude Code UI can be customized to show what you care about: token count, cost, current model, permission mode, and more. See `claude-code-docs/statusline.md` for configuration options.

A useful setup shows tokens remaining and current cost so you always know where you stand without running `/context`.
