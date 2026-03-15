# Common Workflows Cheatsheet

## Session Start & Navigation
```bash
claude                          # start new session in cwd
claude --continue               # resume most recent session
claude --resume                 # pick from session list
claude --resume auth-refactor   # resume by name
claude -n auth-refactor         # start session with a name
claude --from-pr 123            # resume session linked to PR
claude --permission-mode plan   # start in plan mode (read-only)
```

### Session Picker Shortcuts
| Key | Action |
|---|---|
| `↑/↓` | Navigate sessions |
| `Enter` | Resume selected |
| `P` | Preview session |
| `R` | Rename session |
| `/` | Search/filter |
| `B` | Filter by current branch |
| `A` | Toggle all projects view |

## Plan Mode
```bash
# Start in plan mode
claude --permission-mode plan

# Run headless query in plan mode
claude --permission-mode plan -p "Analyze auth system and suggest improvements"

# Switch modes during session
Shift+Tab   # cycles: Normal → Auto-accept edits → Plan mode
```
Set as default in `.claude/settings.json`:
```json
{ "permissions": { "defaultMode": "plan" } }
```
Best for: multi-file changes, unfamiliar codebases, interactive iteration.

## Explore → Fix Workflow
```text
find the files that handle user authentication
how do these authentication files work together?
I'm seeing: [paste error]. suggest a few fixes
update user.ts to add the null check you suggested
```

## Refactor Workflow
```text
find deprecated API usage in our codebase
suggest how to refactor utils.js to use modern JS
refactor utils.js to ES2024 while maintaining behavior
run tests for the refactored code
```

## Test Workflow
```text
find functions in NotificationsService.swift not covered by tests
add tests for the notification service
add test cases for edge conditions
run the new tests and fix any failures
```

## PR Workflow
```text
summarize the changes I've made to the authentication module
create a pr
enhance the PR description with more context about security improvements
```
PR is auto-linked to session; resume later with `claude --from-pr <number>`.

## Parallel Sessions with Worktrees
```bash
claude --worktree feature-auth     # creates .claude/worktrees/feature-auth/
claude --worktree bugfix-123
claude --worktree                  # auto-generates name

# Manual worktree management
git worktree add ../project-feature-a -b feature-a
cd ../project-feature-a && claude
git worktree remove ../project-feature-a
```
Add `.claude/worktrees/` to `.gitignore`.
Cleanup: no changes → auto-removed; changes → Claude prompts keep/remove.

## Extended Thinking
| Scope | How |
|---|---|
| Per-turn max reasoning | Include `ultrathink` in prompt |
| Adjust depth | `/effort` or `CLAUDE_CODE_EFFORT_LEVEL` |
| Toggle on/off | `Option+T` (macOS) / `Alt+T` (Win/Linux) |
| View reasoning | `Ctrl+O` (verbose mode) |
| Disable entirely | `MAX_THINKING_TOKENS=0` |
| Disable adaptive thinking | `CLAUDE_CODE_DISABLE_ADAPTIVE_THINKING=1` |

## Using Images
- Drag-and-drop into Claude Code window
- Copy image → `Ctrl+V` to paste (not `Cmd+V`)
- Reference by path: `Analyze this image: /path/to/image.png`

## File References
```text
@src/utils/auth.js          # includes full file content
@src/components             # provides directory listing
@github:repos/owner/repo/issues   # MCP resource
```

## Non-interactive / Scripted Usage
```bash
claude -p "Explain what this project does"
claude -p "List all API endpoints" --output-format json
claude -p "Analyze this log" --output-format stream-json
cat build-error.txt | claude -p 'explain root cause' > output.txt

# As a linter in package.json scripts
"lint:claude": "claude -p 'you are a linter. look at changes vs main...'"
```

## Desktop Notifications Hook
Add to `~/.claude/settings.json` (Linux):
```json
{ "hooks": { "Notification": [{ "matcher": "", "hooks": [{ "type": "command", "command": "notify-send 'Claude Code' 'needs your attention'" }] }] } }
```
Matchers: `permission_prompt`, `idle_prompt`, `auth_success`, `elicitation_dialog`

---
> Source: [common-workflows.md](../common-workflows.md)
