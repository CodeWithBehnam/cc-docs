# Model Configuration Cheatsheet

## Model Aliases

| Alias | Description |
| :--- | :--- |
| `default` | Recommended for your account tier |
| `sonnet` | Latest Sonnet (currently 4.6) — daily coding tasks |
| `opus` | Latest Opus (currently 4.6) — complex reasoning |
| `haiku` | Fast, efficient — simple tasks and background ops |
| `sonnet[1m]` | Sonnet with 1M token context window |
| `opus[1m]` | Opus with 1M token context window |
| `opusplan` | Opus during plan mode → auto-switches to Sonnet for execution |

Aliases always point to latest. To pin, use full model ID (e.g., `claude-opus-4-6`).

## Set Model (priority order)

```bash
# 1. During session
/model sonnet

# 2. At startup
claude --model opus

# 3. Environment variable
export ANTHROPIC_MODEL=sonnet

# 4. Settings file
# { "model": "opus" }
```

## Effort Levels (adaptive reasoning)

| Level | Description |
| :--- | :--- |
| `low` | Faster, cheaper — straightforward tasks |
| `medium` | Balanced (default for Opus 4.6 on Max/Team) |
| `high` | Deeper reasoning for complex problems |
| `max` | No thinking token limit; Opus 4.6 only; not persistent |

```bash
/effort low          # change level in-session
/effort auto         # reset to model default
claude --effort high # set for single session
```

Setting `effortLevel` in settings file (persists): `"effortLevel": "medium"`
Env var (takes highest precedence): `CLAUDE_CODE_EFFORT_LEVEL=low`

Disable adaptive thinking: `CLAUDE_CODE_DISABLE_ADAPTIVE_THINKING=1`

## 1M Token Context Window

Supported on Opus 4.6 and Sonnet 4.6.

| Plan | Opus 4.6 1M | Sonnet 4.6 1M |
| :--- | :--- | :--- |
| Max / Team / Enterprise | Included | Extra usage |
| Pro | Extra usage | Extra usage |
| API / pay-as-you-go | Full access | Full access |

```bash
/model opus[1m]
/model claude-opus-4-6[1m]
```

Disable: `CLAUDE_CODE_DISABLE_1M_CONTEXT=1`

## `default` Model Behavior by Plan

| Plan | Default model |
| :--- | :--- |
| Max and Team Premium | Opus 4.6 |
| Pro and Team Standard | Sonnet 4.6 |

## `opusplan` Behavior

- Plan mode active → uses Opus
- Execution mode → auto-switches to Sonnet

## Environment Variables for Model Aliases

| Variable | Controls |
| :--- | :--- |
| `ANTHROPIC_DEFAULT_OPUS_MODEL` | Model for `opus` alias |
| `ANTHROPIC_DEFAULT_SONNET_MODEL` | Model for `sonnet` alias |
| `ANTHROPIC_DEFAULT_HAIKU_MODEL` | Model for `haiku` alias |
| `CLAUDE_CODE_SUBAGENT_MODEL` | Model for subagents |

## Restrict Available Models (Admin)

```json
// managed or policy settings
{ "availableModels": ["sonnet", "haiku"] }
```

`Default` option always remains available regardless.

To force a specific model AND restrict choices:
```json
{ "model": "sonnet", "availableModels": ["sonnet", "haiku"] }
```

## Third-Party Provider Pinning

**Always** pin all three aliases before deploying to Bedrock/Vertex/Foundry:

```bash
export ANTHROPIC_DEFAULT_OPUS_MODEL='us.anthropic.claude-opus-4-6-v1'   # Bedrock example
export ANTHROPIC_DEFAULT_SONNET_MODEL='claude-sonnet-4-6'
export ANTHROPIC_DEFAULT_HAIKU_MODEL='claude-haiku-...'
```

Enable 1M context: `export ANTHROPIC_DEFAULT_OPUS_MODEL='claude-opus-4-6[1m]'`

## Fine-grained Model Overrides (`modelOverrides`)

```json
{
  "modelOverrides": {
    "claude-opus-4-6": "arn:aws:bedrock:us-east-2:123:application-inference-profile/opus-prod"
  }
}
```

Maps Anthropic model IDs → provider-specific IDs (ARN, deployment name, etc.).

## Prompt Caching

| Variable | Effect |
| :--- | :--- |
| `DISABLE_PROMPT_CACHING=1` | Disable for all models |
| `DISABLE_PROMPT_CACHING_HAIKU=1` | Disable for Haiku only |
| `DISABLE_PROMPT_CACHING_SONNET=1` | Disable for Sonnet only |
| `DISABLE_PROMPT_CACHING_OPUS=1` | Disable for Opus only |

## Check Current Model

- `/status` — shows model + account info
- Status line (if configured)

---
> Source: [model-config.md](../model-config.md)
