# git_clone_by_author-repo.sh

---

Clone Git repositories based on developer/package format with options for SSH or local paths.

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

- Git must be installed on the system.

<a name="description" />

### Description

<a name="overview" />

#### Overview

The `git_clone_by_author-repo.sh` script provides a convenient way to clone Git repositories from GitHub based on the `developer/package` format. Users can choose to clone using either SSH or HTTP(S) protocols, or specify a local repository. The script employs Bash and utilizes git's cloning capabilities, organizing the repositories into a predefined directory structure.

The script parses command-line arguments to identify whether the user prefers SSH cloning, local cloning, or the default HTTPS method. The default directory for cloning repositories can be set via the `GIT_REPOS` environment variable; if not set, it defaults to `$HOME/git`.

Key Features:
- Supports cloning via SSH or HTTPS.
- Allows specifying a local git repository for cloning.
- Organizes cloned repositories by developer name.

---

<a name="usage" />

#### Usage

To use the script, execute it from the command line with the following syntax:

```bash
./git_clone_by_author-repo.sh [-s | -l <path>] developer/package
```

- `-s`, `--ssh`: Clones the repository using SSH (format: `git@github.com:developer/package.git`).
- `-l`, `--local <path>`: Clones from a local repository specified by `<path>`.
- `developer/package`: Specify the GitHub repository in the format of `developer/package`.

**Example Command**:
```bash
./git_clone_by_author-repo.sh -s johnDoe/myRepo
```

---

<a name="examples" />

#### Examples

1. Cloning a repository using SSH:
   ```bash
   ./git_clone_by_author-repo.sh -s johnDoe/myRepo
   ```

2. Cloning from a local path:
   ```bash
   ./git_clone_by_author-repo.sh -l /path/to/local/repo johnDoe/myRepo
   ```

3. Default HTTPS cloning:
   ```bash
   ./git_clone_by_author-repo.sh johnDoe/myRepo
   ```

---

<a name="notes" />

### Notes

- Ensure to have SSH keys set up and added to the GitHub account when using the SSH option.
- The script will create a directory for each developer under the specified cloning directory if it does not already exist.
- It is advisable not to mix the use of the `-s` and `-l` options simultaneously as the script restricts this.

> **Critique**: 
> While the script is functional, a few improvements could enhance usability:
> - Add error handling for the `git clone` command to manage cases where the cloning fails.
> - Implement validation to check if the provided developer/package format is correct before attempting to clone.
> - Consider providing more verbose output during the cloning process to inform the user of the steps being executed.