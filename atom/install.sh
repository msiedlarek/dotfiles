#!/bin/bash
set -e

readonly ROOT=$(dirname $0)

readonly DEFAULTS=$(which defaults)
readonly APM=$(which apm)

main() {
    if [[ -x $DEFAULTS ]]; then
        defaults write com.github.atom ApplePressAndHoldEnabled -bool false
    fi
    # if [[ -x $APM ]]; then
    #     $APM install -c -q --packages-file "${ROOT}/packages.txt"
    # fi
}

main $@
