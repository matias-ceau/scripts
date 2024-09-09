#!/bin/bash

#INFO:# "Launch a command, history suggestions"

get_cmd() {
    shell_history_info.sh -l |
        cut -f2
}

fzf_cmd() {
    improved-fzfmenu.sh \
        title_is_cmd_prompt \
        --tac \
        --ansi
}

get_cmd | fzf_cmd

#TODO:
