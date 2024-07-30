# llm-script-describer.py

---

Generates markdown documentation for scripts with LLM assistance.

---

### Table of contents

- [Dependencies](#dependencies)
- [Description](#description)
    - [Overview](#overview)
    - [Usage](#usage)
    - [Examples](#examples)
- [Notes](#notes)

---

<a name="dependencies" />

### Dependencies

- `openai` Python package
- `colorama` for colored terminal outputs
- System utilities like `fd`, `rg`
- Shell script: `utils_update_symlinks.sh`

<a name="description" />

### Description

<a name="overview" />

#### Overview

The `llm-script-describer.py` script is designed to help users generate markdown documentation for their scripts. The script utilizes a Language Model, specifically OpenAI's GPT-4o-mini, to provide descriptions based on the content of the scripts. This process helps ensure that the documentation is consistent and informative according to the context of Arch Linux and the Qtile window manager.

The script follows several key steps:
1. **Collecting Script Files**: It identifies all script files in the specified directory, excluding Markdown files.
2. **Checking for Orphaned Documentation**: It checks for documentation files that do not correspond to any existing scripts.
3. **Reading and Describing Scripts**: For each script, it reads its content, checks if it is binary, finds the source if necessary, and generates a description.
4. **Markdown Generation**: Writes the generated description into a Markdown file and updates an index for easy access.

---

<a name="usage" />

#### Usage

To use this script, follow these steps:

1. Ensure that you have the required dependencies installed and the environment variables set, specifically `SCRIPTS` and `OPENAI_API_KEY`.
2. Execute the script from the terminal:
   ```bash
   python llm-script-describer.py [path/to/csv_file.csv]
   ```
   If no CSV path is specified, it defaults to `$SCRIPTS/data/symlink_data.csv`.

The script prompts whether to run another utility script (`utils_update_symlinks.sh`) and processes the provided CSV for script paths, generating documentation as needed.

<a name="examples" />

#### Examples

- Run the script with default CSV file:
  ```bash
  python llm-script-describer.py
  ```
- Process documentation with a custom CSV file:
  ```bash
  python llm-script-describer.py /home/matias/scripts/data/custom_symlink_data.csv
  ```

---

<a name="notes" />

### Notes

- Ensure to update the OpenAI library as needed to maintain compatibility.
- The generated documentation is placed in the `$SCRIPTS/docs/scripts` directory, with the Markdown files named after the scripts.
- The script's exit status reflects various outcomes; refer to console messages for detailed information during execution.

> **Critique**: 
> - The use of shell commands like `fd` and `rg` assumes availability on the system, which may not be present in all configurations. More graceful handling of such dependencies could improve usability.
> - Error handling could be enhanced in functions like `describe_script` to provide more informative feedback on specific failures related to the OpenAI API or file reading issues. This could also include retries or more detailed logging for debugging purposes.