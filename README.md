# Claude Code Docs

Auto-updated mirror of the [Claude Code](https://code.claude.com) documentation, sourced from `code.claude.com/docs/en/`.

A GitHub Actions workflow runs every hour, downloads the latest docs, and commits any changes automatically.

## What's included

- 65+ markdown doc pages covering CLI reference, hooks, plugins, settings, MCP, desktop, and more
- `llms.txt` index file
- `templates/` with CLAUDE.md templates for hooks, skills, and sub-agents

## How it works

1. `Scripts/download-cc-docs.sh` fetches the doc index from `code.claude.com/docs/llms.txt`
2. Extracts all `.md` URLs and downloads each page
3. Cleans up JSX/MDX artifacts (component tags, `theme={null}`, etc.)
4. The GitHub Actions workflow commits and pushes if anything changed

## Using these docs with Claude Code

Add this repo as a reference in your `CLAUDE.md`:

```markdown
See https://github.com/CodeWithBehnam/cc-docs for Claude Code documentation.
```

Or clone it locally and point to specific files for context.

## Manual update

```bash
bash Scripts/download-cc-docs.sh
```
