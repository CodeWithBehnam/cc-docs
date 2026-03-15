# Community Hooks

Community-contributed hook configurations and scripts for Claude Code, imported from [davila7/claude-code-templates](https://github.com/davila7/claude-code-templates) (MIT license).

These hooks extend Claude Code with automation, notifications, security, and workflow enforcement. Each `.json` file is a hook configuration (settings.json format) and each `.sh`/`.py` file is a supporting script referenced by the configuration.

## Installation

1. Copy the `.json` config for the hook you want into your project's `.claude/hooks/` directory (or merge its `hooks` section into `.claude/settings.json`).
2. If the hook has a supporting script (`.sh` or `.py`), copy that script to `.claude/hooks/` as well.
3. Make scripts executable: `chmod +x .claude/hooks/*.sh .claude/hooks/*.py`
4. Some hooks require environment variables (e.g., `DISCORD_WEBHOOK_URL`, `SLACK_WEBHOOK_URL`, `TELEGRAM_BOT_TOKEN`). See each hook's `description` field for setup details.

---

## Hooks by Category

### automation/ - Build, Deploy, and Notification Hooks

| File | Event Type | Description |
|------|-----------|-------------|
| `agents-md-loader.json` | SessionStart | Loads AGENTS.md file content at session start for cross-platform AI assistant compatibility |
| `build-on-change.json` | PostToolUse | Triggers build processes (npm, make, cargo, maven, gradle) when source files change |
| `change-logger.json` + `change-logger.py` | PostToolUse | Logs every file mutation to CSV (.claude/critical_log_changes.csv) for session review |
| `dependency-checker.json` | PostToolUse | Runs security audits (npm audit, safety, cargo audit) when dependency files are modified |
| `deployment-health-monitor.json` | PostToolUse, SessionStart | Monitors Vercel deployment status, error rates, and provides health alerts. Requires VERCEL_TOKEN |
| `discord-notifications.json` | Stop, SubagentStop | Simple Discord notification when Claude Code finishes. Requires DISCORD_WEBHOOK_URL |
| `discord-detailed-notifications.json` | SessionStart, Stop | Detailed Discord notifications with session duration, memory usage, and rich embeds |
| `discord-error-notifications.json` | PreToolUse, PostToolUse, Notification | Discord alerts for long-running Bash operations and user input prompts |
| `simple-notifications.json` | PostToolUse | Cross-platform desktop notifications (macOS osascript, Linux notify-send) on every tool completion |
| `slack-notifications.json` | Stop, SubagentStop | Simple Slack notification when Claude Code finishes. Requires SLACK_WEBHOOK_URL |
| `slack-detailed-notifications.json` | SessionStart, Stop | Detailed Slack notifications with session duration, memory usage, and Block Kit formatting |
| `slack-error-notifications.json` | PreToolUse, PostToolUse, Notification | Slack alerts for long-running Bash operations and user input prompts |
| `telegram-notifications.json` | Stop, SubagentStop | Simple Telegram notification when Claude Code finishes. Requires TELEGRAM_BOT_TOKEN + TELEGRAM_CHAT_ID |
| `telegram-detailed-notifications.json` | SessionStart, Stop | Detailed Telegram notifications with session duration and memory usage |
| `telegram-error-notifications.json` | PreToolUse, PostToolUse, Notification | Telegram alerts for long-running Bash operations and user input prompts |
| `telegram-pr-webhook.json` + `telegram-pr-webhook.py` | PostToolUse | Sends Telegram notification with PR URL and Vercel preview URL after `gh pr create` |
| `vercel-auto-deploy.json` | PostToolUse | Auto-triggers Vercel deployments on code changes with branch-based strategy. Requires VERCEL_TOKEN |
| `vercel-environment-sync.json` | PostToolUse, SessionStart | Validates .env files and provides Vercel environment sync options. Requires VERCEL_TOKEN |

### development-tools/ - Linting, Formatting, Debugging, Backup, and Quality Gates

| File | Event Type | Description |
|------|-----------|-------------|
| `change-tracker.json` | PostToolUse | Logs file modifications and creations to ~/.claude/changes.log with timestamps |
| `command-logger.json` | PreToolUse | Logs all tool usage to ~/.claude/command-log.txt for audit and debugging |
| `debug-window.json` + `debug-window.sh` | SessionStart, SessionEnd | Opens a live-tailing debug log window when Claude Code runs with --debug flag. Supports macOS, Linux, Windows |
| `file-backup.json` | PreToolUse | Creates timestamped backups in .backups/ directory before file edits |
| `lint-on-save.json` | PostToolUse | Runs ESLint, Pylint, or RuboCop after file modifications with auto-fix |
| `nextjs-code-quality-enforcer.json` | PostToolUse | Enforces Next.js App Router conventions, Server/Client component patterns, and TypeScript usage |
| `smart-formatting.json` | PostToolUse | Auto-formats code using Prettier (JS/TS/CSS/HTML), Black (Python), gofmt (Go), rustfmt (Rust), php-cs-fixer (PHP) |
| `worktree-ghostty.json` + `worktree-ghostty.sh` | WorktreeCreate, WorktreeRemove | Opens a 3-panel Ghostty layout (Claude + lazygit + yazi) for git worktrees. macOS only |
| `plan-gate.json` + `plan-gate.sh` | PreToolUse | Warns when editing production code without an approved .spec.md specification (non-blocking) |
| `scope-guard.json` + `scope-guard.sh` | Stop | Detects files modified outside the declared scope of a .spec.md specification (non-blocking) |
| `tdd-gate.json` + `tdd-gate.sh` | PreToolUse | Blocks editing production code unless a corresponding test file exists (TDD enforcement) |

### git/ - Commit Validation, Branch Naming, Push Protection, Auto-Git-Add

| File | Event Type | Description |
|------|-----------|-------------|
| `conventional-commits.json` + `conventional-commits.py` | PreToolUse | Enforces conventional commit message format (feat, fix, docs, etc.). Denies non-conforming commits |
| `prevent-direct-push.json` + `prevent-direct-push.py` | PreToolUse | Blocks direct pushes to main/develop branches, enforcing Git Flow workflow |
| `validate-branch-name.json` + `validate-branch-name.py` | PreToolUse | Validates Git Flow branch naming (feature/*, release/v*.*.*, hotfix/*) on checkout |
| `auto-git-add.json` | PostToolUse | Automatically stages modified files with git add after editing |
| `smart-commit.json` | PostToolUse | Auto-generates commit messages based on change size and creates commits after edits |

### monitoring/ - Desktop Notifications, Tracing, and Performance Monitoring

| File | Event Type | Description |
|------|-----------|-------------|
| `desktop-notification-on-stop.json` | Stop | Sends a single desktop notification when Claude Code finishes responding. Supports macOS and Linux |
| `langsmith-tracing.json` + `langsmith-tracing.sh` | Stop | Sends Claude Code conversation traces to LangSmith for monitoring and analysis. Requires CC_LANGSMITH_API_KEY |
| `performance-budget-guard.json` | PostToolUse | Monitors Next.js bundle size against a 350KB budget, blocks builds that exceed it, provides optimization tips |
| `performance-monitor.json` | PreToolUse, PostToolUse | Records CPU usage, memory, and tool timing to ~/.claude/performance.csv for analysis |

### post-tool/ - Hooks That Run After Tool Execution

| File | Event Type | Description |
|------|-----------|-------------|
| `format-javascript-files.json` | PostToolUse | Runs `npx prettier --write` on JS/TS files after Edit operations |
| `format-python-files.json` | PostToolUse | Runs `black` formatter on Python files after Edit operations |
| `git-add-changes.json` | PostToolUse | Runs `git add` on files after Edit or Write operations |
| `run-tests-after-changes.json` | PostToolUse | Runs `npm run test:quick` after Edit operations if package.json exists |
| `security-scanner.json` | PostToolUse | Scans modified files for vulnerabilities using semgrep, bandit (Python), gitleaks, and regex patterns |
| `test-runner.json` | PostToolUse | Runs tests (npm/yarn, pytest, rspec) after code edits based on file type and project structure |

### pre-tool/ - Hooks That Run Before Tool Execution

| File | Event Type | Description |
|------|-----------|-------------|
| `backup-before-edit.json` | PreToolUse | Creates a timestamped backup copy of files before any Edit operation |
| `console-log-cleaner.json` | PreToolUse | Warns about console.log statements when editing files on production branches (main/master) |
| `dangerous-command-blocker.json` + `dangerous-command-blocker.py` | PreToolUse | Multi-level security: blocks catastrophic commands (rm -rf /), protects critical paths (.git/, .env), warns about suspicious patterns |
| `file-protection.json` | PreToolUse | Blocks edits to system paths (/etc/, /usr/bin/), production configs, node_modules, and vendor directories |
| `notify-before-bash.json` | PreToolUse | Shows a notification before any Bash command execution for security awareness |
| `secret-scanner.json` + `secret-scanner.py` | PreToolUse | Scans staged files for hardcoded secrets from 30+ providers (AWS, OpenAI, Stripe, GitHub, etc.) before git commits |
| `update-search-year.json` | PreToolUse | Automatically appends the current year to WebSearch queries that lack a year for more relevant results |

---

## Example settings.json

Below is an example showing how to wire up a few of the most useful community hooks in your `.claude/settings.json`. Adjust paths if you place scripts in a different location.

```json
{
  "hooks": {
    "PreToolUse": [
      {
        "matcher": "Edit|MultiEdit|Write",
        "hooks": [
          {
            "type": "command",
            "command": "if [[ -n \"$CLAUDE_TOOL_FILE_PATH\" && -f \"$CLAUDE_TOOL_FILE_PATH\" ]]; then mkdir -p .backups && cp \"$CLAUDE_TOOL_FILE_PATH\" \".backups/$(basename \"$CLAUDE_TOOL_FILE_PATH\").$(date +%Y%m%d_%H%M%S).bak\"; fi"
          }
        ]
      },
      {
        "matcher": "Bash",
        "hooks": [
          {
            "type": "command",
            "command": "python3 .claude/hooks/dangerous-command-blocker.py"
          },
          {
            "type": "command",
            "command": "python3 .claude/hooks/secret-scanner.py"
          },
          {
            "type": "command",
            "command": "python3 .claude/hooks/conventional-commits.py"
          }
        ]
      }
    ],
    "PostToolUse": [
      {
        "matcher": "Edit|MultiEdit",
        "hooks": [
          {
            "type": "command",
            "command": "if [[ \"$CLAUDE_TOOL_FILE_PATH\" =~ \\.(js|ts|jsx|tsx)$ ]]; then npx prettier --write \"$CLAUDE_TOOL_FILE_PATH\" 2>/dev/null || true; elif [[ \"$CLAUDE_TOOL_FILE_PATH\" == *.py ]]; then black \"$CLAUDE_TOOL_FILE_PATH\" 2>/dev/null || true; fi"
          }
        ]
      },
      {
        "matcher": "Edit|MultiEdit|Write",
        "hooks": [
          {
            "type": "command",
            "command": "if [[ -n \"$CLAUDE_TOOL_FILE_PATH\" ]] && git rev-parse --git-dir >/dev/null 2>&1; then git add \"$CLAUDE_TOOL_FILE_PATH\" 2>/dev/null || true; fi"
          }
        ]
      }
    ],
    "Stop": [
      {
        "hooks": [
          {
            "type": "command",
            "command": "if command -v osascript >/dev/null 2>&1; then osascript -e 'display notification \"Response complete\" with title \"Claude Code\"'; elif command -v notify-send >/dev/null 2>&1; then notify-send 'Claude Code' 'Response complete'; fi"
          }
        ]
      }
    ]
  }
}
```

This example combines:
- **File backup** before edits (PreToolUse)
- **Dangerous command blocker** for Bash safety (PreToolUse)
- **Secret scanner** to prevent committing credentials (PreToolUse)
- **Conventional commits** enforcement (PreToolUse)
- **Smart formatting** with Prettier/Black after edits (PostToolUse)
- **Auto git add** to stage changes automatically (PostToolUse)
- **Desktop notification** when Claude finishes responding (Stop)

---

## Also Included

`HOOK_PATTERNS_COMPRESSED.json` - A compact reference of common hook patterns (logging, backup, format, git, notify, test, build, security, protect) with reusable command snippets and environment variable documentation.

## Source

All hooks in this directory are from [davila7/claude-code-templates](https://github.com/davila7/claude-code-templates), licensed under MIT.
