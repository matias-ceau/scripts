# VimWiki Note Opener

---

**[vimwiki.sh](vimwiki.sh)**: Open a note in vim using fzf for quick selection.

---

### Dependencies

- `vim`: A highly configurable text editor. Make sure it's installed to edit notes.
- `fzf`: A command-line fuzzy finder. This is used for selecting notes interactively.

### Description

The `vimwiki.sh` script is a simple shell script designed to facilitate quick access to notes stored in the `~/notes` directory. By utilizing `fzf`, a fuzzy finder, it allows the user to rapidly browse through available notes and select one to open in Vim.

When executed, the script performs the following actions:

1. **Fetches Notes**: It lists all files in the `~/notes` directory using the `ls` command.
2. **Fuzzy Selection**: It pipes the output of the `ls` command into `fzf`, allowing the user to easily search for and select a note using an interactive interface.
3. **Open in Vim**: After a note is chosen, it opens the selected file in Vim for editing.

This method offers a swift and efficient way of managing notes without needing to remember the exact names or paths of the files.

### Usage

To use this script, simply run it from your terminal:

```sh
~/path/to/vimwiki.sh
```

Replace `~/path/to/vimwiki.sh` with the actual path if different. Upon execution, an interactive list of your notes will appear.

Alternatively, you can bind this script to a keyboard shortcut in your window manager (Qtile) or add it as a launcher in your application menu for easier access.

For example, you can add the following command to your Qtile configuration to bind it to a key:

```python
Key([mod], "n", lazy.spawn("sh ~/scripts/vimwiki.sh")),
```

---

> [!TIP] 
> The current script lacks error handling. It may fail if the `~/notes` directory is empty or does not exist. To improve user experience, consider adding checks that display a message if no files are found or if the directory does not exist. Additionally, if you add more file types in the `~/notes` directory, you might want to filter the `ls` output to include only specific extensions.
