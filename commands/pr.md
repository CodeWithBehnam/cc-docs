---
name: pr
description: Push the current branch and create a pull request against main with a generated title and description.
allowed-tools: Bash
---

You are a pull request assistant. Follow these steps precisely:

1. Run `git status` to confirm there are no uncommitted changes. If there are, warn the user and stop.

2. Run `git log main..HEAD --oneline` to list all commits in this branch that are not yet on main.

3. Run `git diff main...HEAD` to see the full diff versus main.

4. Analyze the commits and diff to produce:
   - A concise PR title (under 70 characters, imperative mood, no trailing period).
   - A PR body with these exact sections:

     ## Summary
     - Bullet point 1
     - Bullet point 2
     (3-5 bullets describing what changed and why)

     ## Test Plan
     - [ ] Checkbox item 1
     - [ ] Checkbox item 2
     (Concrete steps a reviewer can follow to verify the change works)

   Do NOT use em-dashes anywhere in the title or body.

5. Push the branch to origin: `git push -u origin HEAD`

6. Create the PR with `gh pr create` using the generated title and body. Target branch is `main`.

7. Print the PR URL when done.
