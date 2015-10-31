#!/usr/bin/env bash
set -eu

# Install
#  cd
#  git clone https://github.com/yuki777/dotfiles.git

cd ~
mkdir -p ~/.vim/data
mkdir -p ~/bin
ln -fs dotfiles/.vimrc
ln -fs dotfiles/.vimrc.map
ln -fs dotfiles/.zshrc
ln -fs dotfiles/.zshrc.prompt
ln -fs dotfiles/.zshrc.alias
ln -fs dotfiles/.zshrc.export
ln -fs dotfiles/.zsh
ln -fs dotfiles/.zshenv
ln -fs dotfiles/.tmux.conf
ln -fs dotfiles/.ctags
ln -fs dotfiles/.gtags
ln -fs dotfiles/.tigrc
ln -fs dotfiles/.gitconfig
ln -fs dotfiles/.gitignore
ln -fs dotfiles/.git_template
ln -fs ~/dotfiles/bin/git_merge_wrapper3 ~/bin/git_merge_wrapper3
ln -fs ~/dotfiles/bin/tmuxx              ~/bin/tmuxx
ln -fs ~/dotfiles/bin/tmuxxx             ~/bin/tmuxxx
ln -fs ~/dotfiles/bin/clide              ~/bin/clide

if [ ! -e dotfiles/.vimrc.local ]; then
    cp dotfiles/.vimrc.local ~
fi
if [ ! -e dotfiles/.tmux.local ]; then
    cp dotfiles/.tmux.local ~
fi
if [ ! -e dotfiles/.zshrc.local ]; then
    cp dotfiles/.zshrc.local ~
fi
if [ ! -e dotfiles/.zshrc.mysql ]; then
    cp dotfiles/.zshrc.mysql ~
fi
if [ ! -e dotfiles/.ctagsignore ]; then
    cp dotfiles/.ctagsignore ~
fi

touch .gitconfig.local

~/dotfiles/bin/setup_tmux_local
