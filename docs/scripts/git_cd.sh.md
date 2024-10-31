# Navigate to Git Directories

---

**git_cd.sh**: Script to quickly change directories to a Git repository.

---

### Dependencies

- `locate`: Utility used to find files on the filesystem based on a given pattern. 
- `sed`: Stream editor for filtering and transforming text.
- `eza`: A modern, more colorful replacement for `ls`.
- `fzf`: A command-line fuzzy finder used for interactive selection.
- `awk`: A tool for processing and analyzing text data.

### Description

This script allows you to locate and navigate to any `.git` directory on your system. It utilizes a combination of `locate`, `sed`, `eza`, `fzf`, and `awk` to list all Git repositories, format them aesthetically, and enable selection through an interactive interface powered by `fzf`. Once you select a desired repository from the list, it changes the current working directory to that repository.

The flow starts with `locate` to find paths ending with `.git`. These paths are trimmed of the `.git` suffix using `sed`, and then piped into `eza` to list directories stylishly. The home directory path can be the `/home/matias`, substituted with `~` for clarity, before `fzf` allows the user interaction. The final output is parsed with `awk` to isolate the directory path. 

### Usage

To use the script, simply run it from your terminal:

```bash
bash /home/matias/.scripts/bin/git_cd.sh
```

or you can make it executable and run:

```bash
/home/matias/.scripts/bin/git_cd.sh
```

You can bind this script to a keystroke within your qtile window manager for even faster access or include it in your shell configuration for quick access. This script will present you with a list of Git repositories, and after selecting one, you will be navigated directly to that directory.

---

> [!TIP]
> Consider checking for the existence of required command-line tools at the beginning of the script to provide informative feedback if any are missing. Also, if the script is moved to a different environment or user, update the hardcoded path `/home/matias`. Using `$HOME` would aid portability.