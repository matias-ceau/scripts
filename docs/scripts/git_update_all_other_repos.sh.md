# Git Update All Other Repos

---

**git_update_all_other_repos.sh**: Update multiple Git repositories excluding personal ones

---

### Dependencies

- `fd`: A simple, fast, and user-friendly alternative to `find`.
- `sed`: Stream editor for filtering and transforming text.
- `git`: Version control system necessary for pulling updates.
- `bash`: Required to execute the script.

### Description

The script **git_update_all_other_repos.sh** is designed to update multiple Git repositories in a specified directory that are not your personal ones (as indicated by the exclusion of your username from the matching pattern). The script uses `fd` to search for directories ending with `.git`, except those containing 'matias-ceau'. Each matching directory is transformed with `sed` to remove the `.git` suffix for traversal. It changes into each directory and executes `git pull` to fetch and merge changes from a remote repository. Also, it checks the status of each repository.

- **fd**: Searches for directories with `.git` suffix.
- **sed**: Filters out personal repositories and cleans paths for navigation.
- **git pull**: Updates the local repository by integrating changes from the remote branch.
- **git status**: Provides a short summary of the repository state after each operation.

### Usage

The script is meant to be run from a terminal in an interactive session as it provides verbose feedback. Here's how you can use it:

```bash
export GIT_REPOS=/path/to/repos
/home/matias/.scripts/git_update_all_other_repos.sh
```

- Ensure that the `GIT_REPOS` environment variable is set to the directory containing your Git repositories.
- The script will display each repository being updated and indicate if a pull operation fails with a distinct message.

---

> [!TIP] 
> Consider adding error handling to manage scenarios where `fd`, `git`, or directory navigation could fail unexpectedly. Enhancing log messages for clarity or adding a summary at the end could greatly improve usability.