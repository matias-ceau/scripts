# Command Prompt Launcher

---

**command_prompt.sh**: Launch a command with history suggestions using fzf.

---

### Dependencies

- `shell_history_info.sh`: A script to retrieve the shell command history.
- `improved-fzfmenu.sh`: An enhanced version of fzf for navigating options with improved features.
- `fzf`: A command-line fuzzy finder for filtering through a list of items.

### Description

The `command_prompt.sh` script is designed to streamline the process of launching commands from your shell history. By leveraging the capabilities of `fzf`, which provides a fuzzy search interface, users can quickly access previously executed commands without having to type them out fully.

The script operates in the following way:

1. **Get Command History**: It invokes the `shell_history_info.sh` script to list the command history, extracting the second field (typically the command itself). The command output is then piped for further processing.
   
2. **Fuzzy Search**: The extracted commands are passed to `improved-fzfmenu.sh`, where users can interactively select a command from their history using fuzzy matching. The parameters `--tac` and `--ansi` ensure that the list is displayed in inverse order and retains ANSI color formatting, respectively.

This combination makes it much easier to find and execute past commands, enhancing workflow efficiency.

### Usage

To run the script, simply execute it in your terminal:

```bash
bash /home/matias/.scripts/command_prompt.sh
```

Once executed, the script will display an interactive fzf menu populated with your recent commands. Use the arrow keys to navigate and press `Enter` to execute the selected command.

You can also map this script to a keybinding in your window manager (Qtile) for quicker access, enhancing your productivity further.

---

> [!TIP]  
> Consider adding error handling to check if the required dependencies (`shell_history_info.sh` and `improved-fzfmenu.sh`) are installed and executable. Handling cases where no command history is available could improve the user experience. You may also want to implement a feature to allow users to define their own fzf options for customization.