#!/bin/bash

install_neovim() { #{{{
  echo "Checking if neovim is already installed..."
  if [ -x "$(command -v nvim)" ]; then
      echo "neovim is already installed"
      return
  fi
  OS=$(uname -s)
  if [ $OS == "Linux" ]; then
      curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz
      sudo rm -rf /opt/nvim
      sudo tar -C /opt -xzf nvim-linux64.tar.gz
      echo "Add the following line to your .bashrc or .zshrc file:"
      echo ""
      echo '`export PATH=$PATH:/opt/nvim-linux64/bin`'
      echo ""
      echo "You may need to install python3-neovim package for python support"
  elif [ $OS == "Darwin" ]; then
      # Check the architecture of the machine
      arch=$(uname -m)
      echo "Downloading neovim for $arch"
      sudo rm -rf /usr/local/nvim-macos-$arch
      curl -LO https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-$arch.tar.gz
      sudo tar xzf nvim-macos-$arch.tar.gz -C /usr/local

      echo "Add the following line to your .bashrc or .zshrc file:"
      echo 
      echo "`export PATH=\$PATH:/usr/local/nvim-macos-$arch/bin`"
      echo
  else
      echo "Unsupported OS - $OS"
      exit 1
  fi
}
#}}}

setup_neovim() { # {{{
  ## Setup nvim soft link
  # If there is existing file, check user if they want to move it to .bk
  if [ -d ~/.config/nvim ]; then
      echo "nvim directory already exists"
      read -p "Do you want to move it to ~/.config/nvim.bk? [y/n] " -n 1 -r
      echo
      if [[ $REPLY =~ ^[Yy]$ ]]; then
          mv ~/.config/nvim ~/.config/nvim.bk
      else
          echo "Please remove ~/.config/nvim first"
          exit 1
      fi
  fi
  ln -s ~/.dotfiles/nvim ~/.config/nvim
}
# }}}

setup_gitconfig() { # {{{
  ## Setup .gitconfig hard link
  if [ -f ~/.gitconfig ]; then
      echo ".gitconfig already exists"
      read -p "Do you want to move it to ~/.gitconfig.bk? [y/n] " -n 1 -r
      echo
      if [[ $REPLY =~ ^[Yy]$ ]]; then
          mv ~/.gitconfig ~/.gitconfig.bk
      else
          echo "Please remove ~/.gitconfig first"
          exit 1
      fi
  fi
  ln ~/.dotfiles/gitconfig ~/.gitconfig
}
#}}}


# Ask user if they want to install neovim dotfiles

echo "This script will setup dotfiles for neovim"
read -p "Do you want to setup neovim dotfiles? [y/n] " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
    echo
    echo "Setting up neovim dotfiles"
    install_neovim
    setup_neovim
else
    echo
    echo "Exiting"
    exit 1
fi


## Setup .config/fish soft link
