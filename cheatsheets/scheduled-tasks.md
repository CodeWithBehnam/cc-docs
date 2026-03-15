# Scheduled Tasks (CLI) Cheatsheet

## What It Is

Session-scoped task scheduling using `/loop` and cron tools. Tasks fire while the session is running.
Requires Claude Code v2.1.72+.

For durable scheduling (survives restarts): use Desktop scheduled tasks or GitHub Actions.

## Quick Start with /loop

```text
/loop 5m check if the deployment finished and tell me what happened
/loop 1h run the test suite and report failures
/loop check the build                          # defaults to every 10 minutes
/loop check the build every 2 hours            # trailing "every" clause
/loop 20m /review-pr 1234                      # loop over another command/skill
```

## Interval Syntax

| Form | Example | Interval |
|---|---|---|
| Leading token | `/loop 30m check build` | every 30 minutes |
| Trailing clause | `/loop check build every 2 hours` | every 2 hours |
| No interval | `/loop check build` | every 10 minutes (default) |

Units: `s` (seconds, rounded up to minute), `m` (minutes), `h` (hours), `d` (days)

Odd intervals (7m, 90m) are rounded to nearest clean interval — Claude tells you what it picked.

## One-Time Reminders

```text
remind me at 3pm to push the release branch
in 45 minutes, check whether the integration tests passed
```

Claude schedules a single-fire task that deletes itself after running.

## Manage Tasks

```text
what scheduled tasks do I have?
cancel the deploy check job
```

Underlying tools:

| Tool | Purpose |
|---|---|
| `CronCreate` | Schedule task (cron expression, prompt, recurring flag) |
| `CronList` | List all tasks with IDs, schedules, prompts |
| `CronDelete` | Cancel task by ID |

Max 50 tasks per session.

## Cron Expression Reference

5-field format: `minute hour day-of-month month day-of-week`

| Expression | Meaning |
|---|---|
| `*/5 * * * *` | Every 5 minutes |
| `0 * * * *` | Every hour on the hour |
| `7 * * * *` | Every hour at :07 |
| `0 9 * * *` | Daily at 9am local |
| `0 9 * * 1-5` | Weekdays at 9am |
| `30 14 15 3 *` | March 15 at 2:30pm |

- All times in local timezone
- Wildcards (`*`), steps (`*/15`), ranges (`1-5`), lists (`1,15,30`) all supported
- Extended syntax (`L`, `W`, `MON`, `JAN`) not supported
- Day-of-week: `0`/`7` = Sunday through `6` = Saturday

## Timing Behavior

- **Jitter**: recurring tasks fire up to 10% of period late (max 15 min); one-shots scheduled at :00/:30 may fire up to 90s early
- Tasks fire between your turns (not while Claude is mid-response)
- If Claude is busy, task waits until current turn ends
- **3-day expiry**: recurring tasks auto-delete after 3 days (fire once, then gone)

## Disable Scheduler

```bash
CLAUDE_CODE_DISABLE_CRON=1 claude
```

## Limitations

- Tasks only fire while Claude Code is running and idle
- No catch-up for missed fires (if Claude is busy, fires once when idle — not once per missed interval)
- No persistence across restarts
- For unattended automation: use GitHub Actions (`schedule` trigger) or Desktop scheduled tasks

---
> Source: [scheduled-tasks.md](../scheduled-tasks.md)
