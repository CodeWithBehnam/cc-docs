---
description: Run setup_init hook and report installation results
argument-hint: [hil]
---

# Purpose

Execute the repository initialization hook (setup_init) which installs all dependencies and initializes the database, then summarize and report the results to the user.

## Variables

MODE: $1 (optional - if "true", run interactive mode)

## Workflow
> Execute the following steps in order, top to bottom:

1. **First**, execute `Skill(/prime)` to understand the codebase
2. Check for interactive mode: If MODE is "true", run `Skill(/install-hil)` and ignore the remainder of this prompt
3. Read the log file at `.claude/hooks/setup.init.log` (the hook already ran via `--init` flag)
4. Analyze for successes and failures
5. Write results to `app_docs/install_results.md`
6. Report to user

## Report

Write to `app_docs/install_results.md` and respond to user:

**Status**: SUCCESS or FAILED

**What worked**:
- [completed actions]

**What failed** (if any):
- [errors with context]

**Next steps**:
- [what to do now]
