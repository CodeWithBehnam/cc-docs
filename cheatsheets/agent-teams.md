# Agent Teams Cheatsheet

## What Agent Teams Are

Multiple Claude Code instances working together. One session is the **team lead**; others are **teammates**. Teammates communicate directly with each other via a shared task list and mailbox.

> **Experimental** — disabled by default. Enable: `CLAUDE_CODE_EXPERIMENTAL_AGENT_TEAMS=1`
> Requires Claude Code v2.1.32+

## Enable

```json
// settings.json
{ "env": { "CLAUDE_CODE_EXPERIMENTAL_AGENT_TEAMS": "1" } }
```

## Start a Team

Tell Claude in natural language:
```text
Create an agent team to explore this CLI tool design from 3 angles:
UX, technical architecture, and devil's advocate.
```

Claude creates the team, spawns teammates, and coordinates.

## Subagents vs Agent Teams

| | Subagents | Agent Teams |
| :--- | :--- | :--- |
| **Context** | Own window; reports to main | Own window; fully independent |
| **Communication** | Reports to main agent only | Teammates message each other |
| **Coordination** | Main manages all | Shared task list, self-coordinate |
| **Best for** | Focused task, result only matters | Discussion, debate, collaboration |
| **Token cost** | Lower | Higher (scales with team size) |

## Display Modes

| Mode | Description | Requires |
| :--- | :--- | :--- |
| `in-process` | All teammates in main terminal; `Shift+Down` to cycle | Any terminal |
| `tmux` (split panes) | Each teammate in own pane | tmux or iTerm2 |

```json
{ "teammateMode": "in-process" }    // force in-process
```

```bash
claude --teammate-mode in-process   # single session override
```

## Control Teammates

- `Shift+Down` — cycle through teammates (in-process mode)
- `Ctrl+T` — toggle task list
- `Enter` on teammate — view their session
- `Escape` — interrupt current turn
- Type directly in a teammate's pane (split mode) to message them

## Key Commands

```text
Spawn an architect teammate to refactor auth. Require plan approval first.
Ask the researcher teammate to shut down.
Clean up the team.
Wait for your teammates to finish before proceeding.
```

## Task System

- **Pending / in-progress / completed** states
- Lead assigns tasks or teammates self-claim next unblocked task
- Task claiming uses file locking (no race conditions)
- Dependent tasks auto-unblock when dependencies complete

Storage: `~/.claude/tasks/{team-name}/`

## Quality Gates with Hooks

```json
// In settings.json
{
  "hooks": {
    "TeammateIdle": [{ "hooks": [{ "type": "command", "command": "./verify.sh" }] }],
    "TaskCompleted": [{ "hooks": [{ "type": "command", "command": "./check-done.sh" }] }]
  }
}
```

Exit code 2 = keep teammate working / prevent task completion.

## Architecture

| Component | Role |
| :--- | :--- |
| Team lead | Creates team, spawns teammates, coordinates |
| Teammates | Independent sessions working on tasks |
| Task list | Shared work items with states and dependencies |
| Mailbox | Inter-agent messaging system |

Config stored at `~/.claude/teams/{team-name}/config.json`

## Best Practices

- **Team size**: start with 3-5 teammates; 5-6 tasks per teammate
- **Task size**: self-contained units with clear deliverables
- **Context**: include task-specific details in spawn prompt (teammates don't inherit lead history)
- **File conflicts**: ensure each teammate owns different files
- **Start simple**: begin with research/review (no code conflicts) before parallel implementation

## Use Cases That Work Well

- Parallel code review (security / performance / test coverage reviewers)
- Competing hypotheses for debugging (teammates debate and disprove each other)
- Cross-layer changes (frontend / backend / tests owned separately)
- Research from multiple angles simultaneously

## Known Limitations

- No session resumption for in-process teammates (respawn after `/resume`)
- Task status can lag — check manually if stuck
- One team per session
- No nested teams (teammates can't spawn sub-teams)
- Lead is fixed — can't transfer leadership
- Split panes not supported in VS Code integrated terminal, Windows Terminal, or Ghostty

## Troubleshooting

- Teammates not appearing? `Shift+Down` to check; ensure task was complex enough
- Too many permission prompts? Pre-approve in permission settings before spawning
- Orphaned tmux sessions: `tmux ls` then `tmux kill-session -t <name>`

---
> Source: [agent-teams.md](../agent-teams.md)
