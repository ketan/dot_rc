#!/bin/zsh
if [ -z "$PS1" ]; then
  return
fi
###
# history stuff goes here
###
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

bindkey -e				# use emacs style keys

# filter for less
export LESSOPEN='| /opt/local/bin/lesspipe.sh %s'

export PAGER='less'
export EDITOR='vim'
export GEM_EDITOR='mate'
export GEM_OPEN_EDITOR='mate'

setopt AUTO_CD                # cd if no matching command
setopt AUTO_PARAM_SLASH       # adds slash at end of tabbed dirs
setopt HIST_NO_STORE          # don't save 'history' cmd in history
setopt INC_APPEND_HISTORY     # append history as command are entered
setopt LIST_TYPES             # show file types in list
setopt MARK_DIRS              # adds slash to end of completed dirs
# setopt SHARE_HISTORY          # share history between open shells
setopt HIST_IGNORE_ALL_DUPS	  # ignore all dups from history

autoload colors && colors
# autoload zsh/terminfo			# don't know if this is needed
if [[ "$terminfo[colors]" -ge 8 ]]; then
  colors
fi

# set some colors
for COLOR in RED GREEN YELLOW BLUE MAGENTA CYAN WHITE BLACK; do
    eval PR_$COLOR='%{$fg[${(L)COLOR}]%}'        
    eval PR_BRIGHT_$COLOR='%{$fg_bold[${(L)COLOR}]%}'
done                                                
PR_RESET="%{${reset_color}%}";
PR_NO_COLOR="%{$terminfo[sgr0]%}"

# parse_git_branch() {
#   branch=`git branch --no-color 2>/dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/git (\1)/'`
#   if [[ -n $branch ]]; then
#     echo $branch
#     return
#   fi
#   
#   branch=`hg branch 2>/dev/null`
#   if [[ -n $branch ]]; then
#     echo $branch | sed -e 's/^/hg (/' -e 's/$/)/'
#     return
#   fi
# }
# ###
# # Called before prompt shown, shows the git/mercurial branch
# ###
# function precmd {
#   export PS1="
#   
# ${PR_BLUE}$(rvm-prompt)${PR_NO_COLOR}
# $PR_GREEN%U%m%u$PR_NO_COLOR:$PR_CYAN%~ $PR_RED$(parse_git_branch)$PR_NO_COLOR%(!.#.$) "
# }

