# LLM Script Describer

---

**llm-script-describer.py**: Generate markdown documentation for scripts using GPT-4o-mini.

---

### Dependencies

- `argparse`: To handle command-line arguments.
- `csv`: For reading script metadata from CSV files.
- `hashlib`: To compute file hashes for tracking changes.
- `json`: For handling JSON data.
- `os`: For directory and file operations.
- `subprocess`: To run shell commands.
- `sys`: To exit the script with a status code.
- `colorama`: For colored terminal output.
- `openai`: To interact with OpenAI's API for generating script descriptions.

### Description

This script provides an automated way to generate and update markdown documentation for a collection of scripts located in a designated directory. It utilizes the OpenAI GPT-4o-mini model to create descriptions based on the contents of each script. The generated documentation is then saved as markdown files in a specified location, and also updates a README file and an index of documentation automatically.

Key functionalities include:
- **Reading Scripts**: Scans a directory for script files and reads their contents.
- **Generating Descriptions**: For each script, a detailed description is generated using OpenAI's language model.
- **Managing Documentation**: The script checks for orphaned documentation, updates documentation files, and maintains a JSON file tracking the state of each script and its documentation.
- **CSV Integration**: It can read a specified CSV file to locate script files for documentation.
  
### Usage

To use the script, it must be run from the command line with an optional CSV file path parameter. The default location for this file is `$SCRIPTS/data/symlink_data.csv`.

Example usage:

```bash
python llm-script-describer.py
```

To specify a different CSV file:

```bash
python llm-script-describer.py /path/to/your/data.csv
```

This command will update symlinks, remove orphaned documentation, read scripts from the provided CSV file, and update the README file with new summaries.

---

> [!TIP]  
> Consider implementing error logging instead of just printing errors to the console. This will improve debugging and tracking of issues over time. Additionally, enhancing the script to allow for better customization of the language model parameters could provide more tailored documentation outputs for different contexts.