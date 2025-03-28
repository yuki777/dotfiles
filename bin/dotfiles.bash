#!/usr/bin/env bash
set -eux

if [ ! -d ~/dotfiles ]; then
    git clone http://github.com/yuki777/dotfiles.git ~/dotfiles
fi

cd ~
mkdir -p ~/.vim/data
mkdir -p ~/bin

# vim
ln -fs dotfiles/.gvimrc
ln -fs dotfiles/.vimrc
ln -fs dotfiles/.vimrc.map
ln -fs dotfiles/.gvimrc_first.vim
ln -fs dotfiles/.ideavimrc
mkdir -p ~/.vim/data/yankring

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
ln -sf dotfiles/.zshrc.phpenv
ln -sf dotfiles/.zshrc.goenv
ln -sf dotfiles/.zshrc.volta
ln -sf dotfiles/.zshrc.starship
ln -sf dotfiles/.zshrc.history

# others
ln -fs dotfiles/.tmux.conf
ln -fs dotfiles/.tmux.conf.local
ln -fs dotfiles/.ctags
ln -fs dotfiles/.gtags
ln -fs dotfiles/.tigrc
ln -fs dotfiles/.gitconfig
ln -fs dotfiles/.gitignore
ln -fs dotfiles/.git_template
ln -fs dotfiles/.psqlrc
ln -fs dotfiles/.my.cnf
ln -fs dotfiles/.grcat

# bin
ln -fs ~/dotfiles/bin/git_merge_wrapper3 ~/bin/git_merge_wrapper3
ln -fs ~/dotfiles/bin/tmuxx              ~/bin/tmuxx
ln -fs ~/dotfiles/bin/tmuxxx             ~/bin/tmuxxx
ln -fs ~/dotfiles/bin/clide              ~/bin/clide

# .config
mkdir -p ~/.config
ln -fs ~/dotfiles/.config/starship.toml ~/.config/

# local files
for file in .vimrc.local .zshrc.local .ctagsignore ; do
	if [ ! -e ~/$file ]; then
		cp dotfiles/$file ~
	fi
done

# .gitconfig.local
touch .gitconfig.local
echo '[user]' >> .gitconfig.local
echo '  name = Yuki Adachi' >> .gitconfig.local
echo '  email = yuki777@gmail.com' >> .gitconfig.local

~/dotfiles/bin/install-zsh-vcs-prompt.bash
~/dotfiles/bin/install-zsh-syntax-highlighting.bash
~/dotfiles/bin/install-peco.bash
~/dotfiles/bin/setup-vim.bash
