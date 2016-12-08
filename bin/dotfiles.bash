#!/usr/bin/env bash
set -eu

# Install
#  cd
#  git clone https://github.com/yuki777/dotfiles.git

cd ~
mkdir -p ~/.vim/data
mkdir -p ~/bin

# vim
ln -fs dotfiles/.vimrc
ln -fs dotfiles/.vimrc.map

# zsh
ln -sf dotfiles/.zshenv
ln -sf dotfiles/.zshrc
ln -sf dotfiles/.zshrc.alias
ln -sf dotfiles/.zshrc.export
ln -sf dotfiles/.zshrc.function
ln -sf dotfiles/.zshrc.highlight
ln -sf dotfiles/.zshrc.mysql
ln -sf dotfiles/.zshrc.opt
ln -sf dotfiles/.zshrc.prompt

# others
ln -fs dotfiles/.tmux.conf
ln -fs dotfiles/.ctags
ln -fs dotfiles/.gtags
ln -fs dotfiles/.tigrc
ln -fs dotfiles/.gitconfig
ln -fs dotfiles/.gitignore
ln -fs dotfiles/.git_template
ln -fs dotfiles/.psqlrc
ln -fs dotfiles/.my.cnf

# bin
ln -fs ~/dotfiles/bin/git_merge_wrapper3 ~/bin/git_merge_wrapper3
ln -fs ~/dotfiles/bin/tmuxx              ~/bin/tmuxx
ln -fs ~/dotfiles/bin/tmuxxx             ~/bin/tmuxxx
ln -fs ~/dotfiles/bin/clide              ~/bin/clide

# .config
mkdir -p ~/.config
for file in fish omf nvim ; do
	if [ ! -h "$HOME/$file" ]; then
        ln -fs $HOME/dotfiles/.config/$file $HOME/.config/$file
    fi
    unlink $HOME/.config/$file/$file
done

# local files
for file in .vimrc.local .tmux.local .zshrc.local .ctagsignore ; do
	if [ ! -e "$HOME/$file" ]; then
		cp dotfiles/$file $HOME
	fi
done
touch .gitconfig.local

# setup
~/dotfiles/bin/setup-vim.bash
~/dotfiles/bin/setup_tmux_local
