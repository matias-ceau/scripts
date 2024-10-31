# fzf-based File Editor

---

**editor.sh**: Quickly edit files by searching with `fzf`.

---

### Dependencies

- `nvim`: Neovim text editor for opening files.
- `fzf`: A command-line fuzzy finder to navigate file selections.
- `fd`: A faster alternative to `find`, for listing file paths.
- `bat`: A cat clone with syntax highlighting.
- `chezmoi`: To manage personal configuration files.

### Description

This script enhances your ability to edit files using `fzf` for fuzzy searching and `nvim` for editing. Depending on the options provided, it searches through directories, filtering non-editable files, in a concise manner to help you quickly find and edit the file you need. The script uses `fd` to locate files efficiently, respecting various modes such as `sudo`, `scripts`, `current working directory` (`cwd`), `config` (`chezmoi unmanaged`), or a user-specified directory. It excludes a comprehensive list of non-editable file extensions and directories.

When run, it opens a file selector dialog with `fzf` where you can press `<C-H>` to toggle searching hidden files and `<C-S>` to exclude them.

### Usage

The script can be invoked from the terminal with the following options:

```bash
./editor.sh [-s|--scripts] [-c|--cwd] [-C|--config]
            [-d|--dir <dir>] [-S|--sudo] [-h|--help]
```

- `-s, --scripts`     : Search in the user's `$SCRIPTS` directory.
- `-c, --cwd`         : Search within the current directory.
- `-C, --config`      : Open configuration files managed by `chezmoi`.
- `-d, --dir <dir>`   : Specify a directory to search in.
- `-S, --sudo`        : Edit files with administrative privileges.
- `-h, --help`        : Display usage help.

Example usage to find a file in the current directory:
```bash
./editor.sh --cwd
```

---

> [!NOTE]
> - The script includes many hardcoded directories and file types to exclude, which may not fit all user needs. Consider making these customizable via configuration files or command-line arguments.
> - The reliance on `$SCRIPTS` and `$LOCALDATA` environment variables requires them to be set correctly in your shell.
> - Using `sudo` with `nvim` through this script might not allow `nvim` to fully utilize all features. Consider using a configuration that enables full access in `sudo` mode.