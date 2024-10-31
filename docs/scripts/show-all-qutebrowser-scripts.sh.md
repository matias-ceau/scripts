# Show All Qutebrowser Scripts

---

**show-all-qutebrowser-scripts.sh**: List and display scripts bundled with qutebrowser

---

### Dependencies

- `qutebrowser`: A keyboard-focused web browser with a minimal GUI. Used to fetch the list of scripts provided by the package.
- `pacman`: The package manager for Arch Linux, used here to query the list of files installed by `qutebrowser`.
- `rg` (ripgrep): A line-oriented search tool that recursively searches directories for a regex pattern. Used to filter out directory entries.
- `sed`: A stream editor for filtering and transforming text. Here, it is used to format the output.
- `xargs`: Constructs argument list(s) and executes utility. Used to pass formatted file names to `bat`.
- `bat`: A `cat` clone with syntax highlighting and Git integration to display the scripts.

### Description

This script provides a convenient way to list and display the contents of scripts associated with the `qutebrowser` package on an Arch Linux system. The main operation consists of querying all files installed by `qutebrowser`, filtering to capture only script files, and displaying them in the terminal with enhanced syntax highlighting using `bat`.

1. `pacman -Ql qutebrowser` fetches the list of files installed by the `qutebrowser` package.
2. `tail -n 37` trims the output to capture the last 37 lines. The number appears arbitrary but means to limit selection, possibly approximating the script count.
3. `rg -v '/$'` filters out directory entries to focus on files.
4. `sed 's/^.*qutebrowser //'` refines the list by removing prefixed paths, isolating script filenames.
5. `xargs bat` pipes the filenames to `bat`, which displays each file with syntax highlighting, enhancing readability.

### Usage

To use this script:
1. Ensure all dependencies are installed (`pacman` already exists on Arch systems; others need to be installed as needed).
2. Run the script directly in the terminal. No arguments are required.

```bash
/home/matias/.scripts/bin/show-all-qutebrowser-scripts.sh
```

You can also bind this script to a key combination within `qtile` if desired, for quicker access to viewing script files.

---

> [!CAUTION]
> The script currently defaults to showing the last 37 lines from `pacman -Ql qutebrowser`, which might exclude files if the package structure changes. Consider adjusting the line count dynamically or verifying the actual number of scripts to make this command resilient to updates in the `qutebrowser` package.