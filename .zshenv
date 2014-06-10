#############
# Aliases   #
#############
alias ls='ls --classify --tabsize=0 --literal --color=auto --show-control-chars --human-readable --group-directories-first'
alias ll='ls -l'
alias la='ls -a'
alias lla='ls -la'
alias cp='cp --interactive'
alias mv='mv --interactive'
alias rm='rm --interactive'
alias s='cd ..'
alias df='df --human-readable'
alias du='du --human-readable'
alias vi=vim
alias grep="grep --color"

# cvsstatus
alias cvsstatus="cvs -Q status | grep -i locally"

####################
# global variables #
####################
export CVS_RSH=ssh
export VISUAL=vim
export EDITOR=vim
