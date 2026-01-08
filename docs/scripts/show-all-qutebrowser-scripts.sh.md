# Show all qutebrowser scripts (packaged files)

---

**show-all-qutebrowser-scripts.sh**: Display qutebrowser’s installed script files with syntax highlighting

---

### Dependencies

- `qutebrowser` (pacman package): the script reads its installed file list
- `pacman`: used to query files installed by the `qutebrowser` package (`pacman -Ql`)
- `tail`: keeps only the last entries of the file list (assumes scripts are at the end)
- `ripgrep` (`rg`): filters out directory entries (`rg -v '/$'`)
- `sed`: strips the pacman prefix to get paths relative to qutebrowser’s root
- `xargs`: passes paths to the viewer
- `bat`: pretty-prints files with syntax highlighting

### Description

This helper script is meant for quickly inspecting “script-like” files shipped with the Arch Linux `qutebrowser` package. It queries pacman for the list of installed paths, then:

1. Takes only the last 37 lines of the listing (a heuristic for “the interesting bits”).
2. Removes directory entries (lines ending with `/`).
3. Strips the leading `… qutebrowser ` part from `pacman -Ql` output so only the file path remains.
4. Feeds the resulting file list to `bat` to view them all at once with nice formatting.

This is useful when you want to browse bundled userscripts/templates shipped by the package without manually hunting through `/usr/share`/`/usr/lib` paths.

### Usage

Run in a terminal:

    show-all-qutebrowser-scripts.sh

Typical “tldr” flow:

    # View the packaged qutebrowser script files
    show-all-qutebrowser-scripts.sh

    # Save the output to a file (still colored if your pager preserves it)
    show-all-qutebrowser-scripts.sh > /tmp/qb-scripts.txt

Because it’s non-interactive, it also works well from a qtile keybinding (launch in your terminal emulator).

---

> [!TIP]
> This relies on `tail -n 37`, which is brittle: package contents can change and the “scripts” may no longer be in the last 37 entries. Consider filtering by path instead (e.g., `rg '/userscripts/|/scripts/'`) or using `pacman -Qlq qutebrowser` for clean paths and then selecting specific directories. Also, if filenames can contain spaces, prefer `xargs -d '\n'` or `while IFS= read -r` to avoid splitting issues.