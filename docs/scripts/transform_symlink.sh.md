# Transform Symlink Script

---

**transform_symlink.sh**: A utility to transform symlinks into copies of their targets.

---

### Dependencies

- `fd`: A simple and fast alternative to `find`, used to locate symlinks in the directory tree.
- `fzf`: A general-purpose command-line fuzzy finder that allows interactive selection of symlinks.
- `bat`: A cat clone with syntax highlighting and Git integration, used for previewing files in `fzf`.

### Description

The `transform_symlink.sh` script serves as an unsymlinking utility that allows users to convert symlinks into actual copies of their target files or directories. This script can operate in two modes: interactive mode, where it searches for symlinks recursively and presents them in an interactive `fzf` menu for selection, or command-line mode, where the user can specify one or more symlink paths directly as arguments.

#### Key Functions:
- **`usage`**: Displays help information about the script, including usage, options, and examples.
- **`transform_symlink`**: Takes a symlink path as an argument, checks its validity, reads the target path, and performs the transformation by removing the symlink and copying the target content to its location.

### Usage

Run the script in two primary ways:

1. **Interactive Mode**: 
   To find and transform a symlink using fzf:
   ```bash
   ./transform_symlink.sh
   ```

2. **Direct Mode**: 
   To transform one or more specified symlinks:
   ```bash
   ./transform_symlink.sh /path/to/symlink
   ./transform_symlink.sh link1 link2 ...
   ```

#### Options:
- `-h` or `--help`: Displays help information.

#### Examples:
- Launch the interactive mode:
  ```bash
  ./transform_symlink.sh
  ```
- Transform a single symlink:
  ```bash
  ./transform_symlink.sh /path/to/symlink
  ```
- Transform multiple symlinks at once:
  ```bash
  ./transform_symlink.sh link1 link2 link3
  ```

---

> [!TIP] 
> Consider adding error handling for the case where `fd`, `fzf`, or `bat` are not installed, as this could lead to unexpected behavior if a user tries to run the script without those dependencies. Additionally, the script currently doesn't provide logging or verbose output, which could be useful for debugging in case of a failure.