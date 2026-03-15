# Cost Optimization Tips

Reduce token usage and API costs without slowing down your workflow.

---

## Check context usage with /context

At any point in a session, run `/context` to see how many tokens are in the current context window and how much has been spent so far. Use this to decide whether it is time to compact or clear.

```
/context
```

---

## Show token count in the status line

Configure the status line to display token count and cumulative cost at a glance, so you never need to run `/context` manually. See `claude-code-docs/statusline.md` for the exact configuration.

With this set up, you can see context growth in real time and compact before it gets expensive.

---

## Clear between tasks to reset context

Every task you run in the same session adds to the context window. Unrelated tasks pile up and increase cost without adding value.

```
/clear
```

Use `/clear` at the start of each new, unrelated task. Token cost resets to zero.

---

## Use subagents for research to keep main context clean

Research tasks (reading documentation, exploring a large codebase, investigating a bug) can consume thousands of tokens. Running them in a subagent means the main session only receives the final summary.

```
Use a subagent to read through src/payments/ and summarize how the refund flow works.
```

The subagent's context is discarded after it reports back. Your main session stays lean.

---

## Use Haiku for simple subagent tasks

When a subagent is doing straightforward work (reading a file, checking a value, running a search), you do not need the full Claude model. Configure it to use Haiku.

```
Use a subagent (model: haiku) to check if any files in src/config/ contain the string "DEBUG=true".
```

Haiku is significantly cheaper and fast enough for simple lookup tasks.

---

## Scope file reads to the lines you need

Asking Claude to read a 2000-line file when you only need a 50-line function wastes tokens. Be specific.

```
Read lines 50-100 of src/api/users.ts
```

Or reference the function by name and let Claude find it efficiently:

```
Show me only the `validateToken` function in src/auth/token.ts
```

---

## Compact with focus instructions

`/compact` without instructions compresses context but may drop details you still need. Focus instructions tell it what to preserve.

```
/compact focus on the migration plan and the schema changes we agreed on
```

This keeps the critical thread while dropping conversational filler and exploratory tangents.

---

## Use /btw for quick questions

`/btw` asks a question without adding it to the main conversation history. It is invisible to future context.

```
/btw what does the --recursive flag do here?
```

Use it for quick lookups and clarifications that you do not need remembered for the rest of the session.

---

## Set a budget cap with --max-budget-usd

For scripted or automated runs, set a hard cost ceiling so a runaway task cannot exceed your budget.

```bash
claude -p "analyze all endpoints for security issues" --max-budget-usd 2.00
```

The session stops when the budget is reached. Useful for batch jobs and CI pipelines.

---

## Use /effort low for simple tasks

For tasks that do not require deep reasoning (renaming a variable, reformatting a file, adding a comment), tell Claude to use less effort.

```
/effort low
Rename the variable `tmp` to `userRecord` throughout src/models/user.ts
```

Less reasoning effort means fewer output tokens and lower cost.

---

## Use fast mode for faster, cheaper output

`/fast` switches to a faster output mode on the same model. Responses are quicker and typically cheaper, suitable for tasks where you value speed over thoroughness.

```
/fast
```

Toggle it off with `/fast` again when you need careful, detailed analysis.
