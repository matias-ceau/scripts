# Manual Search History Script

---

**read_the_fucking_manual.sh**: Script to retrieve the most searched manual entries using `man` or `batman`.

---

### Dependencies

- `bat` : A clone of cat with syntax highlighting and Git integration.
- `ripgrep` (`rg`) : A line-oriented search tool that recursively searches your current directory for a regex pattern. It's similar to `grep`, but faster.
- `awk`, `sed`, `sort`, `uniq` : Standard Unix utilities for text processing.

### Description

This script is designed to extract and analyze historical search data of manual entries using the `man` or `batman` commands. It performs the following actions:

1. Reads the shell history files from both Zsh and Bash, located in `$XDG_STATE_HOME/zsh/history` and `$XDG_STATE_HOME/bash/history`, respectively.
2. Filters lines that contain manual entry searches initiated with `man` or `batman`.
3. Parses and cleans the data to isolate the searched entries.
4. Provides various options for displaying the searches, such as listing the most frequently searched entries, displaying all entries, or searching through the list with custom criteria.

### Usage

Here's how you can use the script:

```bash
# Default: Display the 10 most searched terms
./read_the_fucking_manual.sh

# Help: Display usage information
./read_the_fucking_manual.sh -h

# Display the top n searches
./read_the_fucking_manual.sh -n 5

# Display searches done more than a certain number of times
./read_the_fucking_manual.sh -m 3

# Display all searches
./read_the_fucking_manual.sh -a

# Search specific entries using ripgrep arguments
./read_the_fucking_manual.sh man
```

Assigning this script to a keybinding in Qtile or running it in a terminal can improve your workflow by quickly retrieving frequently referenced manual entries.

---

> [!TIP] 
> The script assumes that the history files are accessible and not empty. Consider adding error handling to manage missing or inaccessible files gracefully. Additionally, `$XDG_STATE_HOME` environment variable should be set properly; otherwise, the script might fail when trying to locate the history files. An improvement could include adding a default path if `$XDG_STATE_HOME` is not defined.