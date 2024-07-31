# Git Clone by Author/Repo (git_clone_by_author-repo.sh)

---

A script to clone GitHub repositories via SSH or HTTPS based on user preferences.

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

- `git`: Ensure Git is installed on your Arch Linux system.

<a name="description" />

### Description

<a name="overview" />

#### Overview

The `git_clone_by_author-repo.sh` script facilitates the cloning of GitHub repositories, allowing the user to choose the method of cloning (SSH, local, or HTTPS). It creates a directory structure based on the GitHub developer's name and the repository name. The script defaults to using the HTTPS method unless specified otherwise.

The script starts by checking for command-line arguments and validating them against expected input. Depending on the flags provided (-s for SSH and -l for local), it constructs the appropriate clone command which it then executes.

Key functions:
- `usage`: Outputs the usage instructions.
- Constructs the target directory based on environment variables and user inputs.

---

<a name="usage" />

#### Usage

The script is run from the terminal, and requires at least one argument: the repository in the format `developer/package`. It accepts the following options:

```bash
git_clone_by_author-repo.sh [-s | -l <path>] developer/package
```

- `-s`, `--ssh`: Clone using SSH (e.g., `git@github.com:developer/package.git`).
- `-l`, `--local <path>`: Clone from a local repository at the specified `<path>`.

If neither flag is provided, the script clones using HTTPS by default. The environment variable `GIT_REPOS` is used to define the parent directory for cloning repositories, defaulting to `~/git`.

<a name="examples" />

#### Examples

- Clone a repository via HTTPS:
  ```bash
  ./git_clone_by_author-repo.sh user/repo
  ```

- Clone a repository using SSH:
  ```bash
  ./git_clone_by_author-repo.sh -s user/repo
  ```

- Clone a local repository:
  ```bash
  ./git_clone_by_author-repo.sh -l /path/to/local/repo user/repo
  ```

---

<a name="notes" />

### Notes

- Make sure to have SSH keys set up if using the SSH option to avoid authentication issues.
- The script will create necessary directories if they don’t exist, based on the developer's name.

> **Critique:** 
> 
> The script handles basic scenarios effectively but could benefit from enhanced error handling, particularly while cloning. For instance, it does not check if the repository already exists or if there are any issues during the clone process. Additionally, using a more structured method for argument parsing might enhance readability and maintainability. Consider implementing verbose mode to inform users of the cloning process in detail.