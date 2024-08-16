# Shell History Info

---

**shell_history_info.sh**: Analyze and retrieve the most frequent entries in shell history

---

### Dependencies

- `cat`: Standard command-line utility for concatenating and displaying file contents.
- `sed`: A stream editor for filtering and transforming text.
- `rg`: `ripgrep`, a line-oriented search tool that recursively searches your current directory for a regex pattern.
- `sort`: Command used to sort lines of text files.
- `uniq`: Command that reports or omits repeated lines in a file.

### Description

This script provides a way to analyze shell history files to determine the most frequently occurring lines, words, or characters from both Zsh and Bash history. The script implements several functions to process the history information:

- **get_history**: Combines and outputs the contents of Zsh and Bash history files.
- **split_by_word**: Converts spaces into new lines, allowing word counting.
- **clean_up**: Eliminates empty lines and trims leading/trailing whitespace.
- **sort_by_occurence**: Sorts the cleaned data, counts occurrences, and filters results to show only those with occurrences greater than 5.

The script uses a `case` statement to handle command-line arguments, enabling the user to specify whether they want to analyze lines, words, or characters.

### Usage

To use the script, execute it in a terminal with one of the following options:

- To analyze full lines:
  ```bash
  ./shell_history_info.sh --lines
  ```
- To analyze words:
  ```bash
  ./shell_history_info.sh --words
  ```
- To analyze characters:
  ```bash
  ./shell_history_info.sh --character
  ```
- For a generic option which currently behaves like lines:
  ```bash
  ./shell_history_info.sh --option
  ```

If you provide an invalid argument, the script will notify you to check the usage.

---

> [!TIP] 
> While the script serves its purpose well, consider adding more detailed usage instructions or help features (like `-h` or `--help`) for clarity. Also, implementing error handling for file existence checks could prevent potential failures if the history files are not present.