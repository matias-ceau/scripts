# Git Update All Other Repositories

---

**git_update_all_other_repos.sh**: Automates pulling from all git repositories in a specified directory.

---

### Dependencies

- `fd`: A simple, fast and user-friendly alternative to `find`.
- `git`: Version control system to manage code repositories.
- `rg` (ripgrep): A line-oriented search tool that recursively searches your current directory for a regex pattern.
- `bat`: A cat(1) clone with wings. It provides syntax highlighting and a nice output.
- `sed`: A stream editor for filtering and transforming text.

### Description

The `git_update_all_other_repos.sh` script is designed to streamline the process of updating all Git repositories located within a specific directory, designated by the environment variable `GIT_REPOS`. This is particularly useful for users managing multiple repositories, as it automates the mundane task of pulling updates from each one.

Here's how the script works:
- It utilizes `fd` to find all directories containing a `.git` subdirectory that are exactly three levels deep in the directory structure defined by `GIT_REPOS`.
- For each found repository, the script checks if it has an active remote set up, specifically looking for HTTPS remotes.
- If a remote is found, it prints the repository name with formatting via `bat`, followed by executing a `git pull` command to fetch and merge changes from the remote repository.
- If the `git pull` command fails, it outputs an error message colored in red for easy visibility.

### Usage

To use this script, ensure that the `GIT_REPOS` environment variable is set to the directory containing your Git repositories. You can run the script directly in the terminal using:

```bash
GIT_REPOS="/path/to/your/git/repositories" bash /home/matias/.scripts/git_update_all_other_repos.sh
```

Alternatively, you can assign this script to a keybinding within your window manager, or set it to execute automatically at routine intervals using a cron job.

---

> [!TIP]
> The script currently checks for HTTPS remotes but could be enhanced by adding support for SSH remotes as well. Consider adding a more verbose logging mechanism to improve monitoring of repository statuses during the pull process.