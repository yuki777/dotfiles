# lifted cool stuff from:
# https://github.com/fish-shell/fish-shell/blob/master/share/functions/fish_prompt.fish
# https://github.com/fish-shell/fish-shell/blob/master/share/tools/web_config/sample_prompts/robbyrussell.fish

# set left prompt
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
    set -l red     ( set_color -o red)
    set -l green   ( set_color -o green)
    set -l yellow  ( set_color -o yellow)
    set -l blue    ( set_color -o blue)
    set -l magenta ( set_color -o magenta)
    set -l cyan    ( set_color -o cyan)

		set -l colors $red $green $yellow $blue $magenta $cyan
		set -l date_number (bash ~/dotfiles/bin/machine-id.bash|grep -o [1-6]|head -1|tail -1)
		set -l user_number (bash ~/dotfiles/bin/machine-id.bash|grep -o [1-6]|head -2|tail -1)
		set -l host_number (bash ~/dotfiles/bin/machine-id.bash|grep -o [1-6]|head -3|tail -1)

	  # set date color
    set -l color_date $colors[$date_number]

		# set date
		set -l date (date "+%Y-%m-%d %H:%M:%S")

    # set user color
    set -l color_user $colors[$user_number]
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
    set -l color_host $colors[$host_number]
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

		#	set host
    set -l host "$__fish_prompt_hostname"

		# set pwd
    set -l realhome ~
    set -l pwd (string replace -r '^'"$realhome"'($|/)' '~$1' $PWD)

    # set pwd_length
    set -l pwd_length (string length $pwd)

    if test $pwd_length -gt 50
      set pwd (prompt_pwd)
    end

    echo "#" $color_date$date $color_user$USER$color_host@$host$normal:$pwd$normal
		echo
end

# set right prompt
function fish_right_prompt
end
