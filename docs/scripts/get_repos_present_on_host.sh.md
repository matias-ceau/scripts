# Get Repositories Present on Host (get_repos_present_on_host.sh)

---

This script collects Git repository paths from a specified directory and saves them to a file.

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
- Environment variables: `GIT_REPOS`, `LOCALDATA` must be set.

<a name="description" />

### Description

<a name="overview" />

#### Overview

The `get_repos_present_on_host.sh` script is designed to gather all Git repositories located within a specified directory provided by the `GIT_REPOS` environment variable. It performs the following key steps:

1. **Ensure Environment Variables**: Checks if the `GIT_REPOS` and `LOCALDATA` environment variables are set before proceeding. This ensures that the script has the necessary paths to operate correctly.

2. **Determine Hostname**: Retrieves the system's hostname to create a uniquely named output file for the user’s repositories.

3. **Output Path Definition**: Creates the necessary output paths for storing the list of repositories, both for the hosting machine and a global list.

4. **Repository Discovery**: Utilizes the `find` command to search for directories ending with `.git` within `GIT_REPOS`, formats the output to retrieve clean repository names, and saves them to a dedicated file for the local machine.

5. **Deduplication and Append**: Sorts the repository names to ensure uniqueness and appends them to a comprehensive list of all known repositories, also maintaining uniqueness for that list.

---

<a name="usage" />

#### Usage

To execute this script, ensure that the required environment variables are set, then run it directly from the terminal:

```bash
export GIT_REPOS="/path/to/your/local/git/repos"
export LOCALDATA="/path/to/store/output"
./get_repos_present_on_host.sh
```

The script can also be assigned to a keybinding or run periodically via a cron job.

<a name="examples" />

#### Examples

1. Set environment variables and execute:
   ```bash
   export GIT_REPOS="/home/user/git"
   export LOCALDATA="/home/user/data"
   ./get_repos_present_on_host.sh
   ```

2. After running, check the output in the specified directories:
   ```bash
   cat /home/user/data/docs/git_repos/$(hostname)-repos.txt
   cat /home/user/data/docs/git_repos/all-repos.txt
   ```

---

<a name="notes" />

### Notes

- Make sure the paths provided to `GIT_REPOS` and `LOCALDATA` are correct and accessible.
- This script only retrieves repositories with a depth of 2 (indicated by `NF==2`), which means it expects them to be nested directly under the `GIT_REPOS` path.

> **Critique**: 
> The script currently does not handle the case where the `find` command returns no repositories. Adding a check after the repository discovery step could prevent an empty file from being created. Additionally, consider adding more descriptive logging for better troubleshooting, especially if it is intended for use in various environments.