# Read the Fucking Manual

---

**read_the_fucking_manual.sh**: A script to retrieve the top researched manual entries

---

### Dependencies

- `bat`: A modern alternative to cat that supports syntax highlighting and pagination.
- `ripgrep` (`rg`): A line-oriented search tool that recursively searches the current directory for a regex pattern.

### Description

The `read_the_fucking_manual.sh` script is designed for users who often reference the manual pages (`man`) or the `batman` tool and wish to streamline their workflow by retrieving the most frequently searched entries.

When executed, the script scans the user's shell history stored in `XDG_STATE_HOME` to identify the most searched manual entries. It utilizes a combination of tools such as `sed`, `rg`, `cut`, `sort`, and `awk` to process and filter the data.

Key functions within the script include:
- **`usage()`**: Displays a help message explaining how to use the script and its various options.
- **`get_searches()`**: Gathers searches from both the `bash` and `zsh` history files, processes the data to extract `man` command entries, and summarizes them by frequency of searches.

### Usage

The script can be run directly from the terminal. Here’s how to use it:

```bash
# Display the 10 most searched manual entries (default)
./read_the_fucking_manual.sh

# Display a specific number of searched manual entries
./read_the_fucking_manual.sh -n 5

# Display searches where commands were issued more than a specified number of times
./read_the_fucking_manual.sh -m 2

# Display all searches
./read_the_fucking_manual.sh -a

# Filter searches using ripgrep (can pass any rg arguments)
./read_the_fucking_manual.sh man ls
```

---

> [!TIP]  
> The script currently relies on the existence of history files in `XDG_STATE_HOME`. While this is likely the case for many systems, consider adding checks to ensure these files exist before attempting to read them. This could improve the script's robustness and user experience. Additionally, consider allowing for custom paths for history files in case users have them set up differently.