#!/usr/bin/env bash
set -eu

# setup neobundle, plugins
cd $HOME
mkdir -p $HOME/.vim/bundle
git clone git://github.com/Shougo/neobundle.vim $HOME/.vim/bundle/neobundle.vim
git clone git://github.com/Shougo/unite.vim     $HOME/.vim/bundle/unite.vim
git clone git://github.com/Shougo/vimproc.vim   $HOME/.vim/bundle/vimproc
cd $HOME/.vim/bundle/vimproc && make -f make_unix.mak
$HOME/.vim/bundle/neobundle.vim/bin/neoinstall

# yankring,yanktmp
mkdir -p ~/.vim/data/yankring
mkdir -p ~/.vim/data/yanktmp
