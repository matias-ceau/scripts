# Git Update All Other Repositories

---

**git_update_all_other_repos.sh**: Updates all Git repositories except for the specified one.

---

### Dependencies

- `fd`: A simple, fast, and user-friendly alternative to `find` for searching files. 
- `sed`: A stream editor for filtering and transforming text in a pipeline.
- `git`: The version control system that manages the repositories.

### Description

This script is designed for users who maintain multiple Git repositories and want a convenient way to update them all at once. The script specifically excludes the repository located at `/home/matias/.git/matias-ceau`, allowing the user to perform updates without interfering with their active development.

Here’s a breakdown of how the script works:

1. **Finding Repositories**: The script uses `fd` to search for directories that contain a `.git` subdirectory, which indicates the presence of a Git repository.
2. **Filtering and Formatting**: It utilizes `sed` to exclude the specified repository (`matias-ceau`) and to format the output.
3. **Updating Repositories**: For each found repository, it changes the current working directory to the repository location, executes a `git pull --verbose` command to fetch the latest changes, and displays the status of the repository after the update.
4. **Error Handling**: If the update fails for any repository, it prints an error message in red.
5. **Progress Indication**: After updating each repository, it pauses for a second to allow the user to see the output.

### Usage

To run the script, execute the following command in your terminal:

```bash
bash /home/matias/.scripts/git_update_all_other_repos.sh
```

You can also create a keybinding in your window manager (Qtile) to make it easily accessible. For example, you could bind it to a key combination for quick access when managing your repositories.

---

> [!TIP] 
> Consider expanding the filtering logic to allow for multiple excluded repositories instead of hardcoding one. You could utilize an array to easily manage exclusions and make the script more versatile. Additionally, including some kind of logging mechanism may help in tracking updates across repositories, especially if running the script regularly or on a server.