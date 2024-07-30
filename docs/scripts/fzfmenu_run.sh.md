
---

Dmenu run replacement with fzf and a floating st terminal

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

- `fzf` - A command-line fuzzy finder
- `st` - Simple terminal for X
- `dmenu` - Dynamic menu for X

<a name="description" />

### Description

<a name="overview" />

#### Overview

`fzfmenu_run.sh` is a Bash script that replaces the traditional `dmenu` application launcher by utilizing `fzf`, a powerful fuzzy finder. This script takes advantage of the `dmenu_path` command to generate a list of executable files available in the user's PATH environment variable. The output is then piped to `fzf` via the `fzfmenu.sh` script, allowing users to interactively filter through the list to find their desired command. Upon selecting an option, the chosen command is executed in a floating `st` terminal.

The script allows users to maintain a seamless experience in launching applications directly from their terminal while leveraging the intuitive fuzzy matching capabilities of `fzf`.

---

<a name="usage" />

#### Usage

To use the script, simply execute it from your terminal. Make sure you have it marked as executable (`chmod +x /home/matias/.scripts/fzfmenu_run.sh`) and run:

```
/home/matias/.scripts/fzfmenu_run.sh
```

You can also bind this script to a key combination in your window manager (Qtile) for quick access. 

<a name="examples" />

#### Examples

1. Launch the script directly from the terminal:
   ```
   ./fzfmenu_run.sh
   ```
   
2. Bind it to a key in Qtile by adding this line to your configuration file:
   ```python
   Key([mod], "r", lazy.spawn("/home/matias/.scripts/fzfmenu_run.sh")),
   ```

---

<a name="notes" />

### Notes

- Ensure that `fzf`, `dmenu`, and `st` are installed on your Arch Linux system for the script to function correctly.
- The script runs in the background, allowing you to continue using the terminal or other applications without interruption.

> **Critique:** One potential improvement for this script would be to incorporate error handling mechanisms. For example, if `dmenu_path` or `fzfmenu.sh` fails or produces no output, the script may hang or terminate unexpectedly. Adding checks to ensure that commands produce expected results could enhance user experience significantly. Additionally, consider allowing custom commands or scripts to be run in the terminal other than the ones returned by `dmenu_path`, which could extend the script's usability.