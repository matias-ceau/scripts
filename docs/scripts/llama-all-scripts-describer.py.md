# Llama-powered Script Documentation Generator

---

**llama-all-scripts-describer.py**: Automated Github-style markdown documentation for scripts using Llama 3.1

---

### Dependencies

- `python` (3.8+ recommended)  
- `colorama` – For colored terminal output ([PyPI link](https://pypi.org/project/colorama/))
- `ollama` – Python client for interfacing with local Llama model API
- `fd` – Fast file finding utility (available on Arch as `fd`)
- `ripgrep` (rg) – Fast grep alternative
- `xargs` – For passing arguments from stdin
- `csv` (Python stdlib)  
- `subprocess`, `os`, `sys`, `argparse` (Python stdlib)
- Custom user script: `utils_update_symlinks.sh` (Ensures symlinks are up-to-date before doc generation)
- Local Llama 3.1 model accessible via `ollama`  

---

### Description

This script automates the generation (and maintenance) of markdown documentation for your personal script collection, leveraging Llama 3.1 as an AI-powered doc writer. Its workflow is as follows:

- **Symlink Update Prompt:**  
  Before working, it asks to run your `utils_update_symlinks.sh` to ensure the symlink state matches your scripts.

- **Script Enumeration:**  
  It lists all files within `$SCRIPTS`, filters out markdown files, and builds a set of known script files.

- **Orphaned Doc Detection:**  
  After processing, it points out markdown docs that no longer correspond to any actual script (i.e., orphans).

- **Binary/Script Differentiation:**  
  If it finds a binary file, it attempts to locate the source in `$SCRIPTS/src` using common source extensions. If found, it documents that source; if not, it warns and skips.

- **Script Description:**  
  For each script (from your CSV, typically symlink structure), it:
    - Reads the script (or source)
    - Calls out to the Llama 3.1 Ollama endpoint to generate GitHub-flavored markdown documentation
    - Writes this documentation to `$SCRIPTS/docs/scripts/<scriptname>.md`
    - Updates `$SCRIPTS/docs/index.md` with a link to the new doc

- **Index Updating:**  
  The index file is maintained for easy navigation.

---

### Usage

Typical scenario on your qtile + Arch system:

```sh
llama-all-scripts-describer.py [optional/path/to/symlink_data.csv]
```

If you do not provide a CSV path, it assumes:
```
$SCRIPTS/data/symlink_data.csv
```
with environment variable `SCRIPTS` pointing to your scripts directory.

#### Example Workflows

- **Simply run:**
  ```
  llama-all-scripts-describer.py
  ```
- **Specify an alternate symlink data file:**
  ```
  llama-all-scripts-describer.py /path/to/custom_symlink_data.csv
  ```

> **Best used from a terminal or bound to a key in your qtile workflow.**

---

> [!CAUTION]
> - The script assumes a specific directory structure governed by your `$SCRIPTS` env variable - this isn't portable unless others mimic your setup.
> - The binary/source pairing mechanism is extension-based and could miss custom extensions or source locations.  
> - Docs are only generated if `.md` does not already exist; no updating of existing docs unless you remove them.
> - `ollama` setup (especially model name `llama3.1`) must be correct and available, or the script will silently skip doc generation.
> - The CSV parser skips the header but assumes full three-column CSV conformity (`original_path, symlink, command_name`); mismatches could cause runtime errors.
> - For robust automation, additional logging/reporting and error handling would be helpful, as errors (for instance, permission issues or subprocess failures) currently cause abrupt exits in some places.
