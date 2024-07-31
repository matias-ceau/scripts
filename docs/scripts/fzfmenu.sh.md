# fzfmenu (fzfmenu.sh)

---

Launches an interactive fzf menu in an xterm window.

---

### Table of contents

- [Dependencies](#dependencies)
- [Description](#description)
    - [Overview](#overview)
    - [Usage](#usage)
    - [Examples](#examples)
- [Notes](#notes)

---

<a name="dependencies" />

### Dependencies

- `fzf` - A command-line fuzzy finder.
- `xterm` - Terminal emulator required to run the script.
- `bash` - The shell interpreter.

<a name="description" />

### Description

<a name="overview" />

#### Overview

The `fzfmenu` script serves as a helper function that opens a new `xterm` window to display an interactive menu using `fzf`. The script reads input from the terminal, allowing users to filter and select items from a list presented in the `fzf` interface. The output of the selection is then sent to the terminal where the script was invoked. 

This script is particularly useful in a qtile window manager environment on Arch Linux, as it allows seamless integration with other shell commands and workflows. The use of `/proc/$$/fd/0` and `/proc/$$/fd/1` ensures that the script correctly manages input and output between the term and the `fzf` process.

---

<a name="usage" />

#### Usage

To use the `fzfmenu` script, simply execute it in your terminal. You can pass any arguments to `fzf` as follows:

```bash
/home/matias/.scripts/fzfmenu.sh [fzf-options]
```

This script can also be bound to a key combination in qtile, enabling quick access to the `fzf` menu from anywhere within the desktop environment.

<a name="examples" />

#### Examples

1. **Basic usage:**
   ```bash
   /home/matias/.scripts/fzfmenu.sh
   ```

2. **Using with a list of files:**
   ```bash
   ls | /home/matias/.scripts/fzfmenu.sh
   ```

3. **Providing selections from a script's output:**
   ```bash
   ps aux | /home/matias/.scripts/fzfmenu.sh
   ```

---

<a name="notes" />

### Notes

- The script opens an `xterm` window. If you prefer a different terminal emulator, you can replace `xterm` with your preferred choice (e.g., `urxvt`, `gnome-terminal`, etc.)
- The script is designed for interactive use; it will not work as expected when run in a non-interactive shell environment.

> **Critique:** 
> This script effectively launches `fzf` within an `xterm` window; however, there are a couple of improvements that could be made:
> - Error handling could be implemented to avoid failures if `fzf` or `xterm` is not installed.
> - Allowing users to specify the terminal type through an argument could improve flexibility. 
> - Adding options to customize the appearance or behavior of `fzf` could provide a better user experience.