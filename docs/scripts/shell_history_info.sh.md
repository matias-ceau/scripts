# Shell History Info

---

**shell_history_info.sh**: Analyzes shell history files to find frequent lines, words, or characters

---

### Dependencies

- `rg`: A tool for recursive searching, used for filtering and cleaning text.
- `sed`: A stream editor for filtering and transforming text.
- `tr`: Used to delete or translate characters.
- `sort`, `uniq`: Used for sorting and finding unique entries.
- `bat`: A cat clone with syntax highlighting and more, optional for enhanced error messages display.

### Description

`shell_history_info.sh` is a script that processes shell history files (Zsh and Bash) to identify the most frequent entries. It removes timestamp info specific to Zsh, and can then analyze this history data in various modes:

- **Lines**: Finds the most frequently repeated command lines.
- **Words**: Breaks down command lines into individual words and identifies the most common ones.
- **Characters**: Analyzes the frequency of each character found in the command history.
- **Options**: Specifically looks for command-line options (words beginning with a `-`).

The script assumes the user's history files are located in the directories specified by `$XDG_STATE_HOME`.

### Usage

Run this script in a terminal with the appropriate options:

```bash
# To find the most frequent lines
bash shell_history_info.sh --lines

# To find the most frequent words
bash shell_history_info.sh --words

# To find the most frequent characters
bash shell_history_info.sh --character

# To find the most frequent command-line options
bash shell_history_info.sh --option
```

If an unknown option is provided, the script will display the list of valid options from the DOC comment within the script itself.

---

> [!NOTE]
> There is a lack of error handling for cases where the history files are not found or are inaccessible. Consider adding checks to verify the existence and readability of these files before proceeding with processing. Additionally, for better readability of the option summary, applying some text formatting to the output displayed by `bat` could be beneficial.