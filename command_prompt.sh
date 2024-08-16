#!/bin/bash

#INFO:# "Launch a command, history suggestions"

get_cmd() {
    shell_history_info.sh -l |
        cut -f2
}

fzf_cmd() {
    improved-fzfmenu.sh \
        --tac \
        --ansi
}

get_cmd | fzf_cmd

#TODO:
