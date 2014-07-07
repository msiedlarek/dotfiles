#!/bin/sh
mkdir -p "$HOME/.config/fish"
symlink "functions" "$HOME/.config/fish/functions"
symlink "config.fish" "$HOME/.config/fish/config.fish"
