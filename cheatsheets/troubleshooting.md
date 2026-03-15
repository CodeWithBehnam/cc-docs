# Troubleshooting Cheatsheet

## Quick Error Lookup
| Error / Symptom | Fix |
|---|---|
| `command not found: claude` | Add `~/.local/bin` to PATH |
| `syntax error near unexpected token '<'` | Install script returned HTML (region or network issue) |
| `curl: (56) Failure writing output` | Network interrupted; retry or use Homebrew/WinGet |
| `Killed` on Linux during install | Add swap space (needs 4 GB RAM) |
| `TLS connect error` / `SSL/TLS secure channel` | Update CA certs or set `NODE_EXTRA_CA_CERTS` |
| `Failed to fetch version` | `storage.googleapis.com` blocked; set `HTTPS_PROXY` |
| `irm is not recognized` | Use PowerShell not CMD |
| `&& is not valid` | Use PowerShell installer, not CMD installer |
| `Claude Code on Windows requires git-bash` | Install Git for Windows |
| `Error loading shared library` | musl/glibc binary mismatch |
| `Illegal instruction` on Linux | CPU architecture mismatch |
| `dyld: cannot load` on macOS | macOS < 13.0 or wrong arch |
| `OAuth error` / `403 Forbidden` | Re-authenticate or check role/subscription |

## Fix PATH (command not found)
```bash
# macOS/Linux — add to ~/.zshrc or ~/.bashrc
echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.zshrc && source ~/.zshrc
claude --version    # verify
```

## Alternative Install Methods
```bash
# macOS/Linux
brew install --cask claude-code

# Windows
winget install Anthropic.ClaudeCode
```

## Fix TLS/SSL Errors
```bash
# Ubuntu/Debian
sudo apt-get update && sudo apt-get install ca-certificates

# Corporate proxy CA
export NODE_EXTRA_CA_CERTS=/path/to/corporate-ca.pem

# Windows: enable TLS 1.2 first
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
irm https://claude.ai/install.ps1 | iex
```

## Fix Low-Memory Linux Install (add swap)
```bash
sudo fallocate -l 2G /swapfile && sudo chmod 600 /swapfile
sudo mkswap /swapfile && sudo swapon /swapfile
curl -fsSL https://claude.ai/install.sh | bash
```

## Fix musl/glibc Mismatch (Linux)
```bash
ldd /bin/ls | head -1    # check: linux-vdso = glibc, musl = musl
# If on glibc but got musl binary: reinstall
# If truly on musl (Alpine):
apk add libgcc libstdc++ ripgrep
```

## Authentication Issues
```bash
# Full re-auth cycle
/logout   # inside claude session
# close and restart
claude    # re-authenticate

# WSL2: browser won't open
export BROWSER="/mnt/c/Program Files/Google/Chrome/Application/chrome.exe"
```
- **OAuth Invalid code**: complete login quickly after browser opens; or type `c` to copy URL
- **403 Forbidden**: verify active subscription or correct Console role assigned
- **Token expired**: run `/login`

## Config File Locations
| File | Purpose |
|---|---|
| `~/.claude/settings.json` | User settings (permissions, hooks, model) |
| `.claude/settings.json` | Project settings (commit to git) |
| `.claude/settings.local.json` | Local project settings (don't commit) |
| `~/.claude.json` | Global state (theme, OAuth, MCP) |
| `.mcp.json` | Project MCP servers (commit to git) |

### Reset Config
```bash
rm ~/.claude.json && rm -rf ~/.claude/   # all user settings + session history
rm -rf .claude/ .mcp.json               # project settings only
```

## Search Not Working
```bash
brew install ripgrep                    # macOS
sudo apt install ripgrep                # Ubuntu/Debian
winget install BurntSushi.ripgrep.MSVC  # Windows
# Then:
export USE_BUILTIN_RIPGREP=0
```

## Performance Issues
- Run `/compact` regularly for large sessions
- Add build dirs to `.gitignore`
- Docker: set `WORKDIR /tmp` before install to prevent filesystem scan

## WSL-Specific
- WSL2 sandbox needs: `sudo apt-get install bubblewrap socat`
- WSL1 does not support sandboxing
- JetBrains on WSL2 not detected: add Windows Firewall rule for WSL2 subnet, or set `networkingMode=mirrored` in `.wslconfig`
- Slow search on WSL: keep projects on Linux filesystem (`/home/`), not `/mnt/c/`

## Run Diagnostics
```bash
/doctor    # checks install, search, settings, MCP config, keybindings, context warnings
/bug       # report issue directly to Anthropic with conversation transcript
```

---
> Source: [troubleshooting.md](../troubleshooting.md)
