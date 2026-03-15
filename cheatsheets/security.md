# Security Cheatsheet

## Security Architecture
- **Read-only by default**: additional actions require explicit permission
- **Write scope**: Claude can only write inside the directory where it was started
- **Checkpoints**: every file edit is snapshotted and reversible
- SOC 2 Type 2, ISO 27001 certified — artifacts at [trust.anthropic.com](https://trust.anthropic.com)

## Permission Modes
| Mode | Behavior |
|---|---|
| Default | Approve each file edit and shell command |
| Auto-accept edits | Files edit without prompting; commands still prompt |
| Plan mode | Read-only; produces plan for approval before execution |

Use `/permissions` to allowlist safe commands. Use `/sandbox` for OS-level isolation.

## Prompt Injection Protections
- Sensitive operations always require explicit approval
- Web fetch uses an **isolated context window** (malicious content can't bleed into conversation)
- `curl` and `wget` are blocklisted by default
- Command injection detection flags suspicious bash even if previously allowlisted
- First-time codebase runs and new MCP servers require **trust verification** (disabled with `-p` flag)
- Fail-closed: unmatched commands default to requiring manual approval

## Sandboxing
Enable with `/sandbox` for OS-level filesystem and network isolation:
- Filesystem: write restricted to project directory
- Network: only allowlisted domains accessible

See [sandboxing cheatsheet](sandboxing.md) for full details.

## Protecting Sensitive Code
- Review all suggested changes before approval
- Use project-specific permission settings for sensitive repos
- Use [devcontainers](/en/devcontainer) for additional isolation
- Audit permissions regularly with `/permissions`

## Team Security
- Use **managed settings** to enforce org-wide standards (distributable via MDM)
- Share approved permission configs through version control
- Monitor activity via [OpenTelemetry metrics](monitoring-usage.md)
- Audit or block settings changes with `ConfigChange` hooks

## Cloud Execution Security
- Each cloud session runs in an isolated Anthropic-managed VM
- Network access limited by default; configurable per session
- GitHub credentials handled via secure proxy — never enter the sandbox
- Git push restricted to current working branch
- All operations are audit-logged
- Environments auto-terminate after session

## Remote Control Sessions
- All execution stays on your local machine
- Data flows through Anthropic API over TLS (same as local usage)
- Uses multiple short-lived, narrowly scoped credentials
- No cloud VMs or sandboxing involved

## MCP Security
- You are responsible for vetting MCP servers — Anthropic does not audit them
- Use MCP servers only from providers you trust or that you wrote yourself
- MCP permissions are configurable in Claude Code settings

## Windows Warning
Avoid enabling WebDAV or allowing Claude Code to access `\\*` paths — WebDAV is deprecated by Microsoft and can allow Claude Code to trigger unauthorized network requests, bypassing the permission system.

## Best Practices
1. Review suggested commands before approval
2. Don't pipe untrusted content directly to Claude
3. Verify proposed changes to critical files
4. Use VMs when interacting with external web services
5. Report suspicious behavior with `/bug`

## Reporting Vulnerabilities
Do not disclose publicly. Report via [HackerOne](https://hackerone.com/anthropic-vdp/reports/new?type=team&report_type=vulnerability) with detailed reproduction steps.

---
> Source: [security.md](../security.md)
