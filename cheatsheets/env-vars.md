# Environment Variables Cheatsheet

Set in shell before `claude`, or in `settings.json` under `"env"` for persistence.

## API & Auth

| Variable | Purpose |
|---|---|
| `ANTHROPIC_API_KEY` | API key for SDK/non-interactive use |
| `ANTHROPIC_AUTH_TOKEN` | Custom `Authorization: Bearer` value |
| `ANTHROPIC_CUSTOM_HEADERS` | Extra headers (`Name: Value`, newline-separated) |
| `CLAUDE_CODE_API_KEY_HELPER_TTL_MS` | Custom refresh interval for `apiKeyHelper` |
| `CLAUDE_CODE_USE_BEDROCK=1` | Route requests through Amazon Bedrock |
| `CLAUDE_CODE_USE_VERTEX=1` | Route requests through Google Vertex AI |
| `CLAUDE_CODE_USE_FOUNDRY=1` | Route requests through Microsoft Foundry |
| `CLAUDE_CODE_SKIP_BEDROCK_AUTH=1` | Skip Bedrock auth (for custom auth) |
| `CLAUDE_CODE_SKIP_VERTEX_AUTH=1` | Skip Vertex auth |
| `CLAUDE_CODE_SKIP_FOUNDRY_AUTH=1` | Skip Foundry auth |
| `AWS_BEARER_TOKEN_BEDROCK` | Bearer token for Bedrock auth |

## Model Selection

| Variable | Purpose |
|---|---|
| `ANTHROPIC_MODEL` | Override default model |
| `ANTHROPIC_SMALL_FAST_MODEL` | Override small/fast model |
| `ANTHROPIC_DEFAULT_SONNET_MODEL` | Override Sonnet model |
| `ANTHROPIC_DEFAULT_OPUS_MODEL` | Override Opus model |
| `ANTHROPIC_DEFAULT_HAIKU_MODEL` | Override Haiku model |
| `CLAUDE_CODE_SUBAGENT_MODEL` | Model for subagents |
| `CLAUDE_CODE_EFFORT_LEVEL` | Set effort: `low`, `medium`, `high` |

## Behavior Control

| Variable | Purpose |
|---|---|
| `CLAUDE_CODE_DISABLE_AUTO_MEMORY=1` | Disable auto memory |
| `CLAUDE_CODE_DISABLE_BACKGROUND_TASKS=1` | Disable background task functionality |
| `CLAUDE_CODE_ENABLE_PROMPT_SUGGESTION=false` | Disable prompt suggestions |
| `CLAUDE_CODE_DISABLE_GIT_INSTRUCTIONS=1` | Disable built-in git workflow instructions |
| `CLAUDE_CODE_PLAN_MODE_REQUIRED=1` | Always start in plan mode |
| `CLAUDE_CODE_DISABLE_FAST_MODE=1` | Prevent fast mode |
| `CLAUDE_CODE_DISABLE_ADAPTIVE_THINKING=1` | Disable adaptive thinking |
| `CLAUDE_CODE_ENABLE_TASKS=1` | Enable background task system |
| `CLAUDE_CODE_TASK_LIST_ID` | Named task list for sharing across sessions |
| `CLAUDE_BASH_MAINTAIN_PROJECT_WORKING_DIR=1` | Keep bash commands in project dir |

## Output & Limits

| Variable | Purpose |
|---|---|
| `BASH_DEFAULT_TIMEOUT_MS` | Default bash command timeout |
| `BASH_MAX_TIMEOUT_MS` | Maximum allowed bash timeout |
| `BASH_MAX_OUTPUT_LENGTH` | Max chars captured from bash output |
| `CLAUDE_CODE_MAX_OUTPUT_TOKENS` | Max tokens in model responses |
| `CLAUDE_CODE_FILE_READ_MAX_OUTPUT_TOKENS` | Max tokens when reading files |
| `MAX_THINKING_TOKENS` | Max tokens for extended thinking |
| `MAX_MCP_OUTPUT_TOKENS` | Max tokens from MCP tool responses |

## Auto-Compaction

| Variable | Purpose |
|---|---|
| `CLAUDE_AUTOCOMPACT_PCT_OVERRIDE` | Override compaction threshold (percentage) |
| `CLAUDE_CODE_AUTO_COMPACT_WINDOW` | Context window size for auto-compact |

## Networking & Proxy

| Variable | Purpose |
|---|---|
| `HTTP_PROXY` / `HTTPS_PROXY` | HTTP/HTTPS proxy for outbound requests |
| `NO_PROXY` | Comma-separated hosts to bypass proxy |
| `CLAUDE_CODE_PROXY_RESOLVES_HOSTS=1` | Let proxy resolve hostnames |
| `CLAUDE_CODE_CLIENT_CERT` | Path to client TLS certificate |
| `CLAUDE_CODE_CLIENT_KEY` | Path to client TLS key |
| `CLAUDE_CODE_CLIENT_KEY_PASSPHRASE` | Passphrase for TLS key |

## Telemetry & Analytics

| Variable | Purpose |
|---|---|
| `CLAUDE_CODE_ENABLE_TELEMETRY=1` | Enable OpenTelemetry metrics export |
| `DISABLE_TELEMETRY=1` | Disable all telemetry |
| `DISABLE_ERROR_REPORTING=1` | Disable error reporting |

## Updates & Installation

| Variable | Purpose |
|---|---|
| `DISABLE_AUTOUPDATER=1` | Disable automatic updates |
| `FORCE_AUTOUPDATE_PLUGINS=1` | Force plugin auto-updates |
| `DISABLE_INSTALLATION_CHECKS=1` | Skip installation validation |
| `USE_BUILTIN_RIPGREP=0` | Use system ripgrep (Alpine/musl) |

## Directories & Paths

| Variable | Purpose |
|---|---|
| `CLAUDE_CONFIG_DIR` | Override default config directory (`~/.claude`) |
| `CLAUDE_CODE_TMPDIR` | Override temp directory |
| `CLAUDE_ENV_FILE` | Path to env file loaded at startup |
| `CLAUDE_CODE_ADDITIONAL_DIRECTORIES_CLAUDE_MD=1` | Load CLAUDE.md from `--add-dir` directories |

## MCP

| Variable | Purpose |
|---|---|
| `MCP_TIMEOUT` | MCP server connection timeout |
| `MCP_TOOL_TIMEOUT` | Individual MCP tool call timeout |
| `ENABLE_TOOL_SEARCH=1` | Enable MCP tool search (default on) |
| `ENABLE_CLAUDEAI_MCP_SERVERS=1` | Enable Claude.ai MCP servers |
| `MCP_OAUTH_CALLBACK_PORT` | Port for MCP OAuth callback |
| `MCP_CLIENT_SECRET` | Client secret for MCP OAuth |

## Misc

| Variable | Purpose |
|---|---|
| `CLAUDE_CODE_SHELL` | Override shell used for commands |
| `CLAUDE_CODE_SHELL_PREFIX` | Prefix prepended to shell commands |
| `CLAUDE_CODE_DISABLE_TERMINAL_TITLE=1` | Disable terminal title updates |
| `CLAUDE_CODE_SIMPLE=1` | Simplified output mode |
| `DISABLE_COST_WARNINGS=1` | Suppress cost warning messages |
| `DISABLE_BUG_COMMAND=1` | Disable `/bug` command |
| `DISABLE_PROMPT_CACHING=1` | Disable prompt caching globally |

---
> Source: [env-vars.md](../env-vars.md)
