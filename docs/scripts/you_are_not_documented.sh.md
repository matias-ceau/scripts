# Script Name: Script Documentation Checker

---

**[you_are_not_documented.sh](you_are_not_documented.sh)**: A script that finds scripts without inline documentation

---

### Dependencies

- `rg`: Also known as Ripgrep, a command-line search tool that recursively searches your current directory for a regex pattern. It is used here to locate files that lack documentation comments.

### Description

This script is designed to simplify the identification of shell scripts that lack proper inline documentation. Using `rg` (Ripgrep), it performs a search for files that do not contain the administrative comment `#INFO:#`. This allows developers to efficiently locate scripts that may need further documentation efforts.

The script specifically targets files in a directory specified by the `$SCRIPTS` environment variable. Additionally, the results are filtered to exclude files in the `/docs/` and `/config/` directories, as well as common file types like `.csv` and `.md`, which typically do not need inline documentation.

Here's a breakdown of the main command:

- `rg '#INFO:#' --files-without-match "$SCRIPTS"`: This command searches for files in the `$SCRIPTS` directory that do not contain the pattern `#INFO:#`.
- `| rg -v '/docs/|/config/|\.csv|\.md'`: The output is then piped to another `rg` command that filters out paths containing `/docs/`, `/config/`, or files with extensions `.csv` or `.md`.

### Usage

To run this script, it should be executed in the terminal. Ensure that the `$SCRIPTS` environment variable is set to the directory you want to search through. You can execute the script by navigating to its directory and running:

```bash
./you_are_not_documented.sh
```

If you want to set the `$SCRIPTS` variable inline, you can do so as follows:

```bash
export SCRIPTS=/path/to/your/scripts
./you_are_not_documented.sh
```

---

> [!TIP]  
A potential improvement for this script could be the inclusion of an option to directly display which functions or scripts need documentation, not just the file names. Additionally, considering whether other file extensions should be included in the filter depending on the user's workflow might benefit its usability.
