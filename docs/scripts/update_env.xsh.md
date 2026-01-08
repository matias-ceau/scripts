# Export API keys to `~/.env`

---

**update_env.xsh**: Writes `*_API_KEY` environment vars into `~/.env`

---

### Dependencies

- `xonsh` (shebang: `/usr/bin/xonsh`)
- A shell environment where your API keys are already exported (e.g., from qtile autostart, `~/.profile`, `direnv`, etc.)

### Description

This Xonsh script snapshots your current environment and generates a simple dotenv-style file at `~/.env`.

How it works:

- It inspects the current environment mapping (`${...}` in xonsh).
- It filters variables whose name ends with `API_KEY` (exact suffix match on the last 7 characters).
  - Examples matched: `OPENAI_API_KEY`, `GITHUB_API_KEY`
  - Not matched: `APIKEY`, `OPENAI_KEY`, `API_KEY_EXTRA`
- It writes the selected variables to `~/.env` in the form:

  - `NAME=value`
  - one per line, with a trailing newline at the end of the file

This is handy on Arch + qtile setups where you want a single dotenv file for apps/scripts without duplicating secrets in multiple places. Note that it overwrites `~/.env` every run.

### Usage

Run manually (interactive or from a launcher):

    update_env.xsh

Or explicitly:

    /home/matias/.scripts/bin/update_env.xsh

Typical flow:

    export OPENAI_API_KEY="..."
    export SOME_SERVICE_API_KEY="..."
    update_env.xsh
    cat ~/.env

You can bind it in qtile (e.g., via `lazy.spawn("update_env.xsh")`) after your session has loaded the environment variables you want to capture.

---

> [!TIP]
> Consider quoting/escaping values when writing dotenv (spaces, `#`, newlines) and using `os.path.join($HOME, ".env")` instead of string concatenation. Also, the script currently overwrites `~/.env` unconditionally—if you store other variables there, you may want to merge/update instead. Finally, filtering only by `*_API_KEY` is simple but may miss secrets using other naming conventions (e.g., `TOKEN`, `SECRET`, `KEY`).