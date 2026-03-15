# Tools Reference Cheatsheet

## All Tools

| Tool                   | Description                                             | Permission Required |
|------------------------|---------------------------------------------------------|---------------------|
| `Agent`                | Spawns a subagent with its own context window           | No                  |
| `AskUserQuestion`      | Asks multiple-choice questions to gather requirements   | No                  |
| `Bash`                 | Executes shell commands                                 | **Yes**             |
| `CronCreate`           | Schedules a recurring/one-shot prompt in current session| No                  |
| `CronDelete`           | Cancels a scheduled task by ID                          | No                  |
| `CronList`             | Lists all scheduled tasks in the session                | No                  |
| `Edit`                 | Makes targeted edits to specific files                  | **Yes**             |
| `EnterPlanMode`        | Switches to plan mode before coding                     | No                  |
| `EnterWorktree`        | Creates isolated git worktree and switches into it      | No                  |
| `ExitPlanMode`         | Presents plan for approval; exits plan mode             | **Yes**             |
| `ExitWorktree`         | Exits worktree session, returns to original directory   | No                  |
| `Glob`                 | Finds files by pattern matching                         | No                  |
| `Grep`                 | Searches for patterns in file contents                  | No                  |
| `ListMcpResourcesTool` | Lists resources from connected MCP servers              | No                  |
| `LSP`                  | Code intelligence: type errors, go-to-def, references   | No                  |
| `NotebookEdit`         | Modifies Jupyter notebook cells                         | **Yes**             |
| `Read`                 | Reads file contents                                     | No                  |
| `ReadMcpResourceTool`  | Reads a specific MCP resource by URI                    | No                  |
| `Skill`                | Executes a skill within the main conversation           | **Yes**             |
| `TaskCreate`           | Creates a task in the task list                         | No                  |
| `TaskGet`              | Gets full details for a specific task                   | No                  |
| `TaskList`             | Lists all tasks with their current status               | No                  |
| `TaskOutput`           | Retrieves output from a background task                 | No                  |
| `TaskStop`             | Kills a running background task by ID                   | No                  |
| `TaskUpdate`           | Updates task status, dependencies, or deletes tasks     | No                  |
| `TodoWrite`            | Manages session task checklist (non-interactive / SDK)  | No                  |
| `ToolSearch`           | Searches for and loads deferred tools                   | No                  |
| `WebFetch`             | Fetches content from a URL                              | **Yes**             |
| `WebSearch`            | Performs web searches                                   | **Yes**             |
| `Write`                | Creates or overwrites files                             | **Yes**             |

## Tools Requiring Permission (summary)

`Bash`, `Edit`, `ExitPlanMode`, `NotebookEdit`, `Skill`, `WebFetch`, `WebSearch`, `Write`

## Bash Tool Behavior

- Working directory **persists** across commands
- Environment variables **do not persist** (`export` in one command is gone in the next)
- Set `CLAUDE_BASH_MAINTAIN_PROJECT_WORKING_DIR=1` to reset cwd to project root after each command
- Activate virtualenvs **before** launching Claude Code
- Use `CLAUDE_ENV_FILE` or a `SessionStart` hook to persist env vars across Bash commands

## Using Tool Names in Rules

Tool names used in permission rules, subagent tool lists, and hook matchers must match exactly (case-sensitive):

```json
{
  "permissions": {
    "allow": ["Read", "Glob", "Grep"],
    "deny": ["Bash(curl *)", "Write"]
  }
}
```

## LSP Notes

- Requires a code intelligence plugin and its language server binary
- Reports type errors/warnings automatically after file edits
- Supports: jump to definition, find references, type info, list symbols, call hierarchies

## TodoWrite vs Task Tools

- `TodoWrite`: non-interactive mode and Agent SDK
- `TaskCreate/TaskGet/TaskList/TaskUpdate`: interactive sessions (replaces TodoWrite in REPL)

---

> Source: [tools-reference.md](../tools-reference.md)
