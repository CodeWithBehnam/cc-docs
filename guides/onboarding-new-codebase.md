# First Day on a New Codebase

This guide walks through the process of getting up to speed on an unfamiliar codebase using Claude Code. The goal is to understand the architecture, find the conventions, and make a first small change - all without accidentally breaking anything.

**Time:** 1-2 hours for initial orientation
**Requires:** Access to the repository
**Related resources:** `/onboard` skill (if set up in your project), onboarding-guide subagent

---

## Overview

1. Navigate to the project and start Claude
2. Get a codebase overview
3. Ask about architecture, data models, and auth
4. Use plan mode to explore without changing anything
5. Set up CLAUDE.md with the conventions you discover
6. Try a small change to test your understanding
7. Name the session for future reference

---

## Step 1: Navigate to the project and start Claude

```bash
cd /path/to/the/project
claude
```

Before asking Claude anything, switch to plan mode with `Shift+Tab`. This ensures that no matter what Claude does during exploration, it cannot modify any files. You are in observation mode.

**Expected outcome:** Claude starts in plan mode. Check the status line confirms this. You now have a safe environment to ask any question without risk.

**If the project has an `/onboard` skill** configured in `.claude/skills/onboard/`, use it now:

```text
/onboard
```

The skill will run a structured orientation sequence tailored to this project. If the skill exists, you can skip steps 2 and 3 below.

---

## Step 2: Ask for a codebase overview

Start broad. Claude will read the directory structure, package files, and key entry points.

```text
Give me an overview of this codebase. What does it do, how is it organized, and what are the main entry points?
```

**Expected outcome:** A summary covering:
- What the application does
- Top-level directory structure with the purpose of each major folder
- Main entry points (server start, CLI entry, build scripts)
- The primary language and framework

Follow up to get more depth:

```text
What are the most important files to understand first? Where does a typical request start and end?
```

**Expected outcome:** A short list of 5-10 files that are central to the application, with a sentence on why each one matters.

---

## Step 3: Ask about architecture, data models, and auth

Now go deeper on the areas that matter most for day-to-day work.

**Architecture patterns:**

```text
What architectural patterns does this codebase use? For example: layered architecture, domain-driven design, microservices, event sourcing, etc. Show me where each pattern appears.
```

**Data models:**

```text
What are the core data models or entities? Where are they defined? How do they relate to each other?
```

**Authentication and authorization:**

```text
How does this application handle authentication? How does it handle authorization? Trace the path from an incoming request to where the user identity is verified.
```

**Configuration:**

```text
How is configuration managed? What environment variables does this app depend on? Where are defaults set?
```

**Testing:**

```text
How is the test suite structured? What command runs the tests? Are there unit tests, integration tests, end-to-end tests? What is the rough coverage situation?
```

**Expected outcome:** After these questions you should have a mental model of the application. Take notes or ask Claude to write a summary you can keep.

---

## Step 4: Use plan mode to explore without changing anything

Stay in plan mode throughout this entire step. Use it to follow code paths interactively.

**Trace a feature:**

```text
Trace the full code path for [a specific feature you will be working on]. Follow it from the HTTP handler through the business logic to the database and back.
```

**Find the conventions:**

```text
Look at 5-10 recent commits and describe the coding conventions this team uses. How are functions named? How are errors handled? How is logging done? What does a typical controller or handler look like?
```

**Find the gotchas:**

```text
Are there any non-obvious patterns, workarounds, or known tech debt in this codebase? Look for TODO comments, unusual patterns, and code that looks like it was patched rather than designed.
```

**Expected outcome:** A list of conventions and gotchas that would take you weeks to discover on your own. This is the most valuable output of this step.

---

## Step 5: Set up CLAUDE.md with the conventions you discover

Now leave plan mode (`Shift+Tab` back to normal mode) and ask Claude to write a CLAUDE.md capturing what you learned. This gives every future session the same head start.

```text
Based on everything you have learned about this codebase, create a CLAUDE.md file in the project root. Include:

1. What the project does (1-2 sentences)
2. Build and test commands
3. Directory structure with a one-line purpose for each top-level folder
4. Coding conventions (naming, error handling, logging, etc.)
5. Gotchas and non-obvious patterns to be aware of
6. Any rules about what should NOT be changed without discussion

Keep it under 150 lines. Use bullet points and headers.
```

**Expected outcome:** A CLAUDE.md file at the project root. Review it carefully - Claude may have missed something or gotten a convention slightly wrong. Edit it directly:

```text
Update the CLAUDE.md: the test command is actually "npm run test:unit" not "npm test". Also add a note that all database queries must go through the repository layer, never directly from controllers.
```

**Commit the CLAUDE.md once you are happy with it:**

```bash
git add CLAUDE.md
git commit -m "Add CLAUDE.md with project conventions and architecture notes"
```

---

## Step 6: Try a small change to test your understanding

The best way to confirm your mental model is to make a real change. Pick something small - a bug fix, a minor improvement, or adding a test for an untested code path.

```text
I want to make a small change as a way to test my understanding of the codebase. Here is what I want to do: [describe the change].

Before you do anything, tell me: which files will need to change, what pattern should the change follow, and what tests should I write or update?
```

**Expected outcome:** Claude describes the change plan in terms of the conventions you just documented. If its plan matches your mental model, you are on track. If it proposes something that surprises you, ask about it before proceeding.

Once you are satisfied with the plan:

```text
Go ahead and make the change. Follow the conventions in CLAUDE.md.
```

Run the tests:

```bash
npm test
```

**Expected outcome:** Tests pass. The change looks consistent with surrounding code style. Another developer looking at it would not know a newcomer wrote it.

---

## Step 7: Name the session for future reference

Before ending the session, give it a descriptive name so you can reference it later. Claude remembers named sessions.

```text
/name onboarding-[project-name]
```

**Expected outcome:** The session is named. In future sessions you can refer to what you learned here:

```text
I previously did an onboarding session called onboarding-[project-name]. Based on what you know about that project, help me [next task].
```

---

## Tips for faster onboarding

**Use the onboarding-guide agent.** If an onboarding-guide subagent is configured in `.claude/agents/`, it may have project-specific orientation built in. Check with:

```text
What agents are available?
```

**Ask about the hardest parts first.** Every codebase has one or two areas that are notoriously hard to understand. Ask colleagues what those are before starting, then ask Claude to explain them specifically.

**Keep plan mode on until you make your first intentional change.** It is too easy to accidentally ask Claude to "fix this" when you really just meant "explain this." Plan mode protects you from that.

**Do not try to understand everything.** Focus on the areas relevant to your first task. Deep knowledge of the whole codebase comes over weeks and months - not in one session.

**Import team docs into CLAUDE.md.** If the project has architectural decision records (ADRs), a wiki, or a runbook, add import references to CLAUDE.md:

```markdown
@docs/architecture/decisions/
@docs/runbook.md
```

Claude will load these at the start of each session. See `claude-code-docs/memory.md` for the `@import` syntax.

---

## Related resources

- `templates/SUBAGENT-TEMPLATE.md` - Template for creating an onboarding-guide subagent
- `templates/SKILL-TEMPLATE.md` - Template for creating an `/onboard` skill
- `claude-code-docs/memory.md` - Full CLAUDE.md documentation including imports
- `claude-code-docs/interactive-mode.md` - Plan mode and other interactive features
- `claude-code-docs/common-workflows.md` - "Understand new codebases" section
