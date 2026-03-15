# Fast Mode Cheatsheet

## What Fast Mode Is

High-speed configuration for **Opus 4.6 only**. 2.5x faster, higher cost per token. Same quality and capabilities — different API configuration prioritizing speed.

> Research preview. Requires Claude Code v2.1.36+. Not available on Bedrock, Vertex, or Foundry.

## Toggle Fast Mode

```bash
/fast          # toggle on/off (Tab to confirm)
```

Or set in settings:
```json
{ "fastMode": true }
```

When enabled:
- Automatically switches to Opus 4.6 if on a different model
- `↯` icon appears next to prompt
- Persists across sessions by default

Disabling: `/fast` again — stays on Opus 4.6 (use `/model` to switch away).

## Pricing

| Mode | Input (<200K) | Output (<200K) | Input (>200K) | Output (>200K) |
| :--- | :--- | :--- | :--- | :--- |
| Fast mode Opus 4.6 | $30/MTok | $150/MTok | $60/MTok | $225/MTok |

- Compatible with 1M token context window
- Billed directly to extra usage (doesn't count against plan's included limits)
- Enable fast mode from session start — switching mid-session pays full uncached price for entire context

## Fast Mode vs Effort Level

| Setting | Quality | Speed | Cost |
| :--- | :--- | :--- | :--- |
| Fast mode | Unchanged | 2.5x faster | Higher |
| Lower effort | Potentially lower on complex tasks | Faster | Lower |

Combine both for maximum speed on simple tasks.

## When to Use

**Use fast mode for:**
- Rapid iteration on code changes
- Live debugging sessions
- Time-sensitive work

**Use standard mode for:**
- Long autonomous tasks
- Batch processing / CI/CD
- Cost-sensitive workloads

## Requirements

- Not available on third-party clouds (Bedrock, Vertex, Foundry)
- Extra usage must be enabled on your account
- Teams/Enterprise: admin must enable before users can access

## Admin Controls

Enable for organization:
- Console: `platform.claude.com/claude-code/preferences`
- Claude AI: `claude.ai/admin-settings/claude-code`

Require per-session opt-in (resets each session):
```json
{ "fastModePerSessionOptIn": true }
```

Disable completely:
```bash
export CLAUDE_CODE_DISABLE_FAST_MODE=1
```

## Rate Limits

Fast mode has **separate** rate limits from standard Opus 4.6.

On rate limit or out of extra usage credits:
- Automatically falls back to standard Opus 4.6
- `↯` icon turns gray (cooldown)
- Auto re-enables when cooldown expires
- Or manually disable with `/fast`

---
> Source: [fast-mode.md](../fast-mode.md)
