# Brainstorm: 10 Practical Hooks Recipes

**Date:** 2026-03-15
**Status:** Approved
**Output:** `templates/HOOKS-RECIPES.md`

## What We're Building

A new file `templates/HOOKS-RECIPES.md` containing 10 production-ready hook recipes for Claude Code. Each recipe includes full standalone `.sh` scripts with proper error handling, comments, and configurability. The collection complements the existing `templates/HOOKS-TEMPLATE.md` (which covers basics) by providing advanced, cross-platform, real-world hooks.

## Why This Approach

- **Separate file**: keeps the existing template as a quick-reference while the recipes serve as a deeper cookbook
- **Full standalone scripts**: easier to audit, test, and customize than inline one-liners
- **Cross-platform focus**: many teams work across Linux, macOS, and Windows (WSL/Git Bash)
- **All four categories covered**: safety, quality, observability, and automation

## The 10 Hooks

### Safety & Protection (3)

| # | Name | Event | Purpose |
|---|------|-------|---------|
| 1 | Cross-Platform Dangerous Command Blocker | `PreToolUse` (Bash) | Blocks destructive commands (rm -rf, del /s, format, fdisk, DROP TABLE, mkfs, dd if=) across Linux, macOS, and Windows |
| 2 | Network Exfiltration Guard | `PreToolUse` (Bash) | Blocks curl/wget/nc to untrusted domains, prevents piping sensitive files to external URLs, configurable allowlist |
| 3 | Git Safety Net | `PreToolUse` (Bash) | Blocks force push, branch delete on main/master, reset --hard, clean -fd, and other destructive git operations |

### Quality Gates (3)

| # | Name | Event | Purpose |
|---|------|-------|---------|
| 4 | Auto-Lint After Edits | `PostToolUse` (Edit/Write) | Detects language from file extension, runs appropriate linter, feeds errors back as context for Claude to fix |
| 5 | Test Runner on Stop | `Stop` (agent hook) | Runs project test suite before Claude finishes, blocks stop if tests fail, supports npm/pytest/go/cargo |
| 6 | Commit Message Validator | `PreToolUse` (Bash) | Intercepts git commit commands, enforces Conventional Commits format (feat/fix/chore/etc.), blocks non-compliant messages |

### Observability & Audit (2)

| # | Name | Event | Purpose |
|---|------|-------|---------|
| 7 | Full Session Audit Logger | `PostToolUse` (all tools) | Logs every tool call with timestamp, tool name, inputs, and session ID as JSON lines for compliance/analysis |
| 8 | Slack/Webhook Notifier | `Stop` (HTTP hook) + `Notification` (command) | Posts to Slack or any webhook when Claude finishes or needs attention, includes session summary |

### Workflow Automation (2)

| # | Name | Event | Purpose |
|---|------|-------|---------|
| 9 | Smart Context Injector | `SessionStart` | Injects git status, current branch, recent commits, and project-specific reminders on startup and after compact |
| 10 | Auto-Commit on Stop | `Stop` (command) | Stages and commits all changes when Claude finishes, uses Conventional Commits format, checks stop_hook_active to prevent loops |

## Key Decisions

- **Full .sh scripts for every recipe** (not inline one-liners) for auditability and testability
- **Each recipe includes**: settings JSON config + standalone script + usage notes + customization guide
- **Cross-platform patterns**: recipes detect OS where relevant (uname/OSTYPE) and handle Linux/macOS/Windows(WSL) differences
- **Configurable**: dangerous patterns, allowed domains, linter commands, etc. are defined as arrays at the top of each script for easy customization
- **jq dependency**: all scripts assume jq is available (noted in prerequisites)

## Structure of Each Recipe

1. Title and description (what it does, why you need it)
2. Settings JSON (copy-paste into .claude/settings.json)
3. Full script with comments
4. Customization section (what to change)
5. Testing instructions (how to verify it works)
