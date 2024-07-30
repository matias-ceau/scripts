
---

Fzfmenu integrated with Alacritty terminal, requires --bind to exit.

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

- `fzf`: A command-line fuzzy finder.
- `alacritty`: A fast terminal emulator.

<a name="description" />

### Description

<a name="overview" />

#### Overview

The `improved-fzfmenu.sh` script is designed to provide a user-friendly fuzzy menu by leveraging `fzf` in conjunction with the Alacritty terminal emulator. It allows users to easily browse through a set of options defined via command-line arguments, with a customizable window size to enhance visibility.

This script takes advantage of shell parameter expansion and the `printf` command to safely escape arguments passed to it. The escaping ensures that spaces and special characters in the arguments are handled properly, allowing for a more reliable user experience. The command also redirects the input from the current shell process to `fzf`, allowing for real-time selection while the user interacts with the terminal interface.

---

<a name="usage" />

#### Usage

To use the script, ensure it is executable:

```bash
chmod +x /home/matias/.scripts/improved-fzfmenu.sh
```

You can run the script from the terminal and pass the options you want to display in the fuzzy menu. The script takes arbitrary arguments that will be passed to `fzf`, and it's essential to include the `--bind` argument to allow exiting the `fzf` interface:

```bash
/home/matias/.scripts/improved-fzfmenu.sh option1 option2 option3 --bind 'ctrl-c:abort'
```

<a name="examples" />

#### Examples

1. Running the script with three options:
    ```bash
    /home/matias/.scripts/improved-fzfmenu.sh option1 option2 option3 --bind 'ctrl-c:abort'
    ```

2. Filtering files in the current directory:
    ```bash
    /home/matias/.scripts/improved-fzfmenu.sh $(ls) --bind 'ctrl-c:abort'
    ```

---

<a name="notes" />

### Notes

- Ensure that both `fzf` and `alacritty` are installed and set in your `PATH`.
- The window dimensions for Alacritty can be adjusted by modifying the `-o` parameters in the script if a different size is needed.

> **Critique**: 
> This script could benefit from additional error handling. For instance, checking if `fzf` or `alacritty` is installed before attempting to run the commands would make it more robust. Furthermore, adding a `--help` flag could provide users with guidance on how to use the script effectively.