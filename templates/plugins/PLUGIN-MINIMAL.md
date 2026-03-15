# Plugin Template: Minimal (Single Skill)

The simplest possible Claude Code plugin. One skill, one file, ready to install.

---

## Directory Structure

```text
my-plugin/
├── .claude-plugin/
│   └── plugin.json         # Plugin manifest
└── skills/
    └── my-skill/
        └── SKILL.md         # The skill
```

---

## Step 1: Create plugin.json

Create `.claude-plugin/plugin.json`:

```json
{
  "name": "my-plugin",
  "version": "1.0.0",
  "description": "Short description of what this plugin does",
  "author": {
    "name": "Your Name"
  }
}
```

---

## Step 2: Create the Skill

Create `skills/my-skill/SKILL.md`:

```yaml
---
name: my-skill
description: >
  What this skill does and when to use it.
  Include keywords users would naturally say.
argument-hint: "[argument]"
---

## Task

Do <action> for $ARGUMENTS:

1. <Step 1>
2. <Step 2>
3. <Step 3>

## Rules

- <Rule 1>
- <Rule 2>
```

---

## Step 3: Install Locally

```bash
# Install from local directory
claude plugin install /path/to/my-plugin

# Or install for just this project
claude plugin install /path/to/my-plugin --scope project

# Reload plugins in an active session
/reload-plugins
```

---

## Step 4: Test

```text
> /my-plugin:my-skill some argument
> Or just describe what you want and Claude will auto-invoke the skill
```

---

## Example: Changelog Generator

`.claude-plugin/plugin.json`:

```json
{
  "name": "changelog-gen",
  "version": "1.0.0",
  "description": "Generate changelog entries from git commits",
  "author": { "name": "Your Name" }
}
```

`skills/changelog/SKILL.md`:

```yaml
---
name: changelog
description: >
  Generate a changelog entry from recent git commits.
  Use when asked to write a changelog, release notes, or summarize recent changes.
argument-hint: "[version-tag or number-of-commits]"
---

Generate a changelog entry for $ARGUMENTS:

1. Run `git log --oneline` to see recent commits (use the argument as a tag or count)
2. Group commits by type (features, fixes, improvements, breaking changes)
3. Write a human-readable changelog in Keep a Changelog format
4. Include the date and version number

## Output Format

```markdown
## [version] - YYYY-MM-DD

### Added
- New feature descriptions

### Fixed
- Bug fix descriptions

### Changed
- Improvement descriptions

### Breaking Changes
- Breaking change descriptions (if any)
`` `

Omit empty sections. Use past tense. Start each item with a verb.
```

---

## Publishing

To share your plugin:

1. Push the plugin directory to a git repository
2. Others install with: `claude plugin install https://github.com/you/my-plugin`
3. Or submit to a marketplace (see PLUGIN-FULL.md for marketplace details)
