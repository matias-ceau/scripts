# Improved FZF Menu 

---

**improved-fzfmenu.sh**: A script to invoke fzf in Alacritty terminal with argument handling

---

### Dependencies

- `fzf`: A command-line fuzzy finder used to filter and select items.
- `alacritty`: A fast and GPU-accelerated terminal emulator. The script requires Alacritty to run `fzf`.

### Description

The `improved-fzfmenu.sh` script is designed to enhance the experience of using `fzf` (fuzzy finder) by launching it within the Alacritty terminal emulator. The script effectively handles command-line arguments and passes them to `fzf`, allowing for flexible usage without manually escaping special characters.

The script starts by escaping each argument supplied to it, ensuring they are properly formatted for the shell. This is achieved via a loop that utilizes `printf %q`, which outputs the argument in a way suitable for the shell. The escaped arguments are then combined into a single string, `fzf_args`, which can be used when invoking `fzf`.

Finally, the script opens a new Alacritty terminal window with the title 'fzfmenu' and executes `fzf` with the provided arguments. It also includes a `TODO` section for future improvements, such as supporting other terminal emulators like `kitty` and adding options for modifying the terminal window's size.

### Usage

To use the `improved-fzfmenu.sh` script, execute it in the terminal with desired `fzf` options as arguments. Here’s a basic usage example:

```bash
./improved-fzfmenu.sh --bind 'ctrl-o:execute(xdg-open {})'
```

This example opens `fzf` in Alacritty and executes the `xdg-open` command on the selected item when `ctrl-o` is pressed.

The script can also be integrated into keybindings in your window manager for quick access, enhancing workflow efficiency. 

---

> [!TIP]
> The script currently lacks flexibility in changing the terminal emulator. As mentioned in the TODOs, consider extending it to allow users to specify their terminal of choice (e.g., `kitty`) through an additional argument. Additionally, implementing options for window sizing could enhance usability, enabling users to customize the appearance of `fzf` to their liking.