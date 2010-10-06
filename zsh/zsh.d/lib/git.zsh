# Allow for functions in the prompt.
setopt PROMPT_SUBST

autoload -Uz vcs_info

function precmd {
  # set formats
  # %b - branchname
  # %u - unstagedstr (see below)
  # %c - stangedstr (see below)
  # %a - action (e.g. rebase-i)
  # %R - repository path
  # %S - path in the repository
  
  local FMT_BRANCH="${PR_GREEN}%b${PR_NO_COLOR}"        # e.g. master
  local FMT_ACTION="(${PR_CYAN}%a${PR_NO_COLOR}%)"      # e.g. (rebase-i)
  local FMT_PATH="%R${PR_YELLOW}/%S"                    # e.g. ~/repo/subdir
  local FMT_ANOTATION="${PR_GREEN}%u%c${PR_NO_COLOR}"   # e.g. "⚡↕"
  # check-for-changes can be really slow.
  # you should disable it, if you work with large repositories
  zstyle ':vcs_info:*:prompt:*' check-for-changes true
  zstyle ':vcs_info:*:prompt:*' unstagedstr       '⚡'   # display ¹ if there are unstaged changes
  zstyle ':vcs_info:*:prompt:*' stagedstr         '↕'     # display ² if there are staged changes
  zstyle ':vcs_info:*:prompt:*' actionformats     "${FMT_BRANCH}${FMT_ACTION}//"  "${FMT_PATH} ${FMT_ANOTATION}"
  zstyle ':vcs_info:*:prompt:*' formats           "${FMT_BRANCH}//"               "${FMT_PATH} ${FMT_ANOTATION}"
  zstyle ':vcs_info:*:prompt:*' nvcsformats       ""                              "%~"
  zstyle ':vcs_info:hg*:*'      get-bookmarks     true
  
  
  vcs_info 'prompt'
}

function ___rvm_prompt {
  "${ruby_string}"
}
function prompt {
    local brackets=$1
    local color1=$2
    local color2=$3

    local bracket_open="${color1}${brackets[1]}${PR_NO_COLOR}"
    local bracket_close="${color1}${brackets[2]}"

    local git='$vcs_info_msg_0_'

    local colon="${color1}:"

    local user_host="${color2}%m"
    local vcs_cwd='${${vcs_info_msg_1_%%.}/$HOME/~}'
    local r_cwd="${color2}%B${vcs_cwd}%<<%b"
    local rvm_string='${${GEM_HOME}/$rvm_path\/gems\/}'

    PROMPT="
${PR_BLUE}${rvm_string}${PR_NO_COLOR}
${user_host}${colon}${PR_NO_COLOR}${bracket_open}${git}${r_cwd}${bracket_close}
%# ${PR_NO_COLOR}"
}

prompt '[]' $PR_BRIGHT_BLACK $PR_WHITE
