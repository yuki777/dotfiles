# LANG=C
case ${UID} in
0)
    LANG=C
    ;;
esac

# autoload
autoload history-search-end
autoload -U compinit
autoload zed
autoload colors
autoload -Uz zmv
compinit

# prompt
colors
local BLACK=$'%{\e[30m%}'
local RED=$'%{\e[31m%}'
local GREEN=$'%{\e[32m%}'
local YELLOW=$'%{\e[33m%}'
local BLUE=$'%{\e[34m%}'
local PURPLE=$'%{\e[35m%}'
local CYAN=$'%{\e[36m%}'
local WHITE=$'%{\e[1;37m%}'
local DEFAULT=$'%{\e[1;m%}'
#local RANDOMCOLOR=$'%{\e[$[color=$[31+$RANDOM%6]]m%}'
#PROMPT="${WHITE}%D{%Y-%m-%d %H:%M:%S} %n${RANDOMCOLOR}@%M${WHITE}:%/${reset_color}"
local name_number=`echo $HOME|wc -c|grep -o '[0-6]'|sort|uniq|tail -n1` # 0-6. It might be duplicated.
local name_color=$'%{\e[$[color=$[31+$name_number%6]]m%}'
local host_number=`uname -a|wc -c|grep -o '[0-6]'|sort|uniq|tail -n1` # 0-6. It might be duplicated.
local host_color=$'%{\e[$[color=$[31+$host_number%6]]m%}'
PROMPT="${WHITE}%D{%Y-%m-%d %H:%M:%S} ${name_color}%n${host_color}@%M${WHITE}:%/${reset_color}
"
if [[ `whoami` == "root" ]]; then
PROMPT="${RED}%D{%Y-%m-%d %H:%M:%S} %n@%M:%/${reset_color}
"
fi

## bindkey
bindkey -e
#bindkey "^[[1~" beginning-of-line # Home gets to line head
#bindkey "^[[4~" end-of-line # End gets to line end
#bindkey "^[[3~" delete-char # Del
bindkey "^p" history-beginning-search-backward-end
bindkey "^n" history-beginning-search-forward-end
#bindkey "\\ep" history-beginning-search-backward-end
#bindkey "\\en" history-beginning-search-forward-end
#bindkey "\e[Z" reverse-menu-complete

# zle
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end

# others
HISTFILE=${HOME}/.zsh_history
HISTSIZE=50000
SAVEHIST=50000
fpath=(${HOME}/.zsh/functions/Completion ${fpath})
#compinit

# alias
alias grep='grep --color'
alias svnstat='svn -u stat | egrep -v " tmp/|GPATH|GTAGS|GRTAGS|tags"'
alias _svnadd='svn st | grep '\''^\?'\'' | sed -e '\''s/\?[ ]*/svn add /g'\'
alias svnadd='_svnadd | grep -Ev "^svn add tmp\/|^svn add libs\/Bear$|^svn add .tags$|^svn add tags$|^svn add GRTAGS$|^svn add GPATH$|^svn add GTAGS$|^svn add tmp\/|^svn add logs\/|^svn add .screenlog\/|^svn add tee\/"'
alias cvsadd="cvs status 2>/dev/null | egrep '^\? '|egrep -v 'cvs status: Examining |? tmp/|? GPATH|? GRTAGS|? GTAGS|? .tags|? logs/'"
alias mkpassswd='mkpasswd -l 8 -d 2 -C 2 -s 0 -2'
alias h='history -E 1'
alias screeen='screen -U -D -RR'
alias ctagsrphp="ctags -R --tag-relative=yes --PHP-kinds=+cdfv -h '.php' --exclude='logs'  --exclude='tmp'  --exclude='tmp_image' --exclude='\.svn' --totals=yes --regex-PHP='/abstract class ([^ ]*)/\1/c/' --regex-PHP='/interface ([^ ]*)/\1/c/' --regex-PHP='/(public |static |abstract |protected |private )+function ([^ (]*)/\2/f/'"
alias 2utf8='nkf -w --overwrite'
alias 2utf='nkf -w --overwrite'
alias 2eucjp='nkf -e --overwrite'
alias 2euc='nkf -e --overwrite'
alias 2sjis='nkf -e --overwrite'
alias vimp='vim -p '
#alias vimb='vim -p "+NERDTree htdocs" "+tabnew" "+NERDTree libs/App/action" "+tabnew" "+NERDTree libs/App/view" "+tabnew" "+NERDTree templates" "+tabfirst"'
#alias vimB='vim -p "+NERDTree htdocs" "+tabnew" "+NERDTree App/Ro" "+tabnew" "+NERDTree App/Form" "+tabnew" "+NERDTree App/views" "+tabfirst"'
#alias vimc='vim -p "+NERDTree application/controllers/" "+tabnew" "+NERDTree application/views/" "+tabnew" "+NERDTree application/language/" "+tabnew" "+NERDTree ." "+tabfirst"'
# cakephp
alias vimc='vim -p "+NERDTree app/Controller/" "+tabnew" "+NERDTree app/Model/" "+tabnew" "+NERDTree app/View/" "+tabnew" "+NERDTree app/Locale/" "+tabfirst"'
alias vim.='vim "+NERDTree ."'
#alias vim.='vim "+VimFilerExplorer -find ."'
alias vimrc='vim ~/.vimrc'
# vim open session
function vimo(){
    vim "+OpenSession $1"
}
function vimb(){
    t=`tmux display-message -p '#S'`    # current tmux session name
    b=`git rev-parse --abbrev-ref HEAD` # current git branch name
    vim "+OpenSession $t.$b"
}

# http://qiita.com/jpshadowapps/items/3fbf817bdd14c48e2d54
function vip {
    vim $(grep -in ${1} **/*.php | grep -v "[0-9]:\s*//" | peco | awk -F ":" '{print "-c "$2" "$1}')
}
function vit {
    vim $(grep -in ${1} **/*.twig | grep -v "[0-9]:\s*//" | peco | awk -F ":" '{print "-c "$2" "$1}')
}

# TODO: find gitv tab, and fix view bug
alias gitv='touch ~/.vim/data/view/gitv; rm -fr ~/.vim/data/view/*gitv*; vim ../.git/index -c "Gitv --all" -c "tabonly"'
alias gitst="git st -s|awk '{print \$2}'|tr '\n' ' '|xargs echo"
case "${OSTYPE}" in
darwin*)
	alias ll='ls -Gla'
	;;
freebsd*)
	alias ll='ls -Gla'
	;;
linux*)
	alias ll='ls -Falq1AH --color=always --time-style=+"%Y-%m-%d %H:%M:%S"'
	;;
esac
alias l='ll'
EASYTETHER_EXT=/System/Library/Extensions/EasyTetherUSBEthernet.kext
alias easytether-on="sudo kextload $EASYTETHER_EXT"
alias easytether-off="sudo kextunload $EASYTETHER_EXT"
alias easytether-status="kextstat |grep EasyTether"
alias adb="/Applications/sdk/platform-tools/adb"
alias tailf='tail -F'
#alias hi="perl -pe 's/warn|err/\033\[1;31m$&\033\[0m/gi'"
alias zmv='noglob zmv -W'
alias g='git'

# export
export LANG=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8
export EC2_PRIVATE_KEY=$HOME/.aws_pk.pem
export EC2_CERT=$HOME/.aws_cert.pem
export EC2_URL="https://ec2.ap-northeast-1.amazonaws.com"
export EC2_REGION="ap-northeast-1"
export PATH=$HOME/.nodebrew/current/bin:$PATH
export PATH="/usr/sbin:${PATH}"
export PATH="/sbin:${PATH}"
export PATH="${HOME}/bin:${PATH}"
export PATH=/opt/local/bin:/opt/local/sbin/:$PATH
export PATH=$HOME/local/bin:$PATH
export PATH=/Applications/android-sdk-mac_x86/tools:$PATH
export PATH=/Applications/android-sdk-mac_x86/platform-tools:$PATH
export PATH=$HOME/local/go/bin:$PATH
export MANPATH=/opt/local/man:$MANPATH
export EDITOR=vim
export SVN_EDITOR=vim
export HGEDITOR=vim
export TERM=xterm-256color
export LD_LIBRARY_PATH=${HOME}/local/lib/:${LD_LIBRARY_PATH}
export GOROOT=~/local/go
[ -f $HOME/local/bin/global ] && export GTAGSGLOBAL=$HOME/local/bin/global
# setopt
setopt prompt_subst
setopt list_packed
setopt noautoremoveslash
setopt nolistbeep
setopt complete_aliases     # aliased ls needs if file/dir completions work
setopt APPEND_HISTORY         # .zsh-history を上書きではなく追加
setopt AUTO_CD                # ディレクトリ名だけを入力した時にそこに cd する
setopt AUTO_LIST              # 候補が複数ある時に自動的に一覧を出す
setopt AUTO_MENU              # TAB で順に補完候補を切り替える
##setopt AUTO_PARAM_SLASH       # 変数名補完時に、その値がディレクトリ名なら直後にスラッシュも補う
setopt AUTO_PARAM_KEYS        # カッコの対応などを自動的に補完
#setopt AUTO_RESUME            # サスペンド中のプロセスと同じコマンド名を実行した場合はリジューム
#setopt CHECK_JOBS             # シェルを抜ける (exit) 時に、zsh: you have runnning jobs と警告を出す
setopt CORRECT                # コマンドのスペルチェック
#setopt CORRECT_ALL            # 対象のファイルもスペルチェックをする
setopt EXTENDED_GLOB          # 拡張補完。ファイル名で #, ~, ^ の 3 文字を正規表現として扱う
setopt EXTENDED_HISTORY       # zsh の開始, 終了時刻をヒストリファイルに書き込む
#setopt GLOB_DOTS              # . で開始するファイル名にマッチさせるとき、先頭に明示的に . を指定する必要がなくなる。
#setopt HASH_CMDS              # 各コマンドが実行されるときにパスをハッシュに入れる
#setopt HIST_EXPIRE_DUPS_FIRST # ヒストリリストに追加されるコマンド行が古いものと同じなら古いものを削除する
##setopt HIST_NO_STORE          # history コマンドを history に保存しない
##setopt HIST_IGNORE_DUPS       # 直前と同じコマンドをヒストリに追加しない
setopt HIST_REDUCE_BLANKS     # 余分な空白は詰めて記録
#setopt HIST_SAVE_NO_DUPS      # ヒストリファイルに書き出すときに、古いコマンドと同じものは無視する
#setopt INC_APPEND_HISTORY     # 履歴をインクリメンタルに追加
setopt LIST_TYPES             # 補完候補一覧でファイルの種別をマーク表示
setopt MARK_DIRS              # ファイル名の展開でディレクトリにマッチした場合 末尾に / を付加
setopt NUMERIC_GLOB_SORT      # 数字を数値と解釈してソートする
setopt NOBEEP                 # ビープを鳴らさない
#setopt NO_FLOW_CONTROL        # disable C-q, C-s
#setopt PROMPT_SUBST           # PROMPT 変数に対して変数展開、コマンド置換、算術展開を施す
#setopt RM_STAR_WAIT           # rm * を実行する前に確認
setopt SHARE_HISTORY          # 履歴の共有
#setopt EQUALS                 # =command を command のパス名に展開する
#setopt HIST_VERIFY            # ヒストリを呼び出してから実行する間に一旦編集
#setopt LIST_ROWS_FIRST        # 補完リストを水平にソートする
#setopt LONG_LIST_JOBS         # 内部コマンド jobs の出力をデフォルトで jobs -l にする
setopt PRINT_EIGHT_BIT        # 出力時8ビットを通す
setopt interactive_comments # '#' 以降をコメントとして扱う
unsetopt PROMPTCR            # 出力の文字列末尾に改行コードが無い場合でも表示
setopt PUSHD_IGNORE_DUPS      # 同じディレクトリを pushd しない
setopt AUTO_PUSHD              # cd 時に自動で push. cd -[TAB]
setopt MAGIC_EQUAL_SUBST      # --prefix=/usr などの = 以降も補完
setopt RM_STAR_SILENT         # http://zsh.sourceforge.net/Doc/Release/Options.html#index-NORMSTARSILENT

REPORTTIME=3 # 実行したプロセスの消費時間が3秒以上かかったらtimeコマンド表示
TIMEFMT="%J # %E" # REPORTTIMEのフォーマットを変更

zstyle ':completion:*' menu select
zstyle ':completion:*' format '%F{white}%d%f'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*' keep-prefix
zstyle ':completion:*' completer _oldlist _complete _match _ignored _approximate _list _history

# w3mでALC検索 ex : alc hoge
function alc() {
    if [ $# != 0 ]; then
        w3m "http://eow.alc.co.jp/$*/UTF-8/?ref=sa"
    else
        w3m "http://www.alc.co.jp/"
    fi
}

# w3mでexcite翻訳
function world() {
    if [ $# != 0 ]; then
        w3m "http://www.excite.co.jp/world/english/?before=$*"
    else
        w3m "http://www.excite.co.jp/world/english/?before=$*"
    fi
}

# ex : php-unserialize PhpSerialized.text
function php-unserialize() { 
    php -r "print_r(unserialize(file_get_contents('$*')));"
}

# complete host
function print_known_hosts (){
    if [ -f $HOME/.ssh/known_hosts ]; then
        cat $HOME/.ssh/known_hosts|tr ',' ' '|cut -d' ' -f1|sort|uniq
    fi  
}
_cache_hosts=($( print_known_hosts ))

# highlighter
# tail -f log | hi
# tail -f log | hi hoge
function hi(){
    if [ $# != 0 ];then
        clide -e /deprecate/i,fg=yellow -e /warn/i,fg=yellow -e /reject/i,fg=red -e /critical/i,fg=red -e /fail/i,fg=red -e /false/i,fg=red -e /err/i,fg=red,bold -e /fatal/i,fg=red,bold -e /\ 404\ /i,bold -e /\ 503\ /i,bold -e /yuki/i,bold -e /adachi/i,fg=blue,bg=yellow -e /$*/i,fg=green
    else
        clide -e /deprecate/i,fg=yellow -e /warn/i,fg=yellow -e /reject/i,fg=red -e /critical/i,fg=red -e /fail/i,fg=red -e /false/i,fg=red -e /err/i,fg=red,bold -e /fatal/i,fg=red,bold -e /\ 404\ /i,bold -e /\ 503\ /i,bold -e /yuki/i,bold -e /adachi/i,fg=blue,bg=yellow
    fi
}

# svn log diff viewer
function svnld(){ svnlogdiff $* }
function svnlogdiff(){
    if [ $# != 0 ];then
        svn log --limit $* --verbose --diff|nkf -w|view - -c "set ft=diff"
    else
        svn log --limit 1  --verbose --diff|nkf -w|view - -c "set ft=diff"
    fi
}

# tmuxinator
[[ -s $HOME/.tmuxinator/scripts/tmuxinator ]] && source $HOME/.tmuxinator/scripts/tmuxinator

# source
[ -f ${HOME}/.zshrc.local ] && source ${HOME}/.zshrc.local
[ -f ${HOME}/.zshrc.mysql ] && source ${HOME}/.zshrc.mysql
[ -f ${HOME}/.zshrc.git   ] && source ${HOME}/.zshrc.git
[ -f ${HOME}/.zshrc.cl    ] && source ${HOME}/.zshrc.cl
[ -f ${HOME}/.zshrc.prompt ] && source ${HOME}/.zshrc.prompt

# The next line updates PATH for the Google Cloud SDK.
[ -f ~/google-cloud-sdk/path.zsh.inc ] && source ~/google-cloud-sdk/path.zsh.inc

# The next line enables bash completion for gcloud.
[ -f /home/vagrant/google-cloud-sdk/completion.zsh.inc ] && source /home/vagrant/google-cloud-sdk/completion.zsh.inc

# Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
