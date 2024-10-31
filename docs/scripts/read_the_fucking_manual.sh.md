# Manual Search History Analyzer

---

**read_the_fucking_manual.sh**: Lists and analyzes the most searched manual entries.

---

### Dependencies

- `bash`: Required to execute the script.
- `rg` (ripgrep): Utilized for searching and filtering manual search entries.
- `sed`: Used for parsing history entries.
- `awk`: Employed for formatting and threshold filtering.
- `bat`: Used for enhanced help display.

### Description

This script analyzes the shell history from both `zsh` and `bash`, extracting and listing the most frequently searched manual entries. Its primary function is to display which commands have had their manuals queried the most – using either `man` or `batman`. 

The script fetches command names from the history files located at paths defined by the `XDG_STATE_HOME` environment variable. It processes these entries to reflect on the command popularity by performing several operations:
- Filtering out manual command invocations such as `man` and `batman`.
- Counting unique entries to display frequency.
- Sorting for easy viewing by frequency.

### Usage

Run the script from a terminal. It supports several options for customizing the output, as outlined below:

```sh
./read_the_fucking_manual.sh # Display the top 10 most searched manual entries
```

#### Options

- **Default (no arguments):** Displays the top 10 most frequently searched manual entries.
  
- `-h`, `--help`: Displays a help message detailing usage options.
  
  ```sh
  ./read_the_fucking_manual.sh -h
  ```

- `-n`, `--number <nb>`: Specify the number of top entries to display.
  
  ```sh
  ./read_the_fucking_manual.sh -n 5 # Top 5 searches
  ```

- `-m`, `--more-than [<nb>]`: Displays entries searched more than the specified number of times (default is 1).
  
  ```sh
  ./read_the_fucking_manual.sh -m 2 # Entries searched more than twice
  ```

- `-a`, `--all`: Displays all entries regardless of search frequency.

  ```sh
  ./read_the_fucking_manual.sh -a
  ```

- `[<rg_arguments>]`: Pass any arguments directly to `ripgrep` to perform a search across all search entries.

  ```sh
  ./read_the_fucking_manual.sh "grep"
  ```

---

> [!NOTE]
> The script could benefit from additional error handling, particularly for cases where dependencies might be missing or when the requested history files do not exist. Additionally, it may be useful to check if `XDG_STATE_HOME` is set and provide a default if not, enhancing portability across different environments.