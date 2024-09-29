# Command Prompt Launcher

---

**command_prompt.sh**: Launch a command with history suggestions

---

### Dependencies

- `shell_history_info.sh`: A script to retrieve the command history.
- `improved-fzfmenu.sh`: A script that enhances command selection using fzf (fuzzy finder).

### Description

This script provides a user-friendly interface for launching commands by suggesting previously used commands from the user's shell history. 

- **get_cmd**: This function retrieves the command history via the `shell_history_info.sh` script and extracts just the command part using the `cut` command.
- **fzf_cmd**: This function utilizes the `improved-fzfmenu.sh` script to present the command suggestions in a visual, interactive way using the fzf tool. The `--tac` flag reverses the input, allowing users to see the most recent commands at the top, and `--ansi` ensures that any color codes in the command suggestions are interpreted correctly.

The combination of these functions allows for quick, efficient command selection without needing to type the entire command again.

### Usage

To use the script, simply run it in your terminal. You can directly execute it as follows:

```bash
bash /home/matias/.scripts/command_prompt.sh
```

When invoked, the script will pull up a list of commands from your history. You can navigate through this interactive list using your keyboard, select a command, and press Enter to execute it.

If you wish to assign this script to a keybinding in `qtile`, add the following line to your `config.py`:

```python
Key([mod], "p", lazy.spawn("/home/matias/.scripts/command_prompt.sh")),
```

This will bind the command selection launcher to the key combination defined by `mod + p`.

---

> [!TIP]  
> The script could be enhanced by adding error handling for cases where the `shell_history_info.sh` script fails or if no commands exist in the history. Additionally, consider implementing a graceful exit mechanism if the user quits the fzf menu without selecting a command.