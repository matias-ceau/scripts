# chezmoi_on_a_new_system.sh

Certainly! Below is the GitHub documentation in markdown format for the provided script:

---

# Chezmoi Initialization Script

This repository contains a simple script to initialize and apply a Chezmoi configuration using a remote install script. The script downloads and executes the Chezmoi installation script from a specified URL and initializes the Chezmoi configuration for a given user.

## Script Overview

### File: `init-chezmoi.sh`

```bash
#! /usr/bin/bash

"$(curl -fsLS get.chezmoi.io)" -- init --apply matias-ceau
```

### Functionalities

- **Downloading Chezmoi**: The script uses `curl` to fetch the Chezmoi install script from the URL `https://get.chezmoi.io`.
- **Executing the Install Script**: The fetched script is then executed immediately to initialize Chezmoi.
- **Initializing and Applying Configuration**: The command `chezmoi init --apply matias-ceau` is run, which initializes the Chezmoi configuration for the user `matias-ceau` and applies the configuration settings immediately.

## Requirements

- **curl**: This script requires `curl` to be installed on the system to download the Chezmoi install script.
- **Bash**: The script is written for the Bash shell (`/bin/bash`).

## Usage

1. **Clone the Repository** (if applicable):

    ```sh
    git clone https://github.com/your-username/your-repo.git
    cd your-repo
    ```

2. **Run the Script**:

    Ensure the script has execution permissions and run it:

    ```sh
    chmod +x init-chezmoi.sh
    ./init-chezmoi.sh
    ```

    Alternatively, you can directly run the command without cloning:

    ```sh
    "$(curl -fsLS get.chezmoi.io)" -- init --apply matias-ceau
    ```

## Notes

- **User Configuration**: Replace `matias-ceau` with your own Chezmoi username if you have a different configuration repository.
- **Safety Considerations**: Always review the content of scripts fetched from the internet before executing them. The URL specified (`get.chezmoi.io`) should point to an official and trusted source for installing Chezmoi.

## Additional Information

- **Chezmoi Documentation**: For more details on Chezmoi and its usage, visit the [Chezmoi documentation](https://www.chezmoi.io/docs/).

## License

This script is provided "as-is" without any warranties. Refer to the repository's `LICENSE` file for more information.

## Contribution

Contributions are welcome! Please open an issue or submit a pull request with your proposed changes.

---

Feel free to customize this documentation further to match the specifics of your repository and usage instructions.