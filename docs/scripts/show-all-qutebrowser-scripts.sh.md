# Show All Qutebrowser Scripts

---

**show-all-qutebrowser-scripts.sh**: Fetches and displays all Qutebrowser script files using bat.

---

### Dependencies

- `pacman`: The package manager for Arch Linux, used to query installed packages.
- `rg`: Also known as Ripgrep, a command-line search tool that recursively searches your current directory for a regex pattern.
- `sed`: A stream editor for filtering and transforming text.
- `bat`: A cat clone with syntax highlighting and Git integration.

### Description

This script provides a convenient way to list and display all the script files associated with the Qutebrowser installation on an Arch Linux system. 

The script more specifically performs the following operations:

1. `pacman -Ql qutebrowser`: Lists all files belonging to the installed `qutebrowser` package.
2. `tail -n 37`: Retrieves the last 37 lines of the output, which typically contain script files.
3. `rg -v '/$'`: Filters out directories, leaving only files in the output.
4. `sed 's/^.*qutebrowser //'`: Removes the `qutebrowser` prefix, simplifying the filename view.
5. `xargs bat`: Takes the resulting filenames and pipes them to `bat`, which will display their content with syntax highlighting, making it easier for the user to read the scripts.

### Usage

To use the script, simply run it from the terminal:

```bash
bash /home/matias/.scripts/show-all-qutebrowser-scripts.sh
```

You should see the content of the Qutebrowser scripts printed to your terminal. This can be a handy way to quickly review script files without needing to open them one by one.

---

> [!TIP]  
> Consider adding error handling in case `qutebrowser` is not installed or if any commands fail. Additionally, you could allow users to specify a number of lines to tail or to include line numbers in the output for easier reference. This would improve the usability of the script significantly.