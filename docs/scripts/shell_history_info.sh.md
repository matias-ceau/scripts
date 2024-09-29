# Shell History Analyzer

---

**shell_history_info.sh**: Script to extract most frequent lines, words, or characters from shell history.

---

### Dependencies

- `bash`: The script is written in Bash and requires a Bash environment to execute.
- `sed`: A stream editor for filtering and transforming text.
- `sort`: Used to sort lines of text files.
- `uniq`: Report or omit repeated lines in a file.
- `rg` (ripgrep): A line-oriented search tool that recursively searches your current directory for a regex pattern.
- `bat`: A cat(1) clone with syntax highlighting and Git integration, used to display sections of the script.

### Description

This script analyzes the shell history files located at `$XDG_STATE_HOME/zsh/history` and `$XDG_STATE_HOME/bash/history`. It performs operations to retrieve the most frequent lines, words, or characters. It utilizes several helper functions: 

- **get_history**: Concatenates the contents of Zsh and Bash history files while removing extraneous Zsh format indications.
- **split_by_word**: Splits lines into separate words.
- **clean_up**: Cleans the output by removing empty lines and stripping trailing and leading whitespaces.
- **sort_by_occurence**: Counts the occurrence of each line/word/character, displaying only those with an occurrence greater than 5.

The script can be run with various options, allowing users to specify the desired analysis type (lines, words, characters).

### Usage

To use the script, execute it in the terminal with one of the following options:

```bash
# List most frequent lines
bash shell_history_info.sh -l

# List most frequent words
bash shell_history_info.sh -w

# List most frequent characters
bash shell_history_info.sh -c

# List options starting with a dash
bash shell_history_info.sh -o
```

If an invalid argument is provided, the script outputs an error message along with its own source code for reference.

---

> [!TIP] 
> The script could benefit from error handling to check if the history files exist before attempting to read them. Additionally, consider implementing support for configuring the minimum occurrence threshold via command-line arguments, providing users flexibility.