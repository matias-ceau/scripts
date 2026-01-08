# Git repos inventory (per-host + global)

---

**get_repos_present_on_host.sh**: Scan `$GIT_REPOS` and record repos present on this machine

---

### Dependencies

- `bash`
- `hostnamectl` (systemd): used to derive the current host name
- `find`: searches for `.git` directories
- `sed`: trims `$GIT_REPOS` prefix and `/.git` suffix
- `awk`: filters to “two-level” repo paths (`owner/repo` style)
- `sort`: de-duplicates and normalizes output
- Environment variables: `GIT_REPOS`, `LOCALDATA`

### Description

This script builds a simple inventory of Git repositories available on the current host (useful when you have multiple machines and want to track what’s checked out where).

Workflow:

1. Verifies `GIT_REPOS` and `LOCALDATA` are set; otherwise exits with an error.
2. Resolves the host name via `hostnamectl hostname`.
3. Writes a per-host list to:  
   `$LOCALDATA/docs/git_repos/<hostname>-repos.txt`
4. Appends that list into a global aggregate file:  
   `$LOCALDATA/docs/git_repos/all-repos.txt`
5. Both files are sorted and de-duplicated in-place.

Repo discovery is done by locating `.git` directories under `$GIT_REPOS`, then converting them to relative repo identifiers. The `awk -F/ 'NF==2'` constraint keeps only paths with exactly two components (e.g. `user/project`), which matches common layouts where `$GIT_REPOS/<owner>/<repo>/.git` exists.

### Usage

Run manually in a terminal, from anywhere:

- Minimal:
  - `GIT_REPOS="$HOME/git" LOCALDATA="$HOME/.local/share" get_repos_present_on_host.sh`

- Typical (exported in shell init):
  - `get_repos_present_on_host.sh`

Suggested qtile binding (example idea): run it periodically or on-demand and keep your inventory updated.

---

> [!TIP]
> Consider using `HOSTNAME=$(hostname)` instead of `hostnamectl` to avoid systemd coupling. Also, `cat >> all-repos.txt` means history isn’t preserved but duplicates are handled after sorting; if you ever want “which host had it”, store host tags per line (e.g. `hostname repo`). Finally, the `NF==2` filter will drop deeper repo layouts—make it configurable if your tree isn’t strictly `<owner>/<repo>`.