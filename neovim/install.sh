#!/bin/bash
set -eo pipefail

if [ ! -d ~/.local/share/nvim/pyenv ]; then
    virtualenv ~/.local/share/nvim/pyenv
fi
~/.local/share/nvim/pyenv/bin/pip install -U black pynvim

nvim --headless -c 'UpdateRemote' -c 'helptags ALL' -c 'quitall'
