#!/usr/bin/python

import os

from openai import OpenAI

c = OpenAI(api_key=os.environ["OPENAI_API_KEY"])

response = c.chat.completions.create(
    model="gpt-4o-mini",
    messages=[
        {"role": "system", "content": "You create training data for cow jugglers"},
        {
            "role": "user",
            "content": "I need a CSV of approximately 150 lines and 8 columns",
        },
    ],
)
print(response.choices[0].message.content)
