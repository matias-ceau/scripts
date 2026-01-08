# Update all Git repos (HTTPS only)

---

**git_update_all_other_repos.sh**: Bulk `git pull` for repos under `$GIT_REPOS` and report successes/errors

---

### Dependencies

- `git` — performs `pull` and inspects remotes
- `fd` — finds `.git` directories quickly (`-H` to include hidden)
- `ripgrep` (`rg`) — filters `git remote -v` output to keep HTTPS fetch remotes
- `bat` — pretty-print repo headers and show final reports
- Environment: `$GIT_REPOS` — root directory containing your repositories

### Description

This script scans your `$GIT_REPOS` tree for Git repositories (by locating directories named `.git` at an exact depth of 3), then updates each repo via `git pull` **only if** its `fetch` remote uses `https`.

For each eligible repo it:

1. Prints a formatted header derived from the repo path (using `sed`) and renders it with `bat` (TOML lexer + Monokai theme).
2. Runs `git -C "<repo>" pull`.
3. Appends the repo path to either:
   - `/tmp/git-successfull-updates.txt`
   - `/tmp/git-failed-updates.txt`
4. At the end, displays both summary files with `bat`.

This is well suited for an Arch + qtile workflow: run it in a terminal, or call it from a keybinding if you’re okay with interactive `git pull` prompts (credentials, conflicts).

### Usage

Run from any shell (requires `$GIT_REPOS`):

    export GIT_REPOS="$HOME/dev"
    ~/.scripts/bin/git_update_all_other_repos.sh

Typical “tldr”:

    # Update all HTTPS repos under $GIT_REPOS (depth=3), then show a report
    GIT_REPOS="$HOME/git" git_update_all_other_repos.sh

Outputs:

- Live `git pull` output per repo
- Final combined report rendered by `bat`:
  - `/tmp/git-successfull-updates.txt`
  - `/tmp/git-failed-updates.txt`

---

> [!WARNING]
> There’s a bug: `cat > SUCCESSES` / `cat > ERRORS` should be `cat > "$SUCCESSES"` / `cat > "$ERRORS"`; currently it writes to files literally named `SUCCESSES` and `ERRORS`. Also consider quoting variables everywhere (`"$GIT_REPOS"`, `"$SUCCESSES"`), using `while IFS= read -r line`, and handling non-fast-forward pulls (maybe `git fetch --all` + `git status` or `git pull --rebase`). The `--exact-depth=3` assumption may miss repos; making depth configurable would improve portability.