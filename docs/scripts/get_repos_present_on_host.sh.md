# Get Repositories Present on Host

---

**get_repos_present_on_host.sh**: Script to list Git repositories present on the current host and store them.

---

### Dependencies

- `bash`: The script is written in Bash and will require a Bash shell to execute.
- `find`: Used to search for `.git` directories.
- `sed`: Utilized for manipulating the output to the desired format.
- `awk`: Employed to filter and format repository paths.
- `sort`: Needed to sort the repository names and remove duplicates.

### Description

This Bash script fetches and lists Git repositories that are located in the directory specified by the environment variable `GIT_REPOS`. It works by locating all directories containing a `.git` folder, extracting the repository names, and saving them to a local output file specific to the hostname obtained via `hostnamectl`. Additionally, it appends the found repositories to a collective file that maintains a list of all repositories across different hosts.

Here’s how the script works step-by-step:

1. **Environment Variable Checks**: The script begins by verifying that the environment variables `GIT_REPOS` and `LOCALDATA` are set. If either is missing, the script will exit with an error message.
   
2. **Hostname Retrieval**: It retrieves the current hostname using `hostnamectl`.

3. **Output File Definitions**: Defines paths for individual host output and a cumulative all-repos file.

4. **Directory Creation**: Ensures the target directory exists by creating it if it doesn't.

5. **Repository Discovery**: Uses the `find` command to locate `.git` directories, formats the output with `sed` and `awk` to obtain clean repository names.

6. **Sorting and Deduplication**: The script sorts the repository names, ensuring there are no duplicates before saving them to the output files.

7. **Success Message**: Finally, it provides user feedback once the repository list is updated successfully.

### Usage

Before executing the script, ensure the environment variables are set:

```bash
export GIT_REPOS="/path/to/your/git/repositories"
export LOCALDATA="/path/to/your/local/data"
```

To run the script, simply execute:

```bash
bash /home/matias/.scripts/get_repos_present_on_host.sh
```

This will update the appropriate files with the found repositories.

---

> [!TIP]  
> The script currently does not handle situations where the paths specified in `GIT_REPOS` do not exist or are not accessible. Implementing error handling for such cases can improve robustness. Additionally, consider implementing logging to track operations performed by the script and potential errors.