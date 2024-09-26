#!/bin/bash

NVIM_RELPATH=".config/nvim"

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
  # Check if the symbolic link exists and is pointing to the correct directory
  if [ -L ~/$NVIM_RELPATH ]; then
      if [ "$(readlink ~/$NVIM_RELPATH)" == "$PWD/$NVIM_RELPATH" ]; then
          echo "nvim symbolic link already exists"
          return
      else
          echo "nvim symbolic link exists but pointing to wrong directory"
          read -p "Do you want to remove it? [y/n] " -n 1
          echo
          if [[ $REPLY =~ ^[Yy]$ ]]; then
              rm ~/$NVIM_RELPATH
          else
              echo "Please remove ~/$NVIM_RELPATH first"
              exit 1
          fi
      fi
  fi
  # If there is existing file, check user if they want to move it to .bk
  if [ -d ~/$NVIM_RELPATH ]; then
      echo "nvim directory already exists"
      read -p "Do you want to move it to ~/$NVIM_RELPATH.bk? [y/n] " -n 1
      echo
      if [[ $REPLY =~ ^[Yy]$ ]]; then
          mv ~/$NVIM_RELPATH ~/$NVIM_RELPATH.bk
      else
          echo "Please remove ~/$NVIM_RELPATH first"
          exit 1
      fi
  # If symbolic link exists
  elif [ -L ~/$NVIM_RELPATH ]; then
      echo "nvim symbolic link already exists"
      read -p "Do you want to remove it? [y/n] " -n 1
      echo
      if [[ $REPLY =~ ^[Yy]$ ]]; then
          rm ~/$NVIM_RELPATH
      else
          echo "Please remove ~/$NVIM_RELPATH first"
          exit 1
      fi
  fi
  ln -s $PWD/$NVIM_RELPATH ~/$NVIM_RELPATH
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
read -p "Do you want to setup neovim dotfiles? [y/n] "
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
