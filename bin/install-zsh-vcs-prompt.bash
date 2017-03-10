#!/usr/bin/env bash
set -eux

if [ -L ~/.zsh ]; then
    unlink ~/.zsh
fi

if [ ! -d ~/.zsh/zsh-vcs-prompt ]; then
    mkdir -p ~/.zsh
    git clone git://github.com/yuki777/zsh-vcs-prompt.git ~/.zsh/zsh-vcs-prompt
fi
