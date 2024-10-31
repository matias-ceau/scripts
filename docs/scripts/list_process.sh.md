# List Running Services Script

---

**list_process.sh**: Lists all running service units using `systemctl`

---

### Dependencies

- `systemctl`: Utilized to list service units. It is part of the `systemd` suite which is native to many Linux distributions, including Arch Linux.
- `sort`: Used here to organize the output based on the fourth column.

### Description

This script is a simple shell script designed to provide a sorted list of all service units on your machine. It leverages `systemctl`, which is the system and service manager for Linux operating systems that use `systemd`. The command used is:

```bash
systemctl list-units --type=service --all --no-pager --no-legend | sort -k4
```

Here’s a breakdown of the `systemctl` options used:
- `--type=service`: Limits the output to service units.
- `--all`: Shows all loaded units, regardless of their state.
- `--no-pager`: Disables paging through results, so all output is listed directly.
- `--no-legend`: Omits the legend, cleaning up the output for easier parsing or reading.

The `sort -k4` part means the script sorts the listed services by the fourth column, which typically corresponds to the state of the service.

### Usage

To use this script:
1. Make sure you have the necessary permissions to execute it. You might need to run `chmod +x /home/matias/.scripts/bin/list_process.sh`.
2. Execute the script by running:

   ```bash
   /home/matias/.scripts/bin/list_process.sh
   ```

This script can be run directly in the terminal or be bound to a shortcut key in your qtile configuration for quick access.

---

> [!TIP]
> One possible improvement is to add filtering based on specific statuses or unit names, allowing more refined searches. Additionally, consider adding headers or better formatting for easier readability when the script output is longer.