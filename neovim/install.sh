#!/bin/bash
set -eo pipefail

# Bootstrap Packer
nvim --headless -c 'lua require("plugins")' -c 'quitall'
# Install plugins
nvim --headless -c 'lua require("plugins")' -c 'autocmd User PackerComplete quitall' -c 'PackerSync'
