# Transform Symlinks

---

**transform_symlink.sh**: Convert symbolic links to copies of their targets.

---

### Dependencies

- `bash`: The script is written in Bash.
- `fd`: A simple, fast and user-friendly alternative to `find`.
- `fzf`: A command-line fuzzy finder used for interactive selection.
- `bat`: A command-line tool for displaying file contents with syntax highlighting (used in fzf preview).

### Description

The **transform_symlink.sh** script is designed to convert symbolic links into physical copies of their targets. This utility can be especially useful when you need to remove symlinks but retain the content pointed to by the symlinks, either for backup purposes or to alter file structures while maintaining data integrity.

Here’s a broad overview of how the script functions:

- Validates if provided arguments are symbolic links.
- If no arguments are given, it uses `fd` to locate symlinks up to five levels deep within the current directory. These are then displayed via an `fzf` selection interface for the user to choose from.
- The `transform_symlink` function checks if the provided path is a symlink and verifies the existence of the symlink's target. If valid, it removes the symlink and copies its target in its place.

This script does not modify anything if the specified path is not a symlink or if the symlink target is unavailable.

### Usage

To use this script, it can either run in interactive mode or accept direct arguments:

```bash
# Interactive mode using fzf
/home/matias/.scripts/bin/transform_symlink.sh

# Transform a specified symlink
/home/matias/.scripts/bin/transform_symlink.sh /path/to/symlink

# Transform multiple symlinks
/home/matias/.scripts/bin/transform_symlink.sh link1 link2 link3
```

To display the help and usage information:

```bash
/home/matias/.scripts/bin/transform_symlink.sh --help
```

---

> [!NOTE] While this script handles basic conditions well, users should ensure that they have a backup of their data before transformation, especially if the process fails or is interrupted. Additionally, consider implementing a dry-run mode to preview actions before execution, which would enhance reliability and user confidence.