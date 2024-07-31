# Transform Symlinks

---

**[transform_symlink.sh](/transform_symlink.sh)**: Convert symlinks to copies of their target files or directories.

---

### Dependencies

- `fd`: A simple, fast and user-friendly alternative to `find`. Used for finding symlinks.
- `fzf`: A command-line fuzzy finder. Provides an interactive interface for selecting items.
- `bat`: A cat clone with syntax highlighting. Used to preview the contents of files in `fzf`.

### Description

The `transform_symlink.sh` script is a utility designed to convert symbolic links (symlinks) into regular files or directories. It simplifies the process of dealing with symlinks in the file system by providing an interactive selection menu, allowing users to choose which symlinks to transform.

The script includes two operational modes:
1. **Interactive Mode**: If no arguments are provided, the script searches the current directory recursively for symlinks using `fd` and presents them in an `fzf` menu for selection.
2. **Direct Mode**: If one or more symlink paths are provided as arguments, the script attempts to transform each specified symlink without interactive assistance.

In either mode, the script checks if the selected item is indeed a symlink. If valid, it retrieves the target path using `readlink`. It also checks if the target exists before proceeding to remove the original symlink and copy the target files/directories in its place.

### Usage

To run the script, ensure it has execution permissions and then execute it as follows:

#### Interactive Mode
```bash
./transform_symlink.sh
```
This will initiate an interactive mode using `fzf` to select one or more symlinks to transform.

#### Direct Mode
```bash
./transform_symlink.sh /path/to/symlink1 /path/to/symlink2
```
You can specify one or multiple symlink paths directly. The script will attempt to transform each one in turn.

#### Help Option
To view usage information and options:
```bash
./transform_symlink.sh --help
```

---

> [!TIP]  
> The script currently assumes that the target of the symlink exists and does not check for overwrite conditions where a file already exists at the symlink's location. Future enhancements could include a prompt for overwriting, as well as additional error handling for edge cases like circular symlinks.
