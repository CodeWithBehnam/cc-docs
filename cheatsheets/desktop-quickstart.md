# Desktop Quickstart Cheatsheet

## Install

1. Download Claude for macOS (universal) or Windows
   - Windows ARM64: separate download link
   - Linux: not supported
2. Launch from Applications (macOS) or Start menu (Windows)
3. Sign in with Anthropic account
4. Click the **Code** tab

- Desktop includes Claude Code — no separate Node.js or CLI install needed
- To use `claude` in terminal too: install CLI separately

## Desktop App Tabs

| Tab | Purpose |
|---|---|
| Chat | General conversation, no file access (like claude.ai) |
| Cowork | Autonomous background agent in cloud VM |
| Code | Interactive coding with local file access (this guide) |

## First Session

1. Select **Local** → click **Select folder** → choose project
2. Pick a model (Sonnet recommended to start)
3. Send a task:
   - `Find a TODO comment and fix it`
   - `Add tests for the main function`
   - `Create a CLAUDE.md for this codebase`

Default mode: **Ask permissions** — Claude proposes changes, you Accept/Reject each diff.

## Key Capabilities to Try

| Feature | How to use |
|---|---|
| Interrupt Claude | Click stop or type correction + Enter |
| Add file context | Type `@filename` in prompt |
| Attach files/images | Attachment button or drag-and-drop |
| Use skills/commands | Type `/` or click **+** → Slash commands |
| Review changes | Click `+12 -1` indicator → diff view |
| App preview | Click **Preview** dropdown → run dev server |
| Track a PR | Open PR → CI status bar with Auto-fix / Auto-merge |
| Parallel sessions | Click **+ New session** in sidebar |
| Run task remotely | Select **Remote** instead of Local when starting |
| Scheduled tasks | **Schedule** sidebar → **+ New task** |

## Permission Modes

- **Ask permissions** (default): approve every edit
- **Auto accept edits**: faster iteration, still asks before commands
- **Plan mode**: Claude maps approach without touching files — good for big refactors

## Coming from the CLI?

```bash
/desktop    # Move CLI session to Desktop (macOS/Windows)
```

Desktop and CLI share: CLAUDE.md, MCP servers, hooks, skills, settings.

---
> Source: [desktop-quickstart.md](../desktop-quickstart.md)
