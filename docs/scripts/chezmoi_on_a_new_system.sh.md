# Setup Chezmoi on a New System

---

**[chezmoi_on_a_new_system.sh](chezmoi_on_a_new_system.sh)**: Script to initialize Chezmoi on a new system for a specific user

---

### Dependencies

- `curl`: A command-line tool for transferring data with URLs. Required to fetch the Chezmoi installation script.

### Description

This script is designed to automate the initial setup of Chezmoi, a tool for managing dotfiles across systems, on a new Linux installation. When executed, the script performs the following actions:

1. **Fetch Installation Script**: It uses `curl` to download the Chezmoi installation script directly from its official URL.
2. **Initialize Chezmoi**: The script initializes Chezmoi with a predefined configuration specific to the user `matias-ceau`, applying pre-set dotfile configurations immediately.

The primary purpose is to streamline the setup process, allowing users to get their dotfiles in place quickly and efficiently right after setting up a new system. 

### Usage

To run this script, simply execute it from your terminal. Make sure to grant execution permissions to the script if it’s not already executable:

```bash
chmod +x /home/matias/.scripts/sys/setup/chezmoi_on_a_new_system.sh
```

Then, you can run the script as follows:

```bash
/home/matias/.scripts/sys/setup/chezmoi_on_a_new_system.sh
```

After running, the script should automatically initialize Chezmoi with the specified configuration, setting up your dotfiles as defined in your Chezmoi repository.

---

> [!TIP]  
> Consider adding error handling to the script to manage potential issues, such as failing to download the installation script. Additionally, you might want to parameterize the username to make the script more versatile for use on different accounts without modification. Furthermore, reviewing and updating the script with comments would enhance readability and maintainability.
