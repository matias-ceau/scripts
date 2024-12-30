import json
with open('conversations.json', 'r') as file:
    data = json.load(file)

for d in data:
    with open(f"markdown/claude-{d['uuid']}.md", 'w') as file:
        file.writelines([
            "---\n",
            "ntype: chat\n",
            f"title: {d['name']}\n",
            f"date: {d['created_at'].split('T')[0]}\n",
            f"model: 'claude-3.5-sonnet'\n",
            "---\n\n"
        ] + [f"## {c['sender']}\n\n{c['text']}\n\n~~~json\n{c.get('attachments')}\n~~~\n" 
             for c in d["chat_messages"]]
                       )