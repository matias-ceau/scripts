# LLM Script Describer

---

**llm-script-describer.py**: Generate GitHub markdown documentation from user scripts.

---

### Dependencies

- `argparse`: For parsing command line arguments.
- `csv`: For handling CSV file operations.
- `hashlib`: For generating file hashes.
- `json`: For reading/writing JSON files.
- `os`: For operating system dependent functionalities.
- `subprocess`: To run shell commands.
- `sys`: To access command line arguments and exit functionalities.
- `colorama`: To provide colored output in the terminal.
- `openai`: To utilize OpenAI's API for script description generation.

### Description

The `llm-script-describer.py` script automates the creation of GitHub documentation for a collection of user scripts. It reads scripts specified in a CSV file, evaluates their content, and uses OpenAI's language model to generate descriptive markdown documentation. The script organizes documentation into a specified folder structure and also manages an index in the `README.md` file to keep track of script descriptions.

Key functionalities include:
- **Script Processing**: It reads scripts, decides if a script is a binary or a text file, and generates descriptions using the OpenAI API.
- **Documentation Management**: It updates/create markdown files for each script in a dedicated documentation directory and manages orphans—unlinked markdown documents.
- **Symlink Updates**: Optionally, it runs a secondary script to update symlinks.
- **Indexing**: It updates an index of scripts for easy navigation in the documentation.
- **Checksum Verification**: By maintaining hashes of scripts, it avoids unnecessary recomputation of documentation if the scripts haven't changed. 

### Usage

To run the script, use the following command in your terminal:

```bash
python /home/matias/.scripts/llm-script-describer.py [path_to_csv]
```

- `path_to_csv`: Path to the CSV file containing the scripts to be documented. If not specified, it defaults to `$SCRIPTS/data/symlink_data.csv`.

**Example:**
```bash
python /home/matias/.scripts/llm-script-describer.py /home/matias/.scripts/data/my_scripts.csv
```

---

> [!TIP] 
The script expects a valid CSV format and may fail if the input file is incorrect. Consider adding error handling for invalid file formats or providing feedback on the number of scripts processed. Additionally, the script relies heavily on external API calls; it may be wise to add rate limiting or error handling for API failures to ensure smoother execution.