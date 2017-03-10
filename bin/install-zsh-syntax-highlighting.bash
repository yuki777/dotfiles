#!/usr/bin/env bash
set -eux

if [ -L ~/.zsh ]; then
    unlink ~/.zsh
fi

if [ ! -d  ~/.zsh/zsh-syntax-highlighting ]; then
    mkdir -p ~/.zsh
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.zsh/zsh-syntax-highlighting
fi
