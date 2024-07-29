# git_clone_by_author-repo.sh

# get git repos

This script clones a specified GitHub repository into a local directory. Users can choose to clone the repository using either HTTPS or SSH. Additionally, it supports cloning from a local path.

## Usage

```bash
./get_git_repos.sh [-s | -l <path>] developer/package
```

### Options

- `-s`, `--ssh`: Use SSH for cloning the repository (e.g., `git@github.com:developer/package.git`).
- `-l <path>`, `--local <path>`: Use a local repository with the specified path for cloning.

### Parameters

- `developer/package`: Specifies the GitHub repository to clone, where `developer` is the username/organization and `package` is the repository name.

### Examples

1. Clone a repository using HTTPS:

```bash
./get_git_repos.sh developer/package
```

2. Clone a repository using SSH:

```bash
./get_git_repos.sh -s developer/package
```

3. Clone from a local repository path:

```bash
./get_git_repos.sh -l /path/to/local/repo developer/package
```

## Script Behavior

1. **Verify Arguments**: The script checks if the necessary arguments are provided.
2. **Set Default Directory**: The script sets the default directory for storing cloned repositories to `$HOME/git` unless overridden.
3. **Process Options**: The script processes options for using SSH or local repository path.
4. **Validate Conflicts**: Ensures that both SSH and local path options are not used simultaneously.
5. **Extract Developer and Package**: Extracts the developer and package name from the provided repository string.
6. **Create Target Directory**: Creates the target directory if it doesn't exist.
7. **Clone Repository**: Clones the repository using the chosen method (HTTPS, SSH, or local path).

## Exit Codes

- `0`: Success
- `1`: Invalid usage or conflicting options provided

## Author

Generated automatically

## License

This script is provided as is, without any warranty. Use at your own risk.