# Read the Fucking Manual

---

**read_the_fucking_manual.sh**: A script to display the most researched manual entries based on history.

---

### Dependencies

- `bash`: The shell in which this script is written.
- `bat`: A tool to view files with syntax highlighting and Git integration.
- `ripgrep` (`rg`): A command-line search tool that recursively searches your current directory for a regex pattern.

### Description

This script provides an easy way to review the most frequently searched manual entries based on the user's command history. It aggregates entries from the Zsh and Bash histories and provides various options for filtering and displaying results.

The script primarily utilizes the following functions:
- `cat`: To concatenate the Bash and Zsh history files.
- `rg`: Used to filter commands that start with either `man` or `batman`.
- `sed`: For streamlining results by removing unwanted parts of each line.
- `cut`: To separate the command from its options and arguments.
- `sort`, `uniq`, and `awk`: These utilities work together to count occurrences and neatly format the output.

### Usage

To run the script, simply execute it in your terminal. By default, it returns the top 10 most searched man entries:

```bash
./read_the_fucking_manual.sh
```

You can also use several options to customize the output:

- Display a specific number of results:
  ```bash
  ./read_the_fucking_manual.sh -n 5
  ```
  This command returns the top 5 searched manual entries.

- Filter searches based on a minimum search count:
  ```bash
  ./read_the_fucking_manual.sh -m 3
  ```
  This displays entries that have been searched more than 3 times.

- Retrieve all entries:
  ```bash
  ./read_the_fucking_manual.sh -a
  ```

- Search for specific entries:
  ```bash
  ./read_the_fucking_manual.sh grep
  ```
  This searches the history for entries containing "grep".

For more information on how to use the script, run:
```bash
./read_the_fucking_manual.sh -h
```

---

> [!TIP]  
> Consider adding error handling for cases where the history files might not exist or be empty. Currently, if either of the history files is missing or unpopulated, the script will fail silently. It could also be beneficial to check if `bat` and `ripgrep` are installed at the start of the script and notify the user if they are not found.