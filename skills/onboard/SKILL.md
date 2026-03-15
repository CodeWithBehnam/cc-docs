---
name: onboard
description: >
  Generate a codebase overview for new team members. Produces an architecture
  summary, key files guide, and conventions reference. Use when someone is
  new to a project, when the user asks "give me an overview", "explain the
  architecture", "where do I start?", or "onboard me to this codebase".
context: fork
agent: Explore
allowed-tools: Read, Grep, Glob, Bash(git *), Bash(find *), Bash(wc *)
---

## Context

- Repository: !`git rev-parse --show-toplevel 2>/dev/null || pwd`
- Top-level structure: !`find . -maxdepth 2 -not -path './.git/*' -not -path './node_modules/*' -not -path './.venv/*' | sort`
- Recent contributors: !`git shortlog -sn --no-merges -10 2>/dev/null || echo "Not a git repo"`
- Recent activity: !`git log --oneline -15 2>/dev/null || echo "No git history"`
- Package/dependency files: !`find . -maxdepth 2 -name "package.json" -o -name "pyproject.toml" -o -name "go.mod" -o -name "Gemfile" -o -name "pom.xml" | head -10`

## Task

Generate a comprehensive onboarding guide for this codebase. Cover all of the following:

1. **Read key entry points**: `README.md`, `CLAUDE.md`, main entry files (`main.py`, `index.ts`, `main.go`, `app.py`, `server.js`, etc.), and any architecture or design docs

2. **Understand the architecture**:
   - What kind of system is this? (web API, CLI tool, library, data pipeline, mobile app, etc.)
   - What are the main layers or components? (frontend, backend, database, workers, etc.)
   - How do the components communicate? (HTTP, events, shared DB, message queue, etc.)

3. **Map the directory structure**: Read 2-3 levels deep and explain what each major directory contains and why it exists

4. **Find the key files**: For each major layer, identify the 3-5 most important files a new developer should read first

5. **Extract conventions**: Look for linting configs, test patterns, naming conventions, and any rules in `CLAUDE.md` or similar

6. **Identify the development workflow**: Check `Makefile`, `scripts/`, `package.json` scripts, CI config for how to build, test, and run the project locally

## Output Format

Produce a guide with these sections:

### What This Project Does
One paragraph. What problem does this solve? Who uses it?

### Architecture Overview
ASCII diagram of major components and their relationships.

### Directory Map
Table: directory path, what it contains, when you would touch it.

### Key Files to Read First
Ordered list of files (with paths) and why each one matters.

### How to Run It Locally
Step-by-step: install dependencies, configure environment, start the app, run tests.

### Conventions and Standards
Bullet list of coding conventions, naming rules, and any "gotchas" unique to this project.

### Where to Make Common Changes
Practical guide: "To add a new API endpoint, edit X. To add a new database table, edit Y. To change the UI theme, look in Z."
