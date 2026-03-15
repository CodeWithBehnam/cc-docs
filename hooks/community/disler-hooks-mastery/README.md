# disler-hooks-mastery - Comprehensive Python Hooks System

A sophisticated Python-based hooks system for Claude Code by [disler](https://github.com/disler) (github.com/disler/claude-code-hooks-mastery, 3300+ stars). This collection provides a complete lifecycle hook framework with LLM-powered summaries, text-to-speech announcements, automated code quality validation, multi-agent observability, and human-in-the-loop patterns.

All hooks use `uv run --script` for zero-config dependency management and are designed to fail gracefully (they never block Claude Code on errors).

**License:** MIT

---

## Hook Scripts

Each `.py` file maps to a Claude Code hook event type matching its filename.

### Lifecycle Hooks

| File | Event Type | Description |
|------|-----------|-------------|
| `session_start.py` | SessionStart | Logs session start, loads git status/branch info, injects development context (TODO.md, GitHub issues), optional TTS announcement |
| `session_end.py` | SessionEnd | Logs session end with timestamp, optional cleanup of stale temp files and old chat logs |
| `setup.py` | Setup | Detects project type (Node.js, Python, Rust, Go), checks tool availability, installs dependencies, runs maintenance tasks |
| `stop.py` | Stop | Logs stop events, copies transcript to chat.json for review, LLM-generated completion messages via TTS |
| `pre_compact.py` | PreCompact | Logs compaction events, optionally backs up transcript before context window compaction |

### Tool Lifecycle Hooks

| File | Event Type | Description |
|------|-----------|-------------|
| `pre_tool_use.py` | PreToolUse | Blocks dangerous `rm -rf` commands and `.env` file access, logs all tool invocations |
| `post_tool_use.py` | PostToolUse | Logs all completed tool invocations to JSON for audit |
| `post_tool_use_failure.py` | PostToolUseFailure | Logs tool failures with structured error details, timestamps, and session context |
| `permission_request.py` | PermissionRequest | Auto-allows read-only operations (Read, Glob, Grep, safe Bash), logs all permission requests, supports deny with interrupt |

### Agent Lifecycle Hooks

| File | Event Type | Description |
|------|-----------|-------------|
| `subagent_start.py` | SubagentStart | Logs subagent spawn with agent ID and type, optional TTS announcement |
| `subagent_stop.py` | SubagentStop | Logs subagent completion, reads transcript for task context, generates AI summary of completed work, TTS with file-based lock queue for concurrent agents |

### User Interaction Hooks

| File | Event Type | Description |
|------|-----------|-------------|
| `user_prompt_submit.py` | UserPromptSubmit | Logs prompts, stores session data in JSON, validates prompts against blocked patterns, generates LLM-powered agent names |
| `notification.py` | Notification | Logs notification events, TTS announcement when agent needs user input (with randomized personalization) |

### Observability Hooks (from multi-agent-observability repo)

| File | Event Type | Description |
|------|-----------|-------------|
| `send_event.py` | Any | Sends hook events to an observability server (default: localhost:4000), extracts model info, includes chat transcript, generates AI summaries |

### Setup Hooks (from install-and-maintain repo)

| File | Event Type | Description |
|------|-----------|-------------|
| `setup_init.py` | Setup (init) | Repository initialization: installs backend (uv) and frontend (npm) dependencies, initializes SQLite database, sets environment variables |
| `setup_maintenance.py` | Setup (maintenance) | Maintenance mode: upgrades dependencies, runs VACUUM and integrity checks on SQLite databases, reports table row counts |

---

## Validators

Automated code quality checks that run as PostToolUse or Stop hooks. They output JSON decisions to block-and-retry or allow completion.

| File | Type | Description |
|------|------|-------------|
| `validators/ruff_validator.py` | PostToolUse | Runs `uvx ruff check` on Python files after Write/Edit operations. Blocks with lint errors so Claude can fix them. |
| `validators/ty_validator.py` | PostToolUse | Runs `uvx ty check` for type checking on Python files. Blocks on type errors. |
| `validators/validate_new_file.py` | Stop | Validates that a new file was created in a specified directory (checks git status and file age). |
| `validators/validate_file_contains.py` | Stop | Validates that a newly created file contains all required content strings (case-sensitive section checks). |

---

## Utils

### LLM Integrations (`utils/llm/`)

Each LLM provider module exposes `prompt_llm()`, `generate_completion_message()`, and `generate_agent_name()` functions.

| File | Description |
|------|-------------|
| `utils/llm/anth.py` | Anthropic API integration using claude-3-5-haiku for fast completions, agent name generation |
| `utils/llm/oai.py` | OpenAI API integration using gpt-4.1-nano for completions, gpt-4o-mini for name generation |
| `utils/llm/ollama.py` | Ollama local LLM integration using OpenAI-compatible API (default model: gpt-oss:20b) |
| `utils/llm/task_summarizer.py` | Generates natural language summaries of subagent task completions for TTS announcements |

### TTS Integrations (`utils/tts/`)

Text-to-speech providers, selected automatically based on available API keys (ElevenLabs > OpenAI > pyttsx3).

| File | Description |
|------|-------------|
| `utils/tts/elevenlabs_tts.py` | ElevenLabs Turbo v2.5 TTS for high-quality, low-latency speech |
| `utils/tts/openai_tts.py` | OpenAI gpt-4o-mini-tts with streaming audio and Nova voice |
| `utils/tts/pyttsx3_tts.py` | Offline TTS using pyttsx3 (no API key required, cross-platform) |
| `utils/tts/tts_queue.py` | File-based lock manager for coordinating concurrent TTS from multiple agents using fcntl |

### Observability Utils (`utils/`)

| File | Description |
|------|-------------|
| `utils/constants.py` | Shared constants and session log directory helpers |
| `utils/hitl.py` | Human-in-the-loop pattern: ask questions, request permissions, or present choices via a WebSocket callback to an observability dashboard |
| `utils/model_extractor.py` | Extracts model name from Claude Code transcript JSONL files with optional file-based caching |
| `utils/summarizer.py` | Generates one-sentence event summaries using Anthropic for the observability server |

### Examples (`examples/`)

| File | Description |
|------|-------------|
| `examples/hitl_example.py` | Demonstrates HITL patterns: free-form questions, permission requests, and multiple-choice prompts |

---

## Installation

### Quick Start

1. Copy this entire directory to your project's `.claude/hooks/` directory:

```bash
cp -r hooks/community/disler-hooks-mastery/ .claude/hooks/
```

2. Make all scripts executable:

```bash
chmod +x .claude/hooks/disler-hooks-mastery/*.py
chmod +x .claude/hooks/disler-hooks-mastery/validators/*.py
chmod +x .claude/hooks/disler-hooks-mastery/utils/llm/*.py
chmod +x .claude/hooks/disler-hooks-mastery/utils/tts/*.py
```

3. Wire hooks in your `.claude/settings.json` (see example below).

### Requirements

- **Python 3.10+** (most scripts specify `>=3.11`, a few work with `>=3.8`)
- **uv** (scripts use `uv run --script` with inline dependency metadata)

### Optional Dependencies

These are installed automatically by `uv run --script` when needed:

| Package | Required By | Purpose |
|---------|-------------|---------|
| `python-dotenv` | Most hooks | Load `.env` files for API keys |
| `anthropic` | `anth.py`, `task_summarizer.py`, `summarizer.py`, `send_event.py`, `subagent_stop.py` | Anthropic API calls |
| `openai` | `oai.py`, `ollama.py`, `openai_tts.py` | OpenAI and Ollama API calls |
| `elevenlabs` | `elevenlabs_tts.py` | ElevenLabs TTS |
| `pyttsx3` | `pyttsx3_tts.py` | Offline TTS |
| `websockets` | `hitl.py` | Human-in-the-loop WebSocket server |
| `requests` | `hitl.py` | HTTP requests to observability server |

### Environment Variables

| Variable | Used By | Description |
|----------|---------|-------------|
| `ANTHROPIC_API_KEY` | `anth.py`, `task_summarizer.py`, `summarizer.py` | Anthropic API access |
| `OPENAI_API_KEY` | `oai.py`, `openai_tts.py` | OpenAI API access |
| `ELEVENLABS_API_KEY` | `elevenlabs_tts.py` | ElevenLabs TTS access |
| `OLLAMA_MODEL` | `ollama.py` | Override default Ollama model (default: gpt-oss:20b) |
| `ENGINEER_NAME` | `notification.py`, `stop.py`, LLM utils | Personalize TTS messages |
| `CLAUDE_ENV_FILE` | `setup.py` | Persist environment variables across sessions |
| `CLAUDE_HOOKS_LOG_DIR` | `constants.py` | Override log directory (default: logs/) |

---

## Example settings.json

Below is a complete example wiring all hooks. Adjust the path prefix if you install them in a different location.

```json
{
  "hooks": {
    "SessionStart": [
      {
        "hooks": [
          {
            "type": "command",
            "command": "uv run .claude/hooks/session_start.py --load-context"
          }
        ]
      }
    ],
    "SessionEnd": [
      {
        "hooks": [
          {
            "type": "command",
            "command": "uv run .claude/hooks/session_end.py --cleanup"
          }
        ]
      }
    ],
    "Setup": [
      {
        "hooks": [
          {
            "type": "command",
            "command": "uv run .claude/hooks/setup.py --verbose"
          }
        ]
      }
    ],
    "UserPromptSubmit": [
      {
        "hooks": [
          {
            "type": "command",
            "command": "uv run .claude/hooks/user_prompt_submit.py --store-last-prompt"
          }
        ]
      }
    ],
    "PreToolUse": [
      {
        "hooks": [
          {
            "type": "command",
            "command": "uv run .claude/hooks/pre_tool_use.py"
          }
        ]
      }
    ],
    "PostToolUse": [
      {
        "hooks": [
          {
            "type": "command",
            "command": "uv run .claude/hooks/post_tool_use.py"
          }
        ]
      },
      {
        "matcher": "Write|Edit|MultiEdit",
        "hooks": [
          {
            "type": "command",
            "command": "uv run .claude/hooks/validators/ruff_validator.py"
          },
          {
            "type": "command",
            "command": "uv run .claude/hooks/validators/ty_validator.py"
          }
        ]
      }
    ],
    "PostToolUseFailure": [
      {
        "hooks": [
          {
            "type": "command",
            "command": "uv run .claude/hooks/post_tool_use_failure.py"
          }
        ]
      }
    ],
    "PermissionRequest": [
      {
        "hooks": [
          {
            "type": "command",
            "command": "uv run .claude/hooks/permission_request.py --auto-allow"
          }
        ]
      }
    ],
    "PreCompact": [
      {
        "hooks": [
          {
            "type": "command",
            "command": "uv run .claude/hooks/pre_compact.py --backup"
          }
        ]
      }
    ],
    "Notification": [
      {
        "hooks": [
          {
            "type": "command",
            "command": "uv run .claude/hooks/notification.py --notify"
          }
        ]
      }
    ],
    "SubagentStart": [
      {
        "hooks": [
          {
            "type": "command",
            "command": "uv run .claude/hooks/subagent_start.py --notify"
          }
        ]
      }
    ],
    "SubagentStop": [
      {
        "hooks": [
          {
            "type": "command",
            "command": "uv run .claude/hooks/subagent_stop.py --notify --summarize"
          }
        ]
      }
    ],
    "Stop": [
      {
        "hooks": [
          {
            "type": "command",
            "command": "uv run .claude/hooks/stop.py --chat --notify"
          }
        ]
      }
    ]
  }
}
```

### Minimal Setup (logging only, no TTS or LLM)

If you only want logging and safety features, omit the `--notify`, `--chat`, and `--summarize` flags:

```json
{
  "hooks": {
    "PreToolUse": [
      {
        "hooks": [
          { "type": "command", "command": "uv run .claude/hooks/pre_tool_use.py" }
        ]
      }
    ],
    "PostToolUse": [
      {
        "hooks": [
          { "type": "command", "command": "uv run .claude/hooks/post_tool_use.py" }
        ]
      },
      {
        "matcher": "Write|Edit|MultiEdit",
        "hooks": [
          { "type": "command", "command": "uv run .claude/hooks/validators/ruff_validator.py" }
        ]
      }
    ],
    "Stop": [
      {
        "hooks": [
          { "type": "command", "command": "uv run .claude/hooks/stop.py" }
        ]
      }
    ]
  }
}
```

---

## Source

- Primary repo: [disler/claude-code-hooks-mastery](https://github.com/disler/claude-code-hooks-mastery) (MIT license)
- Observability additions: [disler/claude-code-hooks-multi-agent-observability](https://github.com/disler/claude-code-hooks-multi-agent-observability) (MIT license)
- Setup hooks: [disler/install-and-maintain](https://github.com/disler/install-and-maintain) (MIT license)
