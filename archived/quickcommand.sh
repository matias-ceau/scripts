#! /bin/sh

#DOC#@RUN@$deprecated$ "Run any command with dmenu"

command=$(true | dmenu -i -p 'Sir?')
eval "$command"
