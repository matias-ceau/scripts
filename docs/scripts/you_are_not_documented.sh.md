# Undocumented Scripts Finder

---

**you_are_not_documented.sh**: A utility script to find scripts without inline documentation within a specified directory.

---

### Dependencies

- `rg` (Ripgrep): A fast search tool for recursively searching your files. This script uses `rg` to find files that lack `#INFO:#` comments.
 
### Description

The script is designed to help you maintain clarity and organization in your script files by ensuring they have inline documentation. It achieves this by leveraging the capabilities of `ripgrep` to search through a specified directory, identify script files that do not contain the `#INFO:#` tag. Lines matching patterns like `/docs/`, `/config/`, `.csv`, or `.md` are excluded to focus the search on relevant scripts only.

The core functionality is based on two `rg` commands:
- The first command searches the specified directory for files that do not contain the `#INFO:#` tag.
- The second `rg` filters out certain paths and file types that are not relevant.

### Usage

To use this script, make sure you have `ripgrep` installed. Assign the directory you wish to search to the `SCRIPTS` environment variable, then run the script. 

Example usage in terminal:

```bash
export SCRIPTS=/path/to/scripts
/home/matias/.scripts/you_are_not_documented.sh
```

This will output a list of scripts that lack the `#INFO:#` tag and do not reside in `/docs/`, `/config/`, nor are `.csv` or `.md` files. Consider binding this script to a key combination in qtile for quick checks directly from your window manager.

---

> [!TIP]  
> - The script currently relies on an environment variable `SCRIPTS` to determine the search directory. It could be improved by adding error handling for an unset `SCRIPTS` variable or by allowing a directory to be passed directly as an argument for more flexibility.
> - Additionally, consider expanding the list of excluded patterns if other file types or directory names should be ignored in future updates.