# Show Custom Keyboard Layout

---

**show_keyboard_layout.py**: Prints a custom visual keyboard layout to the terminal for reference.

---

### Dependencies

- `python` (Standard Arch package; script uses standard library only)

### Description

This script displays an ASCII art representation of a custom keyboard layout. It's designed to offer a quick, clear reference for special or nonstandard keys, such as accented letters or alternative symbols, which are useful in multilingual or custom XKB setups. 

The layout is stored as a raw string (`keyboard_layout`) containing a stylized keyboard grid, with rows for each section (digits, QWERTY, modifiers, etc.). The printout includes:
- Primary and alternate character layers per key (such as Shift/AltGr positions)
- Modifier keys clearly labeled (`Shift`, `Alt`, `Ctrl`, `Super`)
- Extra characters for specific international input: `ä`, `ß`, `ñ`, `ö`, `œ`, and more.
- Unicode and other extended symbols for rapid reference while typing.

This is especially helpful for users running tiling window managers like qtile under Arch Linux, where you may want to avoid GUI utilities for layout checking.

### Usage

You can run this script directly in your terminal. It's ideal to bind this script to a key combination in qtile, so you can pop up your keyboard reference at any time.

**TL;DR**:  

```bash
python ~/.scripts/bin/show_keyboard_layout.py
```

Or make it executable and call directly:

```bash
chmod +x ~/.scripts/bin/show_keyboard_layout.py
~/.scripts/bin/show_keyboard_layout.py
```

**Tip for qtile**:  
To open this in a terminal from a qtile keybinding, you might use a keybinding like:

```python
Key([mod], "F11", lazy.spawn("alacritty -e ~/.scripts/bin/show_keyboard_layout.py"))
```
*(Adjust terminal as needed.)*  

---

> [!TIP]
> The script offers a static, hardcoded ASCII art keyboard, so it won't automatically adapt if your physical or xkb layout changes. Consider integrating a dynamic layout query using tools like `setxkbmap -print` or `xkbcli` for adaptability. For now, this is a quick-reference tool—if you change layouts, you need to update the script manually. Also, the formatting might be best suited for monospaced fonts—ensure your terminal uses one for the best results.