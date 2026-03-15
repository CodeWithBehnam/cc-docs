# Prompting Tips

How to write prompts that get better results faster from Claude Code.

---

## Be specific about files and locations

Vague prompts lead to vague searches. Tell Claude exactly where to look.

Instead of:
> "Fix the login bug"

Try:
> "Fix the session expiry bug in `src/auth/session.ts`, the `refreshToken` function around line 80"

This skips the file-search phase and gets straight to the fix.

---

## Include verification criteria

Tell Claude how to confirm the change worked. This prevents shallow fixes that pass the eye test but break at runtime.

```
Implement the rate limiter in middleware/rateLimit.ts.
After implementing, run `npm test -- --testPathPattern=rateLimit` to confirm all tests pass.
```

Claude will run the tests and iterate if they fail, rather than stopping after the first attempt.

---

## Point to existing patterns to follow

Claude will match your codebase style when you show it an example.

```
Add a DeleteWidget endpoint following the same pattern used in src/api/CreateWidget.php.
```

This produces code that fits naturally instead of code that looks like it was written by a different team.

---

## Scope investigations to avoid broad searches

Saying "find the token refresh logic" triggers a wide codebase search. Scoping it saves time and tokens.

```
Check src/auth/ for the token refresh logic.
```

If you know the file, be even more specific:

```
Look at src/auth/oauth.ts for how token refresh is handled.
```

---

## Use "interview me" for complex features

For features with many unknowns, ask Claude to interview you before writing any code. This surfaces assumptions and design decisions upfront.

```
I want to add multi-tenant support. Interview me about the requirements before making any changes.
```

Claude will ask focused questions, then produce a plan grounded in your actual constraints.

---

## Paste screenshots for UI work

Claude Code accepts images. For layout bugs, design implementation, or UI review, paste a screenshot directly into the prompt. No need to describe the visual in words.

This is especially effective for:
- Pointing out a CSS bug ("the button is overlapping the nav, see screenshot")
- Implementing a design mockup
- Comparing before/after states

---

## Use plan mode for multi-step changes

Before letting Claude execute a large refactor or migration, switch to plan mode first.

Press `Shift+Tab` twice to enter plan mode, then describe the task. Claude will lay out every step it intends to take. Review and edit the plan before approving execution.

This catches misunderstandings before any files change.

---

## Say "use subagents" for research tasks

When you need Claude to investigate something that requires reading many files or running multiple searches, asking it to use subagents keeps the main context clean.

```
Use subagents to find all places where we call the payments API and summarize the patterns.
```

The research happens in isolated subagent contexts. Only the summary comes back to the main session.

---

## Give URLs for external documentation

If your task involves a library, API, or framework, paste the URL to the relevant docs. Claude will fetch and read them.

```
Update our Stripe integration to use the new Payment Intents API.
Docs: https://stripe.com/docs/payments/payment-intents
```

This is more reliable than relying on training data for fast-moving APIs.

---

## Use "ultrathink" for complex reasoning tasks

For hard problems that require deep reasoning, tell Claude explicitly to think harder.

```
ultrathink: what is the safest way to migrate this schema without downtime?
```

This activates extended thinking and produces more thorough analysis on problems that reward it.

---

## State test preferences explicitly

Claude defaults to using mocks in tests. If you prefer real objects or integration-style tests, say so.

```
Write tests for the UserRepository. Don't use mocks - use the real database with a test transaction that rolls back.
```

Or for the opposite:

```
Write unit tests. Use mocks for all external dependencies.
```

Being explicit avoids re-work when Claude's default does not match your project's style.
