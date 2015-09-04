source ~/.bash_colors
source ~/.git-prompt.sh

export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad

PATH=$PATH:/usr/class/cs140/`uname -m`/bin
CS140_BUILD_DIR='~/Documents/CS140/cs140/src/filesys'

PS1="\[$Green\]\u:\[$Blue\]\[$Yellow\]\W\[\033[m\]\[$Purple\]\$(__git_ps1)\[$White\]\[$Color_Off\]\$ "

# https://github.com/ndbroadbent/scm_breeze
# first time, run: ~/.scm_breeze/install.sh
[ -s "~/.scm_breeze/scm_breeze.sh" ] && source "~/.scm_breeze/scm_breeze.sh"

# TODO on each individual computer
# https://github.com/bobthecow/git-flow-completion/wiki/Install-Bash-git-completion
if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
fi


