# LLM Script Describer

---

**[llm-script-describer.py](llm-script-describer.py)**: Auto-generates Markdown documentation for user scripts.

---

### Dependencies

- `openai`: Python wrapper for the OpenAI API, required for generating descriptions.
- `colorama`: Library to enable colored terminal text for better readability.
- `csv`: Built-in Python library for handling CSV file operations.
- `subprocess`: Built-in Python library for executing system commands.
- `json`: Built-in Python library for JSON file operations.
- `hashlib`: Built-in library for secure hash functions.

### Description

The **LLM Script Describer** is a Python script designed to automate the creation of Markdown documentation for user scripts stored in a specified directory. It does this by using the OpenAI API to generate descriptions based on the content and metadata of each script. This facilitates efficient documentation management for users on systems running Arch Linux with the Qtile window manager.

The script performs several key functions:

- **Reading Scripts**: It can read scripts from standard formats (e.g., `.py`, `.sh`) and even find source files for binary scripts.
- **Documentation Generation**: It utilizes the OpenAI API (with the `gpt-4o-mini` model) to create descriptive Markdown files based on individual script content.
- **GitHub Integration**: The generated Markdown files are organized and indexed, allowing for seamless integration with GitHub's documentation structure.
- **Automatic Updates**: It can update README files and remove orphaned documentation files automatically, keeping the documentation up-to-date and relevant based on the user's script repository.

### Usage

To run the script, you must provide the path to a CSV file that lists script metadata, including original paths and desired symlinks. The default path points to `$SCRIPTS/data/symlink_data.csv`. You may also run it directly from your terminal.

```bash
python /home/matias/.scripts/llm-script-describer.py /path/to/your/symlink_data.csv
```

#### Key Options

- `--help`: Displays a help message.
  
#### Example

1. Place your scripts in the designated `$SCRIPTS` directory.
2. Create a CSV file with entries such as:
   ```
   original_script_path, symlink_path, command_name
   /path/to/script1.py, script1, description of script1
   ```
3. Execute the script as shown above.
4. The script will generate Markdown documentation files for each listed script and update the README accordingly.

---

> [!TIP] Consider handling exceptions more gracefully, especially for external command executions with `subprocess`. Implementing retries or logging can provide better insight into failures. Additionally, ensure that your API key environment variable is set and valid before execution.
