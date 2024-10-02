# Sync Git Repository

---

**sync-repo.py**: A script to automate syncing a Git repository with remote branches.

---

### Dependencies

- `python3`: The script is written in Python 3.
- `git`: Version control system for tracking changes in source code.
- `rich`: A Python library for rich text and beautiful formatting in the terminal.

### Description

`sync-repo.py` is a powerful Python script designed to streamline the process of syncing a local Git repository with its remote counterpart. The script uses the `rich` library to provide a user-friendly interface in the terminal, presenting commands, errors, and summaries in an aesthetically pleasing manner.

Key features include:
- Automated fetching, merging, and pushing of changes.
- Handling merge conflicts with user-friendly options.
- Stashing and reapplying changes while managing potential stash conflicts.
- Summarizing the sync operation with detailed timestamps and commit information.

The script utilizes several helper functions to execute commands and display outputs, ensuring a seamless and informative user experience.

### Usage

To use the script, run it with the path to your Git repository as an argument. For example:

```bash
python3 /home/matias/.scripts/sync-repo.py /path/to/your/repo
```

#### Steps Performed by the Script

1. **Fetch Updates**:
   The script retrieves all changes from the remote repository.

2. **Check for Local Changes**:
   If local changes exist, it stashes them before attempting to merge.

3. **Merge Updates**:
   The script tries to fast-forward the local branch; if it fails, it reverts to a rebase. Conflicts are handled through prompts.

4. **Stash Management**:
   After merging, any stashed changes are attempted to be reapplied with conflict resolution options for the user.

5. **Commit and Push**:
   If there are new changes, they are committed with an automatically generated message and pushed to the remote repository.

6. **Summary Display**:
   Finally, a summary of the operation is displayed, including the current time, commit information, and a summary of the last changes.

---

> [!TIP]
> The script could improve error handling by providing more specific feedback for different git errors (e.g., authentication issues). Furthermore, the conflict resolution prompts might be enhanced with more options for advanced users. Consider adding configuration options to set preferred editors or customize commit messages.