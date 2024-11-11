# Quick File Editor with fzf

---

**editor.sh**: A script for fast file editing using fzf with customizable search paths.

---

### Dependencies

- `fzf`: A command-line fuzzy finder.
- `nvim`: Neovim text editor.
- `bat`: A cat clone with syntax highlighting and Git integration.
- `fd`: A simple, fast, and user-friendly alternative to 'find'.
- `chezmoi`: A tool to manage your dotfiles across multiple machines.
  
### Description

This script allows the user to quickly find and edit files using a fuzzy search interface provided by `fzf`. It utilizes `fd` to search for files, with various modes that specify different directories and permissions for file access. The script intelligently excludes non-editable file types, ensuring only suitable files are listed. The various modes include:

- **Scripts Mode**: Searches within the user's scripts directory.
- **Current Directory Mode**: Limits search to the current working directory.
- **Config Mode**: Targets configuration files unmanaged by `chezmoi`.
- **Custom Directory Mode**: Allows specification of any directory to search.
- **Sudo Mode**: Enables editing files that require root permissions.

### Usage

The script is run from the terminal and accepts multiple options:

```bash
editor.sh [OPTIONS]
```

**Options:**

- `-s`, `--scripts`: Search and edit within the `SCRIPTS` directory.
- `-c`, `--cwd`: Restrict search to the current working directory.
- `-C`, `--config`: Search for config files outside `chezmoi` management.
- `-d`, `--dir <dir>`: Specify a directory to search.
- `-S`, `--sudo`: Execute with `sudo` for editing protected files.
- `-h`, `--help`: Display the help message.

**Examples:**

Edit scripts with sudo:

```bash
editor.sh --sudo
```

Find and edit files in `/home/user/docs`:

```bash
editor.sh --dir /home/user/docs
```

---

> [!NOTE]
> This script excludes a broad range of file types, which may unintentionally exclude files a user might want to edit. Consider a finer-grained control over excluded files, perhaps via a configuration file. Additionally, checking existence of environment variables like `$SCRIPTS` and `$LOCALDATA` would prevent errors in execution.