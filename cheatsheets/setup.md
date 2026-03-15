# Setup Cheatsheet

## System Requirements

| Item | Requirement |
|---|---|
| macOS | 13.0+ |
| Windows | 10 1809+ / Server 2019+ |
| Linux | Ubuntu 20.04+, Debian 10+, Alpine 3.19+ |
| RAM | 4 GB+ |
| Shell | Bash, Zsh, PowerShell, CMD |
| Windows extra | [Git for Windows](https://git-scm.com/downloads/win) required |

## Installation Methods

| Method | Command |
|---|---|
| Native (macOS/Linux/WSL) | `curl -fsSL https://claude.ai/install.sh \| bash` |
| Native (PowerShell) | `irm https://claude.ai/install.ps1 \| iex` |
| Homebrew | `brew install --cask claude-code` |
| WinGet | `winget install Anthropic.ClaudeCode` |

> Native installs auto-update. Homebrew/WinGet do NOT — update manually.

## Verify Installation

```bash
claude --version
claude doctor   # full diagnostic check
```

## Install Specific Version

```bash
# Stable channel
curl -fsSL https://claude.ai/install.sh | bash -s stable

# Specific version
curl -fsSL https://claude.ai/install.sh | bash -s 1.0.58
```

## Update

```bash
claude update         # apply update immediately
brew upgrade claude-code    # Homebrew
winget upgrade Anthropic.ClaudeCode  # WinGet
```

## Release Channels

Add to `settings.json`:
```json
{ "autoUpdatesChannel": "stable" }   // ~1 week old, skips bad releases
{ "autoUpdatesChannel": "latest" }   // default, newest features
```

Disable auto-updates:
```json
{ "env": { "DISABLE_AUTOUPDATER": "1" } }
```

## Windows-Specific

- **Native**: install Git for Windows → run installer from PowerShell/CMD (no Admin needed)
- **WSL**: both WSL 1 and 2 supported; WSL 2 supports sandboxing
- If Git Bash not found, set in `settings.json`:
  ```json
  { "env": { "CLAUDE_CODE_GIT_BASH_PATH": "C:\\Program Files\\Git\\bin\\bash.exe" } }
  ```

## Alpine Linux

```bash
apk add libgcc libstdc++ ripgrep
# Then in settings.json:
{ "env": { "USE_BUILTIN_RIPGREP": "0" } }
```

## Uninstall

```bash
# Native (macOS/Linux)
rm -f ~/.local/bin/claude && rm -rf ~/.local/share/claude

# Homebrew
brew uninstall --cask claude-code

# Remove config/data (WARNING: deletes all settings and history)
rm -rf ~/.claude && rm ~/.claude.json
```

---
> Source: [setup.md](../setup.md)
