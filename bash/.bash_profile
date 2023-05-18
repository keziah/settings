source ~/.bash_colors
source ~/.git-prompt.sh

alias ls="ls -l"
alias gcm="git commit -m"

# Enable git shortcuts via scmpuff
eval "$(scmpuff init -s)"

# Record all bash history
export PROMPT_COMMAND='if [ "$(id -u)" -ne 0 ]; then echo "$(date "+%Y-%m-%d.%H:%M:%S") $(pwd) $(history 1)" >> ~/.logs/bash-history-$(date "+%Y-%m-%d").log; fi'

searchlogs_old () {
  searchterm=$@
  if [ -z $searchterm ]; then
    echo "Usage: [N=int] searchlogs [searchterm]"
    echo "Example: N=15 searchlogs aws sts"
    return
  fi
  NUM_LINES=${N:-'10'}
  grep -hrv 'logsearch' ~/.logs | ag -i "$searchterm" | sort | tail -n $NUM_LINES
}

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

# Format prompt
export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad
PS1="\[$Green\]\u:\[$Blue\]\[$Yellow\]\W\[\033[m\]\[$Purple\]\$(__git_ps1)\[$White\]\[$Color_Off\]\$ "

# Installations
. /opt/homebrew/etc/profile.d/z.sh
export PATH="/usr/local/bin:$PATH"

# Set brew as main path only if installed
which brew > /dev/null
if [ $? -eq 0 ]; then
  export PATH="/opt/homebrew/bin:$PATH"
fi


