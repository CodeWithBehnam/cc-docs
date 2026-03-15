# Professional Code Review with Claude Code

This guide walks through using Claude Code to conduct a thorough code review. You will use a fresh session to avoid bias, direct Claude to focus on specific areas, use subagents for deep dives, generate structured review comments, and then switch to an author session to address the feedback.

**Time:** 30-60 minutes per PR
**Requires:** Access to the PR diff (via GitHub CLI or pasted diff)
**Related resources:** `/review` skill (if configured in your project), code-reviewer subagent

---

## Overview

1. Open a fresh session for unbiased review
2. Ask Claude to review the PR diff
3. Focus on specific areas (security, performance, tests)
4. Use subagents for deep dives
5. Generate structured review comments
6. Address feedback in the author session

---

## Step 1: Open a fresh session for unbiased review

Reviews are most useful when done without the implementation context that the author carries. Start a new session with no prior conversation history.

```bash
cd /path/to/the/repository
claude
```

Switch to plan mode with `Shift+Tab` - a reviewer should not be modifying files. Name the session so you can reference it:

```text
/name review-pr-[number]
```

**Expected outcome:** A clean plan-mode session. Claude has no prior context about the PR other than what the repository contains and what you are about to show it.

---

## Step 2: Ask Claude to review the PR diff

**Option A: Using the GitHub CLI (recommended if gh is installed)**

```text
Fetch and review PR #[number] from this repository. Use the GitHub CLI to get the diff and the PR description. Give me an initial review covering correctness, code quality, and any obvious issues.
```

Claude will run `gh pr diff [number]` and `gh pr view [number]` to pull the full context.

**Option B: Pasting the diff manually**

If you do not have the GitHub CLI, paste the diff directly:

```text
Here is the diff for the PR I want you to review. The PR description says: "[paste PR description]"

[paste diff here]

Give me an initial review covering correctness, code quality, and any obvious issues.
```

**Expected outcome:** An initial review covering:
- What the PR does (Claude's own summary - useful for checking the PR description is accurate)
- Obvious correctness issues
- Code quality observations
- Missing tests or documentation
- Questions that need answering before the PR can be approved

At this stage Claude is giving you breadth, not depth. The deep dives come in Steps 3 and 4.

---

## Step 3: Focus on specific areas

After the initial overview, direct Claude to specific concerns. The most common ones are security, performance, and test coverage.

**Security review:**

```text
Focus specifically on security. Look at the changed code for:
- Input validation and sanitization
- Authentication and authorization checks
- SQL/command injection risks
- Sensitive data being logged or exposed
- Dependency changes that introduce known vulnerabilities
```

**Performance review:**

```text
Focus specifically on performance. Look for:
- N+1 query patterns
- Missing database indexes implied by new query patterns
- Unnecessary re-renders or recomputations
- Large data sets being loaded into memory
- Missing caching opportunities
- Synchronous operations that should be async
```

**Test coverage:**

```text
Focus specifically on test coverage. Look at:
- Which branches of the new logic are covered
- Edge cases that are not tested
- Tests that only test the happy path
- Integration tests that should exist but do not
- Tests that are too tightly coupled to implementation details
```

**API contract review:**

```text
Does this PR change any public API, HTTP endpoint, or event format? If yes, are the changes backward-compatible? Is the documentation updated?
```

**Expected outcome:** Focused findings in each area. Take notes on which areas have real issues versus which are clean.

---

## Step 4: Use subagents for deep dives

For issues that need more than surface examination, use a subagent to dig deeper without clogging your main review conversation with lengthy explorations.

**If you have a code-reviewer subagent configured:**

```text
Use the code-reviewer agent to do a deep analysis of the changes to src/auth/ in this PR. I want to understand whether the session management changes are safe.
```

**For any specific file or function:**

```text
The change to processPayment() in src/payments/processor.ts looks risky. Spawn an exploration of the full call path for that function - what calls it, what it calls, and whether the new error handling is correct end-to-end.
```

**Expected outcome:** The subagent returns a focused analysis of that specific area. The main review session stays focused on the overall PR without being derailed by deep code exploration.

If you do not have a code-reviewer subagent, you can create one from the template in `templates/SUBAGENT-TEMPLATE.md` (use the read-only reviewer template).

---

## Step 5: Generate review comments

Once you have gathered all the findings, ask Claude to format them as review comments ready to post.

```text
Based on everything we have found, generate review comments formatted for GitHub. For each issue:
- Quote the relevant code (file path + line number or range)
- Describe the issue clearly
- Suggest the fix (with a code snippet if appropriate)
- Label the severity: [blocking] for must-fix before merge, [suggestion] for improvements, [question] for things needing clarification

Organize: blocking comments first, then suggestions, then questions.
```

**Expected outcome:** A list of formatted review comments. For example:

```
**[blocking]** `src/auth/session.ts:47-52`
The session token is being generated with `Math.random()` which is not cryptographically secure.
Replace with `crypto.randomBytes(32).toString('hex')`.

**[suggestion]** `src/api/users.ts:103`
This query will run once per user in the list (N+1 pattern). Consider batching with `whereIn`.

**[question]** `src/models/order.ts:78`
Why is `completedAt` nullable here? Can an order be in "completed" status without a completion timestamp?
```

Before posting, review the list yourself. Remove any comments that are wrong, too pedantic, or not worth raising. A good review has 3-10 focused comments, not 40 minor ones.

**Post the comments:**

If using the GitHub CLI:

```text
Post these review comments to PR #[number] on GitHub using the gh CLI. Post them as individual line comments where possible. Add a top-level review summary that says whether you recommend [approve / request changes / comment].
```

---

## Step 6: Address feedback in the author session

Switch roles: now you are the author responding to the review. Start a new session (or resume the original implementation session):

```text
/name author-pr-[number]
```

Paste the review comments and work through them:

```text
These are the review comments on my PR. Let's address them one at a time, starting with the blocking issues.

[paste review comments]

For each blocking issue, propose a fix and show me the code change before applying it.
```

**Expected outcome:** Claude works through each comment, proposes fixes, and applies them after your approval. For questions in the review, Claude may suggest a response to post rather than a code change.

After all blocking issues are addressed, run tests:

```bash
npm test
```

Then push the changes:

```bash
git push
```

**Expected outcome:** Updated PR with a clean commit addressing the review feedback.

---

## Tips for better reviews

**Use the /review skill.** If your project has a `/review` skill in `.claude/skills/review/`, it may have project-specific review criteria already encoded. Invoke it with:

```text
/review
```

Or with a PR number:

```text
/review [pr-number]
```

**Set a review depth.** For a quick sanity check, ask for a "light review focused on correctness only." For a PR going to production, ask for a "thorough review including security and performance." Calibrating depth saves time on low-risk changes.

**Review the tests as carefully as the code.** Tests that are too easy to satisfy give false confidence. Ask Claude specifically:

```text
Are these tests actually verifying the behavior, or could they pass with a broken implementation?
```

**Do not automate approval decisions.** Claude can surface issues, but the final approve/request-changes decision should be human. Claude cannot know your team's risk tolerance, release timeline, or the broader context of the change.

**Keep a review checklist in CLAUDE.md.** If your team has a standard review checklist (security, performance, docs, tests), put it in the project's CLAUDE.md under a "Code Review Standards" section. Claude will apply it automatically.

---

## Related resources

- `templates/SUBAGENT-TEMPLATE.md` - Template for creating a code-reviewer subagent (read-only reviewer pattern)
- `templates/SKILL-TEMPLATE.md` - Template for creating a `/review` skill
- `claude-code-docs/code-review.md` - Code review workflows documentation
- `claude-code-docs/sub-agents.md` - Subagent documentation
- `claude-code-docs/github-actions.md` - Automated review via GitHub Actions
