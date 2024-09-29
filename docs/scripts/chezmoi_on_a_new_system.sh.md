# Chezmoi Installation Script

---

**chezmoi_on_a_new_system.sh**: Automates Chezmoi setup on a new system for user matias-ceau.

---

### Dependencies

- `curl`: A command-line tool for transferring data with URLs, required to download Chezmoi.
- `bash`: The script is written in Bash and needs a compatible shell to execute.

### Description

This script is designed for quickly setting up the [Chezmoi](https://chezmoi.io) configuration management tool on a new system. Chezmoi allows users to manage their dotfiles and configuration across multiple machines seamlessly.

The script works by using `curl` to fetch the installer for Chezmoi and initializing it with the `--init` and `--apply` flags, specifically for the user configuration named `matias-ceau`. 

The process performed by the script is as follows:
1. **Downloading the Installer**: It utilizes a command substitution with `$(...)` to execute `curl` commands that securely fetch the installation script for Chezmoi.
2. **Initialization**: The `--init` flag sets up Chezmoi with the configurations stored under the specified user.
3. **Application of Configurations**: The `--apply` flag automatically applies the dotfiles and configurations to the new system.

This streamlined approach minimizes manual setup time and ensures that the necessary configurations are applied correctly upon installation.

### Usage

To use this script, you need to run it in your terminal. You can execute it directly with the following command:

```bash
bash /home/matias/.scripts/sys/setup/chezmoi_on_a_new_system.sh
```

**Note**: Ensure that you have `curl` installed on your system before running the script. Also, you should replace `matias-ceau` with your username if necessary.

---

> [!TIP] 
> While this script is simple and effective, consider adding error handling to ensure the script gracefully handles issues such as network problems or failed installations. Additionally, prompting the user for their username might make the script more flexible for different environments.