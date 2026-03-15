# Output Styles

Output styles control how Claude Code formats its responses. They are placed in `.claude/output-styles/` in your project directory (or `~/.claude/output-styles/` for personal use across all projects).

Each output style is a Markdown file with YAML frontmatter containing a `name` and `description`. The body of the file contains instructions that shape Claude's response format.

## Usage

1. Copy any `.md` file from this directory into `.claude/output-styles/` in your project
2. Select your preferred style using the `/output-style` command or the `--output-style` CLI flag
3. Claude will format all subsequent responses according to the chosen style

## Available Styles

| File | Name | Description |
|------|------|-------------|
| `bullet-points.md` | Bullet Points | Hierarchical bullet points for quick scanning |
| `genui.md` | GenUI | Generative UI - creates self-contained HTML documents with embedded modern styling, saved to `/tmp/` and opened in a browser |
| `html-structured.md` | HTML Structured | Clean semantic HTML5 with proper structure and document hierarchy |
| `markdown-focused.md` | Markdown Focused | Full markdown features (headers, tables, code blocks, admonitions) for maximum readability |
| `observable-tools-diffs.md` | Observable: Tools + Diffs | Transparent reporting of tools used (in TypeScript interface syntax) and git diff summaries after code changes |
| `observable-tools-diffs-tts.md` | Observable: Tools + Diffs + TTS | Combines tool/diff reporting with text-to-speech audio announcements of task completion |
| `table-based.md` | Table Based | Markdown tables for organizing comparisons, steps, configurations, and analysis results |
| `tts-summary-base.md` | TTS Summary (Base) | Audio task completion announcements via text-to-speech (base version) |
| `tts-summary.md` | TTS Summary | Audio task completion with git diff reporting and text-to-speech announcements |
| `ultra-concise.md` | Ultra Concise | Minimal words, maximum speed - direct actions only, no filler or explanations |
| `yaml-structured.md` | YAML Structured | Structured YAML format with hierarchical key-value pairs for machine-readable output |

## Creating Custom Styles

Create a new `.md` file with YAML frontmatter:

```markdown
---
name: My Custom Style
description: Brief description of the style
---

Instructions for how Claude should format responses...
```

Place the file in `.claude/output-styles/` and select it to activate.

## Source

These output styles were contributed by [disler](https://github.com/disler).
