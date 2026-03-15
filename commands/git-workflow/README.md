# Git Workflow Commands

Git workflow orchestration, onboarding, worktree management, and Conductor project management commands.

Sources: [wshobson/agents](https://github.com/wshobson/agents) (MIT), [davila7/claude-code-templates](https://github.com/davila7/claude-code-templates) (MIT)

| File | Description |
|------|-------------|
| `git-workflow.md` | Git workflow from code review through PR creation with quality gates |
| `onboard.md` | Team onboarding specialist for accelerated integration and knowledge transfer |

### Conductor (Project Management)

The Conductor plugin provides track-based project management with phased implementation plans.

| File | Description |
|------|-------------|
| `conductor-setup.md` | Initialize project with Conductor artifacts (product, tech stack, workflow, style guides) |
| `conductor-new-track.md` | Create a new track (feature, bug, chore, refactor) with spec and phased plan |
| `conductor-implement.md` | Execute tasks from a track's implementation plan following TDD workflow |
| `conductor-status.md` | Display project status, active tracks, and next actions |
| `conductor-manage.md` | Track lifecycle management - archive, restore, delete, rename, cleanup |
| `conductor-revert.md` | Git-aware undo by logical work unit (track, phase, or task) |

### Worktrees (Parallel Development)

| File | Description |
|------|-------------|
| `worktree-init.md` | Create parallel worktrees for multi-task development with Ghostty panels |
| `worktree-check.md` | Check current worktree status, branch, and assigned task |
| `worktree-deliver.md` | Commit, push, and create PR from the current worktree |
| `worktree-cleanup.md` | Clean up merged worktrees and their branches |
