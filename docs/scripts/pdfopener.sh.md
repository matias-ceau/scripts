# PDF Opener Script

---

**pdfopener.sh**: Pick and open any PDF file in your home directory with evince (or fallback).

---

### Dependencies

- `fd`: Fast and user-friendly alternative to `find` for listing files.
- `fzfmenu.sh`: User script for fzf-based menu selection (must be present in your `$PATH`).
- `evince`: Lightweight PDF viewer (GTK).
- `xdg-open`: Open files with default applications (fallback if not a regular file).
- (Optional) `dmenu`: Older menu script, commented out.

---

### Description

This script enables you to efficiently browse and open PDF files located anywhere within your home directory. It leverages the fast `fd` utility to recursively search for `.pdf` files, reducing latency compared to traditional `find`. The list is piped into a custom menu selection utility, `fzfmenu.sh`, which provides an interactive (and possibly colorized) file chooser powered by `fzf`.

After making a selection, the script checks if your choice is a regular file:
- If yes, it launches `evince` to view the PDF file.
- If not (for example, if a symbolic link or something unexpected is chosen), it falls back to opening with `xdg-open` to handle atypical files robustly.

The script begins with an old alternative (commented out) using `find`, `grep`, and `dmenu`, but the main, active logic is faster and more ergonomic.

---

### Usage

#### Run Directly in a Terminal:

```sh
sh /home/matias/.scripts/bin/pdfopener.sh
```
or if made executable:
```sh
/home/matias/.scripts/bin/pdfopener.sh
```

#### Assign to a Keybinding in qtile:

```python
Key([mod], "p", lazy.spawn("/home/matias/.scripts/bin/pdfopener.sh"), desc="PDF Opener")
```

> **tldr**  
> Launch the script, interactively pick any PDF under `$HOME` from the fuzzy menu, and it will open instantly in Evince.

---

> [!NOTE]
> - `fzfmenu.sh` must be accessible and functioning correctly since it is critical for selection; if missing the script will fail silently.
> - Consider handling cases where no PDF is selected at all—currently, if `fzfmenu.sh` returns an empty value, the script may try to open an empty string.
> - Output from `fd` uses `--color=always` for colorized entries, which may interfere with the selection if `fzfmenu.sh` or subsequent scripts/commands do not handle ANSI codes correctly.
> - You may wish to customize the search folder, add the ability to search other extensions, or display a notification if no PDFs are found.