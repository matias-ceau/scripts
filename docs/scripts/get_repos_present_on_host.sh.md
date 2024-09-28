# Repository Host Scanner

---

**get_repos_present_on_host.sh**: Script to list and document Git repositories present on the host machine.

---

### Dependencies

- `bash`: The script runs in a bash environment.
- Required environment variables:
  - `GIT_REPOS`: This should be set to the root directory where Git repositories are stored.
  - `LOCALDATA`: This should be set to the directory where output files will be stored.

### Description

This script is designed to scan a specified directory for Git repositories on the host machine and document them. It relies on two environment variables: `GIT_REPOS`, which indicates where to search for repositories, and `LOCALDATA`, which specifies where to store the output.

Upon execution, it checks if these environment variables are set. If they aren't, the script exits with an error message. It then uses the `hostname` command to create a unique output file name based on the host's name and organizes the list of found repositories into a structured text format.

The script:
1. Searches recursively under `$GIT_REPOS` for directories named `.git`.
2. Formats the output to list only the repository names.
3. Saves these repository names into a host-specific file.
4. Ensures the output files are sorted and free of duplicates.
5. Aggregates this list into a general file for tracking all repositories across different hosts.

### Usage

To use this script, ensure the necessary environment variables are set:

```sh
export GIT_REPOS="/path/to/your/git/directories"
export LOCALDATA="/path/to/store/output"
```

Run the script from a terminal:

```sh
bash /home/matias/.scripts/get_repos_present_on_host.sh
```

The script is mostly designed to be run from the command line and can be integrated into larger automation or maintenance routines or even assigned to a keybinding in qtile for quick access.

---

> [!CAUTION]
> An assumption is made that all git repositories contain a `.git` directory directly under the path specified by `GIT_REPOS`. If repositories are organized differently, you may need to adjust the `find` command's directory level filtering via the `awk -F/ 'NF==2'` part. Additionally, handling the script's output in error situations could be enhanced for more robust logging, especially for large-scale automation.