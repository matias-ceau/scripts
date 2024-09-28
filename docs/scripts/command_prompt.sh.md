# Command Prompt Script

---

**command_prompt.sh**: Launch a command with history suggestions for easier execution.

---

### Dependencies

- `shell_history_info.sh`: A script that extracts and formats shell history entries. It should output history in a tabular form where the command is in the second field.
- `improved-fzfmenu.sh`: An enhanced version of `fzf` for interactive filtering. It is used to present the list of commands in an interactive manner.
- `cut`: A standard Unix command to remove sections from each line of files.

### Description

This script assists in running previously executed commands by leveraging the shell's history. It fetches a list of previously run commands using the `shell_history_info.sh` and pipes this list into an improved fuzzy finder menu script, `improved-fzfmenu.sh`. The commands are sorted with the most recent ones displayed first due to the `--tac` option, which reverses the order of lines. The `--ansi` option is used to process and display colored entries correctly, assuming color codes might be present in the history output.

`get_cmd` is a function that retrieves the command history formatted by `shell_history_info.sh`, and only the second field (the command itself) is considered. The `fzf_cmd` function takes this list and runs it through the menu script.

### Usage

The script can be executed directly from a terminal. It could be simplified to a command that could be bound to a keybinding within qtile or executed on startup in a terminal session:

```bash
/home/matias/.scripts/command_prompt.sh
```

- Ensure `shell_history_info.sh` and `improved-fzfmenu.sh` are executable and in your PATH, or update the script to use absolute paths.
- Once executed, an interactive menu will display your command history to select from.

---

> [!TIP]  
> Consider checking the performance of the `shell_history_info.sh` and `improved-fzfmenu.sh` scripts since their efficiency heavily influences this script. Furthermore, handling scenarios where these dependencies might not return expected results could improve the robustness of your script.