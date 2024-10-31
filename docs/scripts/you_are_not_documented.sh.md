# Find Scripts Without Inline Docs

---

**you_are_not_documented.sh**: A script that finds scripts without inline docs in a specified directory

---

### Dependencies

- `rg` (ripgrep): A command-line search tool that recursively searches directories for a regex pattern.

### Description

This script, `you_are_not_documented.sh`, is designed to identify scripts within a specified directory that lack a predefined inline documentation comment tag, specifically `#INFO:#`. The script uses `rg` (ripgrep), a fast and flexible text searching tool, to efficiently search through files and directories.

The first `rg` command searches for files that do not contain the pattern `#INFO:#`, which is used to indicate the presence of inline documentation. The search is limited to the directory specified by the environment variable `$SCRIPTS`.

The output from the first `rg` command is then piped into a second `rg` command to exclude files within `/docs/` and `/config/` directories, as well as files with `.csv` and `.md` extensions. This ensures that only relevant script files are considered, and non-script files or documentation folders are ignored.

### Usage

To use the `you_are_not_documented.sh` script, make sure it is executable and that the `$SCRIPTS` environment variable is set to the directory you wish to scan. You can execute the script from the terminal as follows:

```bash
chmod +x /home/matias/.scripts/bin/you_are_not_documented.sh
export SCRIPTS="/path/to/your/scripts"
./you_are_not_documented.sh
```

This will output a list of scripts within the `$SCRIPTS` directory that are missing the `#INFO:#` inline documentation tag.

---

> [!WARNING]  
> The script relies on the `$SCRIPTS` environment variable being set correctly; if it's unset or pointed to the wrong location, the script will not function as intended. Consider adding error handling to check if `$SCRIPTS` is set and valid. Additionally, it might be useful to make the search pattern configurable to accommodate for different inline documentation tags.