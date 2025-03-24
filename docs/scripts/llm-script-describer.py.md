# LLM Script Describer

---

**llm-script-describer.py**: Generates documentation for user scripts using LLM

---

### Dependencies

- `colorama`: Used for cross-platform colored terminal output.
- `openai`: Enables LLM interactions to generate descriptive markdown.
- Python (>=3.13): Necessary to run the script.

### Description

This script automates the generation of GitHub-friendly markdown documentation for your collection of user scripts in an Arch Linux environment using qtile as your window manager. Its primary role is to analyze, update, and document scripts by reading their content or, for binary files, by locating the associated source file using predefined extensions (e.g., .py, .sh, .c). The script begins by updating symlinks via an external helper script, ensuring that your scripts are correctly linked, then uses utilities like `fd` and `rg` to scan your designated SCRIPTS directory for files to process.

Once a file is identified, it computes a SHA256 hash to determine if the script has been modified since the last documentation update. If changes are detected or it’s a new script, its content is either directly read or, in case of binary files, derived from the associated source file, before being sent to an OpenAI LLM model for description generation. The resulting markdown is written to the docs folder, and the index is updated to reflect new entries. Moreover, the script consolidates the individual markdown files into a comprehensive summary that is embedded within your main README.md, complete with an updated table of scripts, ensuring that your repository stays organized and up-to-date.

The script is designed to be run interactively or automatically, integrating seamlessly with your workflow—be it a qtile keybinding or a scheduled cron job. Configuration is achieved via environment variables such as SCRIPTS (for the scripts directory) and OPENAI_API_KEY (for authenticating LLM requests).

---

> [!TIP]
> Consider enhancing exception handling in scenarios where external commands may fail, and verify that dependencies like `fd` and `rg` are installed on your system. Additionally, refining log messages and user prompts can lead to a more robust and user-friendly experience. This modular design offers great flexibility, but regular maintenance of external dependency paths and source file associations is recommended for long-term reliability.