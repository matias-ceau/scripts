# gsi.sh - Git Repository Synchronizer

---

**/home/matias/.scripts/dev/gsi.sh**: improved sync git repository

---

### Dependencies

- `bash` – Core shell interpreter for running the script.
- `git` – Version control system used for repository operations.
- `bat` – Optional tool for enhanced syntax-highlighted output.
- `glow` – Optional Markdown renderer for prettifying messages.
- `sed` – Text processing utility used for stripping ANSI colors.

### Description

This script automates the synchronization of your Git repository by fetching changes from remotes, performing fast-forward merges or rebases, handling local modifications through stashing, and finally pushing any new commits back to the repository. It is tailored for Arch Linux environments and integrates well with the qtile window manager.

Key features include:

- **Enhanced Output:** Uses `bat` for beautifully formatted command previews and `glow` for rendering markdown-styled messages if they are available. The script provides warnings if these tools are not installed.
- **Dry Run Mode:** Run the script with the `--dry-run` flag to simulate git operations without making any changes, which is useful for auditing operations before proceeding.
- **Interactive Conflict Resolution:** In cases of merge conflicts, the script presents a menu allowing you to choose between opening your editor, aborting the merge, or skipping the commit.
- **Repository Maintenance:** Post-synchronization, the script executes `git maintenance run` to ensure the repository remains clean and optimized.
- **Detailed Logging:** Before and after significant git operations, the script prints formatted versions of commands and outputs, offering a clear view of the repository’s state.

### Usage

To use the script, simply run:

    ./gsi.sh <repository_path>

For example:

    ./gsi.sh ~/.scripts

To perform a dry run:

    ./gsi.sh ~/.scripts --dry-run

This script must be executed on a valid Git repository directory. It checks for the presence of a `.git` folder and exits with an error if the directory does not qualify. Preferably, integrate it as a keybinding in your qtile configuration for rapid access.

---

> [!TIP]
> Consider enhancing the script by adding a verbose mode for more detailed output, and possibly integrating logging functionality to track synchronization events over time. Additionally, validating the repository state more robustly before operations can prevent unintended errors in complex workflows.