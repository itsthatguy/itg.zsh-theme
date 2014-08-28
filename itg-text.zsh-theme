# itg-text.zsh-theme
# a designer developed zsh Prompt
# twitter: @itg
# https://gist.github.com/3834711

# background 39, 42, 50
# cyan 116, 241, 198
#
# Colors:
local black=235
local dark=015
local white=007
local yellow=003
local pink=197
local orange=003
local cyan=006
local blue=004
local green=010
local red=009

local highlight=$white
local normal=$red
local fade=$dark
local warning=$yellow
local good=$cyan
local bad=$pink


# Extending the git library locally
function git_user_initials {
  MSG=$(git config --get user.initials || echo '')
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

function itg_current_branch() {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || \
  ref=$(git rev-parse --short HEAD 2> /dev/null) || return
  echo ${ref#refs/heads/}
}


function itg_git_prompt_ahead() {
  if $(echo "$(git log $(itg_git_current_upstream)/$(itg_current_branch)..HEAD 2> /dev/null)" | grep '^commit' &> /dev/null); then
    echo "$ZSH_THEME_GIT_PROMPT_AHEAD"
  fi
}

function itg_git_current_upstream() {
  local upstream=$(git config --get branch."$(itg_current_branch)".remote) || return
  echo $upstream
}

#
# CHANGES THE DIRECTORY INFORMATION
# Prompt builder functions
function itg_dir() {
  if git rev-parse --git-dir > /dev/null 2>&1 && [ ! -d .git ]; then
    git_dir_cdup=$(git rev-parse --show-cdup)
    git_dir_top=$(cd $git_dir_cdup; echo ${PWD##*/})
    git_dir_path=$(git rev-parse --show-prefix)
    dir="$git_dir_top/$git_dir_path %F{$fade}"
  else
    if [ -d .git ]; then
      suffix="%F{$fade}"
    else
      suffix=""
    fi
    dir="%1~$suffix"
  fi
  echo -n "%F{$normal}$dir"
}


#
# CHANGES THE COLOR/STATUS OF THE GIT BRANCH
function itg_git() {
  # Is this a dirty git directory?
  # This check is done first to set colors
  if ($(git_is_dirty)); then
    git_status_color_f=$warning
  else
    git_status_color_f=$fade
  fi

  # Is this a git directory?
  if git rev-parse --git-dir > /dev/null 2>&1; then
    git_prefix=" %F{$git_status_color_f}"
    git_suffix="%F{$git_status_color_f}"
    git_status=$(itg_git_prompt_info)
  else
    git_prefix=""
    git_suffix="%F{$git_status_color_f}"
    git_status=""
  fi

  echo -e "$git_prefix$git_status%F{$normal}$git_suffix"
}

function itg_pair() {
  echo "%F{$normal}$(git_user_initials)"
}

function itg_wrap_right() {
  if alias random_giggle > /dev/null; then
    echo -e "%F{$dark}$(random_giggle)%k"
  fi
}

function itg_host() {
  item=$(itg_wrap_right %t)
  echo -e "${item}"
}


ZSH_THEME_GIT_PROMPT_PREFIX=''
ZSH_THEME_GIT_PROMPT_SUFFIX=''
ZSH_THEME_GIT_PROMPT_DIRTY='%F{$warning} (╯°□°)╯︵┻━┻ '
ZSH_THEME_GIT_PROMPT_CLEAN=''

ZSH_THEME_GIT_PROMPT_AHEAD="↑"
ZSH_THEME_GIT_PROMPT_BEHIND="↓"
ZSH_THEME_GIT_PROMPT_DIVERGED="↕"

# command to make sure the prompt reruns the functions on new prompt
function precmd {
  tmp=$(ruby --version | cut -d' ' -f 2)
  ruby_version=${tmp/p/-p}
  PROMPT="
%F{$dark}$ruby_version
%F{$cyan}╳ %F{$normal} $(itg_dir)$(itg_git)%F{$normal} $(itg_pair)%f"
  RPROMPT="%F{$fade}$(itg_host)"
}

