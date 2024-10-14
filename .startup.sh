#!/usr/bin/env bash

set -u -x

# Install go binaries for vim
echo | nvim +GoInstallBinaries +qall 2&> /dev/null
echo | nvim +PlugInstall +qall 2&> /dev/null

# install coc

go install golang.org/x/tools/gopls@latest

# create .logs dir if it doesn't exist

# Install gvm
#
# Install pyenv

# Configure git configs (scm_breeze, .gitconfig)
git clone https://github.com/scmbreeze/scm_breeze.git ~/.scm_breeze
~/.scm_breeze/install.sh
