alias grep='grep --color'
alias h='history -E 1'
alias vimp='vim -p '
alias vim.='vim "+NERDTree ."'
alias vimrc='vim -p ~/.vimrc*'
alias zshrc='vim -p ~/.zshrc* ~/.zshenv'
alias agit='vim -c "Agit" -c "tabonly"'
alias gitst="git st -s|awk '{print \$2}'|tr '\n' ' '|xargs echo"
alias tailf='tail -F'
alias l='ll'

switch (uname)
    case Linux
        alias ll='ls -Falq1AH --color=always --time-style=+"%Y-%m-%d %H:%M:%S"'
    case Darwin
        alias ll='ls -Gla'
    case FreeBSD NetBSD DragonFly
        alias ll='ls -Gla'
end
