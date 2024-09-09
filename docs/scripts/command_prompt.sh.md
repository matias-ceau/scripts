# Command Prompt Launcher

---

**command_prompt.sh**: Launch a command with history suggestions using fzf

---

### Dependencies

- `shell_history_info.sh`: A script that retrieves the shell command history.
- `improved-fzfmenu.sh`: A customized fzf menu for selecting commands.

### Description

The `command_prompt.sh` script is designed to enhance command input efficiency by leveraging your shell's command history. It uses two key components:

1. **Command History Retrieval**: The `get_cmd()` function utilizes `shell_history_info.sh` to list previously executed commands, extracting only the command portion using `cut`.
   
2. **fzf Interface**: The `fzf_cmd()` function invokes `improved-fzfmenu.sh`, which presents the retrieved command list in a fuzzy-searchable menu, allowing users to quickly find and select a command to execute.

Upon running the script, it retrieves the command history, filters it, and presents it in a user-friendly interface powered by `fzf`, enabling rapid selection of commands by typing partial command text.

### Usage

To execute the script, simply run it in your terminal:

```bash
bash /home/matias/.scripts/command_prompt.sh
```

This will invoke the `fzf` menu populated with your command history. You can start typing to filter the results and press `Enter` to execute the selected command.

You may want to consider adding it to your keybindings in `qtile` for convenient access. For example, you can bind it to a key combination in your `config.py`:

```python
Key([mod], "p", lazy.spawn("/home/matias/.scripts/command_prompt.sh")),
```

---

> [!TIP]  
> The script currently does not handle cases where commands may not exist in the history or when there are no results from the `fzf` selection. Consider adding error handling to alert users when no commands are found or if the dependencies are not installed. Additionally, implementing a mechanism to clear or filter out redundant entries in the history could enhance usability.