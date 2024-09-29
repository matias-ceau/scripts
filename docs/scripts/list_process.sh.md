# List Running Services

---

**list_process.sh**: A script to list all running services using systemd.

---

### Dependencies

- `systemctl`: The command-line tool to examine and control the systemd system and service manager.

### Description

This script utilizes `systemctl` to list currently running services on a system that employs the systemd initialization system, which is common across many Linux distributions, including Arch Linux. The command `systemctl list-units --type=service` retrieves all available service units, while the flags used in the command enhance its usability:

- `--all`: Displays all service units, including those that are not currently loaded.
- `--no-pager`: Prevents output from being paginated, allowing you to see the full list in one go.
- `--no-legend`: Omits the header information from the output for cleaner results.

Finally, `sort -k4` sorts the output based on the fourth column, which typically contains the status of the services, making it easier to read and analyze the state of each service.

### Usage

To use the script, simply ensure it has executable permissions and run it from the terminal:

```bash
chmod +x /home/matias/.scripts/list_process.sh
/home/matias/.scripts/list_process.sh
```

You can also create a keybinding in your window manager (qtile) to execute this script quickly. For example, you can add the following in your `config.py`:

```python
Key([mod], "l", lazy.spawn("/home/matias/.scripts/list_process.sh")),
```

This will allow you to list services by pressing the appropriate key combination (e.g., mod + l).

---

> [!TIP]  
> While this script efficiently lists services, consider implementing additional features like filtering services based on their status (active, inactive, etc.) or redirecting output to a file for later analysis. This could enhance its usability, especially when managing numerous services.