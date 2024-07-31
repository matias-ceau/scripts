# Sync Git Repository (sync-repo.sh)

---

A script to sync a Git repository with fetch, rebase, and handle conflicts.

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

- `git`: Required for version control operations.
- `bat`: Optional, for enhanced command output formatting.
- `glow`: Optional, for displaying markdown in the terminal.
- `bash`: The shell used to run the script.

<a name="description" />

### Description

<a name="overview" />

#### Overview

This script allows users to synchronize a specified Git repository by fetching the latest changes and rebasing any local commits. It is designed to handle various scenarios including conflicts that may arise during the rebase process. The script provides a user-friendly interface, colorful outputs for better readability, and utilizes external commands like `bat` and `glow` to improve the presentation of outputs.

The script performs the following key functions:
- Checks for the presence of `bat` and `glow` for enhanced output formatting.
- Strips ANSI escape sequences from text for compatibility with plain text.
- Runs Git commands and displays their outputs in real-time.
- Handles any merge conflicts that arise during the rebase process interactively.
- Provides usage instructions and summary reports at the end of execution.

---

<a name="usage" />

#### Usage

To use the script, navigate to your terminal and execute the script while providing the path to the target Git repository as an argument. For example:
```bash
bash sync-repo.sh /path/to/your/repo
```

If no repository path is supplied, the script will print usage instructions.

<a name="examples" />

#### Examples

- Syncing a repository located in `~/.scripts`:
```bash
bash sync-repo.sh ~/.scripts
```
- Syncing a different repository:
```bash
bash sync-repo.sh ~/projects/my-repo
```

---

<a name="notes" />

### Notes

- Ensure that the repository is a valid Git repository with a `.git` directory.
- If `bat` or `glow` is not installed, the script will still function but with less visually appealing output.
- Users can customize the editor used during conflict resolution via the `EDITOR` environment variable.

> **Critique:**
> 
> The script effectively manages Git operations and handles conflicts interactively. However, it could structure error messages and prompts with more clarity, especially for users unfamiliar with Git commands. Additionally, incorporating logging functionality could help users track operations over time or diagnose issues if they arise.