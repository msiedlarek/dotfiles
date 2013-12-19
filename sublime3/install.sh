#!/bin/sh
if [[ "$(uname)" == "Darwin" ]]; then
    mkdir -p "$HOME/Library/Application Support/Sublime Text 3/Packages"
    symlink User "$HOME/Library/Application Support/Sublime Text 3/Packages/User"
fi
