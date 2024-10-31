# Command Prompt

---

**command_prompt.sh**: Script to launch a command with history suggestions using `fzf`

---

### Dependencies

- `shell_history_info.sh`: A script that lists the shell history.
- `improved-fzfmenu.sh`: An enhanced `fzf` menu script which supports additional features such as titles and text coloring. 

### Description

This script assists users in running commands by providing an interactive menu with suggestions based on their command history. The command history is first filtered and presented via an enhanced `fzf` interface to allow users to select a previously executed command easily.

The `get_cmd` function calls the `shell_history_info.sh -l` script, which retrieves the history of commands executed in the shell and pipes the output through `cut -f2` to extract only the second field, presumably containing the actual command.

The `fzf_cmd` then uses `improved-fzfmenu.sh` with options like `--tac` (to reverse the order of lines) and `--ansi` (for colored output) to present these commands in a user-friendly interface.

### Usage

To use this script, you can simply run it from the terminal. This can be done either by directly executing the script or by assigning it to a keybinding in a window manager like qtile:

```bash
~/.scripts/bin/command_prompt.sh
```

Alternatively, for quick access, you may want to bind it to a key combination in your qtile configuration. For example:

```python
Key([], "p", lazy.spawn("/home/matias/.scripts/bin/command_prompt.sh")),
```

This allows you to press a specific key combination that opens the prompt with previous command suggestions.

---

> [!TIP] While this script is useful for suggesting commands from history, it appears quite dependent on other user-specific scripts (`shell_history_info.sh` and `improved-fzfmenu.sh`). Documenting and including those dependencies would enhance its portability. Additionally, providing more information about the expected behavior of these helper scripts within this documentation could help in understanding their function and ensuring the script operates correctly.