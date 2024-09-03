# Shell History Analyzer

---

**shell_history_info.sh**: Retrieve and analyze frequent entries from shell history files.

---

### Dependencies

- `bash`: The script is written in Bash and requires a compatible shell.
- `rg` (Ripgrep): Used for searching and filtering text efficiently.
- `sed`: Stream editor for filtering and transforming text.
- `sort`: Standard Unix command for sorting lines of text.
- `uniq`: Used to filter out repeated lines in the output.
- `cat`: Concatenates and displays files.

### Description

This script allows users to analyze their shell history and retrieve the most frequent lines, words, or characters from their `bash` and `zsh` history files. It does this by:

1. **Extracting History**: Combines history from both `bash` and `zsh`.
2. **Processing**: 
   - **Cleaning Up**: Removes empty lines and extra whitespace.
   - **Sorting and Counting**: Sorts the entries, counts occurrences, and filters results based on a specified threshold (minimum 5 occurrences).
3. **Handling Input Options**: The script accepts command-line arguments to specify the analysis type (lines, words, characters), or provide instructions when the arguments are incorrect.

### Usage

To execute the script, use the following command with your desired option:

```bash
./shell_history_info.sh [option]
```

#### Options:

- `-l` or `--lines`: Analyze the most frequent lines in the history.
    ```bash
    ./shell_history_info.sh -l
    ```

- `-w` or `--words`: Analyze the most frequent words in the history.
    ```bash
    ./shell_history_info.sh -w
    ```

- `-c` or `--character`: Analyze the most frequent characters in the history.
    ```bash
    ./shell_history_info.sh -c
    ```

- `-o` or `--option`: Analyze options that start with a `-`.
    ```bash
    ./shell_history_info.sh -o
    ```

If an incorrect option is provided, the script will output the usage instructions.

---

> [!TIP]  
> Consider adding error handling for cases where history files do not exist. Additionally, a summary report could enhance the effectiveness of the script by consolidating findings for easier interpretation.
