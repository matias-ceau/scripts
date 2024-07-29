# git_pull.sh

**Script Description**

This is a Bash script designed to clone Git repositories from GitHub. It provides options for cloning using SSH, local repositories, or HTTPS.

**Functionality**

The script takes a single argument: `developer/package`. This can be either:

* A package name alone (e.g., `package`)
* A developer name followed by a slash and the package name (e.g., `developer/package`)

The script then parses command-line options using a `while` loop, which allows for the following features:

* `-s`, `--ssh`: Clones the repository using SSH protocol.
* `-l`, `--local`: Specifies a local path to clone from instead of GitHub.

If both `-s` and `-l` are specified together, the script exits with an error message.

The script uses environment variables and Bash built-ins to:

1. Determine the default Git repositories directory (`$HOME/git`).
2. Extract the developer name and package name from the input argument.
3. Create a target directory for the cloned repository.
4. Use `git clone` to download the repository, either using SSH, local path, or HTTPS protocol.

**Usage**

To use this script, save it as a file (e.g., `get_git_repos.sh`) and make it executable with `chmod +x get_git_repos.sh`. Then, execute it from the command line, providing the required argument: `./get_git_repos.sh developer/package`.

Example usage:

* Cloning using SSH: `./get_git_repos.sh -s package`
* Cloning using local path: `./get_git_repos.sh -l /path/to/local/repo package`
* Cloning using HTTPS (default): `./get_git_repos.sh package`