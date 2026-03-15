# Claude Code Hook Scripts

Ready-to-use bash hook scripts for Claude Code. Each script reads JSON from stdin (provided automatically by Claude Code), applies its logic, and exits with the appropriate code.

## Hook Scripts

| Script | Event | Matcher | Description |
|--------|-------|---------|-------------|
| `scripts/auto-format.sh` | `PostToolUse` | `Edit\|Write` | Runs the correct formatter after a file is saved: prettier (.ts/.js/.tsx/.jsx), black (.py), gofmt (.go), rubocop (.rb). |
| `scripts/protect-files.sh` | `PreToolUse` | `Edit\|Write` | Blocks edits to .env files, lock files (package-lock.json, yarn.lock, pnpm-lock.yaml), .git/, and any path containing "secret" or "credential". |
| `scripts/notify-desktop.sh` | `Notification` | (none) | Sends a native desktop notification. Cross-platform: osascript on macOS, notify-send on Linux, PowerShell on Windows. |
| `scripts/lint-on-save.sh` | `PostToolUse` | `Edit\|Write` | Runs ESLint (.ts/.js/.tsx/.jsx), ruff (.py), or rubocop (.rb) after a file is saved. Non-blocking (exit 0 always). |
| `scripts/block-dangerous-commands.sh` | `PreToolUse` | `Bash` | Blocks shell commands matching dangerous patterns: rm -rf with root/home targets, DROP TABLE, DROP DATABASE, git push --force to main/master, curl or wget piped to bash/sh. |
| `scripts/log-tool-usage.sh` | `PostToolUse` | (none) | Appends a JSON line to `~/.claude/tool-usage.log` for every tool call, recording tool name, timestamp, file path, and command. |
| `scripts/validate-sql.sh` | `PreToolUse` | `Bash` | Blocks SQL mutation statements (INSERT, UPDATE, DELETE, DROP, CREATE, ALTER, TRUNCATE). SELECT queries are allowed through. |
| `scripts/test-after-edit.sh` | `PostToolUse` | `Edit\|Write` | Finds and runs the related test file after a source file is edited (.ts/.js -> jest, .py -> pytest, .rb -> rspec, .go -> go test). Non-blocking. |
| `scripts/inject-context.sh` | `SessionStart` | `compact` | After context compaction, outputs the current git branch, last 5 commits, and a customizable project reminder to Claude's context. |
| `scripts/stop-check.sh` | `Stop` | (none) | Before Claude finishes, checks for uncommitted changes and uses structured JSON output to ask Claude to commit them. Guards against infinite loops via `stop_hook_active`. |

## Exit Code Reference

| Exit Code | Meaning |
|-----------|---------|
| `0` | Allow the action to proceed. For `SessionStart` hooks, stdout is injected into context. |
| `2` | Block the action. Stderr text is sent back to Claude as feedback. |
| Other | Action proceeds; stderr is logged but not shown to Claude. |

## How to Use

### 1. Copy the scripts to your project

```bash
mkdir -p .claude/hooks
cp /path/to/hooks/scripts/*.sh .claude/hooks/
chmod +x .claude/hooks/*.sh
```

Or copy individual scripts you need.

### 2. Add the hooks configuration to `.claude/settings.json`

Use `settings-examples.json` as a starting point. The key change: replace `$CLAUDE_PROJECT_DIR/hooks/scripts/` with `$CLAUDE_PROJECT_DIR/.claude/hooks/` (or wherever you placed the scripts).

Minimal example wiring up just the protect-files and auto-format hooks:

```json
{
  "hooks": {
    "PreToolUse": [
      {
        "matcher": "Edit|Write",
        "hooks": [
          {
            "type": "command",
            "command": "\"$CLAUDE_PROJECT_DIR\"/.claude/hooks/protect-files.sh"
          }
        ]
      }
    ],
    "PostToolUse": [
      {
        "matcher": "Edit|Write",
        "hooks": [
          {
            "type": "command",
            "command": "\"$CLAUDE_PROJECT_DIR\"/.claude/hooks/auto-format.sh"
          }
        ]
      }
    ]
  }
}
```

### 3. Make scripts executable

Claude Code will not run a script that is not executable:

```bash
chmod +x .claude/hooks/*.sh
```

### 4. Verify in Claude Code

Run `/hooks` inside a Claude Code session to confirm the hooks appear under the correct event types. Use `Ctrl+O` to toggle verbose mode and see hook output in the transcript.

## Customizing inject-context.sh

Open `scripts/inject-context.sh` and edit the `REMINDER` variable near the top of the file:

```bash
REMINDER="Follow project conventions: use the existing code style, write tests for new features, and run the full test suite before marking a task complete."
```

Replace the value with whatever context your project needs Claude to keep in mind after compaction.

## Prerequisites

The scripts require the following tools to be installed for their respective features to work. Missing tools cause the script to emit a warning to stderr and exit 0 (non-blocking):

| Tool | Used by |
|------|---------|
| `jq` | All scripts (JSON parsing) |
| `prettier` | `auto-format.sh`, via `npx` fallback |
| `black` | `auto-format.sh` |
| `gofmt` | `auto-format.sh` |
| `rubocop` | `auto-format.sh`, `lint-on-save.sh` |
| `eslint` | `lint-on-save.sh`, via `npx` fallback |
| `ruff` | `lint-on-save.sh` |
| `pytest` | `test-after-edit.sh` |
| `rspec` | `test-after-edit.sh` |
| `notify-send` | `notify-desktop.sh` (Linux) |
| `osascript` | `notify-desktop.sh` (macOS) |
| `git` | `inject-context.sh`, `stop-check.sh` |

Install `jq` first, as every script depends on it:

```bash
# macOS
brew install jq

# Debian/Ubuntu
sudo apt-get install jq
```

## Further Reading

- [Hooks reference](../claude-code-docs/hooks.md) - full event schemas, JSON formats, and advanced features
- [Hooks guide](../claude-code-docs/hooks-guide.md) - practical walkthrough with examples
- [Settings reference](../claude-code-docs/settings.md) - all settings.json options
