#!/bin/bash

which brew > /dev/null
if [ $? -neq 0 ]; then
  echo "Please install brew and put it in your path before running this script."
  exit
fi

brew install cmake python go nodejs
brew install pyenv
brew install scmpuff
brew install reattach-to-user-namespace
brew install z
brew install telnet
brew install tmux
brew install vim
brew install ag

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# cp "bash/."* ~
# cp ".vimrc" ~
# cp "tmux/.tmux" ~/.tmux
# cp "tmux/.tmux.conf" ~/.tmux.conf

vim +PluginInstall +qall
source ~/.bash_profile

# Install nerdfonts to get tmux working correctly
# Install Nord color profile on iterm
