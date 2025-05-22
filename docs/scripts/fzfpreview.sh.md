# fzf File & Image Preview Demo

---

**fzfpreview.sh**: Display file or image contents in fzf preview window using various tools and fallback logic

---

### Dependencies

- `bat` or `batcat`: Syntax-highlighting cat clone for text files.
- `chafa`: Convert images for terminal display (Sixel, etc).
- `imgcat`: Show images inline in iTerm2.
- `kitty icat`: Used for image previews in kitty.
- `fzf`: Fuzzy file finder (to provide the preview window).
- Standard utilities: `file`, `cat`, `awk`, `stty`, `sed`.

---

### Description

This script is a robust utility for integrating file and image preview capabilities into fzf workflows. Depending on file type and available utilities, it:
- Displays code/text files with syntax highlighting via `bat`/`batcat` (with `cat` fallback).
- Shows images in the preview window using:
  - `kitty icat` when in Kitty terminal (with special flags for best preview UX, including scroll bug workarounds),
  - `chafa` for terminals supporting Sixel graphics (ensures multi-image support),
  - `imgcat` for iTerm2 environments,
  - or just displays file info if no suitable method is found.

Special care is taken to detect binary files, avoid scrolling bugs, and substitute `~` home references. It dynamically sizes the preview window based on fzf environment variables, with fallbacks via `stty`.

---

### Usage

You typically call this script from within an fzf command, setting it as the `--preview` argument:

```sh
fzf --preview '/home/matias/.scripts/dev/fzfpreview.sh {}'
```

Or, you can preview any file from the terminal:

```sh
/home/matias/.scripts/dev/fzfpreview.sh ./path/to/file_or_image
```

**Arguments:**
- Takes one positional argument: the path to the file.

**Examples:**
- Preview a script file in fzf:
  ```
  fzf --preview '~/.scripts/dev/fzfpreview.sh {}'
  ```
- Directly preview an image:
  ```
  ~/.scripts/dev/fzfpreview.sh ~/Pictures/test.jpg
  ```

The script can be assigned to a `qtile` keybinding or composited into custom scripts for more integrated workflows.

---

> [!TIP]
> - The script assumes you have either `bat` or `batcat` for text previews, but doesn't error out if neither is found (falls back to `cat` without syntax highlighting).
> - `imgcat` is assumed to be appropriate if available, but without checks for actual iTerm2 use. The author notes this in the script, but in case you use `imgcat` outside iTerm2, you could add an explicit check using `it2check`.
> - For even better integration with fzf, you could allow the script to accept more than one argument (e.g., adding extra options) or improve error messages if preview tools aren't found.
> - If you plan to use this on other terminals (not Kitty/iTerm2), verify correct behavior, especially Sixel support.
> - Consider adding better handling when no dependencies are available, to let the user know which tools are missing for full functionality.