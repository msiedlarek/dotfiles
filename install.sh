#!/bin/bash

set -e

cd "$(dirname $0)"

function symlink() {
    echo "    $2 -> $(pwd)/$1"
    ln -sFi "$(pwd)/$1" "$2"
}

function install_module() {
    echo "Installing module: $1"
    cd "$1"
    source "install.sh"
    cd ..
}

install_module shell
install_module bash
install_module git
install_module mercurial
install_module readline
install_module screen
install_module tmux
install_module vim
install_module sublime3
install_module fish

if [[ "$(uname)" == "Linux" ]]; then
    install_module i3
    install_module x
fi
