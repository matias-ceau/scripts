# Command Prompt Launcher

---

**command_prompt.sh**: Launch a command with history suggestions using fzf.

---

### Dependencies

- `shell_history_info.sh`: A script that fetches and displays the command history.
- `improved-fzfmenu.sh`: A script for enhanced fuzzy finding capabilities using `fzf`.

### Description

The `command_prompt.sh` script is designed to provide a streamlined way to launch commands from your shell history. It utilizes `fzf`, a powerful command-line fuzzy finder, to present a list of previously executed commands. The script is constructed using a series of functions that work together seamlessly:

1. **get_cmd**: This function calls `shell_history_info.sh` to list command history. It uses `cut` to extract the second field from the output, which is expected to be the command itself.
  
2. **fzf_cmd**: This function invokes `improved-fzfmenu.sh` to display the command options. The flags `--tac` and `--ansi` enhance the usability by formatting the output and allowing for ANSI colors.

After defining these functions, the script combines them to pipe the output from `get_cmd` into `fzf_cmd`, which then allows the user to select a command from their history to execute.

### Usage

To use the script, you need to ensure that the necessary dependencies are installed and executable. Then, simply run the script from your terminal:

```bash
bash /home/matias/.scripts/command_prompt.sh
```

This will launch the fuzzy finder where you can begin typing to filter through your command history. Once you find the desired command, you can select it, and the command will be executed in your shell.

---

> [!TIP]  
> Consider adding a feature to allow users to customize the number of previous commands fetched from history. This could enhance usability, especially for those who frequently run a large number of commands. Additionally, implementing error handling for cases where the dependencies are missing might improve the script's robustness.