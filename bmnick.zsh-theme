# Set up the rediculous prompt, thanks Steve Losh
autoload -U add-zsh-hook
autoload -Uz vcs_info

zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' unstagedstr ' ✐'
zstyle ':vcs_info:*' stagedstr ' ✉'
zstyle ':vcs_info:*' actionformats '%F{5}(%f%s%F{5})%F{3}-%F{5}[%F{2}%b%F{3}|%F{1}%a%F{5}]%f ' '%s'
zstyle ':vcs_info:*' formats '%F{7} on %F{5}%b%F{4}%u%c%f ' '%s'
#    '%F{2}%s%F{7}:%F{2}(%F{1}%b%F{2})%f '
zstyle ':vcs_info:(sv[nk]|bzr):*' branchformat '%b%F{1}:%F{3}%r'
zstyle ':vcs_info:*' enable git hg svn

add-zsh-hook precmd prompt_bmnick_precmd

prompt_bmnick_precmd () {
	vcs_info
	
	case "${vcs_info_msg_1_}" in
		git)
		vcs_system='☭'
		;;
		hg)
		vcs_system='☣'
		;;
		svn)
		vcs_system='☠'
		;;
		*)
		vcs_system='○'
		;;
	esac
}

function battery_charge {
    echo `~/Applications/batterymon.py` 2>/dev/null
}

PROMPT='
%{$fg[magenta]%}%n%{$fg[white]%} at %{$fg[yellow]%}%m%{$fg[white]%} in %{$fg_bold[green]%}%~%{$reset_color%}${vcs_info_msg_0_}
${vcs_system} '

RPROMPT='$(battery_charge)'

