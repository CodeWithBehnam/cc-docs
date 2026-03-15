# Claude Code Tips and Tricks

Curated practical tips from daily Claude Code usage. Each file focuses on a specific area and is filled with actionable, immediately useful techniques.

## Files

| File | Description |
|------|-------------|
| [productivity.md](productivity.md) | Session management, context control, and daily workflow shortcuts |
| [prompting.md](prompting.md) | How to write prompts that get better results faster |
| [debugging.md](debugging.md) | Debugging strategies that save time and preserve context |
| [cost-optimization.md](cost-optimization.md) | Reduce token usage and API costs without slowing down |
| [multi-session.md](multi-session.md) | Parallel sessions, worktrees, and agent coordination |
| [security.md](security.md) | Security-first habits and safeguards for safe automation |

## Quick Reference

**Start a named session and resume it later:**
```
claude -n my-feature
claude --continue my-feature
```

**Cycle permission modes without leaving the session:**
Press `Shift+Tab` to rotate through: normal -> accept-edits -> plan

**Compact context with a focus hint:**
```
/compact focus on the authentication changes
```

**Check token usage at any time:**
```
/context
```

**Run a one-shot task non-interactively:**
```
claude -p "summarize the recent changes" --output-format json
```
