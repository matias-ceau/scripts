# ChatGPT Script Describer

---

**chatgpt-all-scripts-describer.py**: A script for generating GitHub documentation for local scripts utilizing the OpenAI API

---

### Dependencies

- `argparse`: Standard library for parsing command-line arguments.
- `csv`: Standard library for CSV file manipulation.
- `os`: The module for operating system-associated functionality.
- `subprocess`: A module to run shell commands from within the Python script.
- `sys`: Helps manage system-specific parameters and functions.
- `colorama`: For cross-platform colored terminal text. Install via `pip install colorama`.
- `openai`: For interacting with the OpenAI API. Install via `pip install openai`.
- `fd`: A faster alternative to `find`. Available via Arch Linux's `community` repository.
- `rg` (Ripgrep): A search tool that recursively searches the directory. Obtainable via Arch Linux's `community` repository.

### Description

This Python script is designed to automatically generate markdown documentation for scripts stored locally, using the OpenAI API. Its primary aim is to streamline the creation of GitHub-ready documentation by reading different scripts, compiling descriptions, and storing them in markdown files.

The script performs the following tasks:
- **Update Symlinks**: Optionally execute a shell script to update symlinks.
- **Orphaned Documentation Check**: Identifies markdown documentation files without corresponding script files.
- **Binary Handling**: Supports binary file identification and attempts to locate source files from a predefined list of extensions.
- **Script Processing**: Reads each script, utilizes GPT-4o for generating detailed documentation, and saves the generated markdown in a structured directory.
- **Index Update**: Updates or appends to an index file residing in the documentation directory.

### Usage

Run the script from the terminal on Arch Linux using the following command:

```sh
python /home/matias/.scripts/archived/chatgpt-all-scripts-describer.py [csv_path]
```

- `csv_path`: (Optional) Specify a CSV file path containing script details. Defaults to `$SCRIPTS/data/symlink_data.csv`.

You should export your OpenAI API key as an environment variable `OPENAI_API_KEY` before executing this script. Also, ensure that the scripts directory (`$SCRIPTS`) is properly set in the environment.

```sh
export OPENAI_API_KEY='your_openai_api_key'
export SCRIPTS='/path/to/your/scripts_directory'
```

---

> [!TIP]
> While this script efficiently generates documentation, it assumes the OpenAI service is reachable and your key is valid. Always handle API keys securely. It could also benefit from exception handling improvements for edge cases or network issues. Additionally, consider caching results to avoid redundant API requests in successive runs.