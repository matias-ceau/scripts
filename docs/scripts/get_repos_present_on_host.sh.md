# Get Repositories Present on Host

---

**[get_repos_present_on_host.sh](/get_repos_present_on_host.sh)**: Script to list git repositories on the local host and save to files.

---

### Dependencies

- `bash`: The script is a Bash script that requires a compatible shell for execution.
- `git`: This script is designed to work with git repositories, so git must be installed on your system.

### Description

This script scans for all git repositories in a specified directory, formats the output, and saves the results to two text files. It requires two environment variables, `GIT_REPOS` (the root directory containing git repositories) and `LOCALDATA` (the path where output files should be saved).

1. **Script Setup**: The script first checks if the required environment variables are set. If not, it exits with an error message.
2. **Hostname Usage**: It retrieves the system's hostname and constructs file names based on it.
3. **Directory Creation**: It ensures that the output directory exists before attempting to write to it.
4. **Finding Repositories**: The script uses `find` to locate directories named `.git`, followed by `sed` to clean up the path and `awk` to filter the results to include only top-level repositories.
5. **Sorting and Deduplication**: It sorts the repository names, removes any duplicates, and appends the results to a file listing all repositories.
6. **Output Confirmation**: Finally, it outputs a message confirming the update.

### Usage

To use this script, set the required environment variables and execute the script from your terminal:

```bash
export GIT_REPOS="/path/to/your/git/repositories"
export LOCALDATA="/path/to/store/output/files"
bash /home/matias/.scripts/get_repos_present_on_host.sh
```

Once executed, you can find:
- A file at `$LOCALDATA/docs/git_repos/<hostname>-repos.txt` containing a list of repositories scoped to your hostname.
- An aggregate file at `$LOCALDATA/docs/git_repos/all-repos.txt` containing a comprehensive list of all repositories across hosts.

---

> [!TIP] Consider implementing error handling for the `find` command to manage scenarios where no repositories are found, or the specified paths are incorrect. Additionally, enhancing the script to accept command-line parameters for `GIT_REPOS` and `LOCALDATA` could improve flexibility.
