#!/bin/bash

which scmpuff > /dev/null
if [ $? -neq 0 ]; then
  brew install scmpuff
fi

cp "bash/."* ~
cp ".vimrc" ~ 
cp ".tmux.conf" ~
cp "tmux/.tmux"* ~/.tmux

source ~/.bash_profile
