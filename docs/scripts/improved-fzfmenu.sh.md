# improved-fzfmenu.sh

# fzfmenu Helper Script

## Description

This script is a lightweight helper function designed to provide functionality similar to `dmenu` using `fzf`, executed within an `alacritty` terminal emulator. It's especially useful for creating menu-like interfaces in scripts or command-line workflows.

## Usage

```bash
./fzfmenu.sh [ARGUMENTS...]
```

## Features

- **fzf Integration**: Uses `fzf` for fuzzy finding, which is an efficient and flexible way of selecting from a list of items.
- **alacritty Terminal**: Runs the `fzf` interface within an `alacritty` terminal session.
- **Argument Handling**: Escapes and joins any arguments passed to the script before passing them to `fzf`.

## Documentation

### Script Header

```sh
#!/usr/bin/env bash
```

The script uses `bash` as its interpreter.

### Custom Documentation String

```sh
#INFO:#=2024-07= "Similar to dmenu but with fzf and urxvt (this is only the helper function)"
```

### Argument Handling

The script escapes each argument to ensure that special characters are preserved and passed correctly to `fzf`.

```sh
args=()
for arg in "$@"; do
    args+=("$(printf %q "$arg")")
done
```

This creates an array `args` containing the escaped arguments.

### Joining Arguments

```sh
fzf_args="${args[*]}"
```

The script joins the escaped arguments into a single string `fzf_args`.

### Running alacritty with fzf

```sh
alacritty -T 'fzfmenu' -o window.dimensions.columns=150 -o window.dimensions.lines=30 -e bash -c "fzf $fzf_args < /proc/$$/fd/0 > /proc/$$/fd/1"
```

- **`alacritty -T 'fzfmenu'`**: Sets the terminal title to `fzfmenu`.
- **`-o window.dimensions.columns=150 -o window.dimensions.lines=30`**: Configures the terminal window size.
- **`-e bash -c "fzf $fzf_args < /proc/$$/fd/0 > /proc/$$/fd/1"`**: Executes a `bash` command that runs `fzf` with the specified arguments. It uses file descriptors to manage input and output.

## Prerequisites

- **`alacritty`**: Ensure you have the `alacritty` terminal emulator installed.
- **`fzf`**: Ensure you have `fzf` installed.

## Example

```bash
./fzfmenu.sh -m --preview 'cat {}'
```

This example runs the script with `fzf` options to enable multi-select mode (`-m`) and a preview window that shows the contents of the selected file (`--preview 'cat {}'`).

## License

This script is open-source and available under the MIT License.

### Contributions

Contributions are welcome! Feel free to open issues or submit pull requests.

---

This documentation provides an overview of the script's functionality, usage, and argument handling. It aims to make it easier for users to understand and utilize the script effectively.