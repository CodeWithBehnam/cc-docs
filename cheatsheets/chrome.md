# Chrome Integration Cheatsheet

## Requirements

- Google Chrome or Microsoft Edge (not Brave, Arc, or other Chromium browsers)
- [Claude in Chrome extension](https://chromewebstore.google.com/detail/claude/fcoeoabgfenejglbffodgkkbkcdhcgfn) v1.0.36+
- Claude Code v2.0.73+
- Direct Anthropic plan (Pro, Max, Teams, Enterprise) — not available via Bedrock/Vertex/Foundry
- WSL not supported

## Quick Start

```bash
# Start with Chrome enabled
claude --chrome

# Enable from within a session
/chrome

# Enable by default (avoids passing flag each time)
/chrome → "Enabled by default"
```

Note: enabling by default increases context usage since browser tools are always loaded.

## VS Code Usage

Type `@browser` in the prompt box:
```text
@browser go to localhost:3000 and check the console for errors
```

## Capabilities

- Live debugging (console errors, DOM state)
- Design verification (Figma mock → browser check)
- Web app testing (forms, visual regression, user flows)
- Authenticated app interaction (Google Docs, Gmail, Notion, etc.)
- Data extraction from web pages → save as CSV/JSON
- Task automation (form filling, multi-site workflows)
- Session recording as GIFs

## Example Prompts

```text
Open localhost:3000, submit the form with invalid data, check error messages
Open the dashboard and check console for errors on page load
Go to crm.example.com and fill in contacts from contacts.csv
Record a GIF of the checkout flow from cart to confirmation
```

Claude opens new tabs, shares your browser's login state, and pauses at login pages/CAPTCHAs.

## Common Errors

| Error | Fix |
|---|---|
| "Browser extension is not connected" | Restart Chrome and Claude Code; run `/chrome` to reconnect |
| "Extension not detected" | Install/enable extension in `chrome://extensions` |
| "No tab available" | Ask Claude to create a new tab and retry |
| "Receiving end does not exist" | Run `/chrome` → "Reconnect extension" (service worker went idle) |

## Native Messaging Host Paths

**Chrome:**
- macOS: `~/Library/Application Support/Google/Chrome/NativeMessagingHosts/com.anthropic.claude_code_browser_extension.json`
- Linux: `~/.config/google-chrome/NativeMessagingHosts/...`
- Windows: `HKCU\Software\Google\Chrome\NativeMessagingHosts\`

**Edge:** same paths but under `Microsoft Edge` instead of `Google/Chrome`

## Troubleshooting

- First-time setup: restart Chrome after enabling (reads native host config on startup)
- Browser unresponsive: check for blocking JS dialogs (alert/confirm/prompt) — dismiss manually
- Connection drops during long sessions: run `/chrome` → "Reconnect extension"
- Windows EADDRINUSE: close other Claude Code sessions using Chrome
- Manage tools: `/mcp` → select `claude-in-chrome`

---
> Source: [chrome.md](../chrome.md)
