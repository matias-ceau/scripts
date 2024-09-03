# Shell History Information Script

---

**shell_history_info.sh**: Retrieves frequent lines, words, or characters from shell history files.

---

### Dependencies

- `cat`: Reads the content of files.
- `sed`: Stream editor for filtering and transforming text.
- `rg` (Ripgrep): Recursive search tool that can be used to perform searches with context.
- `sort`: Sorts lines of text files.
- `uniq`: Reports or omits repeated lines.
- `tr`: Translates or deletes characters.
- `bat`: A cat clone with syntax highlighting and Git integration.

### Description

The `shell_history_info.sh` script is designed to analyze shell history files for frequently occurring lines, words, or characters. It processes history files for both `bash` and `zsh`, allowing users to aggregate and summarize their command usage patterns efficiently. 

The script defines several utility functions to handle the tasks:

- **get_history**: Combines the history files from `bash` and `zsh` located in the user’s state directory.
- **split_by_word**: Breaks each line into separate words, putting each on a new line.
- **clean_up**: Cleans up the output by removing empty lines and trailing spaces.
- **sort_by_occurence**: Sorts the items and filters them based on frequency, retaining only those with an occurrence greater than 5.

### Usage

To use this script, you simply invoke it from the terminal with a specified option:

```bash
# To get the most frequent lines
./shell_history_info.sh -l

# To get the most frequent words
./shell_history_info.sh -w

# To get the most frequent characters
./shell_history_info.sh -c

# To get options that start with a dash
./shell_history_info.sh -o
```

If an invalid argument is provided, the script will print an error message along with the script's usage instructions embedded in the source code.

---

> [!TIP] 
> The script can be simplified by using functions for repeated `sed` and `sort` commands to enhance maintainability. Also, consider checking if `rg` is installed before execution to avoid errors, and possibly provide a fallback option to `grep`. Emphasizing error handling for cases where the user is on a system without `zsh` or `bash` can enhance user experience.