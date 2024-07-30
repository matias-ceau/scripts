# improved-fzfmenu.sh

# Fzfmenu with Alacritty

This script launches an interactive `fzf` (fuzzy finder) menu inside an [Alacritty](https://github.com/alacritty/alacritty) terminal emulator window. It requires a `--bind` argument to exit `fzf`.

## Prerequisites

- [Alacritty](https://github.com/alacritty/alacritty) must be installed on your system.
- [fzf](https://github.com/junegunn/fzf) must be installed on your system.

## Usage

To execute the script, run:

```bash
./path/to/script.sh --bind <key>:accept
```

The `--bind <key>:accept` argument is necessary to specify a key binding for exiting the `fzf` menu.

## Functionality

1. **Argument Escaping**: The script first processes its input arguments by escaping each one to ensure they are safely passed to `fzf`.
2. **Combining Arguments**: The escaped arguments are joined into a single string, `fzf_args`.
3. **Launching Alacritty**: 
    - The script then launches `alacritty` terminal emulator.
    - **Title**: Sets the window title to 'fzfmenu'.
    - **Dimensions**: Sets the window dimensions to 150 columns by 30 lines.
    - **Command Execution**: Runs a `bash` command inside `alacritty` to execute `fzf` with the supplied arguments.

## Script Details

```bash
#!/usr/bin/env bash

#INFO:#=2024-07= "Fzfmenu with alacritty, requires a --bind argument to exit fzf"

# Escape each argument
args=()
for arg in "$@"; do
    args+=("$(printf %q "$arg")")
done

# Join the escaped arguments
fzf_args="${args[*]}"

alacritty \
    -T 'fzfmenu' \
    -o window.dimensions.columns=150 \
    -o window.dimensions.lines=30 \
    -e bash -c "fzf $fzf_args < /proc/$$/fd/0"

# > /proc/$$/fd/1"
```

## Example

```bash
./fzfmenu.sh --bind 'ctrl-j:accept'
```

This will open an Alacritty window, launch `fzf`, and set a key binding where pressing `Ctrl + J` will accept the current selection in the fzfmenu.

## Note

- This script uses `/proc/$$/fd/0` to provide input to `fzf` from the current shell session.
- Make sure to provide the required `--bind` argument to ensure that `fzf` can exit properly after making a selection.