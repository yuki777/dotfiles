# ?
My Dotfiles.

# Install Dev Tools
```
# ubuntu
sudo apt install -y zsh vim tmux exuberant-ctags global git subversion mercurial make gcc g++ build-essential devscripts libpcre3-dev liblzma-dev autoconf zlib1g-dev libevent-dev

# centos
sudo yum install -y zsh tmux vim git tig wget curl ftp expect mlocate mosh mercurial gcc ncurses lua lua-devel bc libevent libevent-devel ncurses ncurses-devel openssl-devel libcurl-devel expat-devel perl-ExtUtils-MakeMaker glibc-static pcre-devel xz-devel ctags
```

# Clone Dotfiles
```
git clone https://github.com/yuki777/dotfiles.git ~/dotfiles
```

# Setup
```
/bin/sh ~/dotfiles/bin/dotfiles.bash
/bin/sh ~/dotfiles/bin/install-tmux.bash
/bin/sh ~/dotfiles/bin/install-zsh-vcs-prompt.bash
/bin/sh ~/dotfiles/bin/install-vim.bash
/bin/sh ~/dotfiles/bin/setup-vim.bash
# optional
/bin/sh ~/dotfiles/bin/install-ag.bash
/bin/sh ~/dotfiles/bin/install-git.bash
/bin/sh ~/dotfiles/bin/install-peco.bash
```

# TODO
- neosnippets
- tmuxinator

# Test
Thu Nov 26 12:59:51 ICT 2015
