# Claude Code Documentation Index

## Writing Rules

- NEVER use em-dashes ('--') in any generated text. Use commas, periods, parentheses, or regular hyphens instead.

## Workflow Rules

- After making changes, always update this CLAUDE.md file to reflect any added, removed, or renamed files, then commit and push to the remote repository.

This repo contains the official Claude Code documentation, downloaded from <https://code.claude.com/docs>. Doc files live in the `claude-code-docs/` folder.

## Maintenance

When updating these docs (via `Scripts/download-cc-docs.sh`), **you must also update CLAUDE.md and DOCUMENT-INDEX.md** to reflect any added, removed, or renamed pages.

## Detailed Index

The full file-by-file index is in `DOCUMENT-INDEX.md`. Read that file when you need to find a specific resource. Below is a high-level summary of what's in the repo.

## Repo Structure

### `claude-code-docs/` - Official Documentation (45 pages)

Getting started, core usage, memory & settings, extensibility (skills, plugins, hooks, MCP, subagents), IDE integrations (VS Code, JetBrains, Chrome, Desktop), CI/CD & automation (headless, GitHub Actions, GitLab CI/CD, Slack), cloud providers (Bedrock, Vertex AI, Foundry), enterprise & security, operations, and reference (tools, changelog).

### `templates/` - Ready-to-Use Templates

Copy-paste-able starting points for skills, subagents, hooks, CLAUDE.md starters, CI/CD workflows, MCP integrations, plugins, permissions, cloud provider setup, agent teams, workflow automation, and enterprise config. **Use these as starting points** when asked to create any Claude Code feature.

Key files: `SKILL-TEMPLATE.md`, `SUBAGENT-TEMPLATE.md`, `HOOKS-TEMPLATE.md`, `HOOKS-RECIPES.md`, plus starters for Python, TypeScript, React, Rails, and monorepos.

### `rules/` - Drop-in Path-Specific Rules (8 files)

Language-specific rules for TypeScript, Python, React, Go, Rails, Rust, SQL, and testing. Copy to `.claude/rules/` in any project.

### `tips/` - Practical Tips (6 files + README)

Productivity, prompting, debugging, cost optimization, multi-session, and security tips.

### `skills/` - Drop-in Skills (15 core + 222 community in 16 categories)

Core skills: `/commit`, `/pr`, `/review`, `/fix-issue`, `/tdd`, `/refactor`, `/explain`, `/security-scan`, `/doc-gen`, `/migrate`, `/debug`, `/onboard`, `/changelog`, `/perf-audit`, plus auto-loaded `api-conventions`.

Community categories: api-architecture (10), backend-development (20), frontend-development (19), testing-quality (12), security (14), devops-infrastructure (21), data-engineering (6), ai-ml (13), language-specific (23), content-research (12), business (15), observability (5), team-workflow (11), game-embedded (3), blockchain (4), productivity (34).

### `commands/` - Drop-in Slash Commands (12 core + 100 community in 12 categories)

Core: `/commit`, `/pr`, `/review`, `/fix-issue`, `/tdd`, `/deploy`, `/lint-fix`, `/deps-update`, `/explain`, `/release`, `/db-migrate`, `/new-feature`.

Community categories: development (20), review-quality (7), testing (8), debugging (6), deployment-infra (7), documentation (4), git-workflow (12), security (5), team-management (12), data-migration (7), ai-tools (5), refactoring (7).

### `hooks/` - Hook Scripts (10 core + community)

Core scripts: auto-format, protect-files, notify-desktop, lint-on-save, block-dangerous-commands, log-tool-usage, validate-sql, test-after-edit, inject-context, stop-check.

Community hooks in `hooks/community/`: automation, development-tools, git, monitoring, post-tool, pre-tool, and disler-hooks-mastery (comprehensive Python hooks framework).

### `agents/` - Drop-in Subagents (12 core + 185 community in 14 categories)

Core: code-reviewer, security-auditor, test-writer, debugger, docs-writer, refactorer, performance-analyst, db-reader, api-designer, migration-planner, dependency-checker, onboarding-guide.

Community categories: core-development (10), language-specialists (26), infrastructure (16), quality-security (30), data-ai (12), developer-experience (18), specialized-domains (12), business-product (11), meta-orchestration (12), research-analysis (15), design (4), lang-engineering (10), poc-engineering (7), team (2).

### `guides/` - Step-by-Step Workflow Guides (7 + README)

TDD workflow, security audit, onboarding new codebase, migration playbook, PR review workflow, CI/CD setup, monorepo setup.

### `output-styles/` - Response Formatting (11 + README)

Bullet points, generative UI, HTML, markdown, observable tools/diffs, table-based, TTS summary, ultra-concise, YAML.

### `awesome.md` - Curated Resource List

Official resources, MCP servers, plugins, CLAUDE.md starters, tools, cloud setup, and enterprise guides.
