#!/usr/bin/env bash

is_installed() {
  if [[ -z $(which $1) ]]; then
    return 1
  else
    return 0
  fi
}

if [[ is_installed "brew" ]]; then
  echo "Brew is already installed"
else
  echo "Installing brew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

if [[ is_installed "scmpuff" ]]; then
  echo "scmpuff is already installed"
else
  brew install scmpuff
fi

if [[ is_installed "nvim" ]]; then
  echo "nvim is already installed"
else
  brew install neovim
fi

brew install z

# Install tmux
if [[ is_installed "tmux" ]]; then
  echo "tmux is already installed"
else
  brew install tmux
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi

# Install vim-plug
sh -c 'curl -fLo \
  "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim \
  --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
echo | nvim +PlugInstall +qall 2&> /dev/null

