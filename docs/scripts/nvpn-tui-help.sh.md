# nvpn-tui-help.sh: NordVPN TUI Helper

---

**nvpn-tui-help.sh**: Interactive TUI to navigate `nordvpn` commands (and other supported programs) with `fzf`.

---

### Dependencies

This script requires the following dependencies:
- `fzf`: Command-line fuzzy finder used for the interactive TUI.
- `bat`: A `cat` clone with syntax highlighting for previewing command help (view it with readable colors).
- Supported utilities for dynamic integration:
  - `nordvpn`: Default program to control NordVPN via CLI.
  - `docker`, `kubectl`, `git`: Other supported programs for subcommand exploration and execution.
- `sed`: Used for manipulating command output for clean previews.
- `bash` (v4.0 or above): To support associative arrays and advanced scripting features.

### Description

This script provides a terminal user interface (TUI) for navigating and exploring supported CLI commands, starting with `nordvpn` by default. It utilizes `fzf` to display available subcommands or completions dynamically and allows you to select options interactively. 

Key highlights:
- **Dynamic Program Support**: Built-in configurations exist for `nordvpn`, `docker`, `kubectl`, and `git`. The script dynamically adjusts the completion and help flags based on the selected program.
- **Command Previews**: Provides a preview of help text (*via `bat`*) and subcommands for the selected options.
- **Command History**: Tracks past commands, allowing seamless navigation back through previous states.
- **Interactive Features**:
  - Use arrow keys to navigate commands.
  - Toggle previews with `Ctrl-/`.
  - Move quickly in the preview window with `Ctrl-h/l` or `Alt-up/down`.

### Usage

Run the script in a terminal with:
```bash
./nvpn-tui-help.sh [program]
```
- `program`: Optional. Specifies the CLI utility you want to explore (`nordvpn` is the default).

Examples:
```bash
# Explore NordVPN commands:
./nvpn-tui-help.sh

# Explore Docker commands:
./nvpn-tui-help.sh docker

# Explore Git commands:
./nvpn-tui-help.sh git
```

Once the interface loads:
1. Use `fzf` arrows to navigate subcommands.
2. Execute a command by hitting Enter.
3. Go back using the `.. (back)` option.

---

> [!TIP]
> - **Improvement Idea**: Add more program configurations dynamically instead of hardcoding them into the script. Consider supporting external config files for flexibility.
> - **Potential Issue**: If `bat` is not installed or improperly configured, previews may fail. Consider a fallback mechanism using basic `cat` or pure text outputs.
> - **Enhancement**: Enable persistent logging of all executed commands to a file (e.g., for debugging or review purposes).