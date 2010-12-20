# Set up the rediculous prompt, thanks Steve Losh
function collapse_pwd {
    echo $(pwd | sed -e "s,^$HOME,~,")
}

function prompt_char {
    git branch >/dev/null 2>/dev/null && echo '☭' && return
    hg root >/dev/null 2>/dev/null && echo '☣' && return
    echo '○'
}

function battery_charge {
    echo `~/Applications/batterymon.py` 2>/dev/null
}

function virtualenv_info {
    [ $VIRTUAL_ENV ] && echo '('`basename $VIRTUAL_ENV`') '
}

function hg_prompt_info {
   hg prompt --angle-brackets "\
<%{$fg[white]%} on %{$fg[magenta]%}<branch>%{$fg[white]%}>\
%{$fg[green]%}<status|modified|unknown><update>%{$reset_color%}\
%{$fg[white]%} at %{$fg[yellow]%}<tags|%{$reset_color%}, %{$fg[yellow]%}>%{$reset_color%}<
patches: <patches|join( → )|pre_applied(%{$fg[yellow]%})|post_applied(%{$reset_color%})|pre_unapplied(%{$fg[white]%})|post_unapplied(%{$reset_color%})>>" 2>/dev/null
}

function parse_git_dirty {
	gitstatus=""
    gitstatus=`git status 2> /dev/null`
    gitdirty=`    echo -n "${gitstatus}" 2> /dev/null | grep -q "Changed but not updated" 2> /dev/null; echo "$?"`
    gituntracked=`echo -n "${gitstatus}" 2> /dev/null | grep -q "Untracked files" 2> /dev/null; echo "$?"`
    gitahead=`    echo -n "${gitstatus}" 2> /dev/null | grep -q "Your branch is ahead of" 2> /dev/null; echo "$?"`
    gitnewfile=`  echo -n "${gitstatus}" 2> /dev/null | grep -q "new file:" 2> /dev/null; echo "$?"`
    gitrenamed=`  echo -n "${gitstatus}" 2> /dev/null | grep -q "renamed:" 2> /dev/null; echo "$?"`
    gitadded=`    echo -n "${gitstatus}" 2> /dev/null | grep -q "Changes to be committed" 2> /dev/null; echo "$?"`
    statusbits=""
    if [ "${gitdirty}" -eq "0" ]; then
        statusbits="${statusbits}!"
    fi
    if [ "${gituntracked}" -eq "0" ]; then
        statusbits="${statusbits}?"
    fi
    if [ "${gitnewfile}" -eq "0" ]; then
        statusbits="${statusbits}*"
    fi
    if [ "${gitahead}" -eq "0" ]; then
        statusbits="${statusbits}▲"
    fi
    if [ "${gitrenamed}" -eq "0" ]; then
        statusbits="${statusbits} ✄"
    fi
    if [ "${gitadded}" -eq "0" ]; then
        statusbits="${statusbits}✉"
    fi
    echo "${statusbits}"
}
function parse_git_branch {
    git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/\1/"
}

function git_prompt_obscene {
    git branch >/dev/null 2>/dev/null && echo "%{$fg[white]%} on %{$fg[magenta]%}$(parse_git_branch)%{$fg[green]%}$(parse_git_dirty)%{$reset_color%}"
}

PROMPT='
%{$fg[magenta]%}%n%{$fg[white]%} at %{$fg[yellow]%}%m%{$fg[white]%} in %{$fg_bold[green]%}%~%{$reset_color%}$(hg_prompt_info)$(git_prompt_obscene)
$(virtualenv_info)$(prompt_char) '

RPROMPT='$(battery_charge)'

ZSH_THEME_GIT_PROMPT_PREFIX=" on %{$fg[magenta]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[green]%}!"
ZSH_THEME_GIT_PROMPT_CLEAN=""
