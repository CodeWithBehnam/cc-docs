# Skill Template Reference

Use this template when creating new Claude Code skills. Copy the appropriate section below and customize it for the specific use case.

For full documentation, see `skills.md` in the cc-docs folder.

---

## Skill Directory Structure

```text
.claude/skills/<skill-name>/
├── SKILL.md           # Main instructions (REQUIRED)
├── template.md        # Template for Claude to fill in (optional)
├── examples/
│   └── sample.md      # Example output showing expected format (optional)
└── scripts/
    └── helper.sh      # Script Claude can execute (optional)
```

**Where to store:**

| Scope      | Path                                       |
|------------|--------------------------------------------|
| Personal   | `~/.claude/skills/<skill-name>/SKILL.md`   |
| Project    | `.claude/skills/<skill-name>/SKILL.md`     |

---

## Frontmatter Reference

All fields are optional except `description` (recommended).

```yaml
---
name: my-skill                    # Lowercase, hyphens only (max 64 chars). Defaults to directory name
description: >                    # RECOMMENDED — Claude uses this to decide when to invoke
  What this skill does and when to use it.
  Include trigger keywords users would say.
argument-hint: "[arg1] [arg2]"    # Shown during autocomplete, e.g. "[issue-number]"
disable-model-invocation: false   # true = only user can invoke via /name (default: false)
user-invocable: true              # false = hidden from / menu, only Claude invokes (default: true)
allowed-tools: Read, Grep, Glob   # Restrict which tools Claude can use (inherits all if omitted)
model: sonnet                     # Model override: sonnet, opus, haiku, or inherit
context: fork                     # "fork" = run in isolated subagent context
agent: Explore                    # Subagent type when context: fork (Explore, Plan, general-purpose, or custom)
hooks:                            # Lifecycle hooks scoped to this skill
  PreToolUse:
    - matcher: "Bash"
      hooks:
        - type: command
          command: "./scripts/validate.sh"
---
```

## String Substitutions

Use these variables in your skill content:

| Variable               | Description                                    |
|------------------------|------------------------------------------------|
| `$ARGUMENTS`           | All arguments passed when invoking             |
| `$ARGUMENTS[N]` / `$N`| Specific argument by 0-based index             |
| `${CLAUDE_SESSION_ID}` | Current session ID                             |
| `` !`command` ``       | Shell command output (runs before Claude sees) |

---

## Template 1: Reference Skill (Background Knowledge)

Use for: coding conventions, style guides, domain knowledge that Claude applies to ongoing work.

```yaml
---
name: <project>-conventions
description: >
  <Project> coding conventions and patterns.
  Use when writing or reviewing code in this project.
---

## Conventions

- <Convention 1>
- <Convention 2>
- <Convention 3>

## Patterns

### <Pattern Name>

<Description of when and how to use this pattern>

```<language>
<Code example>
`` `

## Anti-patterns

- <What NOT to do and why>
```

---

## Template 2: Task Skill (User-Invoked Action)

Use for: deployments, commits, code generation — actions with side effects you want to control.

```yaml
---
name: <action-name>
description: <What this action does>
disable-model-invocation: true
---

<Action description> for $ARGUMENTS:

1. <Step 1>
2. <Step 2>
3. <Step 3>
4. <Step 4>

## Requirements

- <Requirement 1>
- <Requirement 2>

## Error Handling

- If <condition>: <what to do>
- If <condition>: <what to do>
```

---

## Template 3: Research Skill (Forked Subagent)

Use for: deep codebase exploration, documentation gathering — runs in isolation, returns summary.

```yaml
---
name: <research-name>
description: >
  <What this researches>.
  Use when <trigger conditions>.
context: fork
agent: Explore
allowed-tools: Read, Grep, Glob, Bash(gh *)
---

## Context

- <Dynamic context>: !`<shell command>`
- <More context>: !`<another command>`

## Task

Research $ARGUMENTS:

1. <Research step 1>
2. <Research step 2>
3. <Research step 3>

## Output Format

Provide:
- <What to include in the summary>
- <Specific file references>
- <Actionable findings>
```

---

## Template 4: Code Generation Skill (with Templates)

Use for: generating boilerplate, scaffolding components, creating files from patterns.

**SKILL.md:**

```yaml
---
name: generate-<thing>
description: >
  Generate a new <thing> with standard boilerplate.
  Use when creating new <things>.
disable-model-invocation: true
argument-hint: "[name]"
---

Generate a new <thing> named $ARGUMENTS[0]:

1. Read the template from [template.md](template.md)
2. Fill in the template with the provided name
3. Create the file at <target path>/$ARGUMENTS[0].<ext>
4. <Post-creation step>

## Additional Resources

- For examples, see [examples/](examples/)
```

**template.md** (supporting file):

```text
# Template for <thing>

<Boilerplate content with placeholders like {{NAME}}, {{DATE}}>
```

---

## Template 5: Script-Powered Skill (Visual/Complex Output)

Use for: generating HTML reports, visualizations, running analysis tools.

```yaml
---
name: <visualize-something>
description: >
  Generate an interactive <visualization> of <what>.
  Use when <trigger>.
allowed-tools: Bash(python *), Bash(node *)
---

# <Visualization Name>

Generate <output type> by running:

```bash
python <path-to-skill>/scripts/<script>.py $ARGUMENTS
`` `

## What it shows

- <Feature 1>
- <Feature 2>
- <Feature 3>

## Customization

Pass arguments to customize:
- `$0`: <first arg meaning>
- `$1`: <second arg meaning>
```

---

## Invocation Control Quick Reference

| You want...                              | Set                              |
|------------------------------------------|----------------------------------|
| Both user and Claude can invoke           | (defaults, no flags needed)      |
| Only user can invoke (e.g., /deploy)      | `disable-model-invocation: true` |
| Only Claude can invoke (background info)  | `user-invocable: false`          |
| Read-only mode                            | `allowed-tools: Read, Grep, Glob`|
| Run in isolation                          | `context: fork`                  |
| Use specific model                        | `model: haiku` / `sonnet` / `opus`|

---

## Checklist Before Saving

- [ ] `description` includes keywords users would naturally say
- [ ] Skill appears in `What skills are available?` check
- [ ] Arguments use `$ARGUMENTS` / `$0` / `$1` correctly
- [ ] `disable-model-invocation: true` set if skill has side effects
- [ ] `allowed-tools` restricts to minimum necessary tools
- [ ] Supporting files are referenced from SKILL.md
- [ ] Tested both direct invocation (`/skill-name`) and auto-invocation
