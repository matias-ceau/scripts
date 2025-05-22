# Command Prompt With History Suggestions

---

**command_prompt.sh**: Launches a command prompt with shell history suggestions using fuzzy search

---

### Dependencies

- `shell_history_info.sh` : Outputs shell command history in a tabular format.  
- `improved-fzfmenu.sh` : Wrapper around fzf, with support for custom prompts, titles, and display options.  
- `cut` (coreutils) : Used to process the output (`cut -f2`)  
- `fzf` : Underlying fuzzy finder (presumed used by improved-fzfmenu.sh)  
- Bash (standard shell interpreter)

---

### Description

This script provides an interactive command launcher by leveraging your shell history and fuzzy search. It's particularly useful in environments like Arch Linux under Qtile, where customizable and efficient workflows are paramount.

#### How It Works

1. **Command Extraction:**  
   The script relies on `shell_history_info.sh -l`, which seems to output the shell history in a tabular format. `cut -f2` is used to extract the actual command column (field 2).

2. **Fuzzy Selection:**  
   The processed list is piped to `improved-fzfmenu.sh`, which appears to be a wrapper for `fzf` with enhanced options:
   - `title_is_cmd_prompt` (sets window/prompt title)
   - `--tac` (lists items bottom-to-top, so most recent at bottom/top)
   - `--ansi` (preserve output formatting/colors)

3. **User Prompt:**  
   The user is presented with the fuzzy finder interface, allowing them to quickly search and select a command from their history.

#### (Presumed) Output

The selected command is printed to stdout. Currently, the script does not execute the command—it merely outputs it, making it suitable for piping, scripting, or further keybinding automation.

---

### Usage

You can run the script directly or bind it to a keyboard shortcut from Qtile (recommended for workflow integration):

```bash
~/.scripts/bin/command_prompt.sh
```

#### Example (In Terminal):

```bash
$ ~/.scripts/bin/command_prompt.sh
```

#### Example (Qtile Keybinding):
Add to your `~/.config/qtile/config.py`:
```python
Key([mod], "p", lazy.spawn("~/.scripts/bin/command_prompt.sh"))
```

#### To run and execute immediately (with eval/exec):

You could pipe its output to `bash` (although not currently included, see critique):
```bash
eval "$(~/.scripts/bin/command_prompt.sh)"
```

---

> [!TIP]
> - The script does not actually run the selected command—it only outputs it to stdout. You might want to wrap it or extend the script to automatically execute the selected history command (for example, by appending `| xargs -r bash -c`).
> - There is no error handling if the dependencies (`shell_history_info.sh`, `improved-fzfmenu.sh`) are missing or fail.
> - Consider supporting direct command entry (not just history selection) by adding an "enter custom command" feature.
> - A small TODO is present but not specified; consider clarifying your next planned feature.
> - For better integration, the script could also notify the user if the history is empty or if no command is selected.
