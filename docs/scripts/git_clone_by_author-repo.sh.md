# Git Clone by Author/Repo

---

**[git_clone_by_author.sh](/git_clone_by_author.sh)**: A script to clone git repositories based on developer/package name using various options.

---

### Dependencies

- `git`: A version control system required to clone repositories from GitHub.

### Description

This script simplifies the process of cloning GitHub repositories by allowing users to specify options for SSH cloning, local repository cloning, or HTTPS cloning. The script defines a usage function that displays the correct command-line usage if the user inputs incorrect arguments or fails to provide sufficient input. 

Here’s how the script works:

- It sets a default directory for cloning repositories, with the option to customize it via the `GIT_REPOS` environment variable.
- It assesses command-line flags:
  - `-s` or `--ssh`: This flag enables SSH cloning.
  - `-l` or `--local`: This flag allows specifying a local path from which to clone.
- It ensures that only one of these options can be selected at a time.
- The main parameters expected from the user are `developer/package`, which the script extracts to determine the appropriate subdirectory.

The target directory structure is organized as:

```plaintext
$GIT_REPOS/
└── developer/
    └── package/
```

### Usage

To utilize this script, you can run it in your terminal. Below are the command examples:

```bash
# Clone using HTTPS
./git_clone_by_author-repo.sh user/repo

# Clone using SSH
./git_clone_by_author-repo.sh -s user/repo

# Clone a local repository
./git_clone_by_author-repo.sh -l /path/to/local/repo user/repo
```

**Command-line arguments:**
- `-s`, `--ssh`: Use SSH for cloning the repository.
- `-l`, `--local <path>`: Clone a repository from a local path.

If the command is executed without valid options or with incomplete input, the script will display the correct usage format to guide the user.

---

> [!TIP]  
> The script could be improved by implementing error handling for the `git clone` command to provide clear feedback in case of failures (e.g., incorrect SSH key, invalid repository name). Additionally, consider allowing the user to specify a custom directory for repos as a command-line option for further flexibility.
