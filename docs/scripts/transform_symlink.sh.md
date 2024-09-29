# Transform Symlink

---

**transform_symlink.sh**: A script to convert symlinks into copies of their target files or directories.

---

### Dependencies

- `fd`: A simple, fast and user-friendly alternative to `find` for searching files.
- `fzf`: A command-line fuzzy finder that helps in selecting and interacting with files.
- `bat`: A cat clone with syntax highlighting and Git integration. It is used for previewing files in the `fzf` menu.

### Description

The `transform_symlink.sh` script provides a utility to convert symbolic links (symlinks) into actual copies of their target files or directories. This can be particularly useful when you want to eliminate symlinks and retain the actual content instead. The script executes in two modes:

1. **Interactive Mode**: If no arguments are passed, it employs `fd` to search for symlinks within the current directory and presents them in an interactive `fzf` menu.
2. **Argument Mode**: If one or more symlink paths are specified as arguments, the script will directly transform each of them.

The transformation process first checks if the provided path is indeed a symlink. If valid, it reads the target of the symlink and checks if it exists. If both validations pass, it removes the symlink and creates a copy of the target at the original symlink location.

### Usage

To use the `transform_symlink.sh` script, you can run it from the terminal with the following syntax:

```bash
./transform_symlink.sh [OPTION] [SYMLINK]...
```

- **Interactive Mode** (no arguments):
```bash
./transform_symlink.sh
```
This will trigger an interactive menu to select the symlink you wish to transform using `fzf`.

- **Transform a Single Symlink**:
```bash
./transform_symlink.sh /path/to/symlink
```
Replace `/path/to/symlink` with the actual path to the symlink.

- **Transform Multiple Symlinks**:
```bash
./transform_symlink.sh symlink1 symlink2 ...
```
Use this when you want to convert several symlinks in one command.

- **Help Option**:
```bash
./transform_symlink.sh --help
```
Displays the help message with usage information.

---

> [!TIP]  
> Consider adding error logging features to this script. Currently, any failures during the transformation process are only echoed to the terminal. Logging them into a file could help with debugging and tracking issues in the future. Additionally, you could improve the user interface by providing progress indicators during the file copy operations.