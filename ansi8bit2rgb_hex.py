#!/usr/bin/python

import os
import sys


def ansi_to_rgb(color: int) -> tuple[int, int, int]:
    if 0 <= color <= 15:
        # Standard colors
        return [
            (0, 0, 0),
            (128, 0, 0),
            (0, 128, 0),
            (128, 128, 0),
            (0, 0, 128),
            (128, 0, 128),
            (0, 128, 128),
            (192, 192, 192),
            (128, 128, 128),
            (255, 0, 0),
            (0, 255, 0),
            (255, 255, 0),
            (0, 0, 255),
            (255, 0, 255),
            (0, 255, 255),
            (255, 255, 255),
        ][color]
    elif 16 <= color <= 231:
        color -= 16
        r = (color // 36) * 51
        g = ((color % 36) // 6) * 51
        b = (color % 6) * 51
        return (r, g, b)
    elif 232 <= color <= 255:
        gray = (color - 232) * 10 + 8
        return (gray, gray, gray)
    else:
        raise ValueError("Color code out of range")


def format_color(rgb: tuple[int, int, int], color_format: str):
    r, g, b = rgb
    if color_format == "hex":
        return f"#{r:02x}{g:02x}{b:02x}"
    else:
        return f"rgb({r:>3},{g:>3},{b:>3})"


def print_colors(
    colors: list[int],
    color_format: str,
    colorize: bool = False,
    print_names: bool = False,
):
    rgb_colors = [ansi_to_rgb(c) for c in colors]
    strings = [format_color(r, color_format) for r in rgb_colors]
    if print_names:
        strings = [f"color{c}\t{s}" for c, s in zip(colors, strings)]
    if colorize:
        strings = [f"\033[48;5;{c}m{s}\033[0m" for c, s in zip(colors, strings)]
    for s in strings:
        print(s)


def usage():
    name = os.path.basename(sys.argv[0])
    print(
        f"""
Converts 8 bit colors to RGB or HEX
    
    {name} <command> [options] <number>|<range>|<list> 

USAGE:
    rgb   ---  outputs to rgb
    hex   ---  outputs to hex
    help  ---  shows this message

OPTIONS:
    --name, -n      ---   prints the name followed by the value
    --colored, -c   ---   oolorize the output

EXAMPLES:
    {name} rgb 242       =>    rgb(108,108,108)
    {name} rgb -n 242    =>    color242    rgb(108,108,108)
    {name} hex 242       =>    #6c6c6c
    {name} rgb           =>    (all 256 colors)
    {name} rgb 35-167    =>    (from 35 to 167 (inclusive))
    {name} rgb 35,167    =>    (35 and 167)
"""
    )


def main():
    match sys.argv[1:]:
        case ["help"] | ["--help"] | ["-h"]:
            usage()
            exit(0)
        case ["rgb", *args] | ["hex", *args]:
            fmt = sys.argv[1]
        case _:
            usage()
            exit(1)
    colorize, print_names = False, False
    colors = list(range(256))
    if args:
        for a in sys.argv[1:]:
            if a in ["-c", "--colorize"]:
                colorize = True
            if a in ["-n", "--name"]:
                print_names = True
        color_arg = sys.argv[-1]
        try:
            colors = [int(color_arg)]
        except ValueError:
            pass
        try:
            colors = [int(i) for i in color_arg.split(",")]
        except ValueError:
            pass
        try:
            c1, c2 = [int(i) for i in color_arg.split("-")]
            colors = list(range(c1, c2 + 1))
        except ValueError:
            pass
    print_colors(
        colors=colors, color_format=fmt, colorize=colorize, print_names=print_names
    )


if __name__ == "__main__":
    main()

# To ensure readable text when using different background colors, you can calculate the perceived brightness of the background color and choose either black or white text accordingly. Here's a Python script that demonstrates this approach:
#
# ```python
# import math
#
# def get_rgb_from_8bit(color):
#     if color < 16:
#         return (0, 0, 0) if color == 0 else (128, 0, 0) if color < 8 else (255, 0, 0)
#     elif color < 232:
#         color -= 16
#         return ((color // 36) * 51, ((color % 36) // 6) * 51, (color % 6) * 51)
#     else:
#         grey = (color - 232) * 10 + 8
#         return (grey, grey, grey)
#
# def get_perceived_brightness(r, g, b):
#     return math.sqrt(0.299 * r**2 + 0.587 * g**2 + 0.114 * b**2)
#
# def get_contrasting_text_color(bg_color):
#     r, g, b = get_rgb_from_8bit(bg_color)
#     brightness = get_perceived_brightness(r, g, b)
#     return 30 if brightness > 130 else 37  # 30 for black, 37 for white
#
# def print_colored_text(text, bg_color):
#     text_color = get_contrasting_text_color(bg_color)
#     print(f"\033[{text_color};48;5;{bg_color}m{text}\033[0m", end="")
#
# # Example usage
# for color in range(256):
#     print_colored_text(f"{color:3d}", color)
#     if (color + 1) % 16 == 0:
#         print()
# ```
#
# This script does the following:
#
# 1. `get_rgb_from_8bit(color)`: Converts an 8-bit color code to its RGB components.
#
# 2. `get_perceived_brightness(r, g, b)`: Calculates the perceived brightness of a color based on its RGB values.
#
# 3. `get_contrasting_text_color(bg_color)`: Determines whether to use black (30) or white (37) text based on the background color's brightness.
#
# 4. `print_colored_text(text, bg_color)`: Prints the text with the specified background color and automatically chosen contrasting text color.
#
# The example usage demonstrates printing all 256 8-bit colors with automatically adjusted text color for readability.
#
# You can use this script to print colored text with appropriate contrast:
#
# ```python
# print_colored_text("Hello, World!", 200)  # Light background, dark text
# print_colored_text("Hello, World!", 20)   # Dark background, light text
# ```
#
# This approach ensures that the text remains readable regardless of the background color by automatically switching between black and white text based on the perceived brightness of the background.
