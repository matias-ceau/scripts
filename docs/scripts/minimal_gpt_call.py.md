# Minimal GPT Call Script

---

**minimal_gpt_call.py**: Python script to generate training data CSV for cow jugglers

---

### Dependencies

- `python`: The script is written in Python.
- `openai`: Python library used to interact with the OpenAI API.
- `os`: Standard Python module for environment variable management.

---

### Description

This script serves as a minimal example of how to interact with the OpenAI Chat Completion API. Its primary purpose is to generate a CSV file containing training data, specifically aiming for around 150 lines and 8 columns. The unique premise is dictated by the system prompt, which instructs the AI to generate training data for cow jugglers, adding a playful touch to the use case.

The script begins by importing the necessary modules, particularly using the `os` module to fetch the API key from the environment variable `OPENAI_API_KEY`. The OpenAI client is then instantiated with this key. Next, it sends a chat message featuring two roles (system and user) that define the task and the specifics of the CSV generation. The response is captured, and the content of the first message choice is printed to standard output.

This is especially useful when you want to programmatically generate data without manual intervention. It can be wired to a keybinding in qtile or executed automatically in your Arch linux environment.

---

### Usage

To run this script, ensure that you have set the `OPENAI_API_KEY` environment variable with your valid API key. Then, execute the script from your terminal, for example:

    export OPENAI_API_KEY='your_openai_api_key_here'
    /home/matias/.scripts/dev/minimal_gpt_call.py

Alternatively, you can directly call it with Python:

    python /home/matias/.scripts/dev/minimal_gpt_call.py

This script is intended to be assigned to a keybinding in qtile if interactive terminal usage is not preferred.

---

> [!TIP]  
> While the script provides a straightforward demonstration, consider adding error handling (e.g., try/except blocks) around API calls to better manage potential connection or API errors. Also, the model "gpt-4o-mini" might be a placeholder or non-standard; verify against your OpenAI account for the available models and adjust if necessary. Future improvements could include more flexible input options or writing the output directly to a CSV file.