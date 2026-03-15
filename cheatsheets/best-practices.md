# Best Practices Cheatsheet

## The #1 Constraint: Context Window
- Performance degrades as context fills — manage it aggressively
- Track usage continuously with a custom status line or `/cost`
- Use `/clear` between unrelated tasks; `/compact [focus]` to summarize

## Give Claude a Way to Verify Its Work
| Strategy | Weak prompt | Strong prompt |
|---|---|---|
| Provide test cases | "implement validateEmail" | "write validateEmail. test: user@x.com→true, invalid→false. run tests after" |
| Verify UI visually | "make dashboard look better" | "[screenshot] implement this design, screenshot result, list differences, fix them" |
| Fix root cause | "the build is failing" | "build fails with [error]. fix it and verify build succeeds, address root cause" |

## Explore → Plan → Code → Verify Workflow
1. Enter **Plan Mode** (Shift+Tab twice): Claude reads files without making changes
2. Ask Claude to create a detailed implementation plan
3. Press `Ctrl+G` to open the plan in your editor; refine it
4. Switch to Normal Mode: implement, run tests, fix failures
5. Commit + open PR

> Skip planning for single-file, one-sentence-describable changes.

## Prompting Tips
- Reference specific files: `@src/auth/token.ts`
- Mention constraints and point to existing patterns: "follow the pattern in HotDogWidget.php"
- Pipe data: `cat error.log | claude -p 'explain root cause'`
- Paste images/screenshots directly into the prompt

## CLAUDE.md Essentials
```bash
/init   # generate a starter CLAUDE.md
```
| Include | Exclude |
|---|---|
| Bash commands Claude can't guess | Things Claude can infer from code |
| Code style rules that differ from defaults | Standard language conventions |
| Testing instructions / preferred runner | Detailed API docs (link instead) |
| Repo etiquette (branch names, PR conventions) | Frequently changing information |
| Architectural decisions specific to your project | File-by-file descriptions |

- Keep under ~500 lines; move specialized workflows to **skills**
- Use `@path/to/file` imports inside CLAUDE.md
- Check into git; add "IMPORTANT:" / "YOU MUST" for critical rules
- CLAUDE.md files in parent and child directories are auto-loaded

## Key Commands & Shortcuts
| Action | How |
|---|---|
| Stop Claude mid-action | `Esc` |
| Rewind conversation + code | `Esc Esc` or `/rewind` |
| Clear context | `/clear` |
| Compact with focus | `/compact Focus on API changes` |
| Switch model | `/model` |
| Adjust thinking depth | `/effort` |
| See context usage | `/context` |
| Resume last session | `claude --continue` |
| Browse sessions | `claude --resume` |
| Non-interactive / scripted | `claude -p "prompt"` |

## Session Management
- Use `/rename` early: descriptive names like `oauth-migration` beat the default
- Use `Esc Esc` / `/rewind` to restore code to a checkpoint before a bad edit
- After 2+ failed corrections, `/clear` and write a better prompt from scratch
- Use subagents for research to keep main context clean:
  ```text
  Use subagents to investigate how our auth system handles token refresh
  ```

## Scaling with Parallel Sessions
```bash
claude --worktree feature-auth   # isolated worktree + branch
claude --worktree bugfix-123     # another session, no file conflicts
```
- Writer/Reviewer pattern: Session A implements, Session B reviews from fresh context
- Fan-out batch migrations:
  ```bash
  for file in $(cat files.txt); do
    claude -p "Migrate $file from React to Vue" --allowedTools "Edit,Bash(git commit *)"
  done
  ```

## Common Failure Patterns
| Pattern | Fix |
|---|---|
| Kitchen-sink session (unrelated tasks mixed) | `/clear` between tasks |
| Correcting the same mistake 2+ times | `/clear` and write a better prompt |
| Bloated CLAUDE.md (rules get ignored) | Prune ruthlessly; convert to hooks |
| No verification | Always supply tests, screenshots, or expected output |
| Infinite exploration | Scope tightly or delegate to subagents |

---
> Source: [best-practices.md](../best-practices.md)
