#!/usr/bin/env bash
set -eux

# yankring,yanktmp
mkdir -p ~/.vim/data/yankring
mkdir -p ~/.vim/data/yanktmp

# neosnippet
mkdir -p ~/.vim/data/neosnippet
cp ~/dotfiles/.vim/data/neosnippet/* ~/.vim/data/neosnippet/

# NERDTree
mkdir -p ~/.vim/data/NERDTree
touch    ~/.vim/data/NERDTree/.NERDTreeBookmarks

#vim -c 'set cmdheight=2' -c 'qa!'
