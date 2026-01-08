# Textual GPT TUI Chat Client

---

**tui-gpt.py**: Textual-based TUI chat client streaming responses from OpenAI

---

### Dependencies

- `uv` (shebang runner): executes the script with inline dependency resolution (`uv run --script`)
- `python>=3.12`
- `openai`: OpenAI API client used for streaming chat completions
- `textual`: TUI framework (widgets, events, worker threads)
- `rich`: used for terminal theme (`MONOKAI`) via Textual’s `ansi_theme_dark`
- Environment: `OPENAI_API_KEY` must be set

### Description

This script provides a minimal chat-like TUI (well-suited for qtile keybind launching) built with Textual. It renders the conversation as alternating Markdown blocks:

- `Prompt`: user messages, styled with a subtle `$primary` background and right margin.
- `Response`: assistant messages, bordered and styled with `$success` background; `BORDER_TITLE` shows the selected model (`gpt-4o-2024-08-06`).

On submit (`Input.Submitted`), it:
1. Clears the input.
2. Mounts a `Prompt` widget with the user text.
3. Mounts an empty `Response` widget and anchors it (keeps view near the latest message).
4. Streams the OpenAI response in a background thread (`@work(thread=True)`), incrementally updating the Markdown content via `call_from_thread`.

The system prompt is intentionally blunt (`SYSTEM = "Formulate all responses as if you gave a shit."`), and the API call uses `chat.completions.create(..., stream=True)` to provide token-by-token updates.

### Usage

Set your API key:

    export OPENAI_API_KEY="…"

Run directly (thanks to the `uv` shebang):

    /home/matias/.scripts/bin/tui-gpt.py

Typical flow:
- Type a prompt in the input field
- Press Enter to submit
- Watch the response stream into the bordered message box

Optional qtile integration (example idea):

    lazy.spawn("~/.scripts/bin/tui-gpt.py")

---

> [!TIP]
> Improvements to consider:
> - Add conversation memory (include prior turns in `messages`) so the model can follow context.
> - Guard against missing `OPENAI_API_KEY` (show a friendly error in the UI instead of a `KeyError`).
> - Handle streaming edge cases: `chunk.choices[0].delta.content` can be `None` and `choices` can vary; add safer checks.
> - Consider input disabling while a request is running, plus cancellation/interrupt support.
> - The script header lists `llm` as a dependency but it’s not used (commented out); remove it or add a toggle to select backend.