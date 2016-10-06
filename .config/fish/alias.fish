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

#case "${OSTYPE}" in
#darwin*)
#	alias ll='ls -Gla'
#	;;
#freebsd*)
#	alias ll='ls -Gla'
#	;;
#linux*)
#	alias ll='ls -Falq1AH --color=always --time-style=+"%Y-%m-%d %H:%M:%S"'
#	;;
#esac
