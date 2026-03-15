# Claude Code Workflow Guides

Step-by-step walkthroughs for common development workflows with Claude Code. Each guide walks through a real scenario with exact prompts to type, expected outcomes at each step, and references to skills, agents, and hooks you can reuse.

---

## Guides

| Guide | Description | When to use |
|-------|-------------|-------------|
| [tdd-workflow.md](tdd-workflow.md) | Test-Driven Development with Claude Code | Starting a new feature and want tests to drive implementation |
| [security-audit.md](security-audit.md) | Running a Security Audit with Claude Code | Before a release, after merging a large PR, or on an unfamiliar codebase |
| [onboarding-new-codebase.md](onboarding-new-codebase.md) | First Day on a New Codebase | Joining a project, onboarding a contractor, or revisiting old code |
| [migration-playbook.md](migration-playbook.md) | Migrating Frameworks or Libraries | Upgrading a major dependency or switching frameworks |
| [pr-review-workflow.md](pr-review-workflow.md) | Professional Code Review with Claude Code | Reviewing PRs thoroughly before merging |
| [ci-cd-setup.md](ci-cd-setup.md) | Setting Up Claude Code in CI/CD | Automating code review and issue implementation in GitHub Actions or GitLab CI |
| [monorepo-setup.md](monorepo-setup.md) | Configuring Claude Code for Monorepos | Setting up a multi-package repository with per-package context |

---

## How to choose a guide

**Starting a new feature?** Use [tdd-workflow.md](tdd-workflow.md) to let tests drive your implementation from the beginning.

**Unfamiliar with a codebase?** Start with [onboarding-new-codebase.md](onboarding-new-codebase.md). It helps you explore safely without accidentally making changes.

**Need to upgrade a library?** The [migration-playbook.md](migration-playbook.md) gives a structured approach with safety nets before touching production code.

**Doing a code review?** [pr-review-workflow.md](pr-review-workflow.md) shows how to use subagents for deep security and performance dives, then generate structured review comments.

**Worried about security?** [security-audit.md](security-audit.md) covers a full OWASP-aligned audit, prioritized fixes, and setting up hooks for ongoing protection.

**Setting up automation?** [ci-cd-setup.md](ci-cd-setup.md) walks through GitHub Actions and GitLab CI configuration, including PR review bots and issue-to-PR automation.

**Working in a monorepo?** [monorepo-setup.md](monorepo-setup.md) covers layered CLAUDE.md files, per-package skills, and parallel worktree workflows.

---

## Conventions used in these guides

- Prompts you type into Claude Code are shown in `text` code blocks.
- Shell commands you run outside Claude Code are shown in `bash` code blocks.
- "Expected outcome" sections describe what Claude should produce at each step.
- File paths reference the structure described in `CLAUDE.md` at the repo root.

---

## Related resources

- `templates/SKILL-TEMPLATE.md` - Starting points for creating custom skills
- `templates/SUBAGENT-TEMPLATE.md` - Starting points for creating custom subagents
- `templates/HOOKS-TEMPLATE.md` - Starting points for creating automation hooks
- `claude-code-docs/skills.md` - Full skills documentation
- `claude-code-docs/sub-agents.md` - Full subagents documentation
- `claude-code-docs/hooks-guide.md` - Practical hooks guide
- `claude-code-docs/memory.md` - CLAUDE.md and auto-memory documentation
