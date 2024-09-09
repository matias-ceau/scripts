# Shell History Info

---

**shell_history_info.sh**: Obtains the most frequent lines, words, or characters in shell history files.

---

### Dependencies

- `rg`: A fast text searching tool that is used for cleaning up history entries.
- `bat`: A modern cat clone with syntax highlighting and Git integration, utilized for pretty-printing sections of the script.

### Description

The `shell_history_info.sh` script is designed to analyze the shell history files and extract the most frequently used lines, words, or characters. The analysis is flexible and can be tailored to specific needs based on the command-line options provided. 

The script performs the following main functions:

- **get_history**: Reads the zsh and bash history files and formats the output to remove any unnecessary zsh-specific indications.
- **split_by_word**: Inputs a string and splits it into individual words.
- **clean_up**: Cleans the output by removing empty lines and trimming leading/trailing whitespace.
- **sort_by_occurence**: Sorts the cleaned data by occurrence and formats the output to show only those items with counts greater than five.

### Usage

The script can be executed from the terminal or incorporated into shell workflows. Usage instructions are provided below:

To execute the script, use the following command format:

```bash
./shell_history_info.sh [option]
```

Where `[option]` can be:

- `-l` or `--lines`: To get the most frequent lines in the history.
- `-w` or `--words`: To get the most frequent words in the history.
- `-c` or `--character`: To get the most frequent characters in the history.
- `-o` or `--option`: Get options matching a specific pattern.

**Examples**:

1. Retrieve the most frequent lines:
   ```bash
   ./shell_history_info.sh -l
   ```

2. Retrieve the most frequent words:
   ```bash
   ./shell_history_info.sh -w
   ```

3. Retrieve the most frequent characters:
   ```bash
   ./shell_history_info.sh -c
   ```

4. Retrieve options matching a specific pattern:
   ```bash
   ./shell_history_info.sh -o
   ```

If the argument is incorrect, the script will output an error and show the relevant section of the code for correction.

---

> [!TIP] 
This script could be improved by adding error handling for the absence of the required history files or ensuring `rg` and `bat` are installed. Furthermore, comprehensive comments and better documentation for command-line arguments would enhance user understanding. Consider adding the option to specify custom history file locations as well.