# Environment Loader Test Harness

---

**test-env.sh**: Quick sanity checks for `env.sh` minimal and feature-specific loads

---

### Dependencies

- `bash`
- `../lib/env.sh` — provides `load_env_minimal` and `load_env` functions and exports vars
- `head` — truncates output for the “multiple loads” guard test
- (optional, depending on `env.sh`) `fzf`, `git` — only required if your loader config expects them

### Description

This script is a lightweight test harness meant to be run from the `test/` directory to validate your environment loader (`../lib/env.sh`) on Arch Linux.

It runs five sequential checks and prints key variables to confirm the loader behavior:

1. **Minimal load**  
   Sources `../lib/env.sh`, calls `load_env_minimal`, then prints `SCRIPTS_ENV_LOADED` and `SCRIPTS` to verify the base environment was initialized.

2. **Colors module**  
   Calls `load_env "colors"` and checks that color variables were exported, e.g. `FLEXOKI_LOADED`, `PRIMARY_COLOR`, and sample palette entries (`FLEXOKI_RED`, `FLEXOKI_BLUE`).

3. **FZF module**  
   Calls `load_env "fzf"` and prints `FZF_ENV_LOADED`, `FZF_DEFAULT_COMMAND`, and `FZF_PREVIEW_COMMAND` to ensure your fuzzy-finder defaults are set as expected.

4. **Guard against multiple loads**  
   Calls `load_env "debug,colors,fzf"` and pipes output through `head -3` to quickly inspect that the loader does not re-run expensive initialization when already loaded.

5. **Git paths module**  
   Calls `load_env "git"` and checks path variables like `GIT_REPOS` and `LOCALDATA`.

### Usage

Run it directly from its folder (so the relative `../lib/env.sh` resolves):

    cd /home/matias/.scripts/test
    ./test-env.sh

If you want to use it from elsewhere:

    bash /home/matias/.scripts/test/test-env.sh

Typical workflow:

- run after editing `env.sh`
- run before wiring env-dependent scripts into qtile keybindings/autostart

---

> [!TIP]
> The script assumes it’s executed from `test/` due to `source ../lib/env.sh`. Consider making the path robust with `SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"` and sourcing via `"$SCRIPT_DIR/../lib/env.sh"`. Also, add `set -euo pipefail` (or at least `-u`) for earlier failure detection, and print module load results in a consistent, greppable format (e.g., `printf '%s=%q\n' VAR "$VAR"`).