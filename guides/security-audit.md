# Running a Security Audit with Claude Code

This guide walks through a structured security audit of a codebase using Claude Code. You will use plan mode to analyze without changing anything, then switch to normal mode to fix issues, and finally set up hooks to catch regressions automatically.

**Time:** 1-3 hours depending on codebase size
**Requires:** A git repository with a working test suite
**Related resources:** Security-auditor subagent (see `templates/SUBAGENT-TEMPLATE.md`), `/security-review` skill if set up in your project

---

## Overview

1. Start a fresh session with plan mode
2. Ask Claude to analyze for OWASP Top 10 vulnerabilities
3. Review findings, prioritize by severity
4. Switch to normal mode and fix critical issues first
5. Run `/security-review` to verify fixes
6. Set up protection hooks for ongoing security

---

## Step 1: Start a fresh session with plan mode

Open a new Claude Code session for the audit. Starting fresh avoids carrying context from a previous session that might bias the analysis. Switch to plan mode immediately so Claude cannot modify any files during the analysis phase.

```bash
cd /path/to/your/project
claude
```

Switch to plan mode with `Shift+Tab` (cycles through modes) until the status line shows "Plan mode". Then name the session:

```text
/name security-audit-[date]
```

**Expected outcome:** Claude is in plan mode. It can read files, search the codebase, and reason about the code, but it cannot edit or create files. This is the safe state for analysis.

**Why a fresh session?** Auto-memory from previous sessions can carry assumptions about the code. For a security audit you want Claude to approach the codebase without prior context.

---

## Step 2: Ask Claude to analyze the codebase for OWASP Top 10

Give Claude the full audit scope. The OWASP Top 10 is a good starting framework because it covers the most common and highest-impact vulnerability classes.

```text
Perform a security audit of this codebase focused on the OWASP Top 10. For each vulnerability category, search the codebase systematically and report:

1. What you found (or did not find)
2. Specific file paths and line numbers
3. Severity: Critical / High / Medium / Low
4. A brief explanation of why it is a vulnerability

OWASP Top 10 categories to cover:
- A01: Broken Access Control
- A02: Cryptographic Failures
- A03: Injection (SQL, command, LDAP, etc.)
- A04: Insecure Design
- A05: Security Misconfiguration
- A06: Vulnerable and Outdated Components
- A07: Identification and Authentication Failures
- A08: Software and Data Integrity Failures
- A09: Security Logging and Monitoring Failures
- A10: Server-Side Request Forgery (SSRF)

Do not fix anything yet. Only report findings.
```

**Expected outcome:** A structured report organized by OWASP category. Each finding includes a file path, line reference, severity rating, and explanation. The report may take several minutes as Claude reads through the codebase.

**For a deeper analysis on specific areas,** use a security-auditor subagent if you have one configured:

```text
Use the security-auditor agent to do a deep analysis of the authentication module in [path/to/auth].
```

If you do not have a security-auditor agent, the `templates/SUBAGENT-TEMPLATE.md` file has a read-only reviewer template you can adapt.

---

## Step 3: Review findings, prioritize by severity

Ask Claude to organize the findings into a prioritized action list.

```text
Summarize all findings into a prioritized action list. Group by severity: Critical first, then High, then Medium, then Low. For each item include the file path, a one-line description of the issue, and the estimated effort to fix (small/medium/large).
```

**Expected outcome:** A table or numbered list you can use as a work queue. Something like:

```
CRITICAL
1. SQL injection in src/db/queries.js:47 - user input passed directly to query string [small fix]
2. Hardcoded API key in config/defaults.js:12 - exposed in version control [small fix]

HIGH
3. Missing CSRF protection on POST /api/user/update [medium fix]
...
```

**Review the list yourself before proceeding.** Claude may flag false positives (code that looks risky but is actually safe due to context it missed). Mark anything you disagree with and ask Claude to re-examine:

```text
Item 3 - the CSRF protection is handled by the middleware in src/middleware/csrf.js. Does that cover the /api/user/update route?
```

---

## Step 4: Switch to normal mode, fix critical issues first

Once you have a prioritized list you trust, switch out of plan mode. Press `Shift+Tab` until the status line shows normal mode (no mode indicator).

Start with Critical severity items only. Do not try to fix everything in one pass.

```text
Let's fix the critical issues. Start with item 1: the SQL injection in src/db/queries.js. Show me the vulnerable code first, then propose a fix using parameterized queries. Do not make the change until I approve the approach.
```

**Expected outcome:** Claude shows you the current code and a proposed fix side by side. Review the proposed change before approving.

Once you approve:

```text
Go ahead and apply that fix.
```

Repeat for each critical item. After fixing all critical issues, run your test suite:

```bash
npm test
```

Tests should still pass. If they do not, ask Claude to diagnose the regression before continuing.

After critical items are resolved, work through High severity items the same way:

```text
Critical issues are fixed and tests are green. Now let's work through the High severity items. Start with item 3.
```

---

## Step 5: Run /security-review to verify fixes

If your project has a `/security-review` skill set up, run it to verify the fixes did not introduce new issues and that the original vulnerabilities are actually resolved.

```text
/security-review
```

**Expected outcome:** The skill re-checks the areas that were modified and confirms the fixes are in place. It may also surface any new issues introduced during the fixes.

If you do not have a `/security-review` skill, ask Claude to re-check the specific files you modified:

```text
Re-examine the files we modified during this session. Confirm the original vulnerabilities are fixed. Check whether any of the changes introduced new security issues.
```

**Expected outcome:** A confirmation that each fixed item is no longer vulnerable, plus any new findings to add to the queue.

---

## Step 6: Set up protection hooks for ongoing security

Hooks run automatically on every Claude Code tool use - they are a good way to prevent the same vulnerabilities from being reintroduced. See `templates/HOOKS-TEMPLATE.md` and `claude-code-docs/hooks-guide.md` for the full reference.

**Example: Block writes to sensitive files**

Ask Claude to create a hook that prevents editing `.env` files, credential files, and security configuration:

```text
Create a PreToolUse hook that blocks Claude from editing these files: .env, any file matching *.pem, *.key, config/secrets.*, and src/security/. Put the hook script at .claude/hooks/protect-security-files.sh and add it to .claude/settings.json.
```

**Expected outcome:** A hook script and updated settings.json. The hook uses exit code 2 to block the edit and sends an explanatory message to Claude.

**Example: Warn on SQL string concatenation**

```text
Create a PostToolUse hook that runs after every file Edit or Write. It should grep the modified file for patterns like "query +" or "SELECT.*\+" that suggest SQL string concatenation, and warn Claude if found. Put it at .claude/hooks/warn-sql-concat.sh.
```

**Make hooks executable:**

```bash
chmod +x .claude/hooks/protect-security-files.sh
chmod +x .claude/hooks/warn-sql-concat.sh
```

**Verify the hooks work:**

```text
Try to edit the .env file and show me what happens.
```

**Expected outcome:** Claude reports that the edit was blocked by the hook.

---

## Committing the audit results

Commit the security fixes and the hooks together so the team gets both the remediation and the protection:

```bash
git add -p
git commit -m "Fix critical and high severity security issues from OWASP audit

- Fix SQL injection in src/db/queries.js (parameterized queries)
- Remove hardcoded API key from config/defaults.js
- Add CSRF protection to /api/user/update
- Add PreToolUse hooks to protect sensitive files"
```

---

## Tips for better security audits

**Run the audit on a branch.** Create `security-audit` off main so fixes can be reviewed in a PR before merging.

**Audit incrementally.** For large codebases, audit one module at a time rather than the whole repo at once. Claude's analysis quality drops when it has too much code to hold in context.

**Ask about your specific stack.** After the OWASP sweep, follow up with stack-specific questions:

```text
Are there any security issues specific to Express.js middleware ordering or JWT handling patterns in this codebase?
```

**Check third-party dependencies separately.** Claude cannot run `npm audit` or `pip check` on its own (without shell access), but you can run these and paste the output:

```text
Here is the output of npm audit. Which of these advisories apply to code paths that are actually reachable in production?
```

---

## Related resources

- `templates/SUBAGENT-TEMPLATE.md` - Template for a security-auditor subagent (read-only reviewer pattern)
- `templates/HOOKS-TEMPLATE.md` - Hook templates including the "block dangerous commands" and "protect files" patterns
- `claude-code-docs/hooks-guide.md` - Practical guide to automating workflows with hooks
- `claude-code-docs/hooks.md` - Full hooks reference
- `claude-code-docs/permissions.md` - Permission modes including plan mode
