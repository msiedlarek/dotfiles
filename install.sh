#!/bin/bash

set -e

DOTFILES=$(dirname $0)
STOW="stow --verbose=2 --dir=${DOTFILES} --target=${HOME} $@"

PACKAGES=(
    bash
    fish
    git
    mercurial
    readline
    screen
    shell
    tmux
    vim
)

if [[ "$(uname)" == "Linux" ]]; then
    PACKAGES+=(
        i3
        x
    )
fi

# We don't want Stow's tree folding here - we prefer it to be a real directory.
mkdir -p "${HOME}/.config/fish"

$STOW ${PACKAGES[*]}
