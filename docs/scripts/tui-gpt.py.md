# Mother: Terminal TUI Chat with GPT

---

**tui-gpt.py**: Interactive TUI chat application for GPT models themed as "Mother" from Aliens.

---

### Dependencies

- `python >=3.12` – Minimum Python version required.
- `openai` – Official OpenAI Python client for API queries.
- `textual` – For building terminal GUI apps.
- `rich` – Used by textual for colors and themes.
- (Optional, commented out but referenced) `llm` – Alternative model interface (not actively used in this script).
- Environment variable: `OPENAI_API_KEY` must be set for authentication.

---

### Description

This script launches a terminal-based chat interface styled after "Mother", the AI from the Alien movies. It uses the [Textual](https://www.textualize.io/) library for a modern terminal UI, showing chat prompts and model responses with custom colors and borders for clarity.

Key features:

- **Prompt/Response distinction**: Your input is styled differently from AI replies.
- **Continuous streaming**: AI responses appear in real time as they are received from OpenAI's GPT API (`gpt-4o-2024-08-06`).
- **Alien lore flavor**: All model output is instructively themed as if spoken by "Mother" from Alien.
- **Persistent vertical scroll**: See previous chat history, auto-scroll enabled.

Key components:

- `MotherApp` class: Main Textual app, handles UI layout and interactions.
- `Prompt` and `Response`: Widgets for displaying user questions and AI answers.
- Upon each input, the script creates a new API chat session and renders the stream live, suitable for direct interactive use in a terminal.

---

### Usage

Set up your API key (one-time, or in your shell config):

```
export OPENAI_API_KEY="sk-..."
```

Run the script directly from your terminal:

```
python /home/matias/.scripts/bin/tui-gpt.py
```

#### TL;DR

- Start chat:  
  ```bash
  python tui-gpt.py
  ```
- Type your query, press `Enter`.
- Responses stream in real time.
- Exit with `Ctrl+C` or standard Textual quit sequences.

Tip: Assign this script to a qtile keybinding for instant access from your Arch setup!

---

> [!NOTE]
> - No error handling for missing or invalid `OPENAI_API_KEY`—fails with an exception if not set.
> - Script depends on a recent version of Textual; older Python packages might not render the interface as intended.
> - Code for the optional `llm` backend is present but commented, which could be cleaned up or made configurable.
> - API key is read directly from the environment; consider adding better secrets management.
> - Consider adding input history navigation and multi-turn chat context for a richer experience.  
> - Currently, the system prompt is hardcoded; making it configurable at runtime could improve utility.