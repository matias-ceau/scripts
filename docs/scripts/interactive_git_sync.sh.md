# Interactive Git Sync

---

**interactive_git_sync.sh**: Script to synchronize multiple repositories interactively using `fzf`.

---

### Dependencies

- `bash`: The script is written for and requires `bash`.
- `fzf`: A command-line fuzzy finder that allows selecting repositories interactively.
- `awk`: Used to process and assemble the command line for each repository.
- `sync-repo.sh`: A local script assumed to be located in `$SCRIPTS` that handles the actual synchronization process.
  
### Description

The `interactive_git_sync.sh` is a Bash script designed to facilitate interactive synchronization across multiple Git repositories. It leverages the power of `fzf` for selecting repositories you want to sync. A list of repositories is presented using environment variables such as `$CHEZMOI`, `$SCRIPTS`, `$LOCALDATA`, `$PSYRIS`, and a specific Git repository path `$GIT_REPOS/matias-ceau/ondansetron`.

The script constructs a command for each repository using the underlying `sync-repo.sh` script, which is presumed to reside in the location indicated by the `$SCRIPTS` variable. By default, it provides the functionality to perform a dry run by including `--dry-run` as a command-line argument.

### Usage

To utilize this script, you need to:

1. Ensure all required environment variables (`$CHEZMOI`, `$SCRIPTS`, etc.) are properly set.
2. Run the script in your terminal:
    ```bash
    $ /home/matias/.scripts/bin/interactive_git_sync.sh
    ```
3. Optionally use the `--dry-run` flag to see what changes would occur:
    ```bash
    $ /home/matias/.scripts/bin/interactive_git_sync.sh --dry-run
    ```
4. Use `fzf` interface to select the repository you wish to sync.

Ensure that the `sync-repo.sh` is executable and configured correctly to handle repository synchronization.

---

> [!CAUTION]
> The script assumes that necessary environment variables are set up before being invoked, which might not be ideal for all users. Consider adding error handling for unspecified environment variables.
> Furthermore, specifying the repository paths directly within the script might limit scalability. You might consider reading the repository paths from a configuration file or improving the script to scan for repositories automatically.