#!/bin/bash

NVIM_RELPATH=".config/nvim"

vercomp () {
    if [[ $1 == $2 ]]
    then
        return 0
    fi
    local IFS=.
    local i ver1=($1) ver2=($2)
    # fill empty fields in ver1 with zeros
    for ((i=${#ver1[@]}; i<${#ver2[@]}; i++))
    do
        ver1[i]=0
    done
    for ((i=0; i<${#ver1[@]}; i++))
    do
        if ((10#${ver1[i]:=0} > 10#${ver2[i]:=0}))
        then
            return 1
        fi
        if ((10#${ver1[i]} < 10#${ver2[i]}))
        then
            return 2
        fi
    done
    return 0
}

install_neovim() { #{{{
  echo "Checking if neovim is already installed..."
  if [ -x "$(command -v nvim)" ]; then
      echo "neovim is already installed"

      # Check if the version is greater than 0.8
      version=$(nvim --version | head -n 1 | cut -d ' ' -f 2)
      echo "neovim version: $version"

      vercomp $version "0.8"

      if [ $? -eq '<' ]
      then 
        echo "neovim version is less than 0.8"
        read -p "Do you want to install latest neovim? [y/n] " -n 1
        if [[ $REPLY =~ ^[Yy]$ ]]; then
            echo "Installing latest neovim"
        else
            echo "Please install neovim version 0.8 or greater"
            exit 1
        fi
      fi
  fi

  OS=$(uname -s)
  if [ $OS == "Linux" ]; then
      mkdir -p .tmp
      curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz -o ./.tmp/nvim-linux64.tar.gz
      sudo rm -rf /opt/nvim
      sudo tar -C /opt -xzf nvim-linux64.tar.gz
      rm -rf .tmp
      echo "Add the following line to your .bashrc or .zshrc file:"
      echo ""
      echo '`export PATH=$PATH:/opt/nvim-linux64/bin`'
      echo ""
      echo "You may need to install python3-neovim package for python support"
  elif [ $OS == "Darwin" ]; then
      # Check the architecture of the machine
      ARCH=$(uname -m)
      basename=nvim-macos-$ARCH
      echo "Downloading neovim for $ARCH"
      sudo rm -rf /usr/local/$basename
      curl -LO https://github.com/neovim/neovim/releases/download/nightly/$basename.tar.gz
      sudo tar xzf $basename.tar.gz -C /usr/local

      echo "Add the following line to your .bashrc or .zshrc file:"
      echo 
      echo "export PATH=\$PATH:/usr/local/$basename/bin"
      echo
  else
      echo "Unsupported OS - $OS"
      exit 1
  fi
}
#}}}
#
build_fish_linux() {
  fish_version="3.7.1"
  mkdir -p .tmp
  curl -Lo .tmp/fish.tar.gz https://github.com/fish-shell/fish-shell/releases/download/$fish_version/fish-$fish_version.tar.xz
  tar xzf .tmp/fish.tar.xz -C .tmp
  cd .tmp/fish-$fish_version
  cmake .
  make
  sudo make install
}

install_fish() {
  echo "Checking if fish shell is already installed..."
  if [ -x "$(command -v fish)" ]; then
      echo "fish shell is already installed"
  else
      echo "Installing fish shell"
      OS=$(uname -s)
      if [ $OS == "Linux" ]; then
          build_fish_linux
      elif [ $OS == "Darwin" ]; then
          brew install fish
      else
          echo "Unsupported OS - $OS"
          exit 1
      fi
  fi
}

setup_symlink() { # {{{
  name=$1
  source=$2
  target=$3

  if [ -L $target ]; then
      if [ "$(readlink $target)" == "$source" ]; then
          echo "$name symbolic link already exists"
          return
      else
          echo "$name symbolic link exists but pointing to wrong directory"
          read -p "Do you want to remove it? [y/n] " -n 1
          echo
          if [[ $REPLY =~ ^[Yy]$ ]]; then
              rm $target
          else
              echo "Please remove $target first"
              exit 1
          fi
      fi
    elif [ -d $target ]; then
      echo "$name directory already exists"
      read -p "Do you want to move it to $target.bk? [y/n] " -n 1
      echo
      if [[ $REPLY =~ ^[Yy]$ ]]; then
          mv $target $target.bk
      else
          echo "Please remove $target first"
          exit 1
      fi
  fi
  ln -s $source $target
}

setup_neovim() {
  setup_symlink "nvim" $PWD/$NVIM_RELPATH $HOME/$NVIM_RELPATH
}

setup_fish() {
  setup_symlink "fish" $PWD/.config/fish $HOME/.config/fish
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

# Check if the user has arguments of [nvim, fish]
if [ $# -eq 0 ]; then
    echo "Usage: setup.sh [nvim, fish]"
fi

if [ $1 == "nvim" ]; then
    install_neovim
    read -p "Do you want to setup neovim dotfiles? [y/n] "
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        echo "Setting up neovim dotfiles"
        setup_neovim
    fi
elif [ $1 == "fish" ]; then
    read -p "Do you want to setup fish shell? [y/n] "
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        echo "Setting up fish shell"
        install_fish
        setup_fish
    fi
else
    echo "Invalid argument"
    exit 1
fi
