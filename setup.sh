THIS_DIR=$PWD

# ===== Setup Git {{{
if [ -f ".gitconfig" ]; then
  echo "Found existing .gitconfig, moving to .gitconfig.bk"
  mv .gitconfig .gitconfig.bk
fi
ln $THIS_DIR/.gitconfig

# }}}
# ===== Setup fish {{{

if [! -f "$THIS_DIR/fish/local_config.fish"]; then
  echo "Did not find fish/local_config.fish. Creating one..."
  touch $THIS_DIR/fish/local_config.fish
fi

if ! command -v fish &> /dev/null
then
  echo "Fish not found"
  # sudo apt install fish
fi

if [ -d ".config/fish" ]; then
  echo "Found existing .config/fish, moving to .config/fish.bk"
  mv .config/fish .config/fish.bk
fi
ln -s $THIS_DIR/fish .config/fish
# }}}
# ===== Setup nvim  {{{
git clone https://github.com/junegunn/vim-plug.git $THIS_DIR/nvim/plugged

mkdir -p $THIS_DIR/nvim/undo
mkdir -p $THIS_DIR/nvim/session

if [ -d ".config/nvim/" ]; then
  echo "Found existing .config/nvim, moving to .config/nvim.bk"
  mv .config/nvim .config/nvim.bk
fi
ln -s $THIS_DIR/nvim .config/nvim

# }}}
# ===== Setup Alacritty {{{

# }}}
# ===== Setup bin  {{{

# }}}

