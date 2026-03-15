# Debugging Tips

Debugging strategies that save time, preserve context, and avoid the trap of repeated failed corrections.

---

## Paste the full error message and stack trace

Partial errors lead to guesswork. Always paste the complete error output, including the stack trace and any preceding log lines that show context.

```
Getting this error when running `npm run build`:

TypeError: Cannot read properties of undefined (reading 'map')
    at renderList (src/components/ItemList.tsx:34:22)
    at renderApp (src/App.tsx:12:5)
    ...
```

The full trace tells Claude exactly where the failure originates, not just where it surfaces.

---

## Tell Claude the reproduction steps

Knowing what triggers the bug is as important as knowing the error message. Include:

- What you did (the action or input)
- What you expected to happen
- What actually happened

```
Steps to reproduce:
1. Log in as a non-admin user
2. Navigate to /settings/billing
3. Click "Update payment method"

Expected: form opens
Actual: 403 error is thrown and the user is logged out
```

---

## Ask for root cause fixes, not symptom patches

A fix that silences the error without addressing the cause will resurface later. Make this expectation explicit.

```
Fix the root cause, not just the symptom. Don't add a null check to suppress the error - find out why the value is null in the first place.
```

---

## Use subagents for investigation to keep main context clean

Debugging investigations (reading logs, tracing call chains, checking git history) consume a lot of context. Run them in a subagent so the findings come back as a clean summary.

```
Use a subagent to investigate why the `processPayment` function occasionally returns null. Check the implementation, its callers, and recent git history for that file. Report your findings without making any changes.
```

---

## Use /rewind instead of correcting a failed fix

When a fix attempt makes things worse, the instinct is to ask Claude to correct it. But this adds more broken context. Instead, rewind to before the fix was applied.

```
/rewind
```

Then re-prompt with a clearer description of what the correct behavior should be. A clean starting point produces better results than layering corrections.

---

## After two failed corrections, /clear and write a better prompt

If you have tried to correct Claude twice and the problem is still not resolved, stop. The accumulated context is likely making things worse.

```
/clear
```

Start fresh with a more precise prompt that includes:
- The exact file and function
- The full error output
- The reproduction steps
- What you have already tried

A well-written second attempt almost always beats a third correction.

---

## Use git diff to show Claude what changed recently

If a bug appeared after recent changes and you are not sure what introduced it, show Claude the diff.

```bash
git diff HEAD~3 | claude "something broke after these changes - what looks suspicious?"
```

Or for a specific file:

```bash
git diff HEAD~1 -- src/auth/session.ts | claude "did any of these changes introduce a session expiry bug?"
```

---

## Ask Claude to add strategic debug logging

Instead of guessing at state, ask Claude to add logging at the key points in the execution path. Then run the code and share the output.

```
Add debug logging to trace the value of `user.permissions` as it flows through the middleware chain in src/middleware/. I'll run the code and paste the output back.
```

Once you have the log output, Claude can pinpoint the exact step where the value becomes wrong.

---

## Ask for hypotheses and systematic testing

For intermittent or hard-to-reproduce bugs, ask Claude to reason systematically rather than jump to a fix.

```
Form three hypotheses for why the cache might be returning stale data in production but not locally. For each hypothesis, describe how to test it.
```

Working through hypotheses one at a time is more reliable than applying fixes at random and hoping one sticks.
