# sync-repo.sh

This is a Bash script designed to synchronize a Git repository. Here's a breakdown of its functionality:

**Color Definitions**

The script starts by defining some color codes using ANSI escape sequences, which are used for formatting output.

**Checks for Dependencies**

It checks if the `bat` and `glow` tools are installed on the system. If not, it provides warnings about potentially less-pretty output.

**Functions**

The script defines several functions:

1. `strip_ansi`: removes ANSI escape sequences from a string.
2. `print_command`: prints a command with colored formatting using either `bat` or plain text.
3. `run_command`: runs a Git command and prints its output in real-time, using `print_command`.
4. `handle_error`: handles errors by printing an error message and exiting the script.
5. `print_usage`: prints usage instructions for the script.
6. `print_formatted`: prints a formatted message using either `bat` or plain text.
7. `print_glow`: prints a message with colored formatting using `glow`.
8. `handle_conflicts`: handles conflicts during rebase by prompting the user to choose an option.
9. `display_summary`: displays a sync summary, showing any changes made during the sync.

**Main Logic**

The script checks if a repository path is provided as a command-line argument. If not, it prints usage instructions and exits.

It then:

1. Changes into the specified repository directory.
2. Checks if the directory is a Git repository by looking for a `.git` directory. If not, it handles an error.
3. Fetches the latest changes from the remote repository without merging.
4. Checks if there are any changes to pull. If so, it stashes local changes, pulls with rebase, and applies stashed changes (if any).
5. Runs `git status -s` to check for local changes.
6. If there are changes, it adds them, commits the changes, and pushes them to the remote repository.
7. Runs `git maintenance run`.
8. Prints a success message using `print_glow`.

**Cleanup**

Finally, the script returns to the original directory.

Overall, this script provides a convenient way to synchronize a Git repository, handling conflicts and local changes along the way.