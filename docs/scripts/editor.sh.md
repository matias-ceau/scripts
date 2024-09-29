# Quick File Editor

---

**editor.sh**: A script to quickly edit files using `fzf` in a terminal.

---

### Dependencies

- `fzf`: A command-line fuzzy finder used to search for files interactively.
- `bat`: A syntax highlighting and paging program, used for previewing files.

### Description

This script provides a versatile way to edit files directly from the terminal using the `fzf` fuzzy finder. It leverages the power of `find` and `fd` to locate files excluding non-editable formats and directories. Users can smoothly navigate through file paths, make quick selections, and open files in `nvim` (Neovim) or with `sudo` if the required permissions are necessary. 

#### Key Features:
- **Customizable Search Paths**: Depending on the user's input, it can search specific directories like scripts, current directories, or system configurations.
- **Filtered File Types**: The script excludes certain file formats by default, ensuring only relevant files are presented for editing.
- **Interactive Usage**: Integrates with `fzf` to provide a dynamic and responsive search experience with the option to show or hide hidden files.

### Usage

To utilize this script, make sure it’s executable and run it from your terminal. Below are some command examples:

```bash
# Default usage - search through sensible directories
./editor.sh

# Edit a file in the users' scripts directory
./editor.sh --scripts

# Find files to edit only in the current directory
./editor.sh --cwd

# Edit a configuration file
./editor.sh --config

# Edit files in a specific directory
./editor.sh --dir /path/to/directory

# Edit files with sudo permissions
./editor.sh --sudo

# Get help information
./editor.sh --help
```

---

> [!TIP]  
> Consider enhancing the exclusion list based on specific use cases, or provide a configuration file to maintain user-preferred settings persistently. Additionally, integrating more robust error handling can improve the user experience when incorrect parameters are provided or if `fzf` encounters issues.