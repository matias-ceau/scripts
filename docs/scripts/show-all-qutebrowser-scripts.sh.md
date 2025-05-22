# Show All Qutebrowser Scripts

---

**show-all-qutebrowser-scripts.sh**: Display the content of Qutebrowser's bundled scripts using `bat` for preview

---

### Dependencies

- `qutebrowser`: The package from which scripts are listed.
- `pacman`: Used for querying files installed by qutebrowser (Arch Linux package manager).
- `ripgrep` (`rg`): Filters out directories from the listing.
- `sed`: For text substitution, to format paths.
- `xargs`: Executes `bat` on each listed file.
- `bat`: Syntax-highlighting cat clone, used to preview file content.

---

### Description

This script lists and displays all non-directory files provided by the `qutebrowser` package (likely helper scripts or utilities shipped in its `/usr/bin` or `/usr/share` directories). 

Core steps:

1. `pacman -Ql qutebrowser` lists all files installed by the package.
2. `tail -n 37` takes the last 37 lines, assuming these correspond to the actual scripts (might need tweaking if upstream packaging changes).
3. `rg -v '/$'` filters out directories, only keeping files.
4. `sed 's/^.*qutebrowser //'` strips the leading package/file info, resulting in just paths relative to the root.
5. `xargs bat` sequentially displays the content of these files using `bat` for pretty-printing.

This process produces a quick audit/glance at all Qutebrowser-related scripts, helpful for quickly reviewing helpers, wrappers, or plugin code.

---

### Usage

You can run this script in a terminal:

```
~/.scripts/bin/show-all-qutebrowser-scripts.sh
```

Or assign it to a custom keybinding in Qtile, for example in your `~/.config/qtile/config.py`:

```python
Key([mod], "F12", lazy.spawn("~/.scripts/bin/show-all-qutebrowser-scripts.sh"))
```

#### Example TLDR

```
Show the scripts in the terminal:
$ ~/.scripts/bin/show-all-qutebrowser-scripts.sh

Send output to a file for later viewing:
$ ~/.scripts/bin/show-all-qutebrowser-scripts.sh > qtb_scripts.txt
```

---

> [!NOTE]
> - The use of `tail -n 37` is brittle. If Qutebrowser's packaging changes, this might omit some scripts or include non-scripts. Consider using `awk` or filtering directly for `.sh` or relevant script paths instead.
> - This script only works on Arch (or Arch-like) systems where `pacman` is available.
> - `bat` will error on binary or un-readable files. Adding safeguards for file type could improve robustness.
> - For distribution or portability, checking whether all dependencies are present would be helpful.