#!/usr/bin/env -S uv run --quiet --script

# /// script
# requires-python = ">=3.12"
# dependencies = [
#     "llm",
#     "textual",
# ]
# ///
import os

from openai import OpenAI
from rich.terminal_theme import MONOKAI
from textual import on, work
from textual.app import App, ComposeResult
from textual.containers import VerticalScroll
from textual.reactive import Reactive
from textual.widgets import Footer, Header, Input, Markdown

SYSTEM = """Formulate all responses as if you gave a shit."""
MODEL = "gpt-4o-2024-08-06"


class Prompt(Markdown):
    pass


class Response(Markdown):
    BORDER_TITLE = MODEL


class MotherApp(App):
    ansi_theme_dark = Reactive(MONOKAI, init=False)
    AUTO_FOCUS = "Input"

    CSS = """
    Prompt {
        background: $primary 10%;
        color: $text;
        margin: 1;        
        margin-right: 8;
        padding: 1 2 0 2;
    }

    Response {
        border: wide $success;
        background: $success 10%;   
        color: $text;             
        margin: 1;      
        margin-left: 8; 
        padding: 1 2 0 2;
    }
    """

    def compose(self) -> ComposeResult:
        yield Header()
        with VerticalScroll(id="chat-view"):
            yield Response("INTERFACE 2037 READY FOR INQUIRY")
        yield Input(placeholder="How can I help you?")
        yield Footer()

    def on_mount(self) -> None:
        # self.model = llm.get_model("gpt-4o-2024-08-06")
        self.model = OpenAI(api_key=os.environ["OPENAI_API_KEY"])

    @on(Input.Submitted)
    async def on_input(self, event: Input.Submitted) -> None:
        chat_view = self.query_one("#chat-view")
        event.input.clear()
        await chat_view.mount(Prompt(event.value))
        await chat_view.mount(response := Response())
        response.anchor()
        self.send_prompt(event.value, response)

    @work(thread=True)
    def send_prompt(self, prompt: str, response: Response) -> None:
        response_content = ""
        # llm_response = self.model.prompt(prompt, system=SYSTEM)
        llm_response = self.model.chat.completions.create(
            model=MODEL,
            stream=True,
            messages=[
                {"role": "system", "content": SYSTEM},
                {"role": "user", "content": prompt},
            ],
        )
        for chunk in llm_response:
            response_content += chunk.choices[0].delta.content or ""
            self.call_from_thread(response.update, response_content)


if __name__ == "__main__":
    app = MotherApp()
    app.run()
