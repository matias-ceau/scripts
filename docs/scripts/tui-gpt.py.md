# TUI GPT - Mother AI Interface

---

**tui-gpt.py**: A terminal-based user interface for interacting with an AI named Mother from the Aliens movies.

---

### Dependencies

- `llm`: API for language models, required for interfacing with OpenAI's models.
- `textual`: A framework to build rich user interfaces in the terminal.

### Description

The `tui-gpt.py` script creates a terminal user interface (TUI) that lets users interact with an AI modeled after "Mother" from the Aliens series. Built using the `textual` library, it connects to OpenAI's API to generate responses based on user input.

The main features include:

- A Markdown-based display for both user prompts and AI responses.
- A responsive, scrollable interface that manages user queries effectively.
- An automatic connection to OpenAI using the provided API key from environment variables.

Key components include:

- **Prompt & Response**: Custom classes derived from `Markdown` to render user inputs and AI responses respectively.
- **Styling**: CSS-like syntax to define visual appearance for interactive elements within the TUI.
- **Event Handling**: Listens for user input, processes it asynchronously with OpenAI's API, and updates the display in real time.

### Usage

Run the script in the terminal. Ensure you have set your OpenAI API key in your environment:

```bash
export OPENAI_API_KEY='your_api_key_here'
```

To execute the script, simply run:

```bash
python /home/matias/.scripts/tui-gpt.py
```

Once running, it presents a prompt asking "How can I help you?". Type your query and press Enter:

1. Type your question, for example:
   ```
   What is the purpose of your existence?
   ```

2. Press Enter to submit. The AI will respond promptly in the terminal interface.

The interface supports continuous interaction until you choose to exit the application.

---

> [!TIP] 
> While the script has a solid foundation, consider implementing error handling for API failures or invalid inputs to enhance stability. Additionally, you may want to look into performance optimizations for rendering in larger conversations, such as limiting the message history displayed. Implementing pagination could also be beneficial for extensive outputs.