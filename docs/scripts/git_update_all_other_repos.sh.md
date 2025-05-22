# Git: Update All Other Repos

---

**git_update_all_other_repos.sh**: Batch-pulls all git repositories (with HTTPS remote) at exact depth 3 under `$GIT_REPOS`

---

### Dependencies

- `fd`: Fast alternative to find; used here for directory searching at specific depth.
- `git`: Distributed version control; required for repo operations.
- `ripgrep` (`rg`): Fast search tool; used to filter remote URLs.
- `bat`: Cat clone with syntax highlighting.
- `sed`: Stream editor, for formatting repository info.
- Environment Variable: `GIT_REPOS`  
  The root path where your repositories are located. Must be set before running the script.

---

### Description

This script scans a directory tree (set via the environment variable `$GIT_REPOS`) at an exact depth of 3 for `.git` directories, identifying all potential git repositories at that level.  
For each repo found:

1. It checks if the repo has a "fetch" remote configured with an HTTPS URL.
2. If so, it prints formatted info about the repo using `sed` and pretty-prints it with `bat` using TOML highlighting.
3. Then, it attempts to do a `git pull` for that repo.
4. If the pull fails, an error message is displayed in highlighted color.

This setup is ideal for batch-updating multiple project repositories arranged neatly under a common directory hierarchy, e.g. `$GIT_REPOS/org/project/.git`.

---

### Usage

**1. Set the `$GIT_REPOS` environment variable to your main git repositories folder:**
```bash
export GIT_REPOS="$HOME/projects"
```

**2. Run the script:**
```bash
~/.scripts/bin/git_update_all_other_repos.sh
```

- Can be run interactively in a terminal.
- The script prints each repo before pulling, highlighting line 2 for visibility.
- Only repositories with HTTPS remotes under the specified directory are touched.
- Suitable to assign to a keybinding from within qtile, or execute on demand.

#### Example Run Output
```toml
[my-repo] #org/my-repo
```
```
remote: Enumerating objects: 5, done.
remote: Counting objects: 100%...
...
```

---

> [!TIP]
> - The script expects your repositories to all reside at exactly depth 3 under `$GIT_REPOS` (e.g., `$GIT_REPOS/org/project/.git`). If your layout differs, you may need to adjust the `--exact-depth` parameter.
> - The search is limited to HTTPS remotes; SSH remotes are excluded. You may want to support both in some cases.
> - The invocation of `bat` for highlighting is a nice touch, but using `--highlight-line 2` may not always have the intended effect if the output of `sed` varies.
> - Failed pulls are shown with a red-background message, but you might want to log errors to a file for later review.
> - If any dependency is missing (such as `fd`, `bat`, or `ripgrep`), the script will fail—consider adding a check or a short dependency note at runtime.