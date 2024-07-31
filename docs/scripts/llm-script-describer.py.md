# LLM Script Describer (llm-script-describer.py)

---

Generate markdown documentation for user scripts with AI assistance.

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

- Python 3.x
- OpenAI Python library
- colorama
- Bash scripting environment (for symlink updates)
- Other Python dependencies managed via pip

<a name="description" />

### Description

<a name="overview" />

#### Overview

The `llm-script-describer.py` script automates the creation of markdown documentation for user scripts located within a specified directory. Utilizing the OpenAI GPT model, it facilitates the generation of detailed markdown files from raw script content. This is particularly useful for developers looking to maintain comprehensive documentation for their scripts in a streamlined manner. 

### Key functionalities include:

- Reading scripts from a CSV file to process their content.
- Utilizing a language model to generate descriptions of scripts based on their content.
- Updating the main README file with a summary and a documentation index.
- Cleaning up orphaned documentation files, ensuring only relevant documents are retained.

---

<a name="usage" />

#### Usage

To run the script, execute the following command in the terminal:

```bash
python llm-script-describer.py path/to/symlink_data.csv
```
If no path is provided, it defaults to `$SCRIPTS/data/symlink_data.csv`.

### The script performs several tasks:

- **Interactive Symlink Update**: After prompting the user, it can run a script to update symlinks.
- **Script Processing**: It processes each script listed in the provided CSV, generating accompanying markdown documentation.
- **README Update**: Finally, it updates the documentation index in the main README file with links to generated markdown files.

<a name="examples" />

#### Examples

- Generate documentation from the default CSV:
  ```bash
  python llm-script-describer.py
  ```

- Generate documentation from a custom CSV:
  ```bash
  python llm-script-describer.py /path/to/custom.csv
  ```

---

<a name="notes" />

### Notes

- Ensure that the OpenAI API key is correctly set in the environment variable `OPENAI_API_KEY`.
- The script expects a specific structure for the CSV input file, which should list original script paths along with their symlink names.

> **Critique**: 
> While the script is highly functional, there are scenarios where error handling could be improved, particularly around subprocess calls which may not handle all potential edge cases. Moreover, decoupling the script's concerns (for example, separating LLM interaction from file I/O) could lead to enhanced maintainability and testability. Consider refactoring the subprocess handling to allow for better logging and recovery in case of failures.