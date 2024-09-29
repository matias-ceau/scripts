# Git Update All Other Repositories

---

**git_update_all_other_repos.sh**: A script to update all Git repositories excluding a specific one.

---

### Dependencies

- `fd`: A simple, fast, and user-friendly alternative to `find` to search for files.
- `git`: A version control system to manage repositories.

### Description

This script serves to automate the process of updating all Git repositories located in a specified directory, except for a repository named `matias-ceau`. It does this by leveraging the `fd` command to find all directories containing a `.git` subdirectory and then iterating over each of these directories.

The core functionality includes:
1. **Finding Repositories**: Using `fd -td -H '\.git$'` to list directories that are Git repositories.
2. **Filtering**: Excludes `matias-ceau` through a `sed` command.
3. **Updating**: For each repository, the script navigates into the directory and executes `git pull --verbose` to fetch updates.
4. **Status Check**: After each `git pull`, it runs `git status -v` to show the status of the repository. 
5. **Visual Feedback**: Outputs the repository name in yellow and errors in red for better visibility.

### Usage

To use this script, ensure you have the required dependencies installed. You can run the script from the terminal like this:

```bash
bash /home/matias/.scripts/git_update_all_other_repos.sh
```

The script will automatically find and update all Git repositories located in your specified GIT_REPOS directory, excluding the `matias-ceau` repository.

If you want to make it executable and use it with a keybinding or launcher, you can do the following:

```bash
chmod +x /home/matias/.scripts/git_update_all_other_repos.sh
```

Then you can bind it to a key combination in your window manager or launch it from your desktop environment for quick access.

---

> [!TIP]  
> While the script is efficient, consider adding error handling that stops the script upon encountering a critical error or adding logging functionality to record which repositories were updated successfully or failed. This could enhance the script's usability significantly.