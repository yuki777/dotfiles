# vim open session
function vimo
    vim "+OpenSession $1"
end

## http://qiita.com/jpshadowapps/items/3fbf817bdd14c48e2d54
#function vip
#    vim $(grep -in ${1} **/*.php | grep -v "[0-9]:\s*//" | peco | awk -F ":" '{print "-c "$2" "$1}')
#end
#
#function vit
#    vim $(grep -in ${1} **/*.twig | grep -v "[0-9]:\s*//" | peco | awk -F ":" '{print "-c "$2" "$1}')
#end

## highlighter
## tail -f log | hi
## tail -f log | hi hoge
#function hi
#    if [ $# != 0 ];then
#        clide -e /deprecate/i,fg=yellow -e /warn/i,fg=yellow -e /reject/i,fg=red -e /critical/i,fg=red -e /fail/i,fg=red -e /false/i,fg=red -e /err/i,fg=red,bold -e /fatal/i,fg=red,bold -e /\ 404\ /i,bold -e /\ 503\ /i,bold -e /yuki/i,bold -e /adachi/i,fg=blue,bg=yellow -e /$*/i,fg=green
#    else
#        clide -e /deprecate/i,fg=yellow -e /warn/i,fg=yellow -e /reject/i,fg=red -e /critical/i,fg=red -e /fail/i,fg=red -e /false/i,fg=red -e /err/i,fg=red,bold -e /fatal/i,fg=red,bold -e /\ 404\ /i,bold -e /\ 503\ /i,bold -e /yuki/i,bold -e /adachi/i,fg=blue,bg=yellow
#    fi
#end

# https://github.com/yoshiori/fish-peco_select_zsh_history
function peco_select_zsh_history
  set -l query (commandline)

  if test -n $query
    set peco_flags --query "$query"
  end

  less $ZSH_HISTORY_FILE | cut -d ';' -f 2- | peco $peco_flags | read line

  if [ $line ]
    commandline $line
  else
    commandline -f repaint
  end
end
