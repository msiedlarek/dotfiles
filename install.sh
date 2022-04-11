#!/bin/bash
set -eo pipefail

readonly COMMON_PACKAGES=(
    bash
    git
    neovim
    readline
    screen
    shell
    tmux
    yt-dlp
    zsh
)

readonly LINUX_PACKAGES=(
    gtk
    i3
    termite
    x
    xdg
)

readonly DOTFILES=$(dirname $0)
readonly STOW="stow --verbose=2 --dir=${DOTFILES} --target=${HOME}"

main() {
    local additional_stow_args="$@"

    local packages=(${COMMON_PACKAGES[*]})
    if [[ "$(uname)" == "Linux" ]]; then
        packages+=(${LINUX_PACKAGES[*]})
    fi

    $STOW $additional_stow_args ${packages[*]}

    for package in ${packages[*]}; do
        local install_script="${DOTFILES}/${package}/install.sh"
        if [[ -x $install_script ]]; then
            echo $install_script
            /bin/sh $install_script
        fi
    done

    echo "Done."
}

main $@
