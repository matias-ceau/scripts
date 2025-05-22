# Interactive Git Repo Synchronizer

---

**interactive_git_sync.sh**: Interactive script for syncing multiple git repositories with `fzf` selection.

---

### Dependencies

- ``fzf`` — Command-line fuzzy finder, for interactive repository selection.
- ``awk`` — Required for text parsing and command generation.
- ``bash`` — Shell interpreter.
- ``sync-repo.sh`` — (User script) Executes the actual sync for a chosen repository; must be located at the path contained in `$SCRIPTS`.
- **Environment variables:**
    - ``$CHEZMOI``: Path to your chezmoi repo.
    - ``$SCRIPTS``: Directory containing your user scripts.
    - ``$LOCALDATA``: Path to local data repo.
    - ``$PSYRIS``: Path to psyRIS repo.
    - ``$GIT_REPOS``: Base path to your git repositories.

_NB: All above environment variables must be exported before using the script._

---

### Description

This script provides an interactive way to synchronize your frequent git repositories using a `fzf` menu. It builds a list of predefined repository directories, assembles a command to call an auxiliary script (`sync-repo.sh`) for syncing each repository, and presents a fuzzy-find list to select which repo to sync.  
  
**How it works:**
- Defines a list of paths (presumably git repos) based on environment variables.
- If run with `--dry-run`, appends the argument to the sync command for preview/no-op.
- Uses `awk` to prepare a command for each listed repo.
- Invokes `fzf` for interactive selection; user can fuzzy-search among repositories.
- Executes the selected sync command (or none if canceled).

---

### Usage

You can invoke this script from the terminal:

```sh
~/.scripts/bin/interactive_git_sync.sh
```

If you want a dry run (no changes, just output):

```sh
~/.scripts/bin/interactive_git_sync.sh --dry-run
```

**Recommended:**  
For fastest access, assign a qtile keybinding to run this script via your keyboard launcher or `lazy.spawn`.

The script will display a list of your main repositories to fuzzy select from. Selecting one executes the sync script on that repo.

---

> [!NOTE]
> - The script assumes all required environment variables and `sync-repo.sh` are defined and valid. Consider adding error handling for unset variables.
> - The script directly uses `eval` on the constructed command, which is safe only if you control all variables and paths. Evaluate whether `eval` can be avoided for safety.
> - The use of `awk` in `cmd_list` seems overkill since it just concatenates two items per line. A simple `while` or even a `for` loop over the repo list might make the code clearer and less error-prone.
> - Hardcoded repo list means you have to update the script when you add/remove repos. Optionally, consider scanning `$GIT_REPOS` directories dynamically.