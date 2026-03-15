# Workflow Automation: Scheduled Tasks

Templates for recurring monitoring, polling, reminders, and scheduled workflows within Claude Code sessions.

---

## Build & Deployment Monitoring

### Watch a deployment

```text
/loop 2m Check if the deployment to production is complete.
  Run: kubectl get pods -n production | grep my-app
  Report when all pods show Running status.
  If any pod shows Error or CrashLoopBackOff, alert immediately.
```

### Monitor CI pipeline

```text
/loop 3m Check the status of the latest CI pipeline.
  Run: gh run list --limit 1 --json status,conclusion,name
  If the run completed, report the result and stop looping.
  If still running, report progress.
```

### Watch for build completion

```text
/loop 1m Check if the build finished.
  Run: cat /tmp/build.log | tail -5
  If you see "BUILD SUCCESS" or "BUILD FAILED", report and stop.
```

---

## PR & Code Review Monitoring

### Monitor PR checks

```text
/loop 5m Check the status of PR #42.
  Run: gh pr checks 42
  If all checks pass, let me know.
  If any check fails, show which one and the error.
```

### Watch for review comments

```text
/loop 10m Check if there are new review comments on PR #42.
  Run: gh pr view 42 --json reviews,comments
  Report any new comments since the last check.
```

### Monitor merge queue

```text
/loop 5m Check if my PR has been merged.
  Run: gh pr view 42 --json state,mergedAt
  Report when the state changes from "OPEN".
```

---

## Scheduled Reports

### Daily standup prep

```text
remind me at 9am to prepare standup notes
```

When triggered:

```text
/loop 24h Prepare daily standup notes.
  Run: git log --oneline --since="yesterday" --author="$(git config user.name)"
  Summarize what was accomplished and what's in progress.
```

### Weekly dependency check

```text
/loop 7d Run a dependency audit.
  Run: npm audit
  Summarize any new vulnerabilities found.
  If critical vulnerabilities exist, list them with remediation steps.
```

---

## Status Polling

### Wait for database migration

```text
/loop 30s Check if the database migration completed.
  Run: rails db:migrate:status | tail -10
  If all migrations show "up", report success.
  If any show "down", report which ones are pending.
```

### Wait for service health

```text
/loop 1m Check if the staging API is healthy.
  Run: curl -s -o /dev/null -w "%{http_code}" https://staging-api.example.com/health
  Report when the service returns 200.
  If it returns 5xx for 3 consecutive checks, alert with details.
```

---

## Cron-Based Scheduling

For tasks that outlive a single session, use cron expressions:

### Create a scheduled task

```text
> Schedule a task to run every weekday at 9am that checks for stale PRs
```

Claude will use CronCreate:

```text
Cron expression: 0 9 * * 1-5
Task: Check for PRs open more than 3 days.
  Run: gh pr list --json number,title,createdAt
  Report any PRs older than 3 days.
```

### Common cron expressions

| Expression | Schedule |
|-----------|----------|
| `*/5 * * * *` | Every 5 minutes |
| `0 * * * *` | Every hour |
| `0 9 * * *` | Daily at 9am |
| `0 9 * * 1-5` | Weekdays at 9am |
| `0 9 * * 1` | Mondays at 9am |
| `0 0 1 * *` | First of every month |

### Manage scheduled tasks

```text
> List all my scheduled tasks
> Cancel the deployment monitoring task
```

---

## Skill Re-Invocation

Re-run a skill on a schedule:

```text
/loop 20m /review-pr 42
```

This re-invokes the `review-pr` skill every 20 minutes.

---

## One-Time Reminders

### Timed reminders

```text
> remind me in 30 minutes to check the deployment
> remind me at 3pm to push the release branch
> remind me in 2 hours to follow up on the PR review
```

---

## Interval Reference

| Syntax | Duration |
|--------|----------|
| `30s` | 30 seconds |
| `1m` | 1 minute |
| `5m` | 5 minutes |
| `1h` | 1 hour |
| `2h` | 2 hours |
| `1d` | 1 day |

Default interval (no time specified): 10 minutes.

---

## Tips

- `/loop` tasks are session-scoped and stop when you end the session
- Cron tasks (CronCreate) persist across sessions for up to 3 days
- Set reasonable intervals to avoid unnecessary API costs
- Use short intervals (30s-2m) for active monitoring, longer (5m-20m) for passive checks
- Combine with skills for sophisticated recurring workflows
- Tasks automatically respect the session's permission settings
