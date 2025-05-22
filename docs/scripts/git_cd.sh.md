# Git Project Directory Quick CD

---

**git_cd.sh**: Quickly `cd` to any git project directory found on the system using a fuzzy search.

---

### Dependencies

- `locate` &nbsp;: Fast file name database query
- `sed` &nbsp;: Stream editor for filtering and transforming text
- `eza` &nbsp;: Modern replacement for `ls`, used here for directory listing with icons/colors
- `fzf` &nbsp;: Command-line fuzzy finder for interactive selection
- `awk` &nbsp;: Text processing utility for field extraction
- `bash` &nbsp;: The GNU Bash shell (shebang line)
  
*All dependencies are available or can easily be installed via `pacman` or `paru` on Arch Linux.*

---

### Description

This script provides an efficient way to jump to any git repository on your system, turning hours spent navigating into seconds. It performs the following steps:

1. Uses `locate` to find all `.git` directories indexed on your filesystem.
2. Processes the paths, stripping the trailing `.git`, and lists the parent directories with `eza` for an appealing view (color/icons).
3. Replaces your home directory (`/home/matias`) with `~` for better clarity.
4. Passes the results to `fzf` for fuzzy selection, allowing you to interactively choose your desired project.
5. Uses `awk` to extract the directory path.
6. Converts `~` back to your full home path and outputs the selected directory, before attempting to switch (`cd`) to it.

It's perfect for scripting usage, keybinding (in qtile or your terminal), or ad-hoc project switches.

---

### Usage

The script is designed for interactive terminal use.  
The recommended workflow is:

```sh
bash ~/.scripts/bin/git_cd.sh
```

**Example tldr:**

- Open a terminal.
- Run:
  ```sh
  ~/.scripts/bin/git_cd.sh
  ```
- Begin typing the name of the desired project in the fuzzy finder popup.
- Hit `<Enter>` to select.
- The full directory path is echoed, then the script attempts to `cd` into it.

**Pro tip:**  
To use this as a keybinding from qtile or as a shell command, you may want to modify the script so the directory change persists in your terminal—see the Critique section.

---

> [!NOTE]
> - Subshell Limitation: Because this script runs as a child process (subshell), the `cd` command will not persist after the script exits; in other words, it changes directory only inside the script, not your terminal session. To make persistent directory changes, consider modifying the script to output only the selected path and then use `cd "$(bash git_cd.sh)"` or turn it into a shell function/alias.
> - Hardcoded Home: The script is hardcoded for `/home/matias`. For portability, consider using `$HOME` instead.
> - `locate` Database Update: If new repos are added and not appearing, remember to periodically update the `locate` database with `updatedb`.
> - `awk '{print $2}'` assumes `eza` output is consistent; this could break if `eza` output format changes. Consider output parsing with more robust field handling.