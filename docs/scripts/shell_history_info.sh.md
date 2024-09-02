# Shell History Analyzer

---

**shell_history_info.sh**: Analyzes shell history files to find frequent lines, words, or characters.

---

### Dependencies

- `bash`: The shell in which the script is written.
- `rg` (ripgrep): A fast text searching tool used for cleaning up lines.
- `sed`: A stream editor for filtering and transforming text.
- `sort`: A command for sorting lines of text files.
- `uniq`: A command for reporting or omitting repeated lines.
- `bat`: A cat clone with syntax highlighting and Git integration, used here for displaying the help documentation within the script.

### Description

This script analyzes the shell history files located in the `XDG_STATE_HOME` directory and identifies the most frequent lines, words, or characters based on the provided command-line arguments. The script defines several helper functions to facilitate this analysis:

- **get_history**: Combines `bash` and `zsh` history files.
- **split_by_word**: Converts spaces in text to new lines for word analysis.
- **clean_up**: Removes empty lines and trims whitespace.
- **sort_by_occurence**: Counts occurrences of each line, keeps only those with more than four occurrences, and formats the output.

The script accepts various command-line options to specify what kind of frequency analysis to perform.

### Usage

Run the script from the terminal with the appropriate option to analyze your shell history:

```bash
# Analyze the most frequent lines
./shell_history_info.sh -l

# Analyze the most frequent words
./shell_history_info.sh -w

# Analyze the most frequent characters
./shell_history_info.sh -c

# Display options starting with a specific character
./shell_history_info.sh -o
```

If an invalid option is provided, the script will display a message indicating the error and show the script documentation embedded in the source code.

---

> [!TIP]  
> The script could benefit from improved error handling, such as checking if the history files exist before trying to read them. Implementing input validation for the `XDG_STATE_HOME` environment variable can also enhance robustness. Additionally, consider using more efficient text processing tools to improve performance on large history files.