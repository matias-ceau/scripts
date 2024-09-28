# Chezmoi Initialization Script for New System

---

**chezmoi_on_a_new_system.sh**: Shell script to initialize and apply dotfiles with `chezmoi`

---

### Dependencies

- `bash`: Required to run this shell script.
- `curl`: The script uses `curl` to download and execute the installer script for `chezmoi`.
- `chezmoi`: A tool for managing your dotfiles across multiple machines. This script uses it to set up dotfiles from a GitHub repository.

### Description

This script is used to set up `chezmoi` on a new system by downloading and running its installation script directly through `curl`. It initializes `chezmoi` with a specific user configuration and applies the dotfiles maintained by `matias-ceau`.

- The script is a brief `bash` command designed to be executed on new Arch Linux setups, running qtile as a window manager.
- It uses the `curl` command with multiple flags:
  - `-f` indicates that `curl` will fail silently on server errors.
  - `-s` silences progress meter.
  - `-L` follows redirects.
  - `-S` ensures that `curl` shows an error message if it fails.

### Usage

To use this script, simply run it in your terminal to download and install `chezmoi`, then initialize it with your desired profile:

```bash
bash /home/matias/.scripts/sys/setup/chezmoi_on_a_new_system.sh
```

- This script does not require any additional arguments and is ready to use as it is.
- It can be ideally placed in your setup documentation or as an automated setup script invoked after installing a fresh instance of Arch Linux with qtile.

---

> [!NOTE] This script assumes that all prerequisites are installed and the user has internet connectivity to download the installer script. Consider adding error handling to ensure `curl` is installed on the system. Usage instructions could also include information on verifying and trusting the source, especially when directly fetching and executing scripts over the internet.