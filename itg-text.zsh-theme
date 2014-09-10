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
local magenta=197
local orange=003
local cyan=006
local blue=004
local green=010
local red=009

local bold=''
local dim=$dark
local ul=''
local blink=''
local reverse=''

local highlight=$white
local normal=$red
local fade=$dark
local warning=$yellow
local good=$cyan
local bad=$magenta

# Extending the git library locally
function git_user_initials {
  MSG=$(git config --get user.initials || echo '')
  if [ -n "$MSG" ]; then
    MSG="$MSG "
  fi
  echo $MSG
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
  echo "${ref#refs/heads/}$(parse_git_dirty) $(itg_git_prompt_status) "
}

function itg_current_branch() {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || \
  ref=$(git rev-parse --short HEAD 2> /dev/null) || return
  echo ${ref#refs/heads/}
}

function itg_git_prompt_status() {
  # echo "git fetch"
  _GST=$(command git status --porcelain -b 2> /dev/null)
  _STATUS=""
  if $(echo "$_GST" | grep '^[AMRD]. ' &> /dev/null); then
    _STATUS="$_STATUS$ZSH_THEME_GIT_PROMPT_STAGED"
  fi
  if $(echo "$_GST" | grep '^.[MTD] ' &> /dev/null); then
    _STATUS="$_STATUS$ZSH_THEME_GIT_PROMPT_UNSTAGED"
  fi
  if $(echo "$_GST" | grep -E '^\?\? ' &> /dev/null); then
    _STATUS="$_STATUS$ZSH_THEME_GIT_PROMPT_UNTRACKED"
  fi
  if $(echo "$_GST" | grep '^UU ' &> /dev/null); then
    _STATUS="$_STATUS$ZSH_THEME_GIT_PROMPT_UNMERGED"
  fi
  if $(command git rev-parse --verify refs/stash >/dev/null 2>&1); then
    _STATUS="$_STATUS$ZSH_THEME_GIT_PROMPT_STASHED"
  fi
  if $(echo "$_GST" | grep '^## .*ahead' &> /dev/null); then
    _STATUS="$_STATUS$ZSH_THEME_GIT_PROMPT_AHEAD"
  fi
  if $(echo "$_GST" | grep '^## .*behind' &> /dev/null); then
    _STATUS="$_STATUS$ZSH_THEME_GIT_PROMPT_BEHIND"
  fi
  if $(echo "$_GST" | grep '^## .*diverged' &> /dev/null); then
    _STATUS="$_STATUS$ZSH_THEME_GIT_PROMPT_DIVERGED"
  fi
  echo "$_STATUS"

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

  echo -e "$git_prefix$git_status"
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
ZSH_THEME_GIT_PROMPT_DIRTY=''
ZSH_THEME_GIT_PROMPT_CLEAN=''

ZSH_THEME_GIT_PROMPT_AHEAD="%F{$good}↑"
ZSH_THEME_GIT_PROMPT_BEHIND="%F{$warning}↓︎"
ZSH_THEME_GIT_PROMPT_DIVERGED="%F{$bad}⇅"

function itg_colors() {
  for word in $1
  do
    echo ${(P)word}
  done
}
local SYMBOL="◆"

# added
local git_added_color=$(itg_colors $(git config --get color.status.added || echo 'green'))
ZSH_THEME_GIT_PROMPT_STAGED="%F{$git_added_color}$SYMBOL"

# changed
local git_changed_color=$(itg_colors $(git config --get color.status.changed || echo 'red'))
ZSH_THEME_GIT_PROMPT_UNSTAGED="%F{$git_changed_color}$SYMBOL"

# untracked
local git_untracked_color=$(itg_colors $(git config --get color.status.untracked || echo 'red'))
ZSH_THEME_GIT_PROMPT_UNTRACKED="%F{$git_untracked_color}$SYMBOL"


# command to make sure the prompt reruns the functions on new prompt
function precmd {
  tmp=$(ruby --version | cut -d' ' -f 1-2)
  ruby_version=${tmp/p/-p}
  PROMPT="
%F{$dark}$ruby_version
%F{$cyan}╳ %F{$normal} $(itg_dir)$(itg_git)%F{$normal}$(itg_pair)%f"
  RPROMPT="%F{$fade}$(itg_host)"
}
