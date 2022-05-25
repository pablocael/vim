eval "$(/opt/homebrew/bin/brew shellenv)"
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

alias k=kubectl
alias g=git
alias kx=kubectx
alias vim=nvim
alias ls="ls -aG"

# Eternal bash history.
# ---------------------
# Undocumented feature which sets the size to "unlimited".
# https://stackoverflow.com/questions/9457233/unlimited-bash-history
export HISTFILESIZE=
export HISTSIZE=
export HISTTIMEFORMAT="[%F %T] "
# Change the file location because certain bash sessions truncate .bash_history file upon close.
# http://superuser.com/questions/575479/bash-history-truncated-to-500-lines-on-each-login
export HISTFILE=~/.bash_eternal_history
# Force prompt to write history after every command.
# http://superuser.com/questions/20900/bash-history-loss
PROMPT_COMMAND="history -a; $PROMPT_COMMAND"

# set vim mode
set -o vi
set editing-mode vi
export EDITOR=nvim
export VISUAL="$EDITOR"

powerline-daemon -q
POWERLINE_BASH_CONTINUATION=1
POWERLINE_BASH_SELECT=1
. $HOME/Library/Python/3.8/lib/python/site-packages/powerline/bindings/bash/powerline.sh

PATH=$PATH:$HOME/development/scripts/
export PATH="/opt/homebrew/opt/python@3.8/bin:$PATH"
export WORKON_HOME=$HOME/.virtualenvs
export VIRTUALENVWRAPPER_PYTHON=$(which python3)
export VIRTUALENVWRAPPER_VIRTUALENV=$(which virtualenv)
source /opt/homebrew/bin/virtualenvwrapper.sh

