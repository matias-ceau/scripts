# Transform Symlinks Utility

---

**transform_symlink.sh**: A Bash script utility to convert symbolic links into actual copies of their target files or directories. It operates both interactively and non-interactively using arguments.

---

### Dependencies

- `fd`: A simple, fast and user-friendly alternative to `find`. It's used here to recursively search for symlinks.
- `fzf`: A command-line fuzzy finder, used to provide an interactive menu for symlink selection.
- `bat`: A cat clone with syntax highlighting and Git integration, used to preview symlink files during selection.

### Description

The **transform_symlink.sh** script is designed to assist users in transforming symbolic links (symlinks) into independent copies of their target files or directories. When a symlink is provided to this script, it checks whether the path is indeed a symlink and if its target exists. Once these checks are confirmed, it deletes the symlink and makes a complete copy of its target to the former symlink's location.

The script can be run in two main modes:
- **Interactive mode**: If no arguments are provided, the script uses `fd` to locate symlinks within a depth of 5 directories and displays them in an `fzf` powered fuzzy finder menu for user selection.
- **Argument mode**: If one or more paths are provided as arguments, the script processes each path as a potential symlink to transform.

### Usage

The script can be executed in the following ways:

```bash
# Interactive mode: No arguments, choose from `fzf`
./transform_symlink.sh

# Transform a specific symlink
./transform_symlink.sh /path/to/symlink

# Transform multiple symlinks
./transform_symlink.sh link1 link2 link3

# Display help
./transform_symlink.sh --help
```

In interactive mode, after selecting a symlink, the script will automatically convert it into its target. If transforming symlinks by specifying their paths directly, the script will handle them all sequentially.

---

> [!TIP] 
> While the script is efficient, it lacks confirmation prompts before transforming symlinks, which might lead to accidental modifications. Additionally, it could benefit from error handling for edge cases, such as insufficient permissions or disk space constraints during copying operations. Consider implementing dry-run capabilities or logging for safer execution in larger file systems.