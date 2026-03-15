# Code Review Cheatsheet

## Overview
- Automated PR reviews posted as **inline comments** on GitHub
- Multi-agent fleet analyzes diff + full codebase context
- Available for **Teams and Enterprise** (not with Zero Data Retention)
- Findings do NOT approve or block PRs; existing review workflow stays intact
- Average review time: ~20 minutes; average cost: $15-25 per review

## Severity Levels
| Marker | Severity | Meaning |
|---|---|---|
| 🔴 | Normal | Bug that should be fixed before merging |
| 🟡 | Nit | Minor issue, not blocking |
| 🟣 | Pre-existing | Bug in codebase but not introduced by this PR |

## Setup (Admin Only)
1. Go to [claude.ai/admin-settings/claude-code](https://claude.ai/admin-settings/claude-code)
2. Click **Setup** → install Claude GitHub App to your GitHub org
3. Required permissions: Contents (R/W), Issues (R/W), Pull requests (R/W)
4. Choose repositories and set **Review Behavior** per repo

### Review Behavior Options
| Mode | When reviews run |
|---|---|
| Once after PR creation | Single review when PR opens or is marked ready |
| After every push | Review on each push (most reviews, highest cost) |
| Manual | Only on `@claude review` comment |

## Triggering Reviews
```
@claude review
```
- Post as a **top-level PR comment** (not inline on diff)
- Put `@claude review` at the start of the comment
- Requires owner, member, or collaborator access
- PR must be open and not a draft
- Works in any mode; also opts that PR into push-triggered reviews going forward

## Customizing Reviews

### CLAUDE.md
- Claude reads `CLAUDE.md` at every directory level
- CLAUDE.md violations introduced by the PR are flagged as **nit-level** findings
- Bidirectional: if PR makes a CLAUDE.md statement outdated, Claude flags the docs too

### REVIEW.md (review-only rules)
Add to repo root — not loaded for regular Claude Code sessions:
```markdown
# Code Review Guidelines

## Always check
- New API endpoints have corresponding integration tests
- Database migrations are backward-compatible

## Style
- Prefer match statements over chained isinstance checks

## Skip
- Generated files under src/gen/
- Formatting-only changes in *.lock files
```

## View Usage & Cost
Dashboard: [claude.ai/analytics/code-review](https://claude.ai/analytics/code-review)
- PRs reviewed (daily count)
- Weekly spend
- Feedback (auto-resolved comments after developer fixes)
- Per-repo PR counts and resolved comments

Set a monthly spend cap: [claude.ai/admin-settings/usage](https://claude.ai/admin-settings/usage)

## Pricing Notes
- Billed by token usage; counted as **extra usage** (not against plan's included usage)
- Costs appear on Anthropic bill regardless of Bedrock/Vertex usage
- "After every push" mode multiplies cost by number of pushes

## Gotchas
- Not available for Zero Data Retention orgs
- `@claude review` must be a top-level comment at the start of the line
- If a review is already running, the request is queued
- Default focus is **correctness** only; add REVIEW.md for style/coverage rules

---
> Source: [code-review.md](../code-review.md)
