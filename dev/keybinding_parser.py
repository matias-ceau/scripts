"""
Parse qtile keybindings
"""

import re


def parse_keybindings(config):
    keybindings = []
    key_pattern = re.compile(
        r"Key\((\[.*?\]),\s*\"(.*?)\",\s*(lazy\..*?),\s*desc=\"(.*?)\"\)"
    )
    keychord_pattern = re.compile(
        r"KeyChord\((\[.*?\]),\s*\"(.*?)\",\s*\[(.*?)\],\s*name=\"(.*?)\""
    )

    for match in key_pattern.finditer(config):
        modifiers, key, command, description = match.groups()
        keybindings.append(
            {
                "modifiers": modifiers,
                "key": key,
                "command": command,
                "description": description,
            }
        )

    for match in keychord_pattern.finditer(config):
        modifiers, key, inner_keys, name = match.groups()
        keybindings.append(
            {
                "modifiers": modifiers,
                "key": key,
                "command": f"KeyChord: {name}",
                "description": f"KeyChord: {name}",
            }
        )
        for inner_match in key_pattern.finditer(inner_keys):
            inner_modifiers, inner_key, inner_command, inner_description = (
                inner_match.groups()
            )
            keybindings.append(
                {
                    "modifiers": inner_modifiers,
                    "key": inner_key,
                    "command": inner_command,
                    "description": inner_description,
                }
            )

    return keybindings


def print_keybindings(keybindings):
    for kb in keybindings:
        print(
            f"Modifiers: {kb['modifiers']}, Key: {kb['key']}, Command: {kb['command']}, Description: {kb['description']}"
        )


if __name__ == "__main__":
    with open("/home/matias/.config/qtile/_keys.py", "r", encoding="utf-8") as file:
        config_content = file.read()

    all_bindings = parse_keybindings(config_content)
    print_keybindings(all_bindings)
