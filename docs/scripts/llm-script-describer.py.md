# Script Documentation Assistant

---

**llm-script-describer.py**: Automates the generation and maintenance of markdown documentation for scripts.

---

### Dependencies

- `argparse`: Built-in Python library for handling command-line arguments.
- `csv`: Built-in for reading and writing CSV data.
- `hashlib`: Built-in library for generating hashes.
- `json`: Built-in library for parsing JSON data.
- `os`: Provides a way of using operating system dependent functionality.
- `subprocess`: For managing subprocesses invoked by the script.
- `sys`: Provides access to some variables used or maintained by the Python interpreter.
- `colorama`: For cross-platform colored terminal output.
- `openai`: OpenAI's Python client library for interfacing with their API.
- User scripts such as `utils_update_symlinks.sh` likely help manage symlinks, specific to your environment.

### Description

This script automates the documentation process for scripts in your project by leveraging OpenAI's language models. It reads a CSV file to list the scripts, generates documentation using GPT models, and maintains a JSON file for tracking modifications to scripts. It also updates an index file and the main `README.md` to reflect the current state of script documentation.

The script begins by checking and updating symlinks to ensure all scripts are accessible. It then proceeds to read scripts from a CSV file, generates markdown documentation in the `docs/scripts` directory, and updates a JSON metadata file to keep track of script details like file path, description, doc path, and file hashes. Orphaned documentation files are removed to clean up the docs directory.

### Usage

This script is typically executed in a terminal and can be assigned to a keybinding in qtile or run automatically as a cron job:

```shell
python /home/matias/.scripts/llm-script-describer.py
```

To specify a different OpenAI model:

```shell
python /home/matias/.scripts/llm-script-describer.py gpt-3.5-turbo
```

Ensure you have set the `OPENAI_API_KEY` environment variable for authentication with the OpenAI API.

---

> [!IMPORTANT]
> While the script is comprehensive, it relies heavily on external functionalities which may need error handling improvements. It also assumes all critical environment variables and paths are correctly set, which could introduce errors in different configurations or environments. Integrate logging to catch and record unexpected behaviors for smoother debugging.