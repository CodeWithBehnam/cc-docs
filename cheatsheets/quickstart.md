# Quickstart Cheatsheet

## Prerequisites
- Terminal open, code project ready
- Claude Pro/Max/Teams/Enterprise subscription, Console account, or supported cloud provider

## Install & Launch

```bash
# macOS/Linux/WSL
curl -fsSL https://claude.ai/install.sh | bash

# Start in your project
cd /path/to/your/project
claude
# Prompted to log in on first use
```

## Essential Commands

| Command | What it does |
|---|---|
| `claude` | Start interactive mode |
| `claude "task"` | Start with initial prompt |
| `claude -p "query"` | One-off query, then exit |
| `claude -c` | Continue most recent conversation |
| `claude -r` | Resume a previous conversation |
| `claude commit` | Create a Git commit |
| `/clear` | Clear conversation history |
| `/help` | Show available commands |
| `exit` or `Ctrl+D` | Exit Claude Code |

## First Session Workflow

1. `what does this project do?` — understand the codebase
2. `add a hello world function to the main file` — first edit (Claude asks approval)
3. `commit my changes with a descriptive message` — git integration
4. `write unit tests for the calculator functions` — write tests

## Common Task Prompts

```text
refactor the authentication module to use async/await
add input validation to the user registration form
review my changes and suggest improvements
update the README with installation instructions
```

## Git Prompts

```text
what files have I changed?
create a new branch called feature/quickstart
show me the last 5 commits
help me resolve merge conflicts
```

## Pro Tips
- Be specific: *"fix the login bug where users see a blank screen after wrong credentials"*
- Break complex tasks into numbered steps
- Press `?` for keyboard shortcuts, `Tab` for command completion, `↑` for history
- Type `/` to see all commands and skills
- Claude reads your files automatically — no need to manually add context

---
> Source: [quickstart.md](../quickstart.md)
