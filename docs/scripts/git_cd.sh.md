# Git Change Directory Script

---

**git_cd.sh**: Quick navigation to git repositories using fzf.

---

### Dependencies

- `locate`: A command-line utility for finding files by name.
- `eza`: An enhanced version of `ls` with additional features for better file listing.
- `fzf`: A command-line fuzzy finder that allows users to search through lists interactively.
- `awk`: A powerful text processing tool that is used for pattern scanning and processing.

### Description

The `git_cd.sh` script facilitates quick navigation to Git repository directories from the command line. It leverages several Unix utilities to search for directories containing `.git` folders, allowing users to easily change their current working directory to one of these repositories.

The script works as follows:

1. **Locate**: It uses the `locate` command to find all directories containing `.git` at the end of their path.
2. **Filter**: The output is processed using `sed` to remove the `.git` portion, leaving only the directory path.
3. **List and Colorize**: It utilizes `eza` to display the found directories in a user-friendly format, including icons and colors, enhancing visibility.
4. **Fuzzy Search**: The script passes this list to `fzf`, allowing users to interactively select the desired directory.
5. **Change Directory**: If a directory is selected, the script converts any home directory path back from `~` to `/home/matias` and then changes the current directory to the selected Git repository.

### Usage

To use the script, simply execute it from the terminal:

```bash
bash /home/matias/.scripts/git_cd.sh
```

Alternatively, you can bind the script to a key combination in your window manager, such as `qtile`, for faster access. Here is a sample key binding you could add to your `qtile` configuration:

```python
Key([mod], "g", lazy.spawn("/home/matias/.scripts/git_cd.sh")),
```

Once run, it will display a list of Git repositories found on your system. You can start typing to filter the results and press Enter to navigate to the selected repository.

---

> [!TIP]  
> Consider adding error handling for cases where `locate` might not return any results or if the provided `fzf` selection does not yield a valid path. Additionally, using `trap` to handle exit signals could enhance user experience by ensuring the script exits gracefully.