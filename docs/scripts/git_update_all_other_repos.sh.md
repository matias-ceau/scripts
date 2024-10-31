# Git Update All Other Repositories

---

**git_update_all_other_repos.sh**: Automatically updates all git repositories found under a specified directory using HTTPS.

---

### Dependencies

- `fd`: A simple, fast, and user-friendly alternative to `find`, used here to locate git directories.
- `git`: The version control system for pulling updates from remote repositories.
- `rg` (ripgrep): A fast search tool to filter out repositories with HTTPS fetch URLs.
- `bat`: A cat clone with syntax highlighting, used to display repository information in a visually appealing format.
- `sed`: A stream editor for filtering and transforming text, used here to format the output.
- Environment Variable: `$GIT_REPOS` should be set to the base directory containing your git repositories.

### Description

This script is designed to iterate through each git repository located within a specified directory, identified by `$GIT_REPOS`. It uses `fd` to scan for `.git` directories that are exactly three levels deep. For each discovered repository, it checks if the remote URL is of the type HTTPS using `rg`. If the condition is met, it outputs the repository name in a highlighted format with `bat` and attempts a `git pull` to update the repository. In case of a pull failure, it outputs an error message indicating which repository failed.

### Usage

To use the script:

1. Ensure that all dependencies are installed on your system.
2. Set the `GIT_REPOS` environment variable to point to your base directory containing git repositories.
3. Run the script from a terminal:

   ```sh
   /home/matias/.scripts/bin/git_update_all_other_repos.sh
   ```

The script can be assigned to a keybinding in your qtile configuration for easy access.

**Example:**

```sh
export GIT_REPOS=~/projects
/home/matias/.scripts/bin/git_update_all_other_repos.sh
```

This will update all repositories under the `~/projects` directory tree.

---

> [!TIP]
> Consider integrating logging to capture pull failures in a separate file for easier debugging and tracking. Further, you might want to add checks to handle repositories with network errors or those requiring authentication, as the current script assumes all remote URLs are accessible and do not require additional credentials.