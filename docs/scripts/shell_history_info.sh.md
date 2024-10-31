# Shell History Information Extractor

---

**shell_history_info.sh**: Analyze and extract the most frequent lines, words, or characters from shell history files.

---

### Dependencies

- `sed`: A stream editor used for parsing and transforming text.
- `rg` (ripgrep): A line-oriented search tool similar to `grep`.
- `tr`: A command for translating or deleting characters.
- `uniq`: Report or omit repeated lines.
- `bat`: A cat clone with syntax highlighting for code.

### Description

This script examines your Zsh and Bash shell history files to identify the most frequently used lines, words, and characters. It removes timestamps and session identifiers from the Zsh history and presents a sorted list of entries by frequency, excluding any that occur fewer than five times. By using various options, you can choose whether to analyze lines, words, individual characters, or command options.

**Components**:
- **get_history**: Concatenates your Zsh and Bash history files while stripping unnecessary Zsh-specific components like timestamps.
- **split_by_word**: Breaks lines into individual words for detailed frequency analysis.
- **clean_up**: Removes empty lines and leading or trailing spaces to ensure clean data handling.
- **sort_by_occurence**: Sorts and filters the data, providing a count of each unique line or word while ensuring a minimum occurrence threshold.

### Usage

Execute the script with the desired option:

```bash
# To sort by lines
./shell_history_info.sh -l

# To sort by words
./shell_history_info.sh -w

# To sort by characters
./shell_history_info.sh -c

# To sort by options (flags starting with "-")
./shell_history_info.sh -o
```

It is advisable to create a keybinding in qtile for quick execution or run it directly from the terminal.

---

> [!TIP] Consider enhancing robustness by checking if the history files exist before attempting to read them. This script currently assumes the presence of both `$XDG_STATE_HOME/zsh/history` and `$XDG_STATE_HOME/bash/history`. You could implement a check and handle the absence of these files more gracefully, possibly with a user-friendly error message. Additionally, introducing unit tests might help ensure that each function behaves as expected.