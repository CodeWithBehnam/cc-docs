# Claude Code in Slack Cheatsheet

## Prerequisites

| Requirement          | Details                                                        |
|----------------------|----------------------------------------------------------------|
| Claude Plan          | Pro, Max, Teams, or Enterprise (premium seats)                 |
| Claude Code on web   | Must be enabled at claude.ai/code                              |
| GitHub Account       | Connected with at least one repo authenticated                 |
| Slack Authentication | Slack account linked to Claude account via Claude app          |

## Setup

1. Workspace admin installs Claude app from [Slack App Marketplace](https://slack.com/marketplace/A08SF47R6P4)
2. Each user: open Claude app → App Home tab → click **Connect**
3. Visit [claude.ai/code](https://claude.ai/code), connect GitHub, authenticate repos
4. Invite Claude to channels: `/invite @Claude`

## Routing Modes (App Home → settings)

| Mode          | Behavior                                                          |
|---------------|-------------------------------------------------------------------|
| **Code only** | All `@Claude` mentions go to Claude Code sessions                 |
| **Code + Chat** | Claude auto-detects; routes to Code or Chat based on intent    |

- Use **Retry as Code** button if wrong routing occurs

## How It Works

1. `@Claude` mention in channel/thread → Claude detects coding intent
2. New Claude Code session created on claude.ai/code
3. Progress updates posted to Slack thread
4. Completion: `@you` mention + "View Session" / "Create PR" buttons

## Message Action Buttons

| Button           | Action                                                   |
|------------------|----------------------------------------------------------|
| **View Session** | Opens full transcript in browser                         |
| **Create PR**    | Opens a pull request from session changes                |
| **Retry as Code**| Re-run as a Claude Code session if routed to chat        |
| **Change Repo**  | Select a different repository                            |

## Access Model

- Sessions run under the **individual user's** Claude account and rate limits
- Users can only access repos they've personally connected
- Claude can only respond in channels where it has been invited
- Works in public and private channels; **not in DMs**

## Best Practices

- Include file names, error messages, function names in requests
- Use threads for discussions so Claude gets full context
- Specify the repo in your message if ambiguous
- Use Slack when: existing context is in Slack, async work, team visibility needed
- Use web directly when: uploading files, real-time interaction, long/complex tasks

## Limitations

- GitHub only (no GitLab, Bitbucket, etc.)
- One PR per session
- Sessions consume individual plan rate limits
- Users without Claude Code web access get standard chat only

## Troubleshooting

| Problem                     | Fix                                                           |
|-----------------------------|---------------------------------------------------------------|
| Session not starting        | Check App Home connection; verify Claude Code web access      |
| Repo not showing            | Connect at claude.ai/code; verify GitHub permissions          |
| Wrong repo selected         | Click "Change Repo"; include repo name in request             |
| Auth errors                 | Disconnect/reconnect in App Home; check plan includes CC      |

---

> Source: [slack.md](../slack.md)
