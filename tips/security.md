# Security Tips

Security-first habits and safeguards for safe Claude Code automation.

---

## Add .env and credential files to permission deny rules

Configure Claude Code to refuse to read or write files that contain secrets. Add patterns to your deny list in settings.

```json
{
  "permissions": {
    "deny": [
      "Read(.env*)",
      "Read(*credentials*)",
      "Read(*secret*)",
      "Write(.env*)"
    ]
  }
}
```

This prevents accidental secret exposure even if Claude is asked to read those files.

---

## Use /sandbox for OS-level isolation

Running `/sandbox` executes subsequent shell commands inside a sandboxed environment with restricted filesystem and network access. Use it when asking Claude to run unfamiliar scripts or install packages.

```
/sandbox
npm install
```

See `claude-code-docs/sandboxing.md` for what is and is not accessible inside the sandbox.

---

## Block curl|bash and wget|bash patterns with hooks

Piping remote scripts directly into a shell is a common supply chain attack vector. Use a pre-tool hook to block this pattern.

Example hook rule (in your hooks configuration):

```json
{
  "event": "PreToolCall",
  "tool": "Bash",
  "pattern": "(curl|wget).*\\|.*(bash|sh)",
  "action": "block",
  "message": "Piping remote scripts to a shell is blocked. Download and inspect the script first."
}
```

See `claude-code-docs/hooks.md` for the full hook configuration format.

---

## Use read-only subagents for code review

When asking Claude to review code for security issues, restrict the subagent to read-only tools. This prevents the reviewer from accidentally modifying files.

```
Use a subagent with only Read, Glob, and Grep tools to audit src/auth/ for common vulnerabilities. Do not make any changes - report only.
```

Pair this with `--allowedTools "Read,Glob,Grep"` in automated review pipelines.

---

## Run /security-review before merging

Before merging a significant change, run a dedicated security review pass.

```
/security-review
```

Or as a targeted prompt:

```
Review the changes in this branch for security issues: injection vulnerabilities, missing authentication checks, insecure defaults, and anything that touches secrets or user input.
```

Make this a standard step in your pre-merge checklist.

---

## Use devcontainers with firewall rules for maximum isolation

For the strongest isolation, run Claude Code inside a devcontainer with outbound network rules applied. This limits which hosts Claude's shell commands can reach, preventing exfiltration even if a prompt injection occurs.

See `claude-code-docs/devcontainer.md` for a reference configuration that includes network restrictions.

---

## Block force-push to main with hooks

Protect your main branch from accidental or Claude-initiated force pushes.

```json
{
  "event": "PreToolCall",
  "tool": "Bash",
  "pattern": "git push.*--force.*(main|master)",
  "action": "block",
  "message": "Force pushing to main/master is blocked."
}
```

This fires before the command runs, not after. The push never happens.

---

## Audit dependencies with a dedicated subagent

Regularly run a dependency audit as a subagent task, separate from your main work session.

```
Use a subagent to run `npm audit` (or `pip-audit`, `cargo audit`, etc.), summarize any high or critical vulnerabilities, and list the affected packages with recommended fixes.
```

Keeping this as a separate task prevents audit noise from cluttering your working context.

---

## Never commit secrets - add a protection hook

Add a pre-commit hook that scans staged files for secrets before any commit goes through.

```json
{
  "event": "PreToolCall",
  "tool": "Bash",
  "pattern": "git commit",
  "action": "run-check",
  "command": "git diff --cached | grep -iE '(api_key|secret|password|token)\\s*=\\s*['\"][^'\"]{8,}'"
}
```

If the pattern matches, block the commit and report the finding. Pair this with a tool like `git-secrets` or `trufflehog` for more thorough scanning.

---

## Only use --dangerously-skip-permissions inside sandboxed containers

The `--dangerously-skip-permissions` flag disables all permission checks and approval prompts. It is intended for fully automated CI pipelines running inside isolated containers with no network access to production systems.

Never use it on a developer machine with access to production credentials, cloud accounts, or sensitive files. The flag name exists to make misuse obvious - take it seriously.
