# Dotfiles Agent Instructions (Bare Repo)

This workspace uses the Atlassian bare-repo dotfiles pattern.

- Bare git dir: `$HOME/.cfg`
- Work tree: `$HOME`
- Wrapper: `config` (alias for `/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME`)

## Required Git Usage

Do NOT use plain `git` for dotfiles operations. Always use:

- `config <args>`

Equivalent explicit form:

- `/usr/bin/git --git-dir="$HOME/.cfg/" --work-tree="$HOME" <args>`

To enumerate tracked files safely:

- `config ls-files`

## Scope (Do Not Scan All Of $HOME)

Only read/modify:

- Files explicitly requested by the user, or
- Files already tracked by the dotfiles repo (`config ls-files`).

Avoid filesystem-wide searches under `$HOME`.

## Sensitive Paths (Ask Before Touching)

Never read/modify/commit secrets or keys. Require explicit approval for:

- `$HOME/secrets/**` (note: git config includes `$HOME/secrets/.git_secrets`)
- `$HOME/.ssh/**`
- `$HOME/.gnupg/**`
- `$HOME/.aws/**`
- Any `*.pem` / `*.key`, tokens, or credentials

## Safety

- Never run destructive commands without approval: `reset --hard`, `clean -fd`, forced checkout, etc.
- Prefer minimal, reversible edits.
- After changes: show `config diff` and `config status`.
