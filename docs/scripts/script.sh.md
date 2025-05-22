# Fuzzy Typed Command Launcher

---

**script.sh**: Launches `fzf` in an `xterm` window and types the selected entry using `xdotool`.

---

### Dependencies

- `fzf` – powerful command-line fuzzy finder
- `xterm` – terminal emulator used for displaying the `fzf` menu
- `xdotool` – simulates keyboard input to type the selected entry
- `xargs` – used to pass the selected entry as arguments
- `bash` – required shell interpreter

---

### Description

This script facilitates launching a fuzzy finder menu (`fzf`) within an `xterm` popup, allowing the user to filter/select from a list provided via command line arguments (or standard input). Once an item is selected, the entry is automatically "typed" at the current cursor position in your active window, via `xdotool type`.

**Script logic in detail:**
- All arguments provided to this script are escaped for safety and concatenated.
- These arguments are passed to `fzf`, which will display them for selection.
- The process runs within a dedicated `xterm` window with the title `'fzfmenu'`.
- Standard input and output file descriptors are used to bridge between the menu and the script.
- The resulting selection is picked up and passed to `xdotool type` using `xargs`, simulating keyboard input of the selection into the currently-focused application.

---

### Usage

Run this script with a list of options or arguments, for example:

```bash
~/.scripts/dev/script.sh one two three four
```

Interact with the `fzf` menu (filter by typing), select with <kbd>Enter</kbd> – the chosen text will then be auto-typed wherever your cursor is active.

You can also pass extra options to `fzf`:

```bash
~/.scripts/dev/script.sh --preview 'echo {}' apple banana cherry
```

**Example: Keybinding in qtile:**

Assign this script to a keybinding in your `qtile` config to quickly invoke your custom fuzzy finder and auto-type the result.

---

> [!TIP]
> - The script is robust in argument escaping, but currently expects all menu items as arguments rather than through stdin, which can limit usage with dynamically-generated input.  
> - The use of xterm is hardcoded; for better integration on tiling WMs like qtile, consider making the terminal configurable.  
> - Comments at the top suggest intended support for launching the menu at mouse coordinates and pre-selecting text, but those features are currently commented out. Implementing or removing these could improve clarity.  
> - Consider handling empty selections more gracefully to avoid running `xdotool type` with empty input.