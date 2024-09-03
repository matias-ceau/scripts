# Git Clone by Author/Repo

---

**git_clone_by_author-repo.sh**: A script for cloning Git repositories by specifying developer and package.

---

### Dependencies

- `git`: A version control system to clone repositories. Ensure `git` is installed on your Arch Linux system.

### Description

This Bash script simplifies the process of cloning Git repositories from GitHub by allowing users to specify the developer and package directly as arguments. It provides flexible options for cloning:

- **SSH URL**: Use SSH for cloning.
- **Local Repository**: Clone from a local path.

The script starts by defining a usage function that outputs the instruction on how to use the script if the input arguments are incorrect. The required structure is:

```
git_clone_by_author-repo.sh [-s | -l <path>] developer/package
```

The key parts of the script include:

- Parsing command-line arguments to check for flags (`-s` for SSH and `-l` for specifying local paths).
- Validating user inputs, ensuring only valid combinations of flags and arguments are permitted.
- Cloning the specified repository into a designated Git directory, which defaults to `~/git`.

### Usage

To use the script, follow the syntax provided below:

1. **Clone using HTTPS**:
   ```
   ./git_clone_by_author-repo.sh developer/package
   ```

2. **Clone using SSH**:
   ```
   ./git_clone_by_author-repo.sh -s developer/package
   ```

3. **Clone from a local repository**:
   ```
   ./git_clone_by_author-repo.sh -l /path/to/local/repo developer/package
   ```

Note that using both `-s` and `-l` together will result in an error, as these options are mutually exclusive.

---

> [!TIP]  
> While the script provides good flexibility, consider adding error handling for git operations to capture and display errors encountered during cloning. Additionally, implementing logging to keep track of cloned repositories could be beneficial for later reference.