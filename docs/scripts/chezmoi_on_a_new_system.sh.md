# Chezmoi Setup Script (chezmoi_on_a_new_system.sh)

---

This script sets up the Chezmoi configuration management tool on a new system.

---

### Table of contents

- [Dependencies](#dependencies)
- [Description](#description)
    - [Overview](#overview)
    - [Usage](#usage)
    - [Examples](#examples)
- [Notes](#notes)

---

<a name="dependencies" />

### Dependencies

- `bash` (Bash shell)
- `curl` (for downloading Chezmoi installer)

<a name="description" />

### Description

<a name="overview" />

#### Overview

This script is designed to quickly initialize and apply a Chezmoi configuration for a user named `matias-ceau`. Chezmoi is a dotfile manager that allows you to manage your configuration files across multiple systems. 

The script uses `curl` to fetch the installation script for Chezmoi from the official source and then runs it with the `init` and `apply` commands. The `init` command creates an initial Chezmoi configuration, and `apply` applies that configuration to the current system, ensuring that all managed dotfiles are correctly placed.

This script is particularly useful for users who want to set up their dotfiles quickly on a fresh installation of Arch Linux with qtile as their window manager. 

---

<a name="usage" />

#### Usage

To use this script, simply execute it in a terminal. Make sure that you have `bash` and `curl` installed. You can run it with the following command:

```bash
bash ~/scripts/sys/setup/chezmoi_on_a_new_system.sh
```

This will initiate the Chezmoi setup with the specified user configuration.

<a name="examples" />

#### Examples

1. **Basic Setup**: Run the script after a fresh installation.

   ```bash
   bash ~/scripts/sys/setup/chezmoi_on_a_new_system.sh
   ```

2. **Verifying Installation**: After running the script, check your home directory for the `.local/share/chezmoi` directory to ensure the configuration has been applied.

---

<a name="notes" />

### Notes

- Ensure that you replace `matias-ceau` in the script with your actual username if it's different. 
- This script assumes that there is an internet connection to download Chezmoi.
- The script only configures Chezmoi; additional configuration steps for your dotfiles may be necessary after running this script.

> **Critique:**
> 
> The script lacks error handling, which could be crucial if the `curl` command fails (e.g., due to network issues). Consider checking the exit status of `curl` before proceeding with the initialization and application of the Chezmoi configuration. Additionally, it would be more user-friendly to include instructions or output that indicates the progress of the script.