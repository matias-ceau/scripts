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
improved-fzfmenu.sh \
    --ansi \
    --nth 3 \
    --delimiter ' ' \
    --bind 'ctrl-e:become(pass edit {3})' \
    --bind 'ctrl-y:become(pass -c {3})' \
    --bind 'enter:become(echo {} > /dev/shm/psst)'
ydotool type "$(cat /dev/shm/psst)"

#TODO: make it write to qutebrowser FIFO
# sed -e "s#${PASSWORD_STORE_DIR}.*/##g" |

