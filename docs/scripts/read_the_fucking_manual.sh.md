# Read the Fucking Manual

---

**read_the_fucking_manual.sh**: A script to check frequently searched manual entries.

---

### Dependencies

- `bat`: A cat clone with syntax highlighting and Git integration.
- `ripgrep` (`rg`): A line-oriented search tool that recursively searches your current directory for a regex pattern.
- `sed`: A stream editor for filtering and transforming text.
- `awk`: A programming language designed for text processing.

### Description

`read_the_fucking_manual.sh` is a bash script that helps users quickly access their most researched manual entries by examining their shell command history files. This utility leverages several tools, including `bat`, `ripgrep`, `sed`, and `awk`, to sift through command history and extract relevant entries.

The script primarily reads from the `bash` and `zsh` history files located in the `$XDG_STATE_HOME` directory, applies regular expressions to filter entries that involve the `man` command (or its alternative, `batman`), and provides options to display the results based on the user's requirements. 

#### Important Functions
- **usage()**: Displays usage instructions and command options.
- **get_searches()**: Processes history files, filters for manual commands, and returns results based on various criteria.

### Usage

To use `read_the_fucking_manual.sh`, run the script from the terminal with one of the following options:

```bash
# Get the 10 most searched manual entries
./read_the_fucking_manual.sh

# Get a specific number of most searched entries
./read_the_fucking_manual.sh -n 5

# Get entries where searches were done more than 'n' times
./read_the_fucking_manual.sh -m 3

# Get all searches
./read_the_fucking_manual.sh -a

# Search for a specific term in the history
./read_the_fucking_manual.sh <search_term>
```

---

> [!TIP]  
> This script assumes that the user's command history is logged properly in the specified files. To enhance its functionality, consider adding error handling for cases where history files might not exist or are empty. Additionally, users may benefit from customizing the script to include more contextual information about the commands being searched.