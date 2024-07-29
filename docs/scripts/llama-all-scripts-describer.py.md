# llama-all-scripts-describer.py

# Script Documentation: `script_processor.py`

## Description

This script processes a CSV file containing script information, generates descriptive markdown files for each script using the Llama 3.1 model, updates an index, and checks for orphaned documentation files. The functionalities include colored output for readability, running utility scripts, identifying binary files, and generating markdown files.

## Functionalities

### Functions

- **`print_colored(message, color=Fore.WHITE, style=Style.NORMAL, end='\n')`**

  Prints a colored and styled message to the terminal.

- **`run_update_symlinks()`**

  Prompts the user to run the utility script `utils_update_symlinks.sh` and executes it upon confirmation.

- **`get_script_files()`**

  Retrieves all script files from the specified directory (excluding markdown files).

- **`check_orphaned_docs(script_files)`**

  Checks for orphaned documentation files in the scripts documentation directory and prints them.

- **`is_binary(file_path)`**

  Checks if the given file is binary by reading the first 1024 bytes.

- **`find_source_file(binary_path)`**

  Attempts to locate the source file corresponding to a binary file.

- **`read_script(file_path)`**

  Reads the content from the specified script file.

- **`describe_script(script_content)`**

  Generates a description for the script content using the Llama 3.1 model from the `ollama` package.

- **`write_markdown(filename, content)`**

  Writes the provided content to a markdown file.

- **`update_index(index_path, filename, relative_path)`**

  Updates the index file with a reference to the markdown file.

- **`process_csv(csv_path)`**

  Processes the CSV file containing script information and processes each script entry.

- **`process_script(script_path)`**

  Processes an individual script, generates a documentation file for it, and updates the index.

### Main Execution Flow

- **`main()`**

  - Sets up argument parsing.
  - Validates the existence of the CSV file.
  - Runs the symlink updating utility.
  - Retrieves the script files.
  - Processes the CSV to generate documentation.
  - Checks for orphaned documentation files.
  - Prints completion message.

## Usage

### Command Line

```bash
python script_processor.py [path_to_csv_file]
```

- **`csv_path`**: Path to the CSV file containing script information. Defaults to `$SCRIPTS/data/symlink_data.csv`.

### Requirements

- Python 3.x
- `colorama` package
- `ollama` package
- `fd` and `rg` command-line tools

### Example

```bash
python script_processor.py /path/to/symlink_data.csv
```

## Environmental Variables

- **`$SCRIPTS`**: The base directory containing scripts and related files.

## Directory Structure

- **Scripts Directory**: `$SCRIPTS`
- **Documentation Directory**: `$SCRIPTS/docs/scripts`
- **CSV File Default Path**: `$SCRIPTS/data/symlink_data.csv`

## Generated Documentation

The script generates markdown documentation files for each script and stores them in the `$SCRIPTS/docs/scripts` directory. It also updates an index file located at `$SCRIPTS/docs/index.md`.

## Error Handling

- Handles missing CSV file.
- Catches and reports errors during symlink script execution.
- Reports issues in retrieving script files.
- Properly manages binary and non-binary script distinctions.

## Colored Output

The script uses `colorama` to provide colored terminal output, enhancing readability and user experience. Different colors and styles highlight messages such as errors, prompts, and success notifications.

## External Dependencies

- **`fd`**: A fast and user-friendly alternative to `find`.
- **`rg`**: (`ripgrep`) A fast search tool for large source trees.
- **`ollama`**: Used for generating script descriptions.

## License

Specify the relevant license for your script, e.g., MIT or GPL.

---

Make sure to test the script in your environment and update dependencies or environmental paths as necessary. The provided script presumes specific CLI tools and environmental configurations.