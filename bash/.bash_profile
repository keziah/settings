source ~/.bash_colors
source ~/.git-prompt.sh

alias ls="ls -l"
alias gcm="git commit -m"

# Enable git shortcuts via scmpuff
eval "$(scmpuff init -s)"

# Record all bash history
export PROMPT_COMMAND='if [ "$(id -u)" -ne 0 ]; then echo "$(date "+%Y-%m-%d.%H:%M:%S") $(pwd) $(history 1)" >> ~/.logs/bash-history-$(date "+%Y-%m-%d").log; fi'

export CLEAN=true
searchlogs () {
  searchterm=$@
  if [ -z $searchterm ]; then
    echo "Usage: [N=int] [CLEAN=true] searchlogs [searchterm]"
    echo "Example: N=15 searchlogs aws sts"
    echo "Variables: "
    echo "    N: how many lines to display"
    echo "    CLEAN: Filter out path and time prefix"
    return
  fi
  N=${N:-'10'}
  RES=$( grep -hrv 'logsearch' ~/.logs | ag -i "$searchterm" | sort | tail -n $NUM_LINES )
  if [ $CLEAN == "true" ]; then
    echo "$RES" | sed -u 's/^.*  [ 0-9]\{3,\}  //'
  else
    echo "$RES"
  fi
}

# Format prompt
export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad
PS1="\[$Green\]\u:\[$Blue\]\[$Yellow\]\W\[\033[m\]\[$Purple\]\$(__git_ps1)\[$White\]\[$Color_Off\]\$ "
