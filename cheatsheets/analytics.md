# Analytics Cheatsheet

## Dashboard Access
| Plan | URL | Features |
|---|---|---|
| Teams / Enterprise | [claude.ai/analytics/claude-code](https://claude.ai/analytics/claude-code) | Usage, contribution metrics, GitHub integration, leaderboard, CSV export |
| API (Console) | [platform.claude.com/claude-code](https://platform.claude.com/claude-code) | Usage, spend tracking, team insights |

- **Teams/Enterprise**: Admins and Owners can view
- **Console**: Requires `UsageView` permission (Developer, Billing, Admin, Owner, Primary Owner)

## Key Metrics

### Teams/Enterprise Dashboard
- **Lines of code accepted**: CC-assisted lines users accepted (excludes later deletions)
- **Suggestion accept rate**: % of Edit/Write/NotebookEdit suggestions accepted
- **DAU / Sessions**: daily active users and sessions
- **PRs with CC**: merged PRs containing at least one CC-assisted line
- **PRs with CC (%)**: % of all merged PRs with CC involvement

### Console Dashboard
- Lines of code accepted, suggestion accept rate, activity chart, daily spend
- Per-user table: member, spend this month, lines this month

## Enable Contribution Metrics (Teams/Enterprise)
Requires: Owner role + GitHub admin access; not available with Zero Data Retention.

1. GitHub admin installs the Claude GitHub App: [github.com/apps/claude](https://github.com/apps/claude)
2. Owner navigates to [claude.ai/admin-settings/claude-code](https://claude.ai/admin-settings/claude-code)
3. Enable "Claude Code analytics" and "GitHub analytics" toggles
4. Complete GitHub auth and select GitHub organizations

Data appears within 24 hours; updates daily. Supports GitHub Cloud and GitHub Enterprise Server.

## PR Attribution Details
- PRs tagged `claude-code-assisted` in GitHub if they contain ≥1 CC-assisted line
- Attribution window: sessions from **21 days before** to **2 days after** PR merge
- Lines are normalized before matching (whitespace, case, quotes)
- Code rewritten >20% by developer is NOT attributed to CC
- Excluded: lock files, generated code, build dirs (`dist/`, `node_modules/`), minified lines (>1000 chars)
- Metrics are **conservative** by design (underestimates actual CC impact)

## Programmatic Access
Search GitHub for PRs labeled `claude-code-assisted` to query data via API.

## Gotchas
- Contribution metrics only cover users in your `claude.ai` organization
- Console API usage and 3rd-party integrations are NOT included in contribution metrics
- Console spend figures are estimates; use the billing page for actual costs
- Zero Data Retention orgs see usage metrics only (no contribution metrics)

---
> Source: [analytics.md](../analytics.md)
