# Server-Managed Settings Cheatsheet

> Public beta — Claude for Teams (v2.1.38+) and Enterprise (v2.1.30+)

## What It Is

Centrally push Claude Code configuration via Claude.ai admin UI — no MDM/device management required. Settings are delivered at authentication time and polled hourly.

## Requirements

- Claude for Teams or Enterprise plan
- Claude Code v2.1.38+ (Teams) or v2.1.30+ (Enterprise)
- Network access to `api.anthropic.com`

## Configure

1. Go to **Claude.ai → Admin Settings → Claude Code → Managed settings**
2. Add JSON configuration
3. Save — clients receive updates on next startup or within 1 hour

**Example: enforce permission deny list**

```json
{
  "permissions": {
    "deny": [
      "Bash(curl *)",
      "Read(./.env)",
      "Read(./.env.*)",
      "Read(./secrets/**)"
    ]
  },
  "disableBypassPermissionsMode": "disable"
}
```

All settings from `settings.json` are supported, including managed-only settings.

## Settings Precedence

- Server-managed and endpoint-managed (MDM) settings = **highest tier** — override everything including CLI args
- When both are present, **server-managed takes precedence** over endpoint-managed

## Caching Behavior

| Scenario                     | Behavior                                                       |
|------------------------------|----------------------------------------------------------------|
| First launch, no cache       | Fetches async; brief window where restrictions not enforced    |
| Subsequent launches          | Cached settings apply immediately; fresh fetch in background   |
| Network failure              | Cached settings persist                                        |
| User edits cache file        | Tampered file applies briefly; server restores on next fetch   |
| User deletes cache file      | First-launch behavior; brief unenforced window                 |

## Security Approval Dialogs

Some settings require explicit user approval before applying:

- Shell command settings
- Custom environment variables (not in known-safe allowlist)
- Hook configurations

- With `-p` (non-interactive mode), dialogs are skipped automatically

## Access Control

Roles that can manage settings: **Primary Owner**, **Owner** only.

## Current Limitations (Beta)

- Settings apply to **all users** uniformly — no per-group configs yet
- MCP server configurations cannot be distributed via server-managed settings
- Not available when using third-party providers (Bedrock, Vertex, Foundry, custom `ANTHROPIC_BASE_URL`)

## Verify Settings Are Applied

```bash
# In Claude Code terminal:
/permissions    # shows effective permission rules including managed rules
```

Or restart Claude Code — managed settings trigger a security dialog on startup if applicable.

## vs. Endpoint-Managed Settings

| Approach                 | Best for                               | Security guarantee         |
|--------------------------|----------------------------------------|----------------------------|
| Server-managed           | No MDM; unmanaged devices              | Client-side; can be bypassed by admin/root users |
| Endpoint-managed (MDM)   | Enrolled devices with MDM/registry     | OS-level; protected from user modification |

---

> Source: [server-managed-settings.md](../server-managed-settings.md)
