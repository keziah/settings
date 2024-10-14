#!/usr/bin/env bash

# Configure git configs (scm_breeze, .gitconfig)
git clone https://github.com/scmbreeze/scm_breeze.git ~/.scm_breeze
~/.scm_breeze/install.sh

# configure tmux (sometimes?)
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# install nvim
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz
sudo rm -rf /opt/nvim
sudo tar -C /opt -xzf nvim-linux64.tar.gz

# Configure vim-plug for nvim
sh -c 'curl -fLo \
  "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim \
  --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
echo | vim +PlugInstall +qall 2&> /dev/null

# install z
mkdir ~/.logs
