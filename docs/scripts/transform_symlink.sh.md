# Transform Symlink (transform_symlink.sh)

---

Replace a symbolic link with its target file.

---

### Table of contents

- [Dependencies](#dependencies)
- [Description](#description)
    - [Overview](#overview)
    - [Usage](#usage)
    - [Examples](#examples)
- [Notes](#notes)

---

<a name="dependencies" />

### Dependencies

- Bash
- `readlink` command (available by default on most Linux distributions)

<a name="description" />

### Description

<a name="overview" />

#### Overview

This script is designed for users who want to replace a symbolic link with the actual file it points to. It performs several checks to ensure that the operation is safe:

1. It checks if exactly one argument (the symlink) is provided.
2. It verifies that the provided argument is indeed a symbolic link.
3. It uses the `readlink` command to find the target file of the symlink.
4. It copies the target file to a new file with the same name as the original symlink, effectively replacing the symlink with the actual file.

This utility can be particularly useful for cleaning up symbolic links after usage, ensuring that the original file is retained without cluttering your file system with unnecessary links.

---

<a name="usage" />

#### Usage

To use the script, execute it from a terminal with the path of the symbolic link you wish to transform as the argument. For example:

```bash
./transform_symlink.sh /path/to/symlink
```

Make sure to give the script executable permissions if you haven't done so yet:

```bash
chmod +x /home/matias/.scripts/transform_symlink.sh
```

<a name="examples" />

#### Examples

1. To transform a symlink named `my_link` into the target it points to:

```bash
/home/matias/.scripts/transform_symlink.sh my_link
```

If `my_link` points to `/home/matias/file.txt`, this command replaces `my_link` with `file.txt`.

---

<a name="notes" />

### Notes

- This script does not handle scenarios where the target file is missing or not accessible. If the target of the symlink cannot be found, the script will fail.
- Ensure that replacing the symlink is the desired action, as this operation cannot be undone once executed.

> **Critique:** 
> The script currently lacks error handling for situations where the target file may not exist or is not readable. It could be improved by adding checks to ensure that the target file is present and accessible before attempting to copy it. Additionally, it could offer an option to back up the existing symlink before replacing it for better safety.