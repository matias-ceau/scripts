# Sync Repository (sync-repo.sh)

---

A script to synchronize a git repository with its remote counterpart.

---

### Table of contents

- [Dependencies](#dependencies)
- [Description](#description)
    - [Overview](#overview)
    - [Usage](#usage)
    - [Examples](#examples)
- [Notes](#notes)

---

<a name="dependencies" />

### Dependencies

- `git` - The version control system used.
- `bat` (optional, for pretty output) - A cat clone with wings.
- `glow` (optional, for Markdown rendering) - Render Markdown on the CLI.

<a name="description" />

### Description

<a name="overview" />

#### Overview

The `sync-repo.sh` script is designed to automate the synchronization of a local git repository with its remote counterpart. It fetches changes from the remote repository, stashes any local changes, and attempts to pull the latest updates with a rebase. If there are conflicts during the rebase, the user is prompted to decide how to resolve them. The script also prepares a summary of changes and manages committing and pushing any local modifications automatically.

The script utilizes colored output for better readability and alerts the user if the optional utilities `bat` and `glow` are not installed, which would result in less formatted output. 

### Usage

To use the script, follow these steps:
1. Save the script in a directory accessible from your terminal.
2. Make it executable with `chmod +x /home/matias/.scripts/sync-repo.sh`.
3. Run it using the command:
   ```
   ./sync-repo.sh <repository_path>
   ```
   For example:
   ```
   ./sync-repo.sh ~/.scripts
   ```

### Examples

- Syncing a repository located in `~/.scripts`:
    ```bash
    ./sync-repo.sh ~/.scripts
    ```
- Displaying the usage information:
    ```bash
    ./sync-repo.sh
    ```

---

<a name="notes" />

### Notes

- Ensure that you have `git` installed and configured on your machine as the script relies heavily on it.
- The script assumes that the local git repository has a set remote. If no remote is configured, it will fail.
- It attempts to manage conflicts interactively, offering options to resolve them.

> **Critique:** 
> The script does well in providing an interactive way to handle merges and conflicts, but it could be improved by allowing command-line flags to enable automatic merging in certain cases. Error handling could be further refined to provide more detailed feedback for each command's failure, especially regarding network issues when fetching from remotes. Also, consider providing more detailed logging of actions taken for easier debugging and tracking of the sync process.