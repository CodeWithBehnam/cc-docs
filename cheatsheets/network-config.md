# Network Configuration Cheatsheet

## Proxy Configuration
```bash
# HTTPS proxy (recommended)
export HTTPS_PROXY=https://proxy.example.com:8080

# HTTP proxy fallback
export HTTP_PROXY=http://proxy.example.com:8080

# Bypass proxy (space- or comma-separated)
export NO_PROXY="localhost,192.168.1.1,example.com,.example.com"

# Bypass all
export NO_PROXY="*"

# Basic auth in proxy URL
export HTTPS_PROXY=http://username:password@proxy.example.com:8080
```

- SOCKS proxies are NOT supported
- For advanced auth (NTLM, Kerberos): use an LLM Gateway that supports your auth method
- Never hardcode passwords in scripts; use env vars or secure credential storage

## Custom CA Certificates
```bash
# Trust a corporate/custom CA
export NODE_EXTRA_CA_CERTS=/path/to/ca-cert.pem
```
Use this when your proxy performs TLS inspection or your enterprise uses a private CA.

## mTLS Client Certificates
```bash
export CLAUDE_CODE_CLIENT_CERT=/path/to/client-cert.pem
export CLAUDE_CODE_CLIENT_KEY=/path/to/client-key.pem
export CLAUDE_CODE_CLIENT_KEY_PASSPHRASE="your-passphrase"  # optional
```

## Required URLs to Allowlist
| URL | Purpose |
|---|---|
| `api.anthropic.com` | Claude API endpoints |
| `claude.ai` | Auth for claude.ai accounts |
| `platform.claude.com` | Auth for Anthropic Console accounts |
| `storage.googleapis.com` | Claude Code binary downloads / updates |

For Claude Code on the web and Code Review (Anthropic-managed infra connecting to your repos):
- Enable **IP allow list inheritance** for installed GitHub Apps in GitHub Enterprise Cloud settings, OR
- Manually add [Anthropic API IP ranges](https://platform.claude.com/docs/en/api/ip-addresses) to your allow list

## Persist Settings
All env vars can also go in `settings.json` to persist without shell exports:
```json
{
  "env": {
    "HTTPS_PROXY": "http://proxy.example.com:8080",
    "NODE_EXTRA_CA_CERTS": "/path/to/ca-cert.pem"
  }
}
```

## Gotchas
- Claude Code does NOT support SOCKS proxies
- Corporate proxies doing TLS inspection require `NODE_EXTRA_CA_CERTS` to avoid certificate errors
- On Bedrock/Vertex/Foundry, Claude Code does not send telemetry metrics — use LiteLLM for spend tracking
- For WSL2 proxy issues, ensure `HTTPS_PROXY` is set inside the WSL environment (not just Windows)

---
> Source: [network-config.md](../network-config.md)
