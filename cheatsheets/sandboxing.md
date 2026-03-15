# Sandboxing Cheatsheet

## What Sandboxing Does
- Restricts **filesystem** access (write limited to cwd by default; read is broad)
- Restricts **network** access (allowlisted domains only via proxy)
- OS-level enforcement: macOS Seatbelt / Linux+WSL2 bubblewrap
- All child processes (kubectl, terraform, npm, etc.) inherit the same restrictions
- Reduces approval fatigue — safe sandboxed commands can auto-run

## Prerequisites
```bash
# macOS: works out of the box (uses Seatbelt)

# Linux / WSL2 (Ubuntu/Debian)
sudo apt-get install bubblewrap socat

# Linux / WSL2 (Fedora/RHEL)
sudo dnf install bubblewrap socat
```
WSL1 is NOT supported.

## Enable Sandboxing
```
/sandbox    # opens mode selection menu in Claude Code
```

### Sandbox Modes
| Mode | Behavior |
|---|---|
| Auto-allow | Sandboxed bash commands run automatically (no approval prompt) |
| Regular permissions | All bash commands still require explicit permission even when sandboxed |

Note: Auto-allow applies to bash only; file edit tools use their own permission flow.

## Configuration (`settings.json`)
```json
{
  "sandbox": {
    "enabled": true,
    "filesystem": {
      "allowWrite": ["~/.kube", "//tmp/build"],
      "denyWrite": ["~/.bashrc"],
      "denyRead": ["~/.ssh"]
    },
    "allowManagedDomainsOnly": true,
    "allowUnsandboxedCommands": false
  }
}
```

### Path Prefix Meanings
| Prefix | Resolves to | Example |
|---|---|---|
| `//` | Absolute filesystem root | `//tmp/build` → `/tmp/build` |
| `~/` | Home directory | `~/.kube` → `$HOME/.kube` |
| `/` | Settings file's directory | `/build` → `$SETTINGS_DIR/build` |
| `./` or none | Relative (resolved by runtime) | `./output` |

`allowWrite` / `denyWrite` / `denyRead` arrays are **merged** across settings scopes (not replaced).

## Custom Proxy (Advanced)
```json
{
  "sandbox": {
    "network": {
      "httpProxyPort": 8080,
      "socksProxyPort": 8081
    }
  }
}
```

## What Sandbox Protects Against
- Prompt injection writing to `~/.bashrc`, `/bin/` or other system files
- Data exfiltration to attacker-controlled servers
- Malicious npm packages or build scripts accessing unauthorized resources
- Unexpected API calls to unapproved services

## Escape Hatch
- When a command fails inside the sandbox, Claude may retry it unsandboxed (goes through normal permission flow)
- Disable: `"allowUnsandboxedCommands": false`
- Exclude specific commands entirely: add to `excludedCommands`

## Known Incompatibilities
- `watchman` — use `jest --no-watchman` instead
- `docker` — add to `excludedCommands` to run outside sandbox
- Many CLI tools need network domain approval on first use (grant once, remembered)

## Open Source Runtime
```bash
npx @anthropic-ai/sandbox-runtime <command-to-sandbox>
```

## Gotchas
- Both filesystem AND network isolation are required for effective sandboxing — one without the other leaves gaps
- Broad domain allowances (e.g. `github.com`) can still allow data exfiltration
- `allowUnixSockets` for `/var/run/docker.sock` effectively grants host access — use carefully
- Overly broad `allowWrite` to `$PATH` dirs or shell configs enables privilege escalation
- Linux `enableWeakerNestedSandbox` (for Docker without privileged namespaces) significantly weakens security

---
> Source: [sandboxing.md](../sandboxing.md)
