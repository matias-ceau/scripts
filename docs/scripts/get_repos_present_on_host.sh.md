# Get Repositories Present on Host

---

**get_repos_present_on_host.sh**: Script to list git repositories in a specified directory and organize them by hostname.

---

### Dependencies

- `bash`: The script runs in a Bash shell.
- `find`: Used to locate `.git` directories within the specified path.
- `sed`: Utilized for text processing to format the output.
- `awk`: Helps in filtering and formatting the output based on directory structure.
- `sort`: Employed to sort the list of repositories and remove duplicates.

### Description

This script automates the process of gathering all git repositories located in a specified directory and organizes them according to the hostname of the device. It begins by checking for two essential environment variables: `GIT_REPOS`, which should point to the root directory containing the git repositories, and `LOCALDATA`, which determines where output files will be stored. If either variable is not set, the script exits with an error message.

The core functionality involves:

1. **Finding Repositories**: It uses the `find` command to search for directories that end with `.git` within `GIT_REPOS`. The output is modified by `sed` to strip unnecessary parts, hence returning only the relative repository paths.

2. **Sorting and Duplicating**: Once the repositories are found, they are sorted and any duplicates are removed. This ensures that the output is clean and organized.

3. **Saving Output**: The script saves the current list of repositories to a file named after the hostname, located in the specified `LOCALDATA` path. It also appends this list to a comprehensive `all-repos.txt` file while maintaining uniqueness.

### Usage

To run the script, ensure that the required environment variables are set and execute it in a terminal:

```bash
export GIT_REPOS="/path/to/your/git/repos"
export LOCALDATA="/path/to/local/data"
bash /home/matias/.scripts/get_repos_present_on_host.sh
```

This script can also be connected to a scheduler or a keybinding for convenience in usage. Simply ensure that environment variables are set up correctly before execution.

---

> [!TIP] 
> This script could be enhanced by adding logging capabilities to better track any issues that arise during execution. Moreover, error handling could be improved to capture failures in the `find` or `sort` commands. A configurable option to specify the output format (e.g., JSON or CSV) could also make the script more versatile.