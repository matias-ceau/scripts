# LLM Script Describer

---

**llm-script-describer.py**: Automates documentation generation and updates for your scripts folder

---

### Dependencies

- `argparse`: Handles command-line arguments for script configuration.
- `csv`: Reads and processes the CSV file containing scripts' paths.
- `hashlib`: Used for computing file hashes to track changes.
- `json`: Reads and writes metadata about the scripts in JSON format.
- `os`: Manages file paths and environment variables.
- `subprocess`: Executes shell commands to interact with the system.
- `sys`: For system-specific functionalities like exiting on errors.
- `colorama`: Enhances terminal output with colored text.
- `openai`: Connects to OpenAI's API for generating script descriptions or summaries.

External dependencies must be installed using `pip` (e.g., `pip install openai colorama`).

---

### Description

This Python script automates the process of documenting and organizing your scripts folder by integrating OpenAI's LLM to generate descriptions. It:

1. **Updates symlinks**: Ensures symlinks in your scripts directory are up to date by executing `utils_update_symlinks.sh`.
2. **Identifies files**: Finds all non-excluded files in the `$SCRIPTS` folder using commands like `fd` and `rg`.
3. **Removes orphaned docs**: Deletes Markdown documentation for scripts no longer present in the folder.
4. **Processes scripts**: Reads content or detects binary files. For binaries, it attempts to trace the source file by searching common source extensions (`.py`, `.sh`, `.cpp`, etc.). 
5. **Generates Markdown documentation**: Uses an OpenAI model (default: `gpt-4o-mini`) to write a detailed file-specific documentation.
6. **Maintains a JSON mapping**: Tracks script metadata (hash, description, related Markdown file, etc.).
7. **Updates README.md**: Summarizes documentation and updates both a generated output section and a file description table.

Its modularized functions make it capable of managing each aspect of script tracking and documentation efficiently.

---

### Usage

Run the script in your terminal:

```bash
python llm-script-describer.py [llm_model]
```

- `llm_model` is optional, defaulting to `"gpt-4o-2024-11-20"` (changeable via command-line argument).

Example:

```bash
python llm-script-describer.py "gpt-4.0-turbo"
```

### Key Integration Points:
- To define the `$SCRIPTS` folder, export it in your `.bashrc`/`.zshrc`:
  ```bash
  export SCRIPTS=/home/matias/.scripts
  ```

You can assign this script to a keybinding in qtile or schedule it via cron for periodic updates.

---

> [!TIP]
> **Error Handling and Enhancements**: While robust, this script lacks thorough exception handling for certain subprocess commands (e.g., failure when `fd` or `rg` isn't installed). Adding a dependency check would enhance usability. Introducing multithreading could also improve performance for larger directories.