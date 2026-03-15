# Zero Data Retention (ZDR) Cheatsheet

## What ZDR Does

- Prompts and model responses are **not stored** by Anthropic after the response is returned
- Applies to Claude Code inference on **Claude for Enterprise** (direct platform only)
- Does **not** apply automatically to Bedrock, Vertex AI, or Foundry (use those platforms' policies)

## Request ZDR

Contact your **Anthropic account team** — ZDR is enabled per-organization and requires manual review.

## What ZDR Covers

- All model inference calls made through Claude Code CLI on Claude for Enterprise
- Applies regardless of which Claude model is used

## What ZDR Does NOT Cover

| Feature                  | Status under ZDR                                                               |
|--------------------------|--------------------------------------------------------------------------------|
| Chat on claude.ai         | NOT covered — standard data retention applies                                  |
| Cowork sessions           | NOT covered                                                                    |
| Claude Code Analytics     | Collects usage metadata (emails, stats); **no prompts/responses stored**. Contribution metrics unavailable |
| User/seat management data | NOT covered — retained under standard policy                                   |
| Third-party integrations  | NOT covered — review each service independently                                |

## Features Disabled Under ZDR

These features are automatically blocked at the backend:

| Feature                               | Reason                                             |
|---------------------------------------|----------------------------------------------------|
| Claude Code on the Web                | Requires server-side conversation history storage  |
| Remote sessions from Desktop app      | Requires persistent session data                   |
| Feedback submission (`/feedback`)     | Sends conversation data to Anthropic               |

## Policy Violation Exception

Even with ZDR, Anthropic may retain data if:

- Required by law
- Session flagged for Usage Policy violation → retained up to **2 years**

## Important Gotchas

- ZDR is **per-organization** — new orgs under the same account need ZDR enabled separately
- `ANTHROPIC_BASE_URL` or third-party providers bypass ZDR entirely
- Transitioning from PAYG API keys to Enterprise ZDR: contact account team to coordinate migration

---

> Source: [zero-data-retention.md](../zero-data-retention.md)
