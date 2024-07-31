# LLM Script Describer

---

**llm-script-describer.py**: Generates markdown documentation for user scripts using GPT-4.

---

### Dependencies

- `python`: The base programming language.
- `openai`: Needed to interact with the OpenAI API for generating script descriptions.
- `colorama`: A library for colored terminal text output.
- `csv`: Standard library for handling CSV files.
- `subprocess`: Standard library for executing shell commands.
- `argparse`: Standard library for command-line argument parsing.
- `json`: Standard library for JSON file handling.

### Description

The `llm-script-describer.py` script automates the process of generating Markdown documentation for user scripts based on GPT-4 model responses. Key functionalities include:

- **Dependency Management**: Ensures necessary libraries are loaded and environment variables are set.
- **Script Processing**: Reads and analyzes scripts, leveraging a conversational AI model to create detailed Markdown descriptions.
- **File Management**: Identifies orphaned documentation, manages symlinks, and creates or updates documentation files.
- **Indexing and README Updates**: Updates a central index of scripts and integrates summaries into a project README file.

The script processes each script listed in a specified CSV file, handling both binary and source files, ensuring that documentation is accurate and up-to-date.

### Usage

To use the script, run it from the terminal with an optional CSV file path argument. The default path is set to `$SCRIPTS/data/symlink_data.csv`. Here’s how to do this:

```bash
python3 /home/matias/.scripts/llm-script-describer.py /path/to/your.csv
```

#### Command-Line Arguments

- `csv_path`: (optional) Path to the CSV file containing the script data. If not provided, defaults to `$SCRIPTS/data/symlink_data.csv`.

**Interactive Prompt**: The script may prompt you to run an optional symlink update script (`utils_update_symlinks.sh`). You can decide whether to proceed with this update.

```bash
Do you want to run utils_update_symlinks.sh? (y/N):
```

---

> [!TIP]  
> The script assumes the OpenAI API key is set in the environment variable `OPENAI_API_KEY`. Ensure this is configured before running to avoid errors. Additionally, the script could benefit from more robust error handling, especially for network-related operations and while reading files.