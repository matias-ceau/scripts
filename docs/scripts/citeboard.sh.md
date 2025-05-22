# Citeboard: Quick Paper Citation and Access

---

**citeboard.sh**: Find academic references by citation key, copy their identifier, or open associated PDFs.

---

### Dependencies

- `findutils`  
  Used for file and directory searching (find).
- `xsel`  
  For copying citation keys to the X clipboard.
- `dmenu`  
  Dynamic menu for rofi-style selection in a graphical environment.
- `evince`  
  PDF viewer for opening matched papers.
- `grep`, `sed`  
  Basic text processing utilities (should be pre-installed on Arch).

### Description

This script allows you to quickly search your Zotero BibTeX library for a paper reference, using `dmenu` to select a citation key. Once a reference is selected, you choose whether to **copy** its citation key to the clipboard or **open** its associated PDF document (if available).

- **Reference extraction**: It parses all BibTeX files under `data/bib/`, extracting citation keys.
- **Interactive menu**: Presents a searchable menu of keys with `dmenu`.
- **Output action**: Lets you copy the citation key (`clipboard`) or open the paper's PDF (`open`), using either `xsel` or `evince`.

### Usage

Assign to keybindings in Qtile or launch directly from terminal:

```sh
~/.scripts/bin/citeboard.sh
```

Selection workflow:
1. **A dmenu prompt appears** with available citation keys. Type to filter, press Enter to select.
2. **A second menu ("open" or "clipboard") appears**.
    - If you pick **clipboard**, the citation key is copied (`xsel -b`).
    - If you pick **open**, the script looks under `data/zotero/storage` for files matching the citation key and opens them with `evince`.

#### Example with dmenu input:

- Press Super+Shift+C (example Qtile binding) to launch.
- Type part of a citation key, Enter.
- Choose `open` or `clipboard`.

---

> [!TIP]
> - **Relies on directory structure:** The script assumes you have a `data/bib/` with BibTeX files and a corresponding `data/zotero/storage/` with PDFs named after citation keys. If the file naming or structure doesn't match this, "open" may silently do nothing.
> - **No input validation:** If your BibTeX citation keys contain spaces or unusual characters, extraction with `sed` might not work reliably.
> - **No error feedback if PDF not found:** The script will pass nothing to `evince` if no match is found, potentially causing confusion.
> - **Minor inefficiency:** Always pipes to `find` and `grep` even for clipboard-only actions. This could be optimized.
> - **You may want to add notifications (e.g. via `notify-send`) to confirm clipboard copies or alert on missing PDFs for improved feedback.**
