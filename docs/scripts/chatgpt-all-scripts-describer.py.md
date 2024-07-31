# ChatGPT Script Describer

---

**[chatgpt-all-scripts-describer.py](/chatgpt-all-scripts-describer.py)**: Automatic documentation generator for user scripts using OpenAI API.

---

### Dependencies

- `openai`: Python client to interact with OpenAI API for generating documentation.
- `colorama`: For cross-platform colored output in terminal.
- `fd`: Fast and user-friendly file/directory search tool (requires installation).
- `rg` (ripgrep): A line-oriented search tool that recursively searches your current directory for a regex pattern (requires installation).
- `xargs`: A command that builds and executes command lines from standard input.

### Description

This script is designed to automate the generation of Markdown documentation for user scripts located in a specified directory. It interacts with the OpenAI API to generate descriptions based on the content of each script file, facilitating easier management and understanding of scripts for users. 

Key functionalities include:
- Checking for and running a symlink update script.
- Identifying orphaned documentation files that do not correspond to any existing script.
- Managing binary scripts by attempting to find their source files and extracting documentation from them.
- Reading script content, generating Markdown documentation through the OpenAI client, and writing this documentation into designated files.
- Maintaining an index file to help users navigate the documentation easily.

### Usage

To use this script, follow these steps:

1. **Set Environment Variables**:
   Make sure to set the `OPENAI_API_KEY` and `SCRIPTS` environment variables before running the script.

2. **Run the Script**:
   You can execute the script from your terminal as shown below:
   ```bash
   python /path/to/chatgpt-all-scripts-describer.py /path/to/csv_file.csv
   ```
   If the path to the CSV file is not provided, it defaults to `$SCRIPTS/data/symlink_data.csv`.

3. **Response to Prompts**:
   The script will prompt you to run `utils_update_symlinks.sh`. Type 'y' or 'yes' to proceed or anything else to skip.

4. **View Documentation**:
   After the script finishes successfully, check the generated Markdown files under the `docs/scripts` directory for each of your scripts.

---

> [!TIP] 
> The script currently relies on several shell utilities (`fd`, `rg`, and `xargs`). Users should ensure these are installed and accessible in their environment. Additionally, consider handling more error cases (like malformed CSV lines) and providing more detailed logging for better usability and debugging. The OpenAI API calls may also incur costs; be mindful of usage limits.
