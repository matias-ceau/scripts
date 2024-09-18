#!/usr/bin/bash

bat -plmd << EOF
# ANSI Escape Code Cheatsheet

## Text Formatting

- \`\\e[0m\` Reset all formatting
- \`\\e[1m\` Bold
- \`\\e[2m\` Dim
- \`\\e[3m\` Italic
- \`\\e[4m\` Underline
- \`\\e[5m\` Blink
- \`\\e[7m\` Reverse (invert fg/bg)
- \`\\e[9m\` Strikethrough

## Text Colors

### Foreground Colors

- \`\\e[30m\` \x1b[31mBlack\x1b[0m
- \`\\e[31m\` Red
- \`\\e[32m\` Green
- \`\\e[33m\` Yellow
- \`\\e[34m\` Blue
- \`\\e[35m\` Magenta
- \`\\e[36m\` Cyan
- \`\\e[37m\` White

### Background Colors

- \`\\e[40m\` Black
- \`\\e[41m\` Red
- \`\\e[42m\` Green
- \`\\e[43m\` Yellow
- \`\\e[44m\` Blue
- \`\\e[45m\` Magenta
- \`\\e[46m\` Cyan
- \`\\e[47m\` White

## Bright Colors

### Bright Foreground Colors

- \`\\e[90m\` Bright Black (Gray)
- \`\\e[91m\` Bright Red
- \`\\e[92m\` Bright Green
- \`\\e[93m\` Bright Yellow
- \`\\e[94m\` Bright Blue
- \`\\e[95m\` Bright Magenta
- \`\\e[96m\` Bright Cyan
- \`\\e[97m\` Bright White

### Bright Background Colors

- \`\\e[100m\` Bright Black (Gray)
- \`\\e[101m\` Bright Red
- \`\\e[102m\` Bright Green
- \`\\e[103m\` Bright Yellow
- \`\\e[104m\` Bright Blue
- \`\\e[105m\` Bright Magenta
- \`\\e[106m\` Bright Cyan
- \`\\e[107m\` Bright White

## Cursor Movement

- \`\\e[<L>;<C>H\` Move cursor to line L, column C
- \`\\e[<N>A\` Move cursor up N lines
- \`\\e[<N>B\` Move cursor down N lines
- \`\\e[<N>C\` Move cursor forward N columns
- \`\\e[<N>D\` Move cursor backward N columns
- \`\\e[2J\` Clear entire screen
- \`\\e[K\` Clear from cursor to end of line

## Miscellaneous

- \`\\e[?25l\` Hide cursor
- \`\\e[?25h\` Show cursor
- \`\\e[s\` Save cursor position
- \`\\e[u\` Restore cursor position

Note: Replace \\e with \\x1b or \\033 if your system requires it.
EOF
