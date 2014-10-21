#!/bin/bash

set -e

readonly COMMON_PACKAGES=(
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

readonly LINUX_PACKAGES=(
    i3
    x
)

readonly DOTFILES=$(dirname $0)
readonly STOW="stow --verbose=2 --dir=${DOTFILES} --target=${HOME}"

main() {
    local additional_stow_args="$@"

    local packages=(${COMMON_PACKAGES[*]})
    if [[ "$(uname)" == "Linux" ]]; then
        packages+=(${LINUX_PACKAGES[*]})
    fi

    # We don't want Stow's tree folding here - we prefer it to be a real
    # directory.
    mkdir -p "${HOME}/.config/fish"

    $STOW $additional_stow_args ${packages[*]}
}

main $@
