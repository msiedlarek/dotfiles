#!/bin/bash
# Tries to start shell in the currently focused window's path.

if command -v termite >/dev/null 2>&1; then
    terminal=termite
else
    terminal=i3-sensible-terminal
fi

path=''

window_id=$(xdpyinfo | sed -n 's/^focus: \+window \+\([x0-9a-fA-F]\+\),.*/\1/p')
window_pid=$(xprop -id $window_id | sed -n 's/^_NET_WM_PID(CARDINAL) \+= \+\([0-9]\+\)$/\1/p')
if [ -n "$window_pid" ]; then
    child_pid=$(pstree -lpA $window_pid | head -n 1 | sed -n 's/.*(\([0-9]\+\))$/\1/p')
    if [ -e "/proc/${child_pid}/cwd" ]; then
        path=$(readlink "/proc/${child_pid}/cwd")
    fi
fi

if [ -n "$path" ]; then
  cd "$path" && exec "$terminal"
else
  exec "$terminal"
fi
