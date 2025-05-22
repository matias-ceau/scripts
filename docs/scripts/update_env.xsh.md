# Update Environment File with API Keys

---

**update_env.xsh**: Extracts current environment API keys and writes them to a `.env` file.

---

### Dependencies

- `xonsh`: Python-powered shell; needed to run `.xsh` scripts.
- Environment variables: The script expects all API keys to be present as environment variables ending with `API_KEY`.

---

### Description

This script is designed to help you manage your API keys on your Arch Linux system (WM: qtile). It scans all your environment variables for keys whose names end with `API_KEY`, then creates (or overwrites) the file `$HOME/.env` containing these key-value pairs in standard dotenv format.

#### Main Steps:

1. Collect all environment variables ending with `API_KEY` using a dictionary comprehension.
2. Format each `KEY=VALUE` pair, joined by newlines.
3. Write this content to `$HOME/.env`.

**Example entry in `.env` after running:**
```
OPENAI_API_KEY=sk-XXXXX
GITHUB_API_KEY=ghp-YYYYY
```

---

### Usage

You can run this script directly in any terminal where `xonsh` is available:

```
xonsh /home/matias/.scripts/bin/update_env.xsh
```

Or, if it's executable:
```
~/.scripts/bin/update_env.xsh
```

If you want to automate or bind it to a key (for example in qtile or sxhkd), simply add the above command.

**Typical workflow:**
1. Export your API keys in your shell session:
    ```
    export OPENAI_API_KEY=sk-XXXXX
    export GITHUB_API_KEY=ghp-YYYYY
    ```
2. Run the script to update `.env`:
    ```
    update_env.xsh
    ```

---

> [!TIP]
>
> - **Security note:** The script will overwrite your `.env` every time; make sure this is intended, especially if you store additional values in `.env` manually.
> - **Improvements:** Consider adding:
>    - A warning or backup of previous `.env` before overwriting.
>    - Filtering or support for other secrets (not just `API_KEY` suffixes).
>    - Option to append instead of overwrite.
>    - Logging/echo output for feedback.
>
> Also, note that this script pulls variables from the current environment—not from files or shells other than the one running the script. If running from a graphical launcher that doesn't inherit your terminal env, you might not get all keys.