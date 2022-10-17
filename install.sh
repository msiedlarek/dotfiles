#!/bin/bash
set -eo pipefail

readonly PACKAGES=(
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

readonly DOTFILES=$(dirname $0)
readonly STOW="stow --verbose=2 --dir=${DOTFILES} --target=${HOME}"

main() {
    local additional_stow_args="$@"

    $STOW $additional_stow_args ${PACKAGES[*]}

    for package in ${PACKAGES[*]}; do
        local install_script="${DOTFILES}/${package}/install.sh"
        if [[ -x $install_script ]]; then
            echo $install_script
            /bin/sh $install_script
        fi
    done

    echo "Done."
}

main $@
