# ChatGPT Script Describer

---

**chatgpt-all-scripts-describer.py**: A Python script to generate documentation for other scripts using OpenAI's GPT API.

---

### Dependencies

- `argparse`: Standard library for parsing command-line arguments.
- `csv`: A module for working with CSV files.
- `os`: Standard library module for interacting with the operating system.
- `subprocess`: To run shell commands from Python.
- `sys`: Provides access to system-specific parameters and functions.
- `colorama`: `colorama` is used for cross-platform colored terminal text.
- `openai`: OpenAI library to interact with their API for GPT model access.

### Description

This script is designed to automate the generation of documentation for scripts stored in a specified directory. Primarily using OpenAI's GPT-4o model, it reads a CSV file listing paths to scripts and for each script, generates documentation in markdown format. It can determine if a file is binary and attempts to find the corresponding source file. If script content is available, it uses GPT to generate a description and writes it to a markdown file. The script also synchronizes symlinks using `utils_update_symlinks.sh` and checks for orphaned documentation files.

### Usage

To run the script, execute it from a terminal on Arch Linux using:
```bash
python /home/matias/.scripts/archived/chatgpt-all-scripts-describer.py [path_to_csv]
```

- By default, it processes the CSV file located at `"$SCRIPTS/data/symlink_data.csv"`.
- It prompts to run `utils_update_symlinks.sh` before processing the CSV file.
- The markdown documentation is saved under the `"$SCRIPTS/docs/scripts"` directory, and an index is updated in `"$SCRIPTS/docs/index.md"`.

For integration with qtile, you could set a keybinding to execute this script, ensuring that all dependencies and environment variables are properly configured.

---

> [!NOTE]
> The script assumes that the environment variable `OPENAI_API_KEY` is set and valid. It uses synchronous API calls, which may delay processing if handling a large number of scripts. Consider implementing asynchronous calls for improved performance. The script currently doesn't handle network or API service interruptions gracefully, which could lead to incomplete documentation if the service is disrupted.