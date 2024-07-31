# Improved FZF Menu (improved-fzfmenu.sh)

---

A script to launch an FZF menu in Alacritty terminal.

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

- Alacritty terminal
- FZF (Fuzzy Finder)
- Bash

<a name="description" />

### Description

<a name="overview" />

#### Overview

The `improved-fzfmenu.sh` script is designed to enhance user interaction with FZF (Fuzzy Finder) by launching it within the Alacritty terminal. This script handles user inputs and safely escapes each argument, ensuring that they are passed correctly to the FZF command. By using Alacritty’s window dimensions as part of the command execution, the user can customize the look of the FZF interface.

The script starts by accepting any number of command-line arguments, escaping them for safe inclusion in the FZF command. It then combines these arguments into a single string, which is fed into FZF when executed in a new Alacritty terminal instance. The specified terminal window dimensions are set for better visibility and usability.

---

<a name="usage" />

#### Usage

To use the script, execute it via the terminal by providing any necessary arguments required by the FZF command. For example:

```bash
./improved-fzfmenu.sh --bind 'ctrl-c:abort'
```

Here, `--bind 'ctrl-c:abort'` is passed as an argument to customize the FZF keybinding behavior.

The script can be assigned to a keybinding within your window manager or executed from a launcher as needed.

<a name="examples" />

#### Examples

1. Launch FZF with specific key bindings:
   ```bash
   ./improved-fzfmenu.sh --bind 'ctrl-j:down,ctrl-k:up'
   ```

2. Launch FZF to search through a list of files:
   ```bash
   find . -type f | ./improved-fzfmenu.sh
   ```

3. Use FZF to list running processes:
   ```bash
   ps aux | ./improved-fzfmenu.sh
   ```

---

<a name="notes" />

### Notes

- Ensure that both Alacritty and FZF are properly installed and configured on your Arch Linux system.
- The script uses `/proc/$$/fd/0` to handle input effectively, which may not work as expected in certain contexts.

> **Critique:** 
> The script could improve error handling for cases where Alacritty or FZF might not be available. Additionally, adding a usage message that describes the script's purpose when no arguments are provided could enhance usability for new users.