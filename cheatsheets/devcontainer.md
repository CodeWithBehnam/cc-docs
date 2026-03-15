# Dev Container Cheatsheet

## What It Is

A pre-configured Docker-based development container for Claude Code with security isolation, enabling `--dangerously-skip-permissions` safely.

Reference: [github.com/anthropics/claude-code/.devcontainer](https://github.com/anthropics/claude-code/tree/main/.devcontainer)

## Quick Start (4 steps)

1. Install VS Code + Remote - Containers extension
2. Clone the Claude Code reference repo
3. Open in VS Code
4. Click "Reopen in Container" (or `Cmd+Shift+P` → "Remote-Containers: Reopen in Container")

## Configuration Files

| File | Purpose |
|---|---|
| `devcontainer.json` | Container settings, extensions, volume mounts |
| `Dockerfile` | Container image and installed tools |
| `init-firewall.sh` | Network security rules (firewall setup) |

## Key Features

- Node.js 20 base image with dev dependencies
- Git, ZSH with productivity enhancements, fzf
- Pre-configured VS Code extensions and settings
- Session persistence (history/config survives container restarts)
- Works on macOS, Windows, Linux

## Security Model

- **Default-deny firewall**: blocks all external traffic except allowlisted domains (npm, GitHub, Claude API, etc.)
- Outbound DNS and SSH permitted
- Startup verification: firewall rules validated on container init
- Isolated from host system

Because of this isolation, you can safely run:
```bash
claude --dangerously-skip-permissions
```

**Warning**: even with isolation, a malicious project could exfiltrate anything accessible inside the container, including Claude Code credentials. Only use with trusted repositories.

## Customization

- Add/remove VS Code extensions
- Adjust resource allocations
- Modify network access (expand/restrict allowed domains)
- Customize shell config and developer tooling

## Use Cases

| Scenario | Benefit |
|---|---|
| Secure client work | Isolate projects so code/credentials don't mix |
| Team onboarding | Fully configured environment in minutes |
| CI/CD consistency | Mirror devcontainer config in pipelines |

---
> Source: [devcontainer.md](../devcontainer.md)
