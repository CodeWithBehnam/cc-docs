# Project: cc-docs

Official Claude Code documentation and reusable assets, downloaded from <https://code.claude.com/docs>.

## Architecture

```
claude-code-docs/    # 45 official doc pages (getting started, usage, extensibility, IDE, CI/CD, cloud, enterprise, reference)
cheatsheets/         # 65 condensed cheatsheets per doc topic (quickstart, hooks, permissions, MCP, etc.)
templates/           # Copy-paste starting points (skills, subagents, hooks, CLAUDE.md starters, CI/CD, MCP, plugins)
rules/               # 8 drop-in path-specific rules (TypeScript, Python, React, Go, Rails, Rust, SQL, testing)
tips/                # 6 practical tip files + README
skills/              # 15 core + 222 community skills in 16 categories
commands/            # 12 core + 100 community slash commands in 12 categories
hooks/               # 10 core + community hook scripts
agents/              # 12 core + 185 community subagents in 14 categories
guides/              # 7 step-by-step workflow guides + README
output-styles/       # 11 response formatting styles + README
docs/brainstorms/    # Planning and brainstorm documents
Scripts/             # Maintenance scripts
awesome.md           # Curated resource list
DOCUMENT-INDEX.md    # Full file-by-file index (read this to find specific resources)
```

## Commands

```bash
Scripts/download-cc-docs.sh      # Download/update docs from code.claude.com
```

## Constraints

NEVER use em-dashes ('--') in generated text - they break formatting consistency. Use commas, periods, parentheses, or regular hyphens instead.

ALWAYS update both CLAUDE.md and DOCUMENT-INDEX.md when docs are added, removed, or renamed - stale indexes cause agents to reference nonexistent files.

ALWAYS commit and push after making changes - this is a shared documentation repo.

ALWAYS use files in `templates/` as starting points when creating any Claude Code feature - they contain tested patterns and correct structure.

## Updating Docs

1. Run `Scripts/download-cc-docs.sh`
2. Review new/changed/removed pages in `claude-code-docs/`
3. Update `DOCUMENT-INDEX.md` with any added, removed, or renamed files
4. Update the Architecture section above if counts or categories changed
5. Commit and push

## Finding Resources

Read `DOCUMENT-INDEX.md` for the full file-by-file index. Key entry points:

- **Templates**: `templates/SKILL-TEMPLATE.md`, `SUBAGENT-TEMPLATE.md`, `HOOKS-TEMPLATE.md`, `HOOKS-RECIPES.md`
- **Language starters**: Python, TypeScript, React, Rails, and monorepo CLAUDE.md starters in `templates/`
- **Cheatsheets**: Quick-reference versions of every doc topic in `cheatsheets/`
