#!/bin/bash

fd_fmt=$'\e[38;2;64;62;60m\uf084 \e[0m\e[34;2m'
fd_fmt+=' {//}/'
fd_fmt+=$'\e[0m'
fd_fmt+=$'\e[33;1m'
fd_fmt+='{/.}'
fd_fmt+=$'\e[0m'

fd -tf '\.gpg$' \
    --base-directory "$PASSWORD_STORE_DIR"  \
    --format "${fd_fmt}" |
sort |
sed 's#\./##' |
fzf \
    --ansi \
    --nth 3 \
    --delimiter ' ' \
    --bind 'ctrl-e:execute(pass edit {3} & sleep 1)' \
    --bind 'ctrl-x:execute(pass {3} | xdotool type --file -)' |
cut -d' ' -f3 |
xargs pass

#TODO: make it write to qutebrowser FIFO
# sed -e "s#${PASSWORD_STORE_DIR}.*/##g" |

