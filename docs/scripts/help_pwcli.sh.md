# help_pwcli.sh: Interactive PW CLI Help Interface

---

**/home/matias/.scripts/dev/help_pwcli.sh**: Interactive tool to display help for various pw-cli utilities

---

### Dependencies

- `bash` – Shell interpreter used to run the script  
- `fzf` – Command-line fuzzy finder for interactive selection  
- `bat` – Syntax-highlighting tool for displaying command help output

### Description

This script provides an interactive interface to quickly access help documentation for a series of "pw-" CLI utilities. The core functionality is divided between two functions: 

- The `doc` function echoes a list of available pw commands, each on a new line. Commands include common tools such as pw-cat, pw-config, pw-dump, and many more.
- The `prev` function is used to generate a preview of the help output for the selected command. By taking the command name as an argument, it calls the command with the `-h` flag, then pipes the output to `bat` with syntax highlighting enabled (using the `--color=always -pplhelp` options).

The script then pipes the list of commands from `doc` into `fzf`, setting up an interactive fuzzy search interface. The `--bind focus:refresh-preview` option ensures that the preview pane is updated whenever the selection changes, while the `--preview 'prev {}'` option invokes the `prev` function on the selected command.

This approach allows developers using Arch Linux with the qtile window manager to quickly toggle between different CLI tools' help documents, streamlining access to command options without manually typing out each command in a terminal.

### Usage

Simply run the script in your terminal:
  
  $ ./help_pwcli.sh

You can also bind this script to a key in your qtile configuration for quick access. For example, in your qtile config file you can add a keybinding such as:

  Key(["mod4"], "F1", lazy.spawn("/home/matias/.scripts/dev/help_pwcli.sh"))

This integration makes it fast and convenient to check tool usage during development or debugging sessions.

---

> [!TIP]  
> While the script effectively combines `fzf` and `bat` for an interactive help interface, consider some potential improvements:  
> - The list of commands in the `doc` function is hardcoded; dynamically generating this list could improve maintainability.  
> - The script assumes all commands support the `-h` option and that they exist in the user’s PATH; adding checks could prevent errors.  
> - The custom syntax highlighting option `-pplhelp` for `bat` might be confusing—document its purpose or allow configuration.