# Sandbox Template: Devcontainer with Isolation

A complete devcontainer setup for running Claude Code in an isolated, sandboxed environment.

Ideal for unattended operation, client projects, or when you want maximum security.

---

## Directory Structure

```text
.devcontainer/
├── devcontainer.json        # VS Code Dev Container config
├── Dockerfile               # Container image definition
└── init-firewall.sh         # Network firewall rules
```

---

## devcontainer.json

```json
{
  "name": "Claude Code Sandbox",
  "build": {
    "dockerfile": "Dockerfile"
  },
  "features": {
    "ghcr.io/devcontainers/features/node:1": {
      "version": "20"
    },
    "ghcr.io/devcontainers/features/git:1": {}
  },
  "postCreateCommand": "npm install -g @anthropic-ai/claude-code && bash .devcontainer/init-firewall.sh",
  "mounts": [
    "source=claude-sessions,target=/home/node/.claude,type=volume"
  ],
  "containerEnv": {
    "ANTHROPIC_API_KEY": "${localEnv:ANTHROPIC_API_KEY}"
  },
  "customizations": {
    "vscode": {
      "extensions": [
        "anthropic.claude-code"
      ]
    }
  },
  "runArgs": [
    "--cap-add=NET_ADMIN"
  ],
  "remoteUser": "node"
}
```

---

## Dockerfile

```dockerfile
FROM mcr.microsoft.com/devcontainers/base:ubuntu-22.04

# Install iptables for firewall
RUN apt-get update && apt-get install -y \
    iptables \
    jq \
    curl \
    && rm -rf /var/lib/apt/lists/*

# Create working directory
WORKDIR /workspace

# Copy firewall script
COPY init-firewall.sh /usr/local/bin/init-firewall.sh
RUN chmod +x /usr/local/bin/init-firewall.sh
```

---

## Firewall Script

`init-firewall.sh` - Restrict outbound network access to only necessary services:

```bash
#!/bin/bash
set -e

# Default policy: deny all outbound
iptables -P OUTPUT DROP

# Allow loopback (localhost)
iptables -A OUTPUT -o lo -j ACCEPT

# Allow DNS resolution
iptables -A OUTPUT -p udp --dport 53 -j ACCEPT
iptables -A OUTPUT -p tcp --dport 53 -j ACCEPT

# Allow established connections
iptables -A OUTPUT -m state --state ESTABLISHED,RELATED -j ACCEPT

# ---- Allowed outbound connections ----

# Claude API (Anthropic)
iptables -A OUTPUT -p tcp --dport 443 -d api.anthropic.com -j ACCEPT
iptables -A OUTPUT -p tcp --dport 443 -d statsig.anthropic.com -j ACCEPT

# GitHub (for git operations)
iptables -A OUTPUT -p tcp --dport 443 -d github.com -j ACCEPT
iptables -A OUTPUT -p tcp --dport 443 -d api.github.com -j ACCEPT
iptables -A OUTPUT -p tcp --dport 22 -d github.com -j ACCEPT

# npm registry (for package installation)
iptables -A OUTPUT -p tcp --dport 443 -d registry.npmjs.org -j ACCEPT

# PyPI (for Python packages)
iptables -A OUTPUT -p tcp --dport 443 -d pypi.org -j ACCEPT
iptables -A OUTPUT -p tcp --dport 443 -d files.pythonhosted.org -j ACCEPT

# ---- Add more allowed domains below ----
# iptables -A OUTPUT -p tcp --dport 443 -d your-api.example.com -j ACCEPT

echo "Firewall configured: outbound restricted to allowed domains only"
```

---

## Sandbox Settings

Add to `.claude/settings.json` inside the container:

```json
{
  "sandbox": {
    "enabled": true,
    "filesystem": {
      "allowWrite": [
        "/workspace",
        "/tmp"
      ],
      "denyWrite": [
        "/usr",
        "/etc",
        "/home/node/.claude/settings.json"
      ],
      "denyRead": [
        "/etc/shadow",
        "/etc/passwd"
      ]
    },
    "network": {
      "allowedDomains": [
        "api.anthropic.com",
        "statsig.anthropic.com",
        "github.com",
        "api.github.com",
        "registry.npmjs.org"
      ]
    }
  },
  "permissions": {
    "allow": [
      "Read",
      "Grep",
      "Glob",
      "Edit(/workspace/**)",
      "Write(/workspace/**)",
      "Bash(npm *)",
      "Bash(node *)",
      "Bash(git *)"
    ],
    "deny": [
      "Bash(rm -rf /)",
      "Bash(curl * | bash)",
      "Bash(wget * | bash)",
      "Read(.env)",
      "Read(.env.*)"
    ]
  }
}
```

---

## Usage

### With VS Code Dev Containers

1. Open the project in VS Code
2. Press `Ctrl+Shift+P` > "Dev Containers: Reopen in Container"
3. Claude Code is pre-installed and sandboxed

### With Docker directly

```bash
# Build the container
docker build -t claude-sandbox -f .devcontainer/Dockerfile .devcontainer/

# Run with your API key
docker run -it \
  -v $(pwd):/workspace \
  -e ANTHROPIC_API_KEY=$ANTHROPIC_API_KEY \
  --cap-add=NET_ADMIN \
  claude-sandbox \
  claude --dangerously-skip-permissions
```

The `--dangerously-skip-permissions` flag is safe here because the container itself provides isolation.

### With GitHub Codespaces

Add to `.devcontainer/devcontainer.json`:

```json
{
  "secrets": {
    "ANTHROPIC_API_KEY": {
      "description": "Claude API key for Claude Code"
    }
  }
}
```

---

## Customizing the Firewall

### Add AWS Bedrock access

```bash
# AWS Bedrock endpoints
iptables -A OUTPUT -p tcp --dport 443 -d bedrock-runtime.us-east-1.amazonaws.com -j ACCEPT
iptables -A OUTPUT -p tcp --dport 443 -d sts.amazonaws.com -j ACCEPT
```

### Add Google Vertex AI access

```bash
# Vertex AI endpoints
iptables -A OUTPUT -p tcp --dport 443 -d us-east5-aiplatform.googleapis.com -j ACCEPT
iptables -A OUTPUT -p tcp --dport 443 -d oauth2.googleapis.com -j ACCEPT
```

### Add MCP server access

```bash
# Slack MCP
iptables -A OUTPUT -p tcp --dport 443 -d mcp.slack.com -j ACCEPT

# Notion MCP
iptables -A OUTPUT -p tcp --dport 443 -d mcp.notion.com -j ACCEPT
```

---

## Tips

- The volume mount for `~/.claude` preserves session data across container restarts
- `--cap-add=NET_ADMIN` is required for iptables firewall rules
- Test firewall rules with `curl -v https://allowed-domain.com` from inside the container
- For maximum isolation, also mount the project directory as read-only and use a scratch volume for writes
- Session persistence across restarts uses the named Docker volume `claude-sessions`
