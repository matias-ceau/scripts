# chatgpt-all-scripts-describer.py

# Script Documentation

## Description
This script is designed to process scripts from a CSV file and generate corresponding documentation in markdown format. It utilizes the OpenAI GPT-4o model to generate descriptions for each script, and ensures that the documentation is up-to-date and free of orphaned files.

## Features
- **Updates symlinks**: Optionally runs a shell script to update symlinks.
- **Finds script files**: Retrieves a list of script files in the specified directory.
- **Checks for orphaned documentation**: Identifies documentation files that no longer have corresponding scripts.
- **Determines file type**: Checks if a given file is binary.
- **Finds source files for binaries**: Looks for source files of binary files.
- **Reads script content**: Reads the content of a script file.
- **Generates script descriptions**: Uses the GPT-4o model to generate markdown descriptions of scripts.
- **Writes markdown files**: Saves the generated descriptions to markdown files.
- **Updates index**: Adds links to new documentation files in an index markdown file.
- **Processes CSV data**: Reads a CSV file containing paths and symlinks information, and processes each script listed.

## Usage

### Prerequisites
- **Python 3.6+**
- **Required Libraries**
  - `sys`
  - `os`
  - `argparse`
  - `csv`
  - `subprocess`
  - `openai`
  - `colorama`

### Installation
Make sure to install the required Python libraries:
```bash
pip install openai colorama
```

### Environment Variables
Set the following environment variables:
- `OPENAI_API_KEY`: Your OpenAI API key.
- `SCRIPTS`: The path to your scripts directory.

### Command-Line Arguments
- `csv_path` (optional): Path to the CSV file. Defaults to `$SCRIPTS/data/symlink_data.csv`.

### Running the Script
```bash
./script.py [csv_path]
```

### Example
```bash
./script.py /path/to/symlink_data.csv
```

## Functions

### `print_colored(message, color=Fore.WHITE, style=Style.NORMAL, end='\n')`
Prints messages to the terminal with specified colors and styles.

### `run_update_symlinks()`
Prompts the user to run the `utils_update_symlinks.sh` script.

### `get_script_files()`
Retrieves a set of script files from the specified scripts directory.

### `check_orphaned_docs(script_files)`
Checks for documentation files without corresponding script files and prints their names.

### `is_binary(file_path)`
Checks if a given file is binary.

### `find_source_file(binary_path)`
Attempts to locate the source file for a binary path.

### `read_script(file_path)`
Reads and returns the content of a script file.

### `describe_script(script_content)`
Generates a description for a script using the GPT-4o model.

### `write_markdown(filename, content)`
Writes the provided content to a markdown file.

### `update_index(index_path, filename, relative_path)`
Adds a link to the new documentation file in the index markdown file.

### `process_csv(csv_path)`
Processes the scripts listed in the CSV file.

### `process_script(script_path)`
Processes a single script, generating its description and saving it as a markdown file.

### `main()`
Main function to handle command-line arguments and orchestrate the entire process.

## License
This script is provided "as is", without warranty of any kind.
