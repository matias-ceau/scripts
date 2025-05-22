# fzfmenu Helper (fzfmenu.sh)

---

**fzfmenu.sh**: Helper script that runs `fzf` inside an `alacritty` terminal instance.

---

### Dependencies

- `alacritty`  
  GPU-accelerated terminal emulator used to spawn a floating window for menu interaction.
- `fzf`  
  Command-line fuzzy finder; provides interactive filtering UX.
- Bash  
  Standard shell interpreter (`#!/bin/bash`).
- (Optional) External scripts or programs whose output is piped into this script.

---

### Description

This script emulates the role of a "rofi" or "dmenu" prompt using `alacritty` and `fzf` for a more extensible, powerful selection interface. It acts as a drop-in interactive menu system, especially suitable for workflows in tiling WMs such as Qtile under Arch Linux.

**Functionality breakdown:**
- Receives arguments meant for `fzf` (such as options to customize prompt, layout, preview, etc.).
- Securely escapes all provided arguments to ensure safe command parsing.
- Spawns an `alacritty` terminal with the window title `fzfmenu`, executes `fzf` with the provided arguments, and connects its input and output directly to the parent process' standard input/output using `/proc/$$/fd/{0,1}`.

This function is best invoked by other scripts as a helper to display selections in a floating/centered `alacritty` window.

---

### Usage

You usually don't call this script directly, but as part of a larger menu script or from within keybindings in Qtile. However, standalone usage is possible for debugging.

**Example (Basic File Picker):**
```bash
ls | ~/.scripts/bin/fzfmenu.sh --prompt="Pick a file: "
```

**With Custom Preview Window:**
```bash
find ~/Documents -type f | ~/.scripts/bin/fzfmenu.sh --preview='head -20 {}' --height=40%
```

**Integration in a Script (Pseudocode):**
```bash
choices=$(some_command_producing_list | ~/.scripts/bin/fzfmenu.sh [fzf options])
```

**Qtile Keybinding (Python fragment):**
```python
Key([mod], "p", lazy.spawn("my-launcher-script.sh"))
```
_Each script that needs a selection/launcher menu can use `fzfmenu.sh` as the backend._

---

> [!TIP]
> While this script securely escapes and forwards options to fzf (improving safety compared to naive wrappers), several considerations could improve robustness:
> - **No input checking**: The script assumes that stdin, stdout, and `/proc/$$/fd/{0,1}` are available and properly connected. Not all terminals/shell invocations will provide these; a check and fallback for non-Linux/pseudo-terminal use would increase portability.
> - **No error handling**: If `alacritty` or `fzf` are missing, the script fails silently. Consider adding checks for dependencies or descriptive error messages for easier debugging.
> - **Window management**: By default, `alacritty` will open in a standard size; integrating options to open as a floating/centered window (using `--class`, `--geometry`, or external WM rules) might better emulate dmenu-like UX in Qtile.
> - **Performance**: For very large input lists, piping directly through the script may be slower than using `fzf` async sources. Consider allowing additional fzf features for large/remote datasets.
