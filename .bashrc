source ~/.bash_colors
source ~/.git-prompt.sh

[ -s "/afs/ir/users/d/a/daeschli/.scm_breeze/scm_breeze.sh" ] && source "/afs/ir/users/d/a/daeschli/.scm_breeze/scm_breeze.sh"

export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad

PATH=$PATH:/usr/class/cs140/`uname -m`/bin
CS140_BUILD_DIR='~/Documents/CS140/cs140/src/filesys'

PS1="\[$Green\]\u:\[$Blue\]\[$Yellow\]\W\[\033[m\]\[$Purple\]\$(__git_ps1)\[$White\]\[$Color_Off\]\$ "
