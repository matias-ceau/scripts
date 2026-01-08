# Citeboard — pick a BibTeX entry and open its PDF or copy its key

---

**citeboard.sh**: Select a BibTeX citation key, then open the PDF or copy the key

---

### Dependencies

- `grep` / `sed` / `find` / `xargs` (from `coreutils` + `findutils`) — text processing and file lookup  
- `dmenu` — interactive menu prompt (ideal for qtile keybindings)  
- `xsel` — copy the selected citation key to the X clipboard (`-b`)  
- `evince` — PDF viewer used to open the matched paper  
- Bib/Zotero data layout:
  - `data/bib/*` — BibTeX files containing entries starting with `@...{key,`
  - `data/zotero/storage` — directory containing the stored PDFs/attachments

### Description

`citeboard.sh` is a lightweight “citation launcher” for your local library. It:

1. Scans `data/bib/*` for BibTeX entry headers (`^@`) and extracts the citation key (the part inside `{...` before the trailing comma).
2. Presents the list of keys in `dmenu` (30 lines visible) so you can quickly fuzzy-pick the reference you want.
3. Prompts a second `dmenu` with two actions:
   - `open`: search `data/zotero/storage` for paths containing the key and open the results with `evince`
   - `clipboard`: copy the key to your clipboard for pasting into LaTeX/Markdown

This fits well into an Arch + qtile workflow: fast keyboard-driven selection without needing a terminal UI.

### Usage

Run interactively (shows `dmenu` prompts):

    citeboard.sh

Typical flows:

- Copy a citation key:

    citeboard.sh
    # pick: smith2021coolpaper
    # pick: clipboard
    # now paste: smith2021coolpaper

- Open a stored PDF:

    citeboard.sh
    # pick: smith2021coolpaper
    # pick: open
    # evince opens matching file(s)

For qtile, bind it to a key and ensure it runs in an X session (since `dmenu`/`xsel` require it).

---

> [!TIP]
> Improvements to consider:
> - Quote variables and handle spaces safely (`grep "$ref"` + `xargs` can misbehave); prefer `find ... -print0 | xargs -0`.
> - Avoid opening multiple matches unintentionally (pick one match via a third `dmenu`).
> - Use absolute paths (or `cd` to a known base dir) so running from qtile doesn’t depend on the current working directory.
> - Replace `echo -e` (non-POSIX in some shells) with `printf "open\nclipboard\n"`.