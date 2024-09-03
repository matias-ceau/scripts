# List Running Services

---

**list_process.sh**: A simple script to list all running services sorted by their status.

---

### Dependencies

- `systemctl`: This command is used to manage services on systems using `systemd`, the init system used by Arch Linux.

### Description

The `list_process.sh` script is designed to provide an overview of all running services on your system. By utilizing the `systemctl` command, it retrieves information about active services and formats the output for easier reading.

The script performs the following actions:
1. **List Services**: It invokes `systemctl list-units` with the following options:
   - `--type=service`: Filters the output to display only service units.
   - `--all`: Shows all units regardless of their state.
   - `--no-pager`: Disables paging to display all results directly in the terminal.
   - `--no-legend`: Suppresses the header row in the output.

2. **Sorting**: The output is sorted based on the fourth column, which typically represents the service's status, providing a clear view of which services are currently active.

### Usage

To run this script, you simply need to execute it from the command line. It does not require any additional parameters:

```sh
bash /home/matias/.scripts/list_process.sh
```

You can also create a keybinding in your window manager (Qtile) to quickly access this script. Below is an example of how you might set up a keybinding in your `config.py`:

```python
from libqtile import widget, hook

@hook.subscribe.startup_once
def autostart():
    subprocess.Popen(['bash', '/home/matias/.scripts/list_process.sh'])
```

Alternatively, you could execute it directly from a terminal window as needed.

---

> [!TIP]  
> Consider adding options to filter services based on their status (active, inactive, etc.) or extending the script to provide detailed information about a selected service. This could enhance usability and give users more control over the output.