# Subagent Template Reference

Use this template when creating new Claude Code subagents. Copy the appropriate section below and customize it for the specific use case.

For full documentation, see `sub-agents.md` in the cc-docs folder.

---

## Subagent File Location

| Scope   | Path                    | When to use                              |
|---------|-------------------------|------------------------------------------|
| Project | `.claude/agents/*.md`   | Codebase-specific, shared via git        |
| User    | `~/.claude/agents/*.md` | Personal, available across all projects  |

Subagents are loaded at session start. Use `/agents` to reload without restarting.

---

## Frontmatter Reference

```yaml
---
name: my-agent                     # REQUIRED — lowercase letters and hyphens
description: >                     # REQUIRED — when Claude should delegate to this agent
  What this agent does.
  Include "use proactively" to encourage auto-delegation.
tools: Read, Grep, Glob, Bash     # Tools allowed (inherits all if omitted)
disallowedTools: Write, Edit       # Tools to deny (removed from inherited/specified list)
model: sonnet                      # sonnet, opus, haiku, or inherit (default: inherit)
permissionMode: default            # default, acceptEdits, dontAsk, bypassPermissions, plan
maxTurns: 50                       # Max agentic turns before stopping
background: false                  # true = always run as background task
isolation: worktree                # "worktree" = run in temporary git worktree
skills:                            # Skills to preload into context at startup
  - api-conventions
  - error-handling-patterns
mcpServers:                        # MCP servers available to this agent
  - slack                          # Reference existing server by name
  - github:                        # Or inline definition
      command: gh
      args: ["mcp"]
memory: user                       # Persistent memory: user, project, or local
hooks:                             # Lifecycle hooks scoped to this agent
  PreToolUse:
    - matcher: "Bash"
      hooks:
        - type: command
          command: "./scripts/validate.sh"
  PostToolUse:
    - matcher: "Edit|Write"
      hooks:
        - type: command
          command: "./scripts/lint.sh"
---
```

---

## Available Tools

Common tool combinations:

| Use case         | Tools                                         |
|------------------|-----------------------------------------------|
| Read-only        | `Read, Grep, Glob`                            |
| Read + terminal  | `Read, Grep, Glob, Bash`                      |
| Full edit access | `Read, Grep, Glob, Bash, Edit, Write`         |
| Minimal edit     | `Read, Grep, Glob, Edit`                      |
| Can spawn agents | `Task, Read, Grep, Glob, Bash`                |
| Restricted spawn | `Task(worker, researcher), Read, Grep, Glob`  |

Use `disallowedTools` to deny specific tools while inheriting the rest:

```yaml
disallowedTools: Write, Edit, NotebookEdit
```

---

## Permission Modes

| Mode                | Behavior                                    |
|---------------------|---------------------------------------------|
| `default`           | Standard permission prompts                 |
| `acceptEdits`       | Auto-accept file edits                      |
| `dontAsk`           | Auto-deny prompts (allowed tools still work)|
| `bypassPermissions` | Skip all permission checks (use with care)  |
| `plan`              | Read-only exploration mode                  |

---

## Memory Scopes

| Scope     | Location                                      | Use when                                |
|-----------|-----------------------------------------------|-----------------------------------------|
| `user`    | `~/.claude/agent-memory/<name>/`              | Learnings apply across all projects     |
| `project` | `.claude/agent-memory/<name>/`                | Knowledge is project-specific, sharable |
| `local`   | `.claude/agent-memory-local/<name>/`          | Project-specific, not in git            |

When `memory` is set, the agent automatically gets Read/Write/Edit tools and a `MEMORY.md` in its context.

---

## Template 1: Read-Only Reviewer

Use for: code review, security audit, documentation review — no modifications allowed.

```markdown
---
name: <domain>-reviewer
description: >
  Expert <domain> review specialist.
  Use proactively after writing or modifying <type of code>.
tools: Read, Grep, Glob, Bash
model: sonnet
---

You are a senior <domain> reviewer ensuring high standards of <quality aspect>.

When invoked:
1. Run `git diff` to see recent changes
2. Focus on modified files
3. Begin review immediately

## Review Checklist

- <Check 1>
- <Check 2>
- <Check 3>
- <Check 4>
- <Check 5>

## Output Format

Organize feedback by priority:
- **Critical** (must fix): <description>
- **Warning** (should fix): <description>
- **Suggestion** (consider): <description>

Include specific code examples showing how to fix each issue.
```

---

## Template 2: Debugger / Fixer

Use for: bug diagnosis, test failures, error investigation — needs edit access to apply fixes.

```markdown
---
name: <domain>-debugger
description: >
  Debugging specialist for <type of errors>.
  Use proactively when encountering <trigger conditions>.
tools: Read, Edit, Bash, Grep, Glob
model: inherit
---

You are an expert debugger specializing in <domain>.

When invoked:
1. Capture error message and stack trace
2. Identify reproduction steps
3. Isolate the failure location
4. Implement minimal fix
5. Verify solution works

## Debugging Process

- Analyze error messages and logs
- Check recent code changes with `git diff`
- Form and test hypotheses
- Add strategic debug logging if needed
- Inspect variable states

## Output Format

For each issue provide:
- **Root cause**: <explanation>
- **Evidence**: <supporting data>
- **Fix**: <specific code change>
- **Verification**: <how to confirm it works>
- **Prevention**: <how to avoid in future>

Focus on fixing the underlying issue, not symptoms.
```

---

## Template 3: Domain Expert

Use for: specialized tasks like data analysis, infrastructure, security — domain-specific knowledge.

```markdown
---
name: <domain>-expert
description: >
  <Domain> expert for <specific tasks>.
  Use proactively for <trigger conditions>.
tools: Bash, Read, Write
model: sonnet
---

You are a <domain> specialist.

When invoked:
1. Understand the requirement
2. <Domain-specific step>
3. <Domain-specific step>
4. Analyze and summarize results
5. Present findings clearly

## Key Practices

- <Practice 1>
- <Practice 2>
- <Practice 3>
- <Practice 4>

## Output Format

For each task:
- Explain the approach
- Document assumptions
- Highlight key findings
- Suggest next steps
```

---

## Template 4: Agent with Hooks (Validated Operations)

Use for: agents that need runtime validation — e.g., read-only DB access, safe bash commands.

```markdown
---
name: <safe>-<domain>
description: >
  <Description> with validated operations.
  Use when <trigger conditions>.
tools: Bash
hooks:
  PreToolUse:
    - matcher: "Bash"
      hooks:
        - type: command
          command: "./scripts/validate-<domain>.sh"
---

You are a <domain> specialist with <restriction description>.

When asked to <task>:
1. <Step 1>
2. <Step 2>
3. <Step 3>

## Restrictions

You cannot <restricted action>. If asked to <restricted request>,
explain that you only have <allowed access type>.
```

**Validation script** (`./scripts/validate-<domain>.sh`):

```bash
#!/bin/bash
INPUT=$(cat)
COMMAND=$(echo "$INPUT" | jq -r '.tool_input.command // empty')

# Block dangerous operations
if echo "$COMMAND" | grep -iE '\b(<BLOCKED_PATTERN_1>|<BLOCKED_PATTERN_2>)\b' > /dev/null; then
  echo "Blocked: <reason>" >&2
  exit 2
fi

exit 0
```

---

## Template 5: Agent with Persistent Memory

Use for: agents that learn over time — reviewers that remember patterns, assistants that build knowledge.

```markdown
---
name: <learning>-<role>
description: >
  <Role> that builds knowledge over time.
  Use proactively when <trigger conditions>.
tools: Read, Grep, Glob, Bash
memory: user
model: sonnet
---

You are a <role> that improves with experience.

## Before Starting

1. Read your memory directory for past learnings
2. Check MEMORY.md for known patterns and conventions
3. Apply existing knowledge to the current task

## During Work

- <Task-specific instructions>
- <Quality criteria>

## After Completing

Update your agent memory with:
- New patterns or conventions discovered
- Recurring issues and their solutions
- Architectural decisions and their context
- Key file paths and their purposes

Write concise notes about what you found and where.
Keep MEMORY.md under 200 lines — link to topic files for details.
```

---

## Template 6: Background Agent

Use for: long-running tasks that shouldn't block the main conversation.

```markdown
---
name: <bg>-<task>
description: >
  <Task description> in the background.
  Use when <trigger conditions>.
tools: Read, Grep, Glob, Bash
background: true
model: haiku
---

You are a background worker for <task type>.

When invoked:
1. <Step 1>
2. <Step 2>
3. <Step 3>

## Important

- Work autonomously without asking clarifying questions
- Return a concise summary of findings
- Flag critical issues prominently at the top of your response
```

---

## Template 7: Isolated Worker (Git Worktree)

Use for: tasks that modify files but need isolation — experimental changes, parallel branches.

```markdown
---
name: <isolated>-<task>
description: >
  <Task> in an isolated copy of the repository.
  Use when <trigger conditions>.
tools: Read, Edit, Write, Bash, Grep, Glob
isolation: worktree
model: inherit
---

You are working in an isolated git worktree.

When invoked:
1. <Step 1 — make changes freely>
2. <Step 2>
3. <Step 3>
4. Commit your changes with a descriptive message

## Notes

- Your changes are isolated — they won't affect the main branch
- The worktree is auto-cleaned if you make no changes
- If changes are made, the worktree path and branch are returned
```

---

## CLI-Defined Subagent (for scripting/automation)

For one-off or CI/CD use, pass JSON directly:

```bash
claude --agents '{
  "<agent-name>": {
    "description": "<when to use>",
    "prompt": "<system prompt>",
    "tools": ["Read", "Grep", "Glob", "Bash"],
    "model": "sonnet"
  }
}'
```

---

## Important Constraints

- Subagents **cannot spawn other subagents** (no nesting)
- Subagents receive only their system prompt + environment info, **not** the full Claude Code system prompt
- Subagents **do not inherit skills** from parent — use the `skills` field to preload them
- Subagents are loaded at session start — restart or use `/agents` to pick up new ones
- When `background: true`, the agent auto-denies any permissions not pre-approved

---

## Checklist Before Saving

- [ ] `name` is lowercase with hyphens only
- [ ] `description` clearly states when Claude should delegate to this agent
- [ ] `description` includes "use proactively" if auto-delegation is desired
- [ ] `tools` restricted to minimum necessary permissions
- [ ] `model` chosen appropriately (haiku for speed, sonnet for capability)
- [ ] System prompt gives clear, actionable instructions
- [ ] System prompt defines output format
- [ ] Tested via direct request: "Use the <name> agent to..."
- [ ] Tested auto-delegation by describing a matching task
- [ ] If using hooks, validation scripts are executable (`chmod +x`)
- [ ] If using memory, instructions for reading/updating memory are in prompt
