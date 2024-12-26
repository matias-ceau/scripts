#!/usr/bin/bash

export SNEKVENV="$HOME/.local/venv/snekai"

lab() {
    source "$SNEKVENV/bin/activate"
    $SNEKVENV/bin/jupyter-lab
}

notebook() {
    source "$SNEKVENV/bin/activate"
    $SNEKVENV/bin/jupyter-notebook
}

ipython() {
    source "$SNEKVENV/bin/activate"
    $SNEKVENV/bin/ipython
}


if [ "$1" = 'lab' ]; then
    lab
elif [ "$1" = 'notebook' ]; then
    notebook
elif [ "$1" = 'ipython' ]; then
    ipython
else
    echo 'Unknown command'
fi
