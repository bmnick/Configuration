# Path to your oh-my-zsh configuration.
export ZSH=$HOME/.oh-my-zsh

# Set to the name theme to load.
# Look in ~/.oh-my-zsh/themes/
export ZSH_THEME="bmnick"

# Set to this to use case-sensitive completion
# export CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# export DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# export DISABLE_LS_COLORS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git rails)

source $ZSH/oh-my-zsh.sh

#==============================================================================
#Set up environment variables, many regarding eventual path settins
#==============================================================================

# make the default editor vim
export EDITOR="mvim -f --remote-tab-wait"
# special case for git:
export GIT_EDITOR="mvim -f --remote-tab-wait +1"

[[ ( -f ~/.zsh_aliases ) ]] && source ~/.zsh_aliases

[[ ( -f ~/.zsh_machine ) ]] && source ~/.zsh_machine

# Enable RVM necessities
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
