# List Running Services Script

---

**list_process.sh**: Displays a sorted list of all running services on your system.

---

### Dependencies

- `systemctl`: A command-line utility to examine and control the systemd system and service manager.
- `sort`: Used to sort lines of text files.

### Description

The `list_process.sh` script is a straightforward tool designed to list all the services managed by `systemctl` on your Arch Linux system and then sort them according to their state. 

- The command `systemctl list-units --type=service --all --no-pager --no-legend` provides a list of all service units. The `--type=service` flag ensures that only services are listed, while `--all` includes all services regardless of state. The `--no-pager` flag disables paging, preventing the output from being sent to a pager like `less`. The `--no-legend` flag removes the legend from the output, making it cleaner.
- The output is piped to `sort -k4`, which sorts the services based on the fourth column, typically the status of each service, letting you easily see which services are active or inactive.

### Usage

To execute this script:

```bash
sh /home/matias/.scripts/bin/list_process.sh
```

This command will output a sorted list of all service units on your system. You may want to bind this script to a key combination in qtile to run it quickly without opening a terminal, or include it in a status script to keep track of service states.

Example:

```bash
mod + shift + s # Bind this command in your qtile config to run the script and display output
```

---

> [!TIP]
> There is room for improvement in this script. If possible, consider adding options to filter output by service state (e.g., active, inactive). Also, capturing errors or providing user feedback within the script could improve its usability, especially when running it interactively.