# Editor Script for File Editing

---

**editor.sh**: A script to edit files in the current folder or its subfolders using fzf.

---

### Dependencies

- `nvim`: The Neovim text editor for file editing.
- `fzf`: A command-line fuzzy finder used for selecting files.
- `fd`: A simple, fast, and user-friendly alternative to `find`.

### Description

This script simplifies the process of editing files in the current directory or its subdirectories by integrating **fzf** and **nvim**. When executed, it displays a list of files that can be searched and filtered through fuzzy matching provided by **fzf**.

The script provides flexibility through different modes:

- **sudo mode** for editing files with root privileges.
- **current working directory mode** to limit the search to the current directory.
- **config mode** designed for modifying specific configuration files.

Files irrelevant to text editing are excluded from the search, such as images, archives, and certain data formats.

The command used to find files is built by the `get_fd_cmd` function based on the selected mode. It generates an appropriate `fd` command, applying various filters to exclude unnecessary files while still allowing the retrieval of hidden files when required. 

### Usage

To run the script, navigate to the desired directory in a terminal and execute:

```bash
./editor.sh [OPTIONS]
```

#### Options:

- `-S, --sudo`: Opens files with sudo.
- `-c, --cwd`: Limits the file search to the current directory only.
- `-C, --config`: Enables editing of configuration files.
- `-h, --help`: Displays the help message.

#### Example Commands:

1. Edit a file normally:

```bash
./editor.sh
```

2. Edit a file with sudo permissions:

```bash
./editor.sh --sudo
```

3. Edit files only in the current directory:

```bash
./editor.sh --cwd
```

---

> [!TIP]
> This script could benefit from additional error handling, particularly when invoking external commands like `nvim` and `fzf`. Including checks to verify the presence of required dependencies before executing the script would enhance usability. Additionally, it is advisable to avoid using `sudo` arbitrarily, as it could potentially open sensitive files or folders inadvertently. Consider incorporating a confirmation mechanism when using `sudo`.