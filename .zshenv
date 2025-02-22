#zmodload zsh/zprof && zprof

# compinit
_compinit() {
	local re_initialize=0
	for match in ${ZDOTDIR}/.zcompdump*(.Nmh+24); do
		re_initialize=1
		break
	done
	autoload -Uz compinit
	if [ "$re_initialize" -eq "1" ]; then
		compinit
		# update the timestamp on compdump file
		compdump
	else
		# omit the check for new functions since we updated today
		compinit -C
	fi
}
_compinit

