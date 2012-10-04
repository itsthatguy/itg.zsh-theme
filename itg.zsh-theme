# itg.zsh-theme
# a designer developed zsh Prompt
# twitter: @itg
# https://gist.github.com/3834711

# Colors:
local black=235
local dark=236
local white=015
local yellow=003
local blue=038
local darker_blue=030
local darker_green=023

# Extending the git library locally
function git_user_initials {
  MSG=$(git config --get user.initials || echo '✈')
  print $MSG
}

function git_is_dirty() {
  local SUBMODULE_SYNTAX=''
  if [[ $POST_1_7_2_GIT -gt 0 ]]; then
        SUBMODULE_SYNTAX="--ignore-submodules=dirty"
  fi
  if [[ -n $(git status -s ${SUBMODULE_SYNTAX}  2> /dev/null) ]]; then
    return 0
  else
    return 1
  fi
}

function itg_git_prompt_info() {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || return
  echo "$ZSH_THEME_GIT_PROMPT_PREFIX${ref#refs/heads/}$(parse_git_dirty)$(itg_git_prompt_ahead)$ZSH_THEME_GIT_PROMPT_SUFFIX"
}

function itg_git_prompt_ahead() {
  if $(echo "$(git log $(itg_git_current_upstream)/$(current_branch)..HEAD 2> /dev/null)" | grep '^commit' &> /dev/null); then
    echo "$ZSH_THEME_GIT_PROMPT_AHEAD"
  fi
}

function itg_git_current_upstream() {
  local upstream=$(git config --get branch."$(current_branch)".remote) || return
  echo $upstream
}

# Prompt builder functions
function itg_dir() {
  echo -n "%K{$blue} %F{$black}%1~"
}

function itg_git() {
  # Is this a dirty git directory?
  # This check is done first to set colors
  if ($(git_is_dirty)); then
    git_status_color_k=$yellow
    git_status_color_f=$darker_green
  else
    git_status_color_k=$darker_blue
    git_status_color_f=$black
  fi

  # Is this a git directory?
  if [ -d .git ]; then
    git_prefix=" %K{$git_status_color_k}%F{$blue}⮀ %F{$git_status_color_f}⭠ "
    git_suffix="%F{$git_status_color_k}⮀"
  else
    git_prefix=""
    git_suffix="%F{$blue}⮀"
  fi

  echo -e "$git_prefix$(itg_git_prompt_info) %K{$darker_green}$git_suffix"
}

function itg_pair() {
  echo " %F{$yellow}$(git_user_initials) %k%F{$darker_green}⮀%f"
}

function itg_rvm() {
  echo "%F{$dark}⮂%K{$dark}%F{$white} $(rvm_prompt_info) %k"
}

ZSH_THEME_GIT_PROMPT_PREFIX=''
ZSH_THEME_GIT_PROMPT_SUFFIX=''
ZSH_THEME_GIT_PROMPT_DIRTY='%F{$darker_green} ✍'
ZSH_THEME_GIT_PROMPT_CLEAN=''

ZSH_THEME_GIT_PROMPT_AHEAD="↑"
ZSH_THEME_GIT_PROMPT_BEHIND="↓"
ZSH_THEME_GIT_PROMPT_DIVERGED="↕"

# command to make sure the prompt reruns the functions on new prompt
function precmd {
  PROMPT="
$(itg_dir)$(itg_git)$(itg_pair) "
  RPROMPT="$(itg_rvm)"
}
