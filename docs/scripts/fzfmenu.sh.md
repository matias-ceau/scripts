# fzfmenu.sh

# fzfmenu-helper

`fzfmenu-helper` is a Bash script that mimics the functionality of `dmenu` using `fzf` and `xterm` (or any terminal emulating `urxvt`). 

## Overview

The script runs `fzf` inside an xterm window, allowing the user to interactively filter and select from a list of inputs. The selected output is then passed back to the terminal.

## Script Details

```bash
#!/usr/bin/env bash

#DOC#=2024-06= "Similar to dmenu but with fzf and urxvt (this is only the helper function"

xterm -T 'fzfmenu' -e bash -c "fzf $* < /proc/$$/fd/0 > /proc/$$/fd/1"
```

### Functionalities

- **Terminal Window:** The script opens a new xterm window titled `fzfmenu`.
  
- **Interactive Selection:** It runs `fzf` (an interactive command-line fuzzy finder) within this terminal window.
  
- **Command Execution:** It can pass additional arguments (`$*`) to `fzf` for additional functionalities or options.
  
- **Input and Output Handling:** The input to `fzf` is taken from the script's file descriptor 0 (`/proc/$$/fd/0`), and the output is redirected to file descriptor 1 (`/proc/$$/fd/1`).

## Prerequisites

- **xterm:** The terminal emulator used to host the `fzf` interface.
- **fzf:** The fuzzy finder utility that allows users to interactively filter and select from the provided list.

## Usage

1. **Make the Script Executable:**

    ```sh
    chmod +x fzfmenu-helper.sh
    ```

2. **Run the Script:**

    You can run the script directly or integrate it into other automation scripts or workflow tools. Example usage:

    ```sh
    echo -e "Option1\nOption2\nOption3" | ./fzfmenu-helper.sh
    ```

    This will display the options in an `fzf` interface within an xterm window, and you can select an option interactively.

## Note

While the script is designed to function similarly to `dmenu`, it relies on `fzf` and `xterm` (or any compatible terminal emulation like `urxvt`). Customize and extend the functionality as needed to fit specific requirements.

## Contributions

Feel free to fork this repository and submit pull requests. Any enhancements that align with the original purpose of this script are welcome.

## License

This script is open-source and available under the [MIT License](LICENSE.md).

---

For further improvement, suggestions, or issues, please open an issue on the [GitHub repository](https://github.com/your-repo/fzfmenu-helper).

Happy coding!