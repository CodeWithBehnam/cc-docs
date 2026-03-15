# Legal and Compliance Cheatsheet

## Applicable Terms
| User type | Terms |
|---|---|
| Team, Enterprise, Claude API | [Commercial Terms of Service](https://www.anthropic.com/legal/commercial-terms) |
| Free, Pro, Max | [Consumer Terms of Service](https://www.anthropic.com/legal/consumer-terms) |

Existing commercial agreements (1P Claude API or 3P via AWS Bedrock / Google Vertex) automatically apply to Claude Code usage unless mutually agreed otherwise.

## Authentication Rules
| Auth method | Permitted use |
|---|---|
| OAuth (Free/Pro/Max) | Claude Code and Claude.ai **only** |
| API key | Developers building products/services; Agent SDK usage |

- OAuth tokens from consumer plans must NOT be used in third-party tools, the Agent SDK, or to route requests on behalf of other users
- Developers must use API key auth through [Claude Console](https://platform.claude.com/) or a supported cloud provider
- Third-party developers cannot offer "Claude.ai login" to their users

Violations may result in enforcement without prior notice.

## Healthcare Compliance (HIPAA / BAA)
Requirements for BAA coverage:
1. Customer must have a signed BAA with Anthropic
2. Organization must have **Zero Data Retention (ZDR)** activated
3. ZDR is enabled per-organization — each org must be set up separately by Anthropic account team

When both conditions are met, the BAA automatically extends to cover Claude Code API traffic.

## Usage Policy
- Subject to [Anthropic Usage Policy](https://www.anthropic.com/legal/aup)
- Advertised usage limits for Pro/Max assume **individual** use of Claude Code and Agent SDK

## Security & Trust Resources
- [Anthropic Trust Center](https://trust.anthropic.com) — SOC 2 Type 2, ISO 27001, and other compliance artifacts
- [Transparency Hub](https://www.anthropic.com/transparency)

## Reporting Vulnerabilities
- Do not disclose publicly
- Submit via [HackerOne VDP](https://hackerone.com/anthropic-vdp/reports/new?type=team&report_type=vulnerability)
- Include detailed reproduction steps; allow time for fix before public disclosure

## Contact
For questions about permitted authentication methods: [contact sales](https://www.anthropic.com/contact-sales)

---
> Source: [legal-and-compliance.md](../legal-and-compliance.md)
