# Repository List Generator

---

**get_repos_present_on_host.sh**: Script to list Git repositories present on the current host.

---

### Dependencies

- `bash`: The script is written in bash and requires it to be executed.
- `hostnamectl`: Utilized to fetch the current hostname.
- `find`, `sed`, `awk`, `sort`, `mkdir`, `echo`: Standard Unix tools used to process and manage file paths.

### Description

This script is designed to scan through a specified directory to locate Git repositories that are present on the host machine. It's an efficient tool for organizing and documenting your local repositories based on the host identity.

- **Environment Variables**:
  - `GIT_REPOS`: The base directory where all Git repositories are stored.
  - `LOCALDATA`: The base directory where output files should be saved.

The script performs the following tasks:
1. Fetches the current hostname using `hostnamectl`.
2. Constructs paths for output files based on the hostname.
3. Ensures the output directory exists.
4. Locates and lists all Git repositories under the `GIT_REPOS` directory with specific structure.
5. Outputs this list to a file named after the host in the `LOCALDATA/docs/git_repos/` directory.
6. Appends this list to a file `all-repos.txt` to maintain a comprehensive record.
7. Sorts and removes duplicates in both output files to ensure uniqueness.

### Usage

To use the script, make sure the environment variables `GIT_REPOS` and `LOCALDATA` are set. You can execute the script directly from the terminal. Here is a typical usage pattern:

```bash
export GIT_REPOS=/path/to/your/repositories
export LOCALDATA=/path/to/save/data
/home/matias/.scripts/bin/get_repos_present_on_host.sh
```

This will produce text files in the format `/path/to/save/data/docs/git_repos/[HOSTNAME]-repos.txt` listing all unique repositories for the current host.

---

> [!TIP]
> The script assumes that repositories have a specific directory depth (two directories from the base `GIT_REPOS` path). If your repository structure varies, consider modifying the `awk` command accordingly. Additionally, error handling can be enhanced by checking for failure cases after critical operations like `mkdir` or `find`.