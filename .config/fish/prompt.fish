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
    set -l normal  ( set_color normal)
    set -l green   ( set_color -o green)
    set -l blue    ( set_color -o blue)
    set -l cyan    ( set_color -o cyan)
    set -l yellow  ( set_color -o yellow)
    set -l magenta ( set_color -o magenta)
    set -l red     ( set_color -o red)

    # set ...
    set -l user "$USER"
    set -l host "$__fish_prompt_hostname"
    set -l pwd  (pwd)

    # set user color
    set -l color_user $red
    set -l check_user ( echo $USER | grep -qE '^yuki$' ; echo $status )
    if test $check_user -eq 0
      set color_user $green
    end
    set -l check_user ( echo $USER | grep -qE '^yuki-adachi$' ; echo $status )
    if test $check_user -eq 0
      set color_user $blue
    end
    set -l check_user ( echo $USER | grep -qE '^fvn-*' ; echo $status )
    if test $check_user -eq 0
      set color_user $yellow
    end

    # set host color
    set -l color_host $red
    set -l check_host ( hostname | grep -qE '.local' ; echo $status )
    if test $check_host -eq 0
      set color_host $blue
    end
    set -l check_host ( hostname | grep -qE '^systes*' ; echo $status )
    if test $check_host -eq 0
      set color_host $cyan
    end
    set -l check_host ( hostname | grep -qE 'macbookpro*' ; echo $status )
    if test $check_host -eq 0
      set color_host $green
    end

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

		echo "#" (date "+%Y-%m-%d %H:%M:%S") $color_user$user$color_host@$host$normal:$pwd$normal [$git_info$gitporcelain]$normal
		echo
end

function fish_right_prompt
end
