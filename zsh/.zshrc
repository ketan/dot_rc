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
# history stuff goes here
###
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

bindkey -e				# use emacs style keys
# End of lines configured by zsh-newuser-install

setopt AUTO_CD                # cd if no matching command
setopt AUTO_PARAM_SLASH       # adds slash at end of tabbed dirs
setopt HIST_NO_STORE          # don't save 'history' cmd in history
setopt INC_APPEND_HISTORY     # append history as command are entered
setopt LIST_TYPES             # show file types in list
setopt MARK_DIRS              # adds slash to end of completed dirs
# setopt SHARE_HISTORY          # share history between open shells
setopt HIST_IGNORE_ALL_DUPS	  # ignore all dups from history

# filter for less
export LESSOPEN='| /opt/local/bin/lesspipe.sh %s'

export PAGER='less'
export EDITOR='vim'

###
# alt+bksp stops on these characters
###
export WORDCHARS="${WORDCHARS:s#/#}"	# alt+bksp stops at '/'
export WORDCHARS="${WORDCHARS:s#-#}"	# alt+bksp stops at '-'
export WORDCHARS="${WORDCHARS:s#.#}"	# alt+bksp stops at '.'

###
# ssh host completion
###
zstyle -e ':completion:*:(ssh|scp):*' hosts 'reply=(
  ${=${${(f)"$(cat {/etc/ssh_,~/.ssh/known_}hosts(|2)(N) \
       /dev/null)"}%%[# ]*}//,/ }
  ${=${(f)"$(cat /etc/hosts(|)(N) <<(ypcat hosts 2>/dev/null))"}%%\#*}
)'

compctl -k hostnames ping sftp host ssh

# some aliases
alias ls='ls -hF --color=auto'
alias vi='vim'
alias less='less -R'
alias -g ..='..'
alias -g ...='../..'
alias -g ....='../../..'
alias -g .....='../../../..'


autoload colors && colors
# autoload zsh/terminfo			# don't know if this is needed
if [[ "$terminfo[colors]" -ge 8 ]]; then
  colors
fi
for color in RED GREEN YELLOW BLUE MAGENTA CYAN WHITE; do
  eval PR_$color='%{$terminfo[bold]$fg[${(L)color}]%}'
  eval PR_LIGHT_$color='%{$fg[${(L)color}]%}'
  (( count = $count + 1 ))
done
PR_NO_COLOR="%{$terminfo[sgr0]%}"

parse_git_branch() {
	branch=`git branch --no-color 2>/dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/git (\1)/'`
	if [[ -n $branch ]]; then
		echo $branch
		return
	fi
	
	branch=`hg branch 2>/dev/null`
	if [[ -n $branch ]]; then
		echo $branch | sed -e 's/^/hg (/' -e 's/$/)/'
	 	return
	fi
}
###
# Called before prompt shown, shows the git/mercurial branch
###
function precmd {
	export PS1="
	
$PR_GREEN%U%m%u$PR_NO_COLOR:$PR_CYAN%~ $PR_RED$(parse_git_branch)$PR_NO_COLOR%(!.#.$)
"
}

for i in $HOME/projects/*/*; do
	dir=`basename $i`
	hash -d $dir=$i
done


function releng(){
	dir=`ls -d *releng* 2>/dev/null`
	if [[ -d "$dir" ]]; then
		cd $dir
	fi
}