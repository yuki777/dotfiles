#!/usr/bin/env bash
set -eu

if [ ! -d  ~/.zsh/zsh-syntax-highlighting ]; then
    mkdir -p ~/.zsh
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.zsh/zsh-syntax-highlighting
fi
