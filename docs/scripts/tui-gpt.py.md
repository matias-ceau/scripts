# Textual GPT TUI Chat

---

**tui-gpt.py**: Textual-based streaming OpenAI chat TUI (quick prompt/response loop)

---

### Dependencies

- `python>=3.12`
- `uv` (because of the `#!/usr/bin/env -S uv run --quiet --script` shebang; enables single-file script execution)
- `textual` (TUI framework: layout, widgets, event handling, threading helpers)
- `openai` (Python SDK providing `OpenAI` client used for streaming chat completions)
- `rich` (pulled by Textual; `MONOKAI` terminal theme is used explicitly)

Environment variables:
- `OPENAI_API_KEY` (required; script indexes `os.environ["OPENAI_API_KEY"]`)
- `OPENAI_MODEL` (optional; defaults to `gpt-5.2`)

### Description

This script provides a minimal chat interface in the terminal using Textual. It renders each user message as a `Prompt` (left-ish, primary tint) and each assistant message as a `Response` (right-ish, success tint) inside a `VerticalScroll` container.

Key behaviors:
- Streaming responses: `send_prompt()` calls `client.chat.completions.create(..., stream=True)` and incrementally updates the `Response` widget as tokens arrive.
- Non-blocking UI: `@work(thread=True)` runs the network request in a worker thread, while `call_from_thread()` safely updates the UI.
- Opinionated system prompt: `SYSTEM = "Formulate all responses as if you gave a shit."` is always prepended.

The `Response` widget’s border title is set to the active model name (`MODEL`), making it easy to confirm which model is being used.

### Usage

Run directly (thanks to `uv` shebang):

    chmod +x ~/.scripts/bin/tui-gpt.py
    ~/.scripts/bin/tui-gpt.py

Or run explicitly:

    uv run --quiet --script ~/.scripts/bin/tui-gpt.py

Set credentials/model:

    export OPENAI_API_KEY="..."
    export OPENAI_MODEL="gpt-5.2"

Qtile keybinding idea (spawn in your preferred terminal):

    lazy.spawn("alacritty -e ~/.scripts/bin/tui-gpt.py")

---

> [!TIP]
> Consider adding basic error handling: missing `OPENAI_API_KEY`, network failures, and `delta.content` being `None` for non-text events. Also, chat history isn’t preserved (each request sends only the latest user prompt + system); if you want continuity, maintain a messages list and append turns. Finally, `OpenAI` is used but not listed in the `uv` dependencies header (only `llm`/`textual` are); add `openai` (and optionally `rich`) there for reproducible installs.