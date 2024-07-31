# File Editor Script

---

**[editor.sh](/editor.sh)**: Edit any file in current folder or subfolders (recursively)

---

### Dependencies

- `nvim`: Neovim text editor for file editing.
- `fzf`: Command-line fuzzy finder.
- `fd`: Simple, fast and user-friendly alternative to `find`.
- `bat`: A `cat` clone with syntax highlighting and Git integration.
- `chezmoi`: Manage your dotfiles with this tool.
- `rg`: Ripgrep, a line-oriented search tool.

### Description

This script provides a straightforward way to edit files using the Neovim text editor from the command line. It allows users to select files interactively through `fzf`, supporting both sudo permissions and customizable search options. 

The script includes various command-line options:

- **`-S` or `--sudo`**: Edit files with elevated permissions.
- **`-c` or `--cwd`**: Restrict search to the current directory only.
- **`-C` or `--config`**: Edit configuration files using `chezmoi` to manage dotfiles.
- **`-h` or `--help`**: Display the help message.

The script constructs a command that uses `fd` to find files while excluding common binaries and large files to streamline the search. The selected file is opened in Neovim, and if the `sudo` option is activated, users can edit system files requiring elevated permissions.

### Usage

To run the script, execute the following command in the terminal:

```bash
./editor.sh [options]
```

Here are some examples of how to use the script:

- **Edit a file in the current directory**:
  ```bash
  ./editor.sh
  ```

- **Edit a file with sudo permissions**:
  ```bash
  ./editor.sh --sudo
  ```

- **Find files only in the current directory**:
  ```bash
  ./editor.sh --cwd
  ```

- **Edit configuration files**:
  ```bash
  ./editor.sh --config
  ```

You can also view the help dialog at any time by running:

```bash
./editor.sh --help
```

---

> [!TIP]  
> To improve this script, think about adding checks for the dependencies to ensure they are installed before execution. Additionally, consider improving the user experience by providing file previews in the selection interface, enhancing usability significantly.
