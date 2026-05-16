---
name: conventional-commit
description: Git commit workflow: inspect status/diff/log, choose a conventional commit message aligned with repo history (often ci(workflows)), stage only intended paths, commit, and verify clean status/branch divergence.
compatibility: opencode
metadata:
  workflow: git
  style: conventional-commits
  focus: workflows
---

## Workflow (do in this order)
1. Inspect repo state (prefer running in parallel):
- `git status --porcelain=v1 --branch`
- `git diff`
- `git diff --staged`
- `git log -5 --oneline --decorate`

2. Decide the conventional commit message by referencing history:
- For workflow changes, prefer `ci(workflows): ...` when that pattern exists in `git log`
- For CI maintenance/test-only changes, prefer `chore(ci): ...`

3. Stage only the intended files:
- `git add <paths...>`

4. Commit (no amend unless explicitly requested):
- `git commit -m "<type>(<scope>): <summary>"`

5. Verify:
- `git status`
- If branch is ahead/behind/diverged, report it.

## Guidelines
- If a workflow `uses:` is pinned to a non-main ref for testing, add an inline comment:
  - `# TEMP: testing only; revert to @main before merge`
- If unrelated changes exist, ask whether to include them or commit only the target paths.
- Never commit secrets (ex: `.env`, keys, credentials).
