#!/bin/bash
set -eo pipefail

# Generate helptags.
nvim --headless -c 'helptags ALL' -c 'quitall'
