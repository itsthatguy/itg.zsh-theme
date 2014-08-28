# PATH
export MYSCRIPTS="$HOME/.scripts"
export MYBIN="$HOME/bin"
export BIN="/usr/local/bin"
export SBIN="/usr/local/sbin"
export NPM="/usr/local/bin/npm"
export PGPATH="/Applications/Postgres.app/Contents/Versions/9.3/bin"
export HEROKU="/usr/local/heroku/bin"
export PATH=$HEROKU:$NPM:$PGPATH:$MYSCRIPTS:$MYBIN:$BIN:$SBIN:/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin

# Various Environment Variables
export PGHOST=localhost
export EDITOR="subl -w"
export TERM=xterm-256color

# chruby's autoload is bad, and it should feel bad
if [[ -e /usr/local/share/chruby ]]; then
  source /usr/local/share/chruby/chruby.sh
  source /usr/local/share/chruby/auto.sh
  chruby $(cat ~/.ruby-version)
fi

source ~/.zshrc
