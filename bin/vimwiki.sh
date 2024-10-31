#! /bin/sh

#INFO:#@CLI@ "Open a note in vim with fzf"

vim ~/notes/"$( ls ~/notes | fzf )"
