# fzf file/image preview helper

---

**fzfpreview.sh**: FZF preview script for text, binaries, and images (kitty/chafa/imgcat)

---

### Dependencies

- `fzf` (indirect): meant to be used as `--preview` command
- `file`: MIME/type detection (`--mime`)
- `bat` / `batcat`: syntax-highlighted text previews (fallbacks to `cat`)
- `kitty` (optional): uses `kitty icat` when running inside Kitty (`$KITTY_WINDOW_ID`)
- `chafa` (optional): renders images in terminal (Sixel output)
- `imgcat` (optional): image preview for iTerm2

### Description

This script is a robust `fzf` preview backend that adapts to the selected entry’s type:

- Expands `~/` to `$HOME` so paths coming from shell-like sources work.
- Uses `file --mime` to detect whether the target is an image.
  - **Non-image**:
    - If `file` reports `=binary`, it prints a concise `file` summary and stops (avoids dumping unreadable bytes).
    - Otherwise, it prefers `batcat`/`bat` with color enabled and no pager, honoring `BAT_STYLE` (defaults to `numbers`).
  - **Image**:
    - Computes preview geometry from `FZF_PREVIEW_COLUMNS`/`FZF_PREVIEW_LINES`, with fallbacks to `stty size`.
    - Includes a small workaround to prevent bottom-of-screen scrolling glitches in some Sixel setups (fzf issue #2544).
    - Rendering order:
      1) `kitty icat` (best experience on Arch + Kitty)
      2) `chafa` (Sixel)
      3) `imgcat` (iTerm2)
      4) fallback to `file` output

### Usage

Set it as your `fzf` preview command:

```sh
fzf --preview '~/.scripts/dev/fzfpreview.sh {}'
```

Typical patterns:

```sh
# File picker
find . -type f | fzf --preview '~/.scripts/dev/fzfpreview.sh {}'

# With bat style override
BAT_STYLE=plain fzf --preview '~/.scripts/dev/fzfpreview.sh {}'
```

You generally don’t run it manually, but you can:

```sh
~/.scripts/dev/fzfpreview.sh path/to/file.png
```

---

> [!TIP]
> The script assumes paths with spaces are passed as a single argument; ensure your `fzf` input/placeholder usage preserves quoting. Consider adding explicit checks for unreadable files and returning a clear message (e.g., “permission denied”). Also note that Sixel support depends on terminal capabilities; on Arch, you may want to standardize on Kitty (`kitty icat`) for consistent image previews.