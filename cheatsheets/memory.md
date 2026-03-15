# Memory Cheatsheet

## Two Memory Systems

| | CLAUDE.md files | Auto memory |
|---|---|---|
| Written by | You | Claude |
| Contains | Instructions and rules | Learnings and patterns |
| Scope | Project, user, or org | Per working tree |
| Loaded | Every session (full) | Every session (first 200 lines of MEMORY.md) |
| Best for | Coding standards, workflows, architecture | Build commands, debugging insights, discovered preferences |

## CLAUDE.md File Locations

| Scope | Location | Shared with |
|---|---|---|
| Managed policy | macOS: `/Library/Application Support/ClaudeCode/CLAUDE.md` | All users (org-wide) |
| Managed policy | Linux/WSL: `/etc/claude-code/CLAUDE.md` | All users (org-wide) |
| Project | `./CLAUDE.md` or `./.claude/CLAUDE.md` | Team (via git) |
| User | `~/.claude/CLAUDE.md` | Just you (all projects) |

Files are loaded by walking up from the current directory. Subdirectory files load on demand.

## Load from Extra Directories

```bash
CLAUDE_CODE_ADDITIONAL_DIRECTORIES_CLAUDE_MD=1 claude --add-dir ../shared-config
```

## Import Other Files

```text
See @README for project overview.

# Additional Instructions
- git workflow @docs/git-instructions.md
- @~/.claude/my-project-instructions.md
```

Supports relative/absolute paths, max 5 hops deep.

## Organize with `.claude/rules/`

```
your-project/
├── .claude/
│   ├── CLAUDE.md
│   └── rules/
│       ├── code-style.md
│       ├── testing.md
│       └── security.md
```

**Path-specific rules** (only load when matching files are opened):
```markdown
---
paths:
  - "src/api/**/*.ts"
---
# API Rules
- All endpoints must include input validation
```

**User-level rules** (apply to every project):
```
~/.claude/rules/
├── preferences.md
└── workflows.md
```

## Exclude CLAUDE.md Files (monorepos)

```json
{
  "claudeMdExcludes": [
    "**/monorepo/CLAUDE.md",
    "/home/user/monorepo/other-team/.claude/rules/**"
  ]
}
```

Add to `.claude/settings.local.json` so it stays local.

## Writing Effective Instructions

- Target under 200 lines per file — longer files reduce adherence
- Use markdown headers and bullets for structure
- Write concrete, verifiable rules:
  - "Use 2-space indentation" not "format code properly"
  - "Run `npm test` before committing" not "test your changes"
- Avoid conflicting instructions across files
- For system-prompt-level enforcement: use `--append-system-prompt` (must pass every invocation)

## Auto Memory

```bash
# Toggle via command or settings
/memory    # toggle auto-memory from UI
```

```json
{ "autoMemoryEnabled": false }
```

```bash
CLAUDE_CODE_DISABLE_AUTO_MEMORY=1 claude
```

**Storage**: `~/.claude/projects/<project>/memory/MEMORY.md` (+ topic files)

- MEMORY.md = index (first 200 lines loaded at start)
- Topic files (e.g., `debugging.md`) loaded on demand
- Machine-local; shared across worktrees in same git repo

**Custom location**:
```json
{ "autoMemoryDirectory": "~/my-custom-memory-dir" }
```

## /memory Command

- Lists all CLAUDE.md and rules files loaded in session
- Toggle auto-memory on/off
- Link to open auto-memory folder
- Select a file to open it in your editor

## Troubleshooting

| Problem | Fix |
|---|---|
| Claude ignores CLAUDE.md | Run `/memory` to verify files are loaded |
| Instructions inconsistent | Make them more specific; check for conflicts |
| CLAUDE.md too large | Split to `.claude/rules/` or use `@path` imports |
| Instructions lost after `/compact` | Add them to CLAUDE.md (conversation-only instructions don't persist) |
| Don't know what auto memory saved | Run `/memory` → open auto memory folder |

---
> Source: [memory.md](../memory.md)
