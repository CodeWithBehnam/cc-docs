---
description: Run setup_maintenance hook and report maintenance results
---

# Purpose

Execute the repository maintenance hook (setup_maintenance) which updates dependencies and runs database maintenance, then summarize and report the results to the user.

## Workflow

0. Run `Skill(/prime)` to understand the codebase
1. Read the log file at `.claude/hooks/setup.maintenance.log` (the hook already ran via `--maintenance` flag)
2. Analyze for successes and failures
3. Write results to `app_docs/maintenance_results.md`
4. Report to user

## Report

Write to `app_docs/maintenance_results.md` and respond to user:

**Status**: SUCCESS or FAILED

**What worked**:
- [completed actions]
- DB integrity: [ok/failed]

**What failed** (if any):
- [errors with context]

**Next steps**:
- [what to do now]
