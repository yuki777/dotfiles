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
ln -sf dotfiles/.zshenv
ln -sf dotfiles/.zshrc
ln -sf dotfiles/.zshrc.alias
ln -sf dotfiles/.zshrc.export
ln -sf dotfiles/.zshrc.function
ln -sf dotfiles/.zshrc.highlight
ln -sf dotfiles/.zshrc.mysql
ln -sf dotfiles/.zshrc.opt
ln -sf dotfiles/.zshrc.prompt
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
if [ ! -e dotfiles/.ctagsignore ]; then
    cp dotfiles/.ctagsignore ~
fi

touch .gitconfig.local

~/dotfiles/bin/setup_tmux_local
