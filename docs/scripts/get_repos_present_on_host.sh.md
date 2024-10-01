# Get Repositories Present on Host

---

**get_repos_present_on_host.sh**: Script to list Git repositories localized on the current host and update them into a summary.

---

### Dependencies

- `bash`: Shell environment required for execution.
- `find`: Utility to search for files and directories within the specified paths.
- `sed`: Stream editor for filtering and transforming text.
- `awk`: Pattern scanning and processing language, used for formatting output.

### Description

This Bash script is designed to identify and list Git repositories present on the local filesystem as specified by the `GIT_REPOS` environment variable. It captures the username's hostname to generate distinct output files under the `LOCALDATA` directory.

The script follows these steps:
1. It checks if the `GIT_REPOS` and `LOCALDATA` environment variables are set,. If not, it exits with an error message.
2. It retrieves the current hostname using `hostnamectl`.
3. It constructs output file paths for both the individual host's repositories and a collective file for all repositories.
4. The script creates the necessary directories if they do not already exist.
5. It uses the `find` command to search for directories containing `.git`, formats the output to derive the relative paths, and writes them to the host-specific output file.
6. Both the host-specific file and a cumulative file are sorted and deduplicated to ensure unique entries.
7. Lastly, it confirms the update process with a success message.

### Usage

To use this script, you should ensure the environment variables `GIT_REPOS` and `LOCALDATA` are correctly set. You can execute this script from the terminal as follows:

```bash
export GIT_REPOS="/path/to/your/git/repositories"
export LOCALDATA="/path/to/store/output"
bash /home/matias/.scripts/get_repos_present_on_host.sh
```

This command will:
- Search for Git repositories under the specified `GIT_REPOS` directory.
- Generate a text file listing the repositories located on the current host.
- Append the listings to a cumulative repositories file. 

You can assign this script to a keybinding or schedule it with a cron job if you wish to automate the updates.

---

> [!TIP]  
> Consider adding error handling for cases where the `find` command may not locate any `.git` directories, or when writing to the output files. Including a verbose mode could also be beneficial for tracking the processing steps.