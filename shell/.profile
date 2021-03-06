# Prefer US English and use UTF-8
export LC_ALL="en_US.UTF-8"
export LANG="en_US.UTF-8"

# Use Vim as default editor
export EDITOR="vim"
export VISUAL="$EDITOR"

# Use less without clearing the screen.
export PAGER="less -X"
export MANPAGER="less -X"

if [ -x /usr/bin/xdpyinfo ]; then
    export QT_STYLE_OVERRIDE=GTK+
    export DPI=$(/usr/bin/xdpyinfo | sed -nr 's/.*([0-9]+)x\1 dots.*/\1/p')
    if [ $DPI -gt 100 ]; then
        export QT_AUTO_SCREEN_SCALE_FACTOR=1
        export GDK_SCALE=2
        # export GDK_DPI_SCALE=0.5
    fi
fi
