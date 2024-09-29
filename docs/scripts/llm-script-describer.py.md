# LLM Script Describer

---

**llm-script-describer.py**: Generates documentation for user scripts using OpenAI's API.

---

### Dependencies

- `argparse`: For parsing command-line arguments.
- `csv`: For handling CSV files.
- `hashlib`: For generating file hashes to detect changes.
- `json`: For reading and writing JSON files.
- `os`: For handling file paths and environment variables.
- `subprocess`: For executing shell commands.
- `sys`: For system-specific parameters and functions.
- `colorama`: For producing colored terminal text.
- `openai`: The OpenAI library to interact with the API.

### Description

The `llm-script-describer.py` script is designed to automate the creation of documentation for scripts stored in a specified directory. It utilizes OpenAI's GPT to generate human-readable descriptions of the scripts based on their content. The script follows these primary functions:

1. **Initialization** - Sets up paths for scripts, CSV files, and documentation directories.
2. **Symlink Updates** - Ensures all relevant symlinks are updated before processing scripts.
3. **Orphaned Documentation Cleaning** - Removes Markdown documentation files that no longer correspond to existing scripts.
4. **Script Processing** - Reads each script, generates a description using a specified OpenAI language model, and saves it as a Markdown file. It also updates the index and README files to reflect the latest changes.

### Usage

To run the script, use the command line with the following syntax:

```bash
python llm-script-describer.py [llm_model]
```

- **llm_model** (optional): Specify the OpenAI model to use; defaults to `gpt-4o-mini`.

#### Example:
```bash
python llm-script-describer.py gpt-4o-mini
```

This command reads scripts from a CSV file (`symlink_data.csv`), processes them to generate Markdown documentation, and updates a README file (`README.md`) with the generated summaries.

---

> [!TIP] 
> Consider adding error handling for scenarios where the API request might fail, or the CSV file is incorrectly formatted. This will make the script more robust and user-friendly. Additionally, documenting the expected format of the CSV file in the README could be beneficial for future users or collaborators.