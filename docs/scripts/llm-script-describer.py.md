# LLM Script Describer

---

**llm-script-describer.py**: Automates documentation generation for scripts, creating markdown files

---

### Dependencies

- `argparse`: For parsing command-line arguments.
- `csv`: To handle CSV file operations.
- `hashlib`: To compute file hashes to detect changes.
- `json`: For JSON operations to store script metadata.
- `os`: For operating system related function calls.
- `subprocess`: To run other script commands.
- `sys`: For system-specific parameters and functions.
- `colorama`: For colored terminal text output.
- `OpenAI`: Requires OpenAI API interactions.

### Description

The `llm-script-describer.py` script is a comprehensive tool designed to automate the generation of GitHub documentation for user scripts, specifically tailored for a Linux-based environment using Arch Linux and the qtile window manager. It employs the OpenAI API to formulate markdown documentation for scripts that are listed in a CSV file.

The script performs several tasks:
- **Symlink Update**: It runs a utility script `utils_update_symlinks.sh` to update script symlinks.
- **File Management**: It identifies available script files and manages orphaned documentation files by removing them.
- **Description Generation**: Using the OpenAI API, the script generates markdown documentation by analyzing the script's content.
- **Documentation Storage**: It writes this documentation into a markdown file and updates a documentation index.
- **README Update**: The script summarizes existing documentation and updates the README.md file accordingly, including a table of all documented scripts.

### Usage

To execute this script, you must ensure you have an OpenAI API key accessible through an environment variable named `OPENAI_API_KEY`. Use the following command to run the script, specifying the desired OpenAI model if necessary:

```sh
python ~/.scripts/meta/llm-script-describer.py gpt-4o
```

This script primarily runs from the terminal and can be initiated directly or included as a part of a broader automated workflow. 

---

> [!TIP]
> While the script efficiently handles text-based script files, it struggles with binary scripts lacking source code. Enhancing it to analyze compiled binaries directly could further broaden its utility. Additionally, handling potential file permissions issues, and better exception handling for subprocess calls could improve reliability. Also, ensuring secure and efficient management of the OpenAI API credentials is crucial to safeguard the API key from being accidentally exposed.