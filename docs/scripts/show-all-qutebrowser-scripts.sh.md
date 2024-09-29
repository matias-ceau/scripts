# Show All Qutebrowser Scripts

---

**show-all-qutebrowser-scripts.sh**: Displays all available Qutebrowser scripts with syntax highlighting.

---

### Dependencies

- `pacman`: Package manager for Arch-based systems, used to query installed packages.
- `tail`: Command-line utility for outputting the last part of files, used here to limit the number of lines.
- `rg`: Ripgrep, a line-oriented search tool that recursively searches your current directory.
- `sed`: Stream editor for filtering and transforming text.
- `xargs`: Utility for building and executing command lines from standard input.
- `bat`: A cat clone with syntax highlighting and Git integration, used here for visualization.

### Description

This script is designed to list all the scripts associated with the Qutebrowser installation. It leverages a combination of command-line utilities to achieve this:

1. **`pacman -Ql qutebrowser`**: This command lists the files installed with the Qutebrowser package.
2. **`tail -n 37`**: This filters the output to show only the last 37 lines, which is typically where user scripts may reside.
3. **`rg -v '/$'`**: This uses ripgrep to exclude lines that represent directories, focusing on files.
4. **`sed 's/^.*qutebrowser //'`**: The `sed` command cleans up the output, removing the leading path information and leaving just the script names.
5. **`xargs bat`**: Finally, `xargs` pipes the cleaned list of script names to `bat` for display, providing a user-friendly output with syntax highlighting.

### Usage

To run this script, simply execute it in your terminal:

```bash
bash /home/matias/.scripts/show-all-qutebrowser-scripts.sh
```

The output will display all Qutebrowser scripts with syntax highlighting, allowing for easier identification and usability.

---

> [!TIP] 
> Consider adding error handling to provide informative messages if Qutebrowser is not installed or if there are no scripts available. Also, you might want to allow users to specify the number of lines displayed from the output of `pacman` for flexibility.