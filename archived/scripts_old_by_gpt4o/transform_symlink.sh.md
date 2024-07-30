# transform_symlink.sh

# Script Documentation

## Overview

This script is a utility for handling symbolic links in Unix-like systems. It performs the following tasks:

1. Checks if the correct number of arguments is provided.
2. Verifies if the given argument is a symbolic link.
3. Replaces the symbolic link with its actual target file.

## Usage

```bash
./script.sh <symlink>
```

- `<symlink>`: The symbolic link to be replaced by its target file.

## Functionalities

1. **Argument Validation:**
   - The script checks if exactly one argument is provided.
   - If the number of arguments is not equal to one, it prints the usage message and exits.
   ```bash
   if [ "$#" -ne 1 ]; then
       echo "Usage: $0 <symlink>"
       exit 1
   fi
   ```

2. **Symlink Validation:**
   - The script verifies if the provided argument is a valid symbolic link.
   - If the argument is not a symbolic link, it prints an error message and exits.
   ```bash
   if [ ! -L "$symlink" ]; then
       echo "$symlink is not a symbolic link."
       exit 1
   fi
   ```

3. **Target Extraction and Replacement:**
   - The script retrieves the target of the symbolic link using the `readlink` command.
   - It then copies the target file to a new file with the same name as the original symbolic link.
   - Finally, it prints a message indicating that the symbolic link has been replaced by its target file.
   ```bash
   target=$(readlink "$symlink")
   cp "$target" "$symlink"
   echo "Symlink $symlink has been replaced with the actual file $target."
   ```

## Example

Assuming `example_symlink` is a symbolic link to `file.txt`:

```bash
./script.sh example_symlink
```

Output:
```
Symlink example_symlink has been replaced with the actual file file.txt.
```

## Exit Codes

- `0`: Success.
- `1`: Incorrect number of arguments, non-existent or non-symbolic link provided.

## Requirements

- Bash shell
- `readlink` command
- `cp` command

## License

This script is provided "as-is" without any warranty.