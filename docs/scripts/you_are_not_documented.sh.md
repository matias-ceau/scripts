# You Are Not Documented

---

**you_are_not_documented.sh**: A script that finds scripts without inline documentation.

---

### Dependencies

- `rg`: This is a fast text searching tool. You will need it to locate scripts without the required documentation comments.

### Description

The `you_are_not_documented.sh` script is designed to help developers manage their code by identifying files that lack inline documentation. Inline documentation is crucial for maintaining code readability and facilitating collaboration. 

This script utilizes the `rg` (ripgrep) command, which searches recursively through files, to find any scripts that do not contain the specific documentation comment `#INFO:#`. This allows users to efficiently pinpoint scripts that may need additional comments or documentation to clarify their purpose and functionality.

Furthermore, the script includes criteria to exclude certain directories and file types from the search results. Specifically, it filters out:
- Any files located in `docs/` or `config/` directories
- Files with extensions `.csv` or `.md`

By narrowing down the search results, the script ensures that only relevant scripts are returned for documentation review.

### Usage

To use this script, simply execute it from a terminal prompt. Make sure that the environment variable `SCRIPTS` is set to the directory containing the scripts you wish to check for documentation. You can run the script with:

```bash
bash /home/matias/.scripts/you_are_not_documented.sh
```

This command will produce a list of scripts within the specified directory that do not have the `#INFO:#` comment tag.

---

> [!TIP] 
> The script could be improved by allowing additional custom filters through command-line arguments. Also, adding a message indicating no undocumented scripts are found would enhance user experience. Consider implementing error handling to manage cases where the `$SCRIPTS` environment variable is not set or does not point to a valid directory.