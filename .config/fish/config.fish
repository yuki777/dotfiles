switch (uname)
  case FreeBSD NetBSD DragonFly
    source ~/.config/fish/prompt_freebsd.fish
  case '*'
    source ~/.config/fish/prompt.fish
end

source ~/.config/fish/alias.fish
source ~/.config/fish/function.fish
source ~/.config/fish/bind.fish
source ~/.config/fish/variable.fish
