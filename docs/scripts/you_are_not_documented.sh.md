# Script Documentation Finder

---

**you_are_not_documented.sh**: Identify scripts lacking inline documentation markers

---

### Dependencies

- `rg` (ripgrep): A line-oriented search tool that recursively searches your current directory for a regex pattern. It is similar to other command-line search tools like `grep`, `ack`, and `the_silver_searcher`, but typically faster and with additional features.

### Description

This script is aimed at maintaining code quality by locating scripts, within a specified directory, that do not contain a specific inline documentation marker, namely `#INFO:#`. Inline documentation markers are crucial for keeping track of script functionality and maintenance history.

The script performs two primary actions using `rg` (ripgrep):
1. It searches for files in the `$SCRIPTS` directory that do not contain any line starting with the marker `#INFO:#`. 
2. It excludes files located in directories named `docs`, `config`, and files with extensions `.csv` or `.md` to avoid unnecessary noise.

This makes it a useful utility when trying to enforce documentation standards across a repository.

### Usage

1. Set the `$SCRIPTS` environment variable to the directory containing your scripts:
   ```bash
   export SCRIPTS="/path/to/your/scripts"
   ```
2. Run the script in your terminal:
   ```bash
   /home/matias/.scripts/bin/you_are_not_documented.sh
   ```

This will output a list of script files in the provided directory that do not contain the `#INFO:#` documentation marker.

---

> [!TIP] While the script efficiently identifies undocumented files, it assumes `$SCRIPTS` is always correctly set. You might want to add error handling to check if this variable is empty or undefined. Additionally, providing optional command-line arguments to specify directories on the fly could enhance the versatility of the script.