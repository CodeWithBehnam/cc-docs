---
name: deploy
description: Run tests, build, and deploy to the specified environment (staging or production). Includes safety checks.
argument-hint: <staging|production>
allowed-tools: Bash, Read
---

Deploy to: $ARGUMENTS

Follow these steps carefully. Stop and report if any step fails.

### Safety Checks (always run first)

1. Confirm the target environment is valid. Accepted values: `staging`, `production`.
   If the value is anything else, stop with an error.

2. Run `git status` to confirm the working tree is clean (no uncommitted changes).
   If there are uncommitted changes, stop and ask the user to commit or stash them first.

3. Run `git log origin/main..HEAD --oneline`. If on a non-main branch deploying to `production`, warn the user and ask for explicit confirmation before proceeding.

4. For `production` deployments, confirm with the user by printing:
   "You are about to deploy to PRODUCTION. Type 'yes' to continue."
   Wait for the user's response before proceeding.

### Pre-deploy Steps

5. Run the full test suite. If any tests fail, stop. Do not deploy broken code.

6. Run the build command for this project:
   - `npm run build` / `yarn build` / `pnpm build` for Node projects.
   - `python -m build` or equivalent for Python packages.
   - `make build` if a Makefile target exists.
   - If no build step is detected, note this and skip.

### Deploy

7. Run the deploy command for the target environment.
   Look for deploy scripts in these locations (in order of preference):
   - `package.json` scripts named `deploy:$ARGUMENTS` or `deploy`.
   - `Makefile` targets named `deploy-$ARGUMENTS` or `deploy`.
   - Shell scripts in `scripts/` or `bin/` matching `deploy*.sh`.
   - A `Dockerfile` / `docker-compose.yml` with a deploy workflow.
   If no deploy script is found, report what was checked and ask the user to specify the deploy command.

### Post-deploy

8. Run a smoke check if one exists (e.g., a health check URL or `make smoke-test`).

9. Print a summary: environment, branch, commit SHA, timestamp, and whether smoke checks passed.
