#!/usr/bin/env bash
set -eu

# install
mkdir -p ~/.zsh
rm -fr ~/.zsh/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.zsh/zsh-syntax-highlighting
