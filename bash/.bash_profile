# set -o vi

source ~/.bash_colors
source ~/.git-prompt.sh
source ~/.bash_vars
source ~/.bash_work

export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad
PS1="\[$Green\]\u:\[$Blue\]\[$Yellow\]\W\[\033[m\]\[$Purple\]\$(__git_ps1)\[$White\]\[$Color_Off\]\$ "

alias stash="git stash save"
alias ls="ls -l"
alias gcm="git commit -m"
alias filter="stdbuf -i0 -o0 sed -E -u 's/^.*(INFO|WARNING) - //'"
alias reset_to_origin="git reset --hard origin/master"
alias untar="tar -xvkf"

eval "$(scmpuff init -s)"
export PATH="$HOME/.rbenv/shims:$PATH"
export PATH="/usr/local/bin:$PATH"
export PATH="~/go/bin:$PATH"
export CLEAN=true
export LOCAL=true

export PROMPT_COMMAND='if [ "$(id -u)" -ne 0 ]; then echo "$(date "+%Y-%m-%d.%H:%M:%S") $(pwd) $(history 1)" >> ~/.logs/bash-history-$(date "+%Y-%m-%d").log; fi'

searchlogs () {
  searchterm=$@
  if [ -z $searchterm ]; then
    echo "Look for previous bash commands run on this machine."
    echo "Ignores searchlogs commands."
    echo "Usage: [NUM_LINES=int] [CLEAN=true] searchlogs [searchterm]"
    echo "Example: NUM_LINES=15 searchlogs aws sts"
    echo "Variables: "
    echo "    NUM_LINES: how many lines to display"
    echo "    CLEAN: Filter out path and time prefix"
    return
  fi
  NUM_LINES=${NUM_LINES:-'10'}
  RES=$( grep -hrv 'logsearch' ~/.logs | ag -i "$searchterm" | grep -v searchlogs | sort | tail -n $NUM_LINES )
  LAST_COMMAND=$( grep -hrv 'logsearch' ~/.logs | ag -i "$searchterm" | grep -v searchlogs | sort | tail -1 )
  if [ $CLEAN == "false" ]; then
    echo "$RES"
  else
    echo "$RES" | sed -u 's/^.*  [ 0-9]\{3,\}  [ 0-9]\{10,\}//'
    echo "$LAST_COMMAND" | sed -u 's/^.*  [ 0-9]\{3,\}  [ 0-9]\{10,\}//' | pbcopy
  fi
}

export ENV=staging
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"

eval "$(pyenv init --path)"
export PATH="/usr/local/opt/openssl@1.1/bin:$PATH"

alias tsync="{ time afdev sync; } 2>> time_sync"

. /opt/homebrew/etc/profile.d/z.sh

export PATH="/usr/local/opt/binutils/bin:$PATH"
eval "$(/opt/homebrew/bin/brew shellenv)"

alias gs='scmpuff_status'
# eval "$(pyenv virtualenv-init -)"

# export LDFLAGS="-L/opt/homebrew/opt/openssl@3/lib"
export LDFLAGS="-L$(brew --prefix openssl@1.1)/lib"
# export CPPFLAGS="-I/opt/homebrew/opt/openssl@3/include"
export CFLAGS="-I$(brew --prefix openssl@1.1)/include"
# export PATH="/opt/homebrew/opt/openssl@3/bin:$PATH"
alias ctags='/opt/homebrew/bin/ctags'

export GOPATH=$HOME/go
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin

# HSTR configuration - add this to ~/.bashrc
alias hh=hstr                    # hh to be alias for hstr
export HSTR_CONFIG=hicolor       # get more colors
shopt -s histappend              # append new history items to .bash_history
export HISTCONTROL=ignorespace   # leading space hides commands from history
export HISTFILESIZE=10000        # increase history file size (default is 500)
export HISTSIZE=${HISTFILESIZE}  # increase history size (default is 500)
# ensure synchronization between bash memory and history file
export PROMPT_COMMAND="history -a; history -n; ${PROMPT_COMMAND}"
# if this is interactive shell, then bind hstr to Ctrl-r (for Vi mode check doc)
if [[ $- =~ .*i.* ]]; then bind '"\C-r": "\C-a hstr -- \C-j"'; fi
# if this is interactive shell, then bind 'kill last command' to Ctrl-x k
if [[ $- =~ .*i.* ]]; then bind '"\C-xk": "\C-a hstr -k \C-j"'; fi

export JAVA_HOME=$(/usr/libexec/java_home -v 1.8)
export PATH=$JAVA_HOME/bin:$PATH
