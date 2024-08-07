#!/bin/bash

## Define the CSV data
#csv_data=$(cat "$1")
#
## Function to colorize the HEX column
#colorize_hex() {
#    while IFS= read -r line; do
#        if [[ $line == HEX* ]]; then
#            echo "$line" | sed 's/;/\t/g'
#        else
#            hex="$(echo "$line" | sed 's/;/\t/g' | cut -f1)"
#            rgb="$(echo "$line" | sed 's/;/\t/g' | cut -f2)"
#            val_rgb="$(echo "$rgb" | sed -e 's/rgb( *//' -e 's/ *)//' -e 's/, */\t/g')"
#            r="$(echo "$val_rgb" | cut -f1 | sed 's/ *//g')"
#            g="$(echo "$val_rgb" | cut -f2 | sed 's/ *//g')"
#            b="$(echo "$val_rgb" | cut -f3 | sed 's/ *//g')"
#            rest=$(echo "$line" | sed 's/;/\t/g' | cut  -f3-)
#            echo -e "$hex\e[38;2;${r};${g};${b}m\u2588\u2588\u2588\u2588\e[0m$rgb\t$rest"
#        fi
#    done <<< "$csv_data"
#}

# Display the colorized CSV data with fzf
#fzf --ansi --header-lines=1

line_generator() {
    block="\u2588\u2588\u2588\u2588\u2588\u2588\u2588\u2588"
    X="\e[0m"
    I="\e[3m"
    BOW="\e[7m"
    echo -e "${BOW}  HEX                  RGB            NAME           SHORT          UI              SYNTAX                   ${X}"
    echo -e "#d14d41 - \e[38;2;209;77;65m${block}${X} - 209,77,65    - red-400     -  re      [9]  -"
    echo -e "#af3029 - \e[38;2;175;48;41m${block}${X} - 175,48,41    - red-600     -  re-2    [1]  - \e[38;2;175;48;41mError text       Invalid, imports${X}"
    echo -e "#da702c - \e[38;2;218;112;44m${block}${X} - 218,112,44   - orange-400  -  or           -"
    echo -e "#bc5215 - \e[38;2;188;82;21m${block}${X} - 188,82,21    - orange-600  -  or-2         -\e[38;2;188;82;21m Warning text     Functions${X}"
    echo -e "#fceeb8 - \e[38;2;252;238;184m${block}${X}${I} - 252,238,184  - yellow-100  -  (css)        -${X}"
    echo -e "#d0a215 - \e[38;2;208;162;21m${block}${X} - 208,162,21   - yellow-400  -  ye      [11] -"
    echo -e "#ad8301 - \e[38;2;173;131;1m${block}${X} - 173,131,1    - yellow-600  -  ye-2    [3]  -\e[38;2;173;131;1m                  Constants${X}"
    echo -e "#4d3a0b - \e[38;2;77;58;11m${block}${X}${I} - 77,58,11     - yellow-900  -  (css)        -${X}"
    echo -e "#879a39 - \e[38;2;135;154;57m${block}${X} - 135,154,57   - green-400   -  gr      [10] -"
    echo -e "#66800b - \e[38;2;102;128;11m${block}${X} - 102,128,11   - green-600   -  gr-2    [7]  -\e[38;2;102;128;11m Success text     Keywords${X}"
    echo -e "#ebf2e7 - \e[38;2;235;242;231m${block}${X}${I} - 235,242,231  - cyan-50     -  (css)        - ${X}"
    echo -e "#3aa99f - \e[38;2;58;169;159m${block}${X} - 58,169,159   - cyan-400    -  cy      [14] - "
    echo -e "#24837b - \e[38;2;36;131;123m${block}${X} - 36,131,123   - cyan-600    -  cy-2    [6]  -\e[38;2;36;131;123m Links, active    Strings${X}"
    echo -e "#142625 - \e[38;2;20;38;37m${block}${X}${I} - 20,38,37     - cyan-950    -  (css)        - ${X}"
    echo -e "#4385be - \e[38;2;67;133;190m${block}${X} - 67,133,190   - blue-400    -  bl      [12] - "
    echo -e "#205ea6 - \e[38;2;32;94;166m${block}${X} - 32,94,166    - blue-600    -  bl-2    [4]  -\e[38;2;32;94;166m                  Variables, attributes${X}"
    echo -e "#8b7ec8 - \e[38;2;139;126;200m${block}${X} - 139,126,200  - purple-400  -  pu           -"
    echo -e "#5e409d - \e[38;2;94;64;157m${block}${X} - 94,64,157    - purple-600  -  pu-2         -\e[38;2;94;64;157m                  Numbers${X}"
    echo -e "#ce5d97 - \e[38;2;206;93;151m${block}${X} - 206,93,151   - magenta-400 -  ma      [13] -"
    echo -e "#a02f6f - \e[38;2;160;47;111m${block}${X} - 160,47,111   - magenta-600 -  ma-2    [5]  -\e[38;2;160;47;111m                  Language features${X}"
    echo -e "#100f0f - \e[38;2;16;15;15m${block}${X} - 16,15,15     - black       -  bg      [0]  -\e[38;2;16;15;15m Background 1${X}"
    echo -e "#1c1b1a - \e[38;2;28;27;26m${block}${X} - 28,27,26     - base-950    -  bg-2    [8]  -\e[38;2;28;27;26m Background 2${X}"
    echo -e "#fffcf0 - \e[38;2;255;252;240m${block}${X}${I} - 255,252,240  - paper       -  (bg)         -${X}"
    echo -e "#e6e4d9 - \e[38;2;230;228;217m${block}${X}${I} - 230,228,217  - base-50     -  (bg-2)       -${X}"
    echo -e "#dad8ce - \e[38;2;218;216;206m${block}${X}${I} - 218,216,206  - base-100    -  (ui)         -${X}"
    echo -e "#cecdc3 - \e[38;2;206;205;195m${block}${X}${I} - 206,205,195  - base-150    -  (ui-2)       -${X}"
    echo -e "#b7b5ac - \e[38;2;183;181;172m${block}${X} - 183,181,172  - base-200    -  tx      [7]  -\e[38;2;183;181;172m Primary text${X}"
    echo -e "#979592 - \e[38;2;151;149;146m${block}${X}${I} - 151,149,146  - base-300    -  (tx-3)       - ${X}"
    echo -e "#878580 - \e[38;2;135;133;128m${block}${X} - 135,133,128  - base-500    -  tx-2    [15] -\e[38;2;135;133;128m Muted text      Punctuation, operators${X}"
    echo -e "#6f6e69 - \e[38;2;111;110;105m${block}${X}${I} - 111,110,105  - base-600    -  (tx-2)       -${X}"
    echo -e "#575653 - \e[38;2;87;86;83m${block}${X} - 87,86,83     - base-700    -  tx-3         -\e[38;2;87;86;83m Faint text      Comments${X}"
    echo -e "#403e3c - \e[38;2;64;62;60m${block}${X} - 64,62,60     - base-800    -  ui-3         -\e[38;2;64;62;60m Active borders${X}"
    echo -e "#343331 - \e[38;2;52;51;49m${block}${X} - 52,51,49     - base-850    -  ui-2         -\e[38;2;52;51;49m Hovered borders${X}"
    echo -e "#282726 - \e[38;2;40;39;38m${block}${X} - 40,39,38     - base-900    -  ui           -\e[38;2;40;39;38m Borders${X}"
}

line_generator
