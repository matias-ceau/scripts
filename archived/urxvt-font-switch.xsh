#! /usr/bin/xonsh

#DOC#@RUN@$deprecated$ "Switch Xressources file with alternative one"

mv ~/.Xresources ~/.XresourcesTEMP
mv ~/.Xresources-alternative ~/.Xresources
mv ~/.XresourcesTEMP ~/.Xresources-alternative
xrdb ~/.Xresources

