# Authentication Cheatsheet

## Login / Logout

```bash
claude          # first run opens browser for login
/login          # switch accounts mid-session
/logout         # log out
claude auth login --email user@example.com --sso
claude auth status        # JSON output; --text for human-readable
```

- If browser doesn't open: press `c` to copy login URL

## Account Types

| Type | Notes |
|---|---|
| Claude Pro / Max | Personal subscription, log in with claude.ai account |
| Claude for Teams | Self-service, includes admin/billing tools |
| Claude for Enterprise | Adds SSO, domain capture, RBAC, compliance API |
| Claude Console | API billing (pre-paid credits); creates "Claude Code" workspace |
| Amazon Bedrock | Set env vars, no browser login needed |
| Google Vertex AI | Set env vars, no browser login needed |
| Microsoft Foundry | Set env vars, no browser login needed |

## Team Setup (Claude for Teams / Enterprise)

1. Subscribe at claude.com/pricing or contact sales
2. Admin invites team members from dashboard
3. Members install Claude Code and log in with their Claude.ai accounts

## Console Team Setup

1. Use existing Console account or create new one
2. Invite users: Settings → Members → Invite (or set up SSO)
3. Assign role: **Claude Code** (API keys only) or **Developer** (any API key)
4. Each user: accept invite → install Claude Code → log in

## Cloud Provider Auth

Set the required env vars before running `claude` — no browser prompt:
- Bedrock: see `/en/amazon-bedrock` docs
- Vertex AI: see `/en/google-vertex-ai` docs
- Microsoft Foundry: see `/en/microsoft-foundry` docs

## Credential Management

| Item | Detail |
|---|---|
| Storage (macOS) | Encrypted macOS Keychain |
| Supported types | Claude.ai, API key, Azure, Bedrock, Vertex Auth |
| Custom key script | `apiKeyHelper` setting — runs a shell script to return API key |
| Refresh interval | Default: 5 min or on HTTP 401; override with `CLAUDE_CODE_API_KEY_HELPER_TTL_MS` |

---
> Source: [authentication.md](../authentication.md)
