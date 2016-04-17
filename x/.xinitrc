#!/bin/sh

RESOURCES_SYSTEM=/etc/X11/xinit/.Xresources
RESOURCES_USER=$HOME/.Xresources
MODMAP_SYSTEM=/etc/X11/xinit/.Xmodmap
MODMAP_USER=$HOME/.Xmodmap

if [ -f $RESOURCES_SYSTEM ]; then
    xrdb -merge $RESOURCES_SYSTEM
fi

if [ -f "$RESOURCES_USER" ]; then
    xrdb -merge "$RESOURCES_USER"
fi

if [ -f $MODMAP_SYSTEM ]; then
    xmodmap $MODMAP_SYSTEM
fi

if [ -f "$MODMAP_USER" ]; then
    xmodmap "$MODMAP_USER"
fi

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
    for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
        [ -x "$f" ] && . "$f"
    done
    unset f
fi

exec i3
