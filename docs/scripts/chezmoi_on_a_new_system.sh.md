# Initialize and Apply Chezmoi Configuration

---

**chezmoi_on_a_new_system.sh**: A script to initialize and apply Chezmoi configurations for a new system

---

### Dependencies

- `curl`: Command line tool for transferring data with URLs. Used here to fetch the Chezmoi installation script.
- `chezmoi`: A tool for managing your dotfiles across multiple machines. This script sets up Chezmoi and applies configurations.

### Description

This script automates the process of initializing and applying your Chezmoi configuration on a new system. Chezmoi is particularly useful for managing your dotfiles across different environments in a consistent manner. The script does the following:

1. Uses `curl` to download the Chezmoi installation script from the official source (`get.chezmoi.io`).
2. Executes the installation script with options `--init` and `--apply` to directly initialize and apply the Chezmoi configuration for the user `matias-ceau`.

This script assumes that Chezmoi is being used to manage the user's dotfiles or configurations and that `matias-ceau` is a configured identifier on Chezmoi.

### Usage

To use this script, run it directly from the command line. It needs to be executed in a shell environment where `bash` is available and assumes that `curl` is installed. 

```bash
bash /home/matias/.scripts/meta/run_once/chezmoi_on_a_new_system.sh
```

It's ideal for setting up a new installation or ensuring the dotfiles are in sync by executing it either manually in a terminal or as part of an automated setup routine.

---

> [!NOTE]
> This script presumes `curl` is pre-installed and accessible in the user's PATH on the new system—common in most Linux distributions but worth checking. Additionally, this script lacks error handling; adding checks to verify successful installation and application of the configuration could enhance reliability.