# Vimwiki Note Opener

---

**vimwiki.sh**: Open a note in vim with fzf for easy selection

---

### Dependencies

- `vim`: A powerful terminal-based text editor.
- `fzf`: A command-line fuzzy finder, used to select the note to open interactively.

### Description

The `vimwiki.sh` script is a straightforward utility designed to enhance the workflow of managing and accessing notes stored in a directory on your system. It leverages `fzf` to provide a fuzzy search interface, allowing you to quickly locate and open any note file within your designated notes directory (`~/notes`) using `vim`.

Here's how it works:
- It lists all files within the `~/notes` directory.
- The list is then piped into `fzf` where you can interactively search and select a file.
- The chosen file is subsequently opened in `vim` for editing or viewing.

This setup is particularly suited for users who prefer managing notes through a combination of command-line tools and a simple text editor.

### Usage

You can run this script directly in your terminal, which will open a file picker interface to select the note you want to open. 

```sh
sh ~/home/matias/.scripts/bin/vimwiki.sh
```

For a more efficient workflow, you can bind this script to a key combination in your qtile configuration. This allows you to quickly trigger the note-opening process without leaving your current workspace context.

Example of a qtile keybinding:

```python
Key([mod, "shift"], "n", lazy.spawn("sh /home/matias/.scripts/bin/vimwiki.sh")),
```

---

> [!NOTE]
> While this script is functional, it assumes the presence of files in the `~/notes` directory. If no files are present, `fzf` will not provide any output and `vim` will attempt to open a non-existent file. To improve, consider adding error handling for the case where the directory is empty. Additionally, verify and ensure that both `vim` and `fzf` are installed and accessible from your shell environment to avoid runtime errors.