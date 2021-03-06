#!/bin/bash
if [[ ! -d ~/.zinit/bin ]]; then
  mkdir -p ~/.zinit
  git clone --depth 1 -b v3.7 https://github.com/zdharma/zinit.git ~/.zinit/bin
fi
