# lifted cool stuff from:
# https://github.com/fish-shell/fish-shell/blob/master/share/functions/fish_prompt.fish
# https://github.com/fish-shell/fish-shell/blob/master/share/tools/web_config/sample_prompts/robbyrussell.fish
function fish_prompt
    # define git functions if not already defined
    if not set -q -g __fish_git_functions_defined
        set -g __fish_git_functions_defined
        function _git_branch_name
            echo (git symbolic-ref HEAD ^/dev/null | sed -e 's|^refs/heads/||')
        end
        function _is_git_dirty
            echo (git status -s --ignore-submodules=dirty ^/dev/null)
        end
    end

    # define hostname if not already defined
    if not set -q __fish_prompt_hostname
        set -g __fish_prompt_hostname (hostname)
    end

    # shortcuts for colors
    set -l cyan    ( set_color -o cyan)
    set -l yellow  ( set_color -o yellow)
    set -l magenta ( set_color -o magenta)
    set -l red     ( set_color -o red)
    set -l green   ( set_color -o green)
    set -l blue    ( set_color -o blue)
    set -l normal  ( set_color normal)

    # set ...
    set -l user "$USER"
    set -l host "$__fish_prompt_hostname"
    set -l pwd  (pwd)

    # set color
    set -l color_user $red
    set -l color_host $yellow

    # if git branch
    if [ (_git_branch_name) ]
        set git_info $blue(_git_branch_name)

        # if dirty
        if [ (_is_git_dirty) ]
            set -l dirty "$red x"
            set git_info "$git_info$dirty "
        else
            set -l clean "$green #"
            set git_info "$git_info$clean"
        end
    end

    set -l gitporcelain (git_porcelain)

		echo "#" (date "+%Y-%m-%d %H:%M:%S") $color_user$user$color_host@$host$magenta:$pwd$normal [$git_info$gitporcelain]$normal
		echo
end

function fish_right_prompt
end

# http://qiita.com/susieyy/items/ac2133e249f252dc9a34
function fish_user_key_bindings
  bind \cr 'peco_select_history (commandline -b)' # Bind for peco history to Ctrl+r
end
