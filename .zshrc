#######################
# Prompt and bindings #
#######################

# Use emacs keybindings even if our EDITOR is set to vi
bindkey -e
bindkey ";5D" backward-word
bindkey ";5C" forward-word
bindkey "^U" vi-kill-line
bindkey "^K" vi-kill-eol
bindkey "ä" kill-word
# binding used by screen
bindkey "5D" backward-word
bindkey "5C" forward-word

# Prompt color (different for root and simple users)
if [ "`id -u`" -eq 0 ]; then
  export PS1="%{[34;1m%}%n%{[33m%}@%{[37m%}%m %{[32m%}%~%{[33m%}%#%{[0m%} "
else
  export PS1="%{[31;1m%}%n%{[33m%}@%{[37m%}%m %{[32m%}%~%{[33m%}%#%{[0m%} "
fi

#####################################
# zsh options (cf 'man zshoptions') #
#####################################
# print output code if different from '0'
setopt print_exit_value
# ask confirmation for 'rm *'
unsetopt rm_star_silent
# remove nonmatching wildcard patterns from arguments list
setopt nullglob

setopt hist_verify
unsetopt auto_cd
setopt auto_pushd
setopt pushd_ignore_dups
setopt pushd_silent
setopt pushd_to_home

unsetopt bg_nice
unsetopt hup

#####################
# Completion schema #
#####################
unsetopt list_ambiguous
setopt auto_remove_slash
unsetopt glob_dots

setopt chase_links

###########
# History #
###########
# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history

setopt inc_append_history
setopt hist_ignore_dups
setopt hist_ignore_all_dups
setopt hist_find_no_dups

##############
# Completion #
##############
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}'
zstyle ':completion:*' max-errors 3 numeric
zstyle ':completion:*' use-compctl false

autoload -Uz promptinit
promptinit

# Use modern completion system
autoload -Uz compinit
compinit
