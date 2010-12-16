# Path to your oh-my-zsh configuration.
export ZSH=$HOME/.oh-my-zsh

# Set to the name theme to load.
# Look in ~/.oh-my-zsh/themes/
export ZSH_THEME="prose"

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
export EDITOR="mate -w"
# special case for git:
export GIT_EDITOR="mate -wl1"

# Set up necessary maven variables
export M2_HOME=/usr/local/apache-maven/apache-maven-2.2.1
export M2=$M2_HOME/bin
#export MAVEN_OPTS="-Xms256m -Xmx512m"

# Set up for Go
export GOROOT=$HOME/Development/Tools/go
export GOOS=darwin
export GOARCH=amd64
export GOBIN=/usr/local/bin

# Griffon needs a home directory to play nice
export GRIFFON_HOME=/Users/ben/Development/Frameworks/griffon-0.3

# Enable autofeature for autospec with rails
export AUTOFEATURE=true

# Set up jruby
export JRUBYBIN=/Users/ben/Development/Tools/jruby/bin

# For Primavera, increase the ant heap size
export ANT_HOME="/usr/share/ant"
export ANT_OPTS="-Xmx1024M -Dant.logger.defaults=/Users/ben/Applications/antcolors.properties"
export ANT_ARGS="-logger org.apache.tools.ant.listener.AnsiColorLogger"
export JAVA_HOME="/System/Library/Frameworks/JavaVM.framework/Home"

# Fix python path for artoo
export PYTHONPATH=/Library/Python/2.6/site-packages

# Java debugging
export JPDA_TRANSPORT=dt_socket
export JPDA_ADDRESS=7777
export VMARGS="-Djava.compiler=NONE -Xnoagent -Xdebug -Xrunjdwp:transport=dt_socket,address=9988,server=y,suspend=n"


# cappucino support
export CAPPBUILD=/Users/ben/Development/Frameworks/cappbuild/
export NARWHAL_ENGINE=jsc

# Include alll necessary files into the path
export PATH=$PATH:/Users/ben/Applications:/Users/Applications/gradle/bin:$M2:$GRIFFON_HOME/bin:$JRUBYBIN:/usr/local/narwhal/bin

[[ ( -f ~/.zsh_aliases ) ]] && source ~/.zsh_aliases

bindkey -v
