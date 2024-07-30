# Get Repos Present on Host (get_repos_present_on_host.sh)

---

This script retrieves locally stored Git repositories and organizes them into a structured file.

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

- Bash shell
- Environment variables: `GIT_REPOS`, `LOCALDATA`

<a name="description" />

### Description

<a name="overview" />

#### Overview

This script scans a specified directory for Git repositories. It requires two environment variables to be set:

- `GIT_REPOS`: The path where Git repositories are stored.
- `LOCALDATA`: The base path to store generated output files.

Upon execution, the script:
1. Validates the necessary environment variables.
2. Fetches the hostname to dynamically generate repository output filenames.
3. Identifies Git repositories located in the `GIT_REPOS` directory and extracts their paths.
4. Outputs the list of repositories found into a file structured according to the hostname.
5. Compiles a comprehensive list across all hosts into a shared file.

The output for each host is stored in `"$LOCALDATA/docs/git_repos/<hostname>-repos.txt"`, and all repositories are gathered in `"$LOCALDATA/docs/git_repos/all-repos.txt"`.

---

<a name="usage" />

#### Usage

1. Ensure you have set the required environment variables:
   ```bash
   export GIT_REPOS="/path/to/your/git/repositories"
   export LOCALDATA="/path/to/store/output"
   ```
   
2. Run the script from the terminal:
   ```bash
   bash /home/matias/.scripts/get_repos_present_on_host.sh
   ```

This script can also be automated with a cron job or bound to a key combination in your window manager (Qtile) for quick execution.

<a name="examples" />

#### Examples

- To run the script:
  ```bash
  export GIT_REPOS="$HOME/my_git_repos"
  export LOCALDATA="$HOME/data"
  bash /home/matias/.scripts/get_repos_present_on_host.sh
  ```

- Check the output files:
  - Individual hostname-specific repositories: `$LOCALDATA/docs/git_repos/<hostname>-repos.txt`
  - All repositories across hosts: `$LOCALDATA/docs/git_repos/all-repos.txt`

---

<a name="notes" />

### Notes

- Ensure the `$GIT_REPOS` directory contains subdirectories with `.git` folders, as the script specifically looks for those.
- Review output files regularly to manage repository listings effectively.

> **Critique:** 
> The script lacks flexibility in handling special cases, such as an empty `GIT_REPOS` directory. It could benefit from more granular error handling, particularly during file operations. Additionally, including options for more specific filtering of repository paths could enhance functionality, such as filtering by specific project names or dates.