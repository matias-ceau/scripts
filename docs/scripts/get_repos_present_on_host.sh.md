# get_repos_present_on_host.sh

---

**get_repos_present_on_host.sh**: List and register two-level git repos present under `$GIT_REPOS` for this host.

---

### Dependencies

- `bash`: Required to run the script.
- `find`: Used to recursively locate `.git` folders.
- `sed`, `awk`, `sort`, `cat`, `mkdir`: Standard GNU core utilities for stream editing, text processing, sorting, file concatenation, and directory management.
- **Environment variables (required):**
  - `$GIT_REPOS`: Root path where git repositories are stored.
  - `$LOCALDATA`: Root data directory where results are written.

### Description

This script catalogs git repositories under a set location on your Arch Linux system. It determines all repositories present under the `$GIT_REPOS` directory which are exactly two directory levels deep (`org/repo/.git`), formats their paths, and records them in a host-specific file as well as a central index of all repositories.

**Main Steps:**
- Checks for the existence of the required environment variables.
- Dynamically builds output paths, segregated per host using the output of `hostnamectl hostname`.
- Uses `find` to gather all `.git` directories under `$GIT_REPOS`, `sed` to convert them to `org/repo` format, and `awk` to filter for two-level deep results only.
- Writes results to a host-specific file, deduplicates it, and appends/sorts into an `all-repos.txt` containing all discovered repositories across hosts.
- Ensures output directories exist before use.

**Utility:**  
Ideal for syncing or auditing repositories per-machine, especially useful for dotfile management, multi-host setups, or scripting hooks within your qtile environment.

### Usage

Before running, you must ensure the two environment variables are set:

```shell
export GIT_REPOS="$HOME/repos"
export LOCALDATA="$HOME/.local/share"
```

To run interactively or in scripts:

```shell
~/.scripts/bin/get_repos_present_on_host.sh
```

**Typical output files:**
- `$LOCALDATA/docs/git_repos/$(hostname)-repos.txt` : Repos for this host.
- `$LOCALDATA/docs/git_repos/all-repos.txt`         : Master list of all repos.

**Examples**

```shell
# Standard execution
GIT_REPOS=~/repos LOCALDATA=~/.local/share ~/.scripts/bin/get_repos_present_on_host.sh

# Manually set and run in one line
GIT_REPOS=/mnt/store/git LOCALDATA=/data ~/.scripts/bin/get_repos_present_on_host.sh
```

---

> [!NOTE]
> - Only repositories at two directory levels (like `org/repo/.git`) are counted; deeper or shallower structures are ignored.
> - The script appends to `all-repos.txt` before deduplication, so historical order is not strictly preserved.
> - There is no check for writable permissions; if the script fails, ensure both directories specified by `$LOCALDATA` exist and are writable.
> - If run frequently on large directory trees, consider limiting depth in the `find` call for performance, or moving deduplication outside append loop for efficiency.
> - Hostname extraction assumes nothing unusual about your hostname (no special chars, embedded slashes, etc).
