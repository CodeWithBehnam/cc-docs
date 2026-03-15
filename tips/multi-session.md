# Multi-Session and Parallel Work Tips

Parallel sessions, worktrees, and agent coordination for getting more done at once.

---

## Use --worktree for isolated parallel work

Git worktrees give each session its own working directory, so parallel sessions do not step on each other's file changes.

```bash
claude --worktree feature-auth
claude --worktree feature-payments
```

Each session works in a separate worktree on its own branch. They can run simultaneously without conflicts.

---

## Writer/reviewer pattern

Split work across two sessions: one writes code, the other reviews it. This catches issues the writing session might miss because it is too focused on implementation.

Session 1 (writer):
```bash
claude -n writer
# implement the feature
```

Session 2 (reviewer):
```bash
claude -n reviewer
# Review the changes in the writer worktree. Focus on security, error handling, and test coverage.
```

---

## Fan-out: process files in parallel with a script

Use `claude -p` (non-interactive, one-shot mode) in a shell loop to process many files independently and in parallel.

```bash
for file in src/api/*.ts; do
  claude -p "add JSDoc comments to all exported functions in $file" &
done
wait
```

Each invocation is independent. Run them in the background with `&` and `wait` to parallelize.

---

## Scope batch operations with --allowedTools

When running automated Claude sessions in scripts, restrict which tools they can use to prevent unintended side effects.

```bash
claude -p "summarize the API surface" --allowedTools "Read,Glob,Grep"
```

This gives read-only access. The session can explore but cannot write, edit, or run shell commands.

---

## Use the Desktop app to manage multiple sessions visually

The Claude Code Desktop app shows all active sessions in a sidebar. You can switch between them, see their status, and review their outputs without managing multiple terminal windows. Useful when running three or more parallel sessions.

See `claude-code-docs/desktop.md` for setup.

---

## Agent teams for automated coordination

For complex multi-agent workflows, use the agent teams feature. Define a coordinator and a set of specialized workers. The coordinator assigns tasks and assembles results.

See `claude-code-docs/agent-teams.md` for the configuration format and examples.

---

## Worktree isolation for parallel exploration

When you want to explore two different approaches to the same problem simultaneously, give each approach its own worktree.

```bash
claude --worktree approach-a
claude --worktree approach-b
```

Compare the results and merge whichever approach worked better. No need to stash or commit intermediate work.

---

## Name sessions with -n for easy identification

Named sessions are easier to manage when you have several running at once. The name appears in the Desktop app sidebar and in `--continue` completion.

```bash
claude -n db-migration
claude -n frontend-polish
claude -n perf-investigation
```

Resume any of them by name:

```bash
claude --continue db-migration
```

---

## Resume a PR session with --from-pr

If you previously worked on a pull request in Claude Code, you can resume that session in the context of the PR using `--from-pr`. This restores the relevant context for the PR without needing to re-describe it.

```bash
claude --from-pr 342
```

Useful for returning to code review or follow-up work on a PR after a break.
