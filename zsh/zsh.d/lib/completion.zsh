#!/bin/zsh
if [ -z "$PS1" ]; then
  return
fi

fpath=(~/.zsh/zsh.d/completion $fpath)

###
# Stuff for normal completion
###
zstyle ':completion:*' completer _expand _complete _ignored
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' menu select=0
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle :compinstall filename "$HOME/.zshrc"

autoload -Uz compinit && compinit

###
# alt+bksp stops on these characters
###
export WORDCHARS="${WORDCHARS:s#/#}"	# alt+bksp stops at '/'
export WORDCHARS="${WORDCHARS:s#-#}"	# alt+bksp stops at '-'
export WORDCHARS="${WORDCHARS:s#.#}"	# alt+bksp stops at '.'

###
# ssh host completion
###
zstyle -e ':completion:*:(ssh|scp|telnet|rsync):*' hosts 'reply=(
  ${=${${(f)"$(cat {/etc/ssh_,~/.ssh/known_}hosts(|2)(N) \
       /dev/null)"}%%[# ]*}//,/ }
  ${=${(f)"$(cat /etc/hosts(|)(N) <<(ypcat hosts 2>/dev/null))"}%%\#*}
)'

compctl -k hostnames ping sftp host ssh


