# List Running Services

---

**[list_process.sh](list_process.sh)**: Script to list all running services on the system in sorted order.

---

### Dependencies

- `systemctl`: This command is part of `systemd` and is used to examine and control the systemd system and service manager.

### Description

This script is a simple yet effective tool for listing all the services currently managed by `systemd` on Arch Linux. It utilizes the `systemctl` command to fetch information about the services and formats it for better readability.

The command used in this script is:

```sh
systemctl list-units --type=service --all --no-pager --no-legend
```

- `--type=service`: This option filters the output to include only service units.
- `--all`: This option displays all units, regardless of their current state.
- `--no-pager`: This option prevents the output from being piped through a pager, which is convenient for scripting.
- `--no-legend`: This removes the header from the output, making it cleaner for processing.

After fetching the list, the output is sorted based on the fourth column (which typically represents the service name), ensuring that the services are displayed in a clear manner.

### Usage

To run the script, simply execute it from the terminal:

```sh
bash /home/matias/.scripts/list_process.sh
```

This command will provide a sorted list of all services running on your system without generating pagination or headers, making it ideal for quick checks or integrations into other scripts.

Additionally, if you wish to bind this script to a key in your window manager (qtile), you can add the following entry in your configuration file:

```python
Key([mod], "p", lazy.spawn("/home/matias/.scripts/list_process.sh")),
```

Adjust `mod` to your preferred modifier key.

---

> [!TIP]  
> This script can be enhanced by adding options for filtering the output further, such as by active/inactive services or better formatting (like adding colors or additional service details). Consider implementing opt-in arguments to customize its behavior based on user requirements.
