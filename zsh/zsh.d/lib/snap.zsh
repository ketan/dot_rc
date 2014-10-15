#!/bin/zsh
if [ -z "$PS1" ]; then
  return
fi

export PATH=$PATH:$HOME/projects/snap/go-saas-chef/scripts

fpath=($HOME/projects/snap/go-saas-chef/scripts/completion $fpath)

autoload -Uz compinit && compinit
