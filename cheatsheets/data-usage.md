# Data Usage Cheatsheet

## Training Data Policy
| User type | Training policy |
|---|---|
| Consumer (Free, Pro, Max) | Data used for model training **when setting is on** |
| Commercial (Team, Enterprise, API) | NOT used for training by default |
| Development Partner Program | Opt-in; org admin must explicitly enable; API only (not Bedrock/Vertex) |

Change consumer privacy settings: [claude.ai/settings/data-privacy-controls](https://claude.ai/settings/data-privacy-controls)

## Data Retention
| User type | Retention |
|---|---|
| Consumer — allows training | 5 years |
| Consumer — does not allow training | 30 days |
| Commercial (Team, Enterprise, API) | 30 days |
| Commercial + Zero Data Retention (ZDR) | 0 days (Enterprise only; enabled per-org) |
| Local session cache | Up to 30 days (configurable) |
| `/bug` feedback transcripts | 5 years |

## Opt-Out Environment Variables
| Variable | What it disables |
|---|---|
| `DISABLE_TELEMETRY=1` | Statsig operational metrics |
| `DISABLE_ERROR_REPORTING=1` | Sentry error logging |
| `DISABLE_BUG_COMMAND=1` | `/bug` reporting |
| `CLAUDE_CODE_DISABLE_FEEDBACK_SURVEY=1` | Session quality surveys |
| `CLAUDE_CODE_DISABLE_NONESSENTIAL_TRAFFIC=1` | All of the above at once |

## Default Behavior by Provider
| Service | Claude API | Vertex / Bedrock / Foundry |
|---|---|---|
| Statsig (metrics) | Default ON | Default OFF |
| Sentry (errors) | Default ON | Default OFF |
| `/bug` reports | Default ON | Default OFF |
| Session quality surveys | Default ON | Default OFF |

Set all env vars in `settings.json` to persist across sessions.

## What Data is Transmitted
- All user prompts and model outputs (encrypted in transit via TLS, not encrypted at rest)
- Statsig: latency, reliability, usage patterns — **no code or file paths**
- Sentry: operational errors only
- `/bug`: full conversation transcript + code (optional GitHub issue created)
- Session quality survey: numeric rating only (1, 2, 3, or dismiss) — **no transcripts**

## Cloud Execution Data
- Repository cloned to isolated Anthropic-managed VM
- Code and session data follow same retention policy as your account type
- GitHub credentials handled via secure proxy (never enter sandbox)
- All outbound traffic goes through security proxy for audit logging
- Deleting a cloud session permanently removes its event data

## Zero Data Retention (ZDR)
- Available for Claude Code on **Claude for Enterprise** only
- Enabled per-organization by Anthropic account team
- Required for BAA (HIPAA) coverage (see [legal-and-compliance](legal-and-compliance.md))
- Disables contribution metrics in analytics dashboard

---
> Source: [data-usage.md](../data-usage.md)
