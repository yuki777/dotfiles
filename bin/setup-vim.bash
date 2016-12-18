#!/usr/bin/env bash
set -eu

# yankring,yanktmp
mkdir -p ~/.vim/data/yankring
mkdir -p ~/.vim/data/yanktmp

# neosnippet
mkdir -p ~/.vim/data/neosnippet
cp ~/dotfiles/.vim/data/neosnippet/* ~/.vim/data/neosnippet/

vim -c 'set cmdheight=2' -c 'qa!'
