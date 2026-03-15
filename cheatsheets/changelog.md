# Changelog Cheatsheet

> Check your version: `claude --version`
> Full changelog: [github.com/anthropics/claude-code/blob/main/CHANGELOG.md](https://github.com/anthropics/claude-code/blob/main/CHANGELOG.md)

## Recent Highlights (latest first)

### v2.1.76 (March 14, 2026)
- MCP elicitation support — servers can request structured input mid-task
- New `Elicitation` / `ElicitationResult` hooks
- `-n` / `--name` CLI flag to set session display name at startup
- `worktree.sparsePaths` setting for large monorepos with `--worktree`
- `PostCompact` hook fires after compaction
- `/effort` slash command to set model effort level
- Session quality survey (`feedbackSurveyRate` admin setting)

### v2.1.75 (March 13, 2026)
- 1M context window for Opus 4.6 by default (Max, Team, Enterprise)
- `/color` command for session prompt-bar color
- Session name on prompt bar via `/rename`
- Last-modified timestamps on memory files
- **Breaking**: removed deprecated Windows managed settings path `C:\ProgramData\ClaudeCode\managed-settings.json`; use `C:\Program Files\ClaudeCode\managed-settings.json`

### v2.1.74 (March 12, 2026)
- `/context` command with actionable suggestions (context-heavy tools, memory bloat)
- `autoMemoryDirectory` setting for custom auto-memory storage
- `modelOverrides` setting maps model picker entries to custom provider IDs (e.g., Bedrock ARNs)

### v2.1.73 (March 11, 2026)
- `modelOverrides` setting — map model names to Bedrock inference profile ARNs
- Default Opus model on Bedrock/Vertex/Foundry changed to **Opus 4.6** (was Opus 4.1)
- `/output-style` deprecated — use `/config` instead

### v2.1.72 (March 10, 2026)
- `ExitWorktree` tool added
- `CLAUDE_CODE_DISABLE_CRON` env var to stop cron jobs mid-session
- Effort levels simplified: low / medium / high (removed max); symbols: ○ ◐ ●
- `CLAUDE.md` HTML comments (`<!-- ... -->`) hidden from Claude when auto-injected

### v2.1.71 (March 7, 2026)
- `/loop` command — run a prompt/slash command on a recurring interval
- Cron scheduling tools for recurring in-session prompts
- Voice STT: 10 new languages (20 total)
- `InstructionsLoaded` hook event when CLAUDE.md / rules files load

### v2.1.70 (March 6, 2026)
- Fixed API 400 errors with `ANTHROPIC_BASE_URL` + third-party gateway
- VSCode: spark icon lists all Claude Code sessions; sessions open as full editors
- VSCode: native MCP server management via `/mcp` in chat panel

### v2.1.69 (March 5, 2026)
- `/claude-api` skill for building Claude API applications
- `includeGitInstructions` setting (and `CLAUDE_CODE_DISABLE_GIT_INSTRUCTIONS` env var)
- `${CLAUDE_SKILL_DIR}` variable for skills referencing their own directory
- HTTP hooks — POST JSON to a URL and receive JSON response

### v2.1.68 (March 4, 2026)
- Opus 4.6 defaults to **medium effort** for Max and Team subscribers
- "ultrathink" keyword re-introduced for high effort on next turn
- Opus 4 and 4.1 removed from first-party API

### v2.1.63 (February 28, 2026)
- `/simplify` and `/batch` slash commands
- `/copy` command with interactive code block picker
- Auto-memory: Claude automatically saves useful context; manage with `/memory`

## Key Settings Added Recently

| Setting                     | Version | Purpose                                             |
|-----------------------------|---------|-----------------------------------------------------|
| `modelOverrides`            | 2.1.73  | Map model names to custom provider IDs / ARNs       |
| `autoMemoryDirectory`       | 2.1.74  | Custom directory for auto-memory storage            |
| `feedbackSurveyRate`        | 2.1.76  | Admin control over quality survey sample rate       |
| `worktree.sparsePaths`      | 2.1.76  | Sparse checkout paths for large monorepos           |
| `includeGitInstructions`    | 2.1.69  | Toggle built-in git commit/PR instructions          |

## Key Environment Variables Added Recently

| Variable                           | Version | Purpose                                     |
|------------------------------------|---------|---------------------------------------------|
| `CLAUDE_CODE_DISABLE_CRON`         | 2.1.72  | Stop all cron jobs mid-session              |
| `CLAUDE_CODE_DISABLE_GIT_INSTRUCTIONS` | 2.1.69 | Remove built-in git workflow instructions |
| `ENABLE_CLAUDEAI_MCP_SERVERS=false`| 2.1.63  | Opt out of claude.ai MCP servers            |

---

> Source: [changelog.md](../changelog.md)
