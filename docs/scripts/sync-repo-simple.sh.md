# Simple Git Repo Synchronization Script

---

**sync-repo-simple.sh**: Automates the process of syncing a local git repository with its remote, including smart error handling and conflict resolution.

---

### Dependencies

- `git`: Required for all version control operations.
- `bash`: The script is written in Bash and uses Bashisms.
- `realpath`: Resolves absolute file paths.
- `${EDITOR}` (environment variable, e.g. `vim`, `nvim`): For editing conflicted files during manual merge resolution.
- `awk`, `sed`, `grep`, `wc`: Used for minor command-line parsing and info extraction.

---

### Description

This script simplifies the process of keeping a local git repository (or dotfiles repository) in sync with its remote counterpart. It combines fetching, merging/pulling, conflict management, auto-committing, and pushing into a single, streamlined command.

#### Highlights:

- **Automatic Stashing:** If uncommitted changes are present, they're safely stashed before pulling new changes.
- **Merge/Pull Conflict Handling:** Interactive prompts help resolve merge and rebase conflicts, opening your editor for manual resolution when necessary.
- **Stash Conflict Options:** Select whether to keep the remote, local, or manually edited version of conflicted files after stashing.
- **Commit Automation:** Generates a succinct commit message and commits any modified files.
- **Error Handling:** Exits on errors, displaying an informative message.
- **Summarized Sync:** Prints a summary of changes at the end of the run.

#### Functions:

- `run_command`: Prints and executes commands in real-time.
- `handle_error`: Graceful exits on terminal errors.
- `generate_commit_message`: Auto-generates a concise commit message.
- `handle_merge_pull_conflicts / handle_stash_conflict`: User-friendly prompts to guide through conflict resolution.
- `display_summary`: Presents a mini changelog summary after a successful sync.

---

### Usage

You can run this script from a terminal. Optionally, you can bind it to a key in your qtile config for rapid one-key syncs.

**Command Syntax:**
```
sync-repo-simple.sh <path/to/git/repository>
```
**Examples:**
```
sync-repo-simple.sh ~/dotfiles
sync-repo-simple.sh ~/Projects/my-coolapp
```

**Help Option:**
```
sync-repo-simple.sh -h
```

**Workflow:**
1. Accepts a single directory argument (the local repo).
2. Checks that argument is a directory and a git repo.
3. Fetches, stashes if necessary, rebases/merges/pulls remote changes.
4. Guides you through any conflicts.
5. Commits and pushes any new local changes.
6. Prints a summary, then returns you to your starting directory.

---

> [!TIP]
> - While generally robust, the script would benefit from improved detection of "no stashed changes" (current logic may always attempt stash pop even if no stashes exist).
> - The commit message could be made more descriptive or customizable (maybe even integrating actual diff summaries or invoking an external LLM/text generator).
> - Error messages and help text are sparse ("help" placeholder); consider expanding for less ambiguity.
> - Handles only one remote and branch—multi-remote/branch environments may need manual tweaking.
> - If used frequently, consider more granular logging or a dry-run mode for extra safety in destructive operations (such as `reset --hard`).