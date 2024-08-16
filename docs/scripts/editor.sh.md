# File Editor with fzf 

---

**editor.sh**: Quickly edit files using `fzf` to find them across specified directories.

---

### Dependencies

- `fd`: A simple, fast, and user-friendly alternative to `find`. It is used to search files.
- `fzf`: A command-line fuzzy finder, enabling you to interactively search files.
- `bat`: A cat clone with syntax highlighting and Git integration, used to preview files.

### Description

The `editor.sh` script allows users to search for files using `fzf` and edit them in `neovim`. By utilizing `fd` for file discovery, it efficiently handles searches based on various user-defined options like directories or specific flags for configurations and scripts.

The script excludes non-editable files like images, audio files, and various others using a robust list of patterns. This makes it particularly useful for developers and system administrators who need to focus only on relevant files in their workflows.

### Usage

To execute the script, run it in the terminal. Here are the available options:

```bash
./editor.sh [-s|--scripts] [-c|--cwd] [-C|--config] \
            [-d|--dir <dir>] [-S|--sudo] [-h|--help]
```

- **No arguments**: Searches in default directories.
- `-s` or `--scripts`: Only searches files in the user’s `$SCRIPTS` directory.
- `-c` or `--cwd`: Limits the search to the current working directory.
- `-C` or `--config`: Searches for ChezMoi unmanaged configuration files.
- `-d <dir>`: Searches files within the specified directory.
- `-S` or `--sudo`: Opens files with sudo permissions.
- `-h` or `--help`: Displays the help message.

For example, to edit a file located in your scripts directory, use:

```bash
./editor.sh --scripts
```

To edit a configuration file, you can execute:

```bash
./editor.sh --config
```

---

> [!TIP]   
> Consider refining the list of excluded files based on your specific needs, as maintaining a comprehensive exclusions list can enhance performance and user experience. Additionally, implementing a more dynamic method for including or excluding certain directories might simplify usage for varying contexts.