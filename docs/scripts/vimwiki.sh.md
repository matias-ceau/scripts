# VimWiki Note Opener

---

**vimwiki.sh**: Open a note in vim with fzf

---

### Dependencies

- `vim`: A highly configurable text editor used primarily for text editing.
- `fzf`: A command-line fuzzy finder that enables searching through files and directories quickly.

### Description

The `vimwiki.sh` script allows users to open notes stored in the `~/notes` directory using the Vim text editor. The utility of this script lies in its integration with `fzf`, which provides a convenient way to perform fuzzy searching on the filenames within the specified directory. This makes it significantly easier to locate and open notes without having to browse manually.

In essence, when executed, the script lists all files in the `~/notes` directory with `ls`, pipes that list to `fzf`, and then opens the selected file in `vim`. This combination offers a smooth and efficient workflow for note-taking.

### Usage

To use the script, simply execute it from the terminal. Here's how you can run it:

```sh
sh ~/scripts/vimwiki.sh
```

Alternatively, to make it even easier, you can bind it to a key in your window manager (Qtile) or create a shortcut in your desktop environment.

For instance, this could be set up in your Qtile configuration file:

```python
Key([mod], "n", lazy.spawn("sh /home/matias/.scripts/vimwiki.sh")),
```

This will allow you to open the note selection interface with the combination of your chosen modifier (e.g., `mod` + `n`).

---

> [!TIP]  
> Consider adding error handling to check if the `~/notes` directory exists and is not empty. If it’s empty, provide a user-friendly message. Additionally, consider enhancing the script to filter the file types shown in `fzf` to make it more context-specific (e.g., only `.md` files if your notes follow that format).