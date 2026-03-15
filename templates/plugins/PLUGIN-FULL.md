# Plugin Template: Full-Featured

A complete Claude Code plugin with skills, agents, hooks, and MCP server integration.

---

## Directory Structure

```text
my-plugin/
├── .claude-plugin/
│   └── plugin.json          # Plugin manifest (required)
├── skills/
│   ├── analyze/
│   │   └── SKILL.md         # Analysis skill
│   └── generate/
│       ├── SKILL.md          # Code generation skill
│       └── template.md       # Template file for generation
├── agents/
│   └── reviewer.md           # Review subagent
├── hooks/
│   └── hooks.json            # Hook definitions
├── .mcp.json                 # MCP server configuration
└── README.md                 # Usage documentation
```

---

## Plugin Manifest

`.claude-plugin/plugin.json`:

```json
{
  "name": "my-full-plugin",
  "version": "1.0.0",
  "description": "A complete plugin with skills, agents, hooks, and MCP integration",
  "author": {
    "name": "Your Name",
    "url": "https://github.com/you"
  },
  "skills": "./skills/",
  "agents": "./agents/",
  "hooks": "./hooks/hooks.json",
  "mcpServers": "./.mcp.json"
}
```

---

## Skills

### Analysis Skill

`skills/analyze/SKILL.md`:

```yaml
---
name: analyze
description: >
  Analyze code quality, complexity, and potential issues.
  Use when asked to audit, analyze, or assess code quality.
argument-hint: "[file-or-directory]"
context: fork
agent: Explore
allowed-tools: Read, Grep, Glob, Bash(wc *), Bash(cloc *)
---

## Task

Analyze $ARGUMENTS for code quality:

1. Count lines of code and file distribution
2. Identify the most complex functions (cyclomatic complexity)
3. Find code duplication patterns
4. Check for common anti-patterns
5. Assess test coverage by comparing src/ to tests/

## Output

Provide a structured report:
- **Summary**: Overall health score (A-F)
- **Complexity hotspots**: Top 5 most complex files/functions
- **Duplication**: Repeated code patterns found
- **Anti-patterns**: Issues and how to fix them
- **Test coverage**: Estimated coverage and gaps
```

### Code Generation Skill

`skills/generate/SKILL.md`:

```yaml
---
name: generate
description: >
  Generate code from templates with project conventions.
  Use when asked to scaffold, generate, or create new components.
argument-hint: "[type] [name]"
disable-model-invocation: true
---

Generate a new $ARGUMENTS[0] named $ARGUMENTS[1]:

1. Read the template from [template.md](template.md)
2. Read existing similar files in the project for style reference
3. Fill in the template following project conventions
4. Create the file in the appropriate directory
5. Add any necessary imports to parent modules
6. Create a corresponding test file

## Supported Types

- `component` - React/UI component
- `service` - Business logic service
- `route` - API route handler
- `model` - Data model
- `test` - Test file for existing module
```

`skills/generate/template.md`:

```text
## Component Template

```tsx
interface {{NAME}}Props {
  // Props here
}

export function {{NAME}}({ }: {{NAME}}Props) {
  return (
    <div>
      {/* Implementation */}
    </div>
  );
}
`` `

## Service Template

```typescript
export class {{NAME}}Service {
  constructor(
    // Dependencies here
  ) {}

  async execute(): Promise<void> {
    // Implementation
  }
}
`` `

## Test Template

```typescript
import { describe, it, expect } from "vitest";

describe("{{NAME}}", () => {
  it("should work", () => {
    // Test implementation
  });
});
`` `
```

---

## Agents

`agents/reviewer.md`:

```yaml
---
name: reviewer
description: >
  Code review specialist.
  Use proactively after writing or modifying code.
tools: Read, Grep, Glob, Bash
model: sonnet
---

You are a code review specialist for this project.

When invoked:
1. Run `git diff` to see recent changes
2. Review each changed file thoroughly
3. Check against project conventions

## Review Checklist

- Correctness: logic errors, edge cases, off-by-one errors
- Security: input validation, injection, auth checks
- Performance: unnecessary loops, missing indexes, memory leaks
- Style: naming, formatting, consistency with codebase
- Tests: adequate coverage, meaningful assertions

## Output Format

Organize by priority:
- **Critical** (must fix): bugs, security issues, data loss risks
- **Warning** (should fix): performance, maintainability concerns
- **Suggestion** (nice to have): style improvements, readability

Include file:line references and code examples for fixes.
```

---

## Hooks

`hooks/hooks.json`:

```json
{
  "hooks": {
    "PostToolUse": [
      {
        "matcher": "Edit|Write",
        "hooks": [
          {
            "type": "command",
            "command": "FILE=$(cat | jq -r '.tool_input.file_path // empty') && [ -n \"$FILE\" ] && echo \"Modified: $FILE\" >> /tmp/claude-plugin-changes.log || true"
          }
        ]
      }
    ]
  }
}
```

---

## MCP Server

`.mcp.json`:

```json
{
  "mcpServers": {
    "project-api": {
      "command": "node",
      "args": ["./mcp-server/index.js"],
      "env": {
        "API_BASE_URL": "${PROJECT_API_URL}"
      }
    }
  }
}
```

---

## README.md

```markdown
# My Full Plugin

Description of what this plugin provides.

## Installation

```bash
claude plugin install https://github.com/you/my-full-plugin
`` `

## Skills

| Skill | Command | Description |
|-------|---------|-------------|
| Analyze | `/my-full-plugin:analyze [path]` | Code quality analysis |
| Generate | `/my-full-plugin:generate [type] [name]` | Scaffold new code |

## Agents

- **reviewer** - Auto-invoked after code changes for review

## Requirements

- Node.js 18+ (for MCP server)
- `cloc` CLI tool (for analysis skill)
```

---

## Development & Testing

```bash
# Test locally during development
claude --plugin-dir /path/to/my-plugin

# Reload after changes
/reload-plugins

# Debug loading issues
claude --debug

# Check plugin status
/plugins
```

---

## Publishing to a Marketplace

Add marketplace metadata to `plugin.json`:

```json
{
  "name": "my-full-plugin",
  "version": "1.0.0",
  "description": "A complete plugin with skills, agents, hooks, and MCP integration",
  "author": {
    "name": "Your Name",
    "url": "https://github.com/you"
  },
  "repository": "https://github.com/you/my-full-plugin",
  "tags": ["code-quality", "generation", "review"],
  "license": "MIT"
}
```

Marketplace operators can then index your plugin for discovery.
