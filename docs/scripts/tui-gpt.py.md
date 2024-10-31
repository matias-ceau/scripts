# TUI GPT Interface

---

**tui-gpt.py**: A terminal-based GPT chat interface resembling 'Mother' from the Aliens movies.

---

### Dependencies

- `python (>=3.12)`: The script requires Python version 3.12 or higher to run.
- `llm`: A library for handling large language models.
- `textual`: A library for creating TUI (Text User Interface) applications.
- `rich`: Provides the `MONOKAI` theme used for text styling.

### Description

The `tui-gpt.py` script creates a TUI application that acts as a conversational interface with OpenAI's GPT models, specifically the "gpt-4o-2024-08-06" model. It provides a retro feel, simulating the persona of "Mother" from the Aliens franchise. The user inputs prompts which are sent to the model, and the responses are displayed in the terminal application.

The main class `MotherApp` uses `textual` to build a UI layout with thematic styling provided by `rich`. It consists of a header, a scrollable chat view, an input field where users type their prompts, and a footer. The script utilizes asynchronous handling to ensure the application remains responsive during interactions with the GPT API. The script is pre-configured to respond in a specific mode, by setting the `SYSTEM` variable, which guides the character of the responses.

### Usage

To use the script, ensure all dependencies are installed and you have an OpenAI API key set in your environment variables as `OPENAI_API_KEY`.

1. **Run in terminal**: 
   ```bash
   python /home/matias/.scripts/bin/tui-gpt.py
   ```

2. **Input a prompt** into the console's input field.

3. **View response**: The script will process and render the response from the GPT model in the chat view area.

```bash
API_KEY=your_openai_api_key python /home/matias/.scripts/bin/tui-gpt.py
```

Note: Replace `your_openai_api_key` with your actual OpenAI API key.

---

> [!TIP]
> The provided prompt handling is synchronous for text input, which might lead to a delay if the API response is large or slow. Consider implementing a more robust error-handling mechanism if the OpenAI service is unavailable or the API key is invalid. Also, improve the user experience by adding more customization options for the UI, such as color themes or model selections.