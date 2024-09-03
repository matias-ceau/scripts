# Get Repositories Present on Host

---

**get_repos_present_on_host.sh**: A script to list Git repositories present on the current host.

---

### Dependencies

- `bash`: The shell interpreter used to run the script.
- `git`: Required to identify Git repositories.
- `awk`, `sed`, and `sort`: Utilities for processing text and output formatting.

### Description

This script is designed to find and list all Git repositories located in a specified directory on the host machine. It requires two environment variables to be set: `GIT_REPOS`, which should point to the directory containing the repositories, and `LOCALDATA`, which is the base directory for saving output files.

Upon execution, the script performs the following operations:

1. **Check Environment Variables**: Verifies that both `GIT_REPOS` and `LOCALDATA` are set, exiting with an error message if not.
2. **Get Hostname**: Captures the hostname of the machine to customize output file names.
3. **Output File Paths**: Defines the paths for a host-specific repositories output file and a cumulative all-repositories file.
4. **Create Output Directory**: Ensures the output directory exists, creating it if necessary.
5. **Find and Format Repositories**: Locates all directories named `.git` within `GIT_REPOS` and formats the output to list the repository names at the top level.
6. **Sort and Deduplicate**: Eliminates duplicate entries in the host-specific output file and appends the results to a global file that tracks repositories from all hosts, again ensuring there are no duplicates.
7. **Completion Message**: Notifies the user when the updates are successful.

### Usage

To use the script, ensure that the environment variables are set properly and execute it directly in the terminal:

```bash
export GIT_REPOS="/path/to/git/repositories"
export LOCALDATA="/path/to/localdata"
bash /home/matias/.scripts/get_repos_present_on_host.sh
```

You might want to run this script periodically or via a cron job to keep the repository listings current. 

---

> [!TIP]  
Consider adding options for custom output locations or filenames as command-line arguments. This would enhance flexibility, allowing users to specify different output locations without modifying environment variables. Additionally, error handling for cases where no repositories are found could improve user experience.