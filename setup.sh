THIS_DIR=$PWD

if [! -f "$THIS_DIR/fish/local_config.fish"]; then
  echo "Did not find fish/local_config.fish. Creating one..."
  touch $THIS_DIR/fish/local_config.fish
fi

if ! command -v tmux &> /dev/null
then
  echo "tmux not found" 
  # sudo apt install tmux
fi

if ! command -v cargo &> /dev/null
then
  echo "Rust not found installing Rust..." 
  curl https://sh.rustup.rs -sSf | sh
fi

if ! command -v alacritty &> /dev/null
then
  echo "Rust not found installing Rust..." 
  cargo install alacritty
fi

if ! command -v fish &> /dev/null
then
  echo "Fish not found"
  # sudo apt install tmux
fi


git clone https://github.com/VundleVim/Vundle.vim.git $THIS_DIR/.vim/bundle/Vundle.vim
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

mkdir -p $THIS_DIR/.vim/undo
mkdir -p $THIS_DIR/.vim/session




cd ~/
if [ -d ".vim" ]; then
  mv .vim .vim.bk
fi
ln -s $THIS_DIR/.vim .

if [ -f ".vimrc" ]; then
  echo "Found existing .vimrc, moving to .vimrc.bk"
  mv .vimrc .vimrc.bk
fi
ln $THIS_DIR/.vimrc .

if [ -f ".alacritty.yml" ]; then
  echo "Found existing .alacritty.yml, moving to .vimrc.bk"
  mv .alacritty.yml .alacritty.yml.bk
fi
ln $THIS_DIR/.alacritty.yml .


if [ -f ".tmux.conf" ]; then
  echo "Found existing .tmux.conf, moving to .tmux.conf.bk"
  mv .tmux.conf .tmux.conf.bk
fi
ln  $THIS_DIR/.tmux.conf .

if [ -f ".gitconfig" ]; then
  echo "Found existing .gitconfig, moving to .gitconfig.bk"
  mv .gitconfig .gitconfig.bk
fi
ln $THIS_DIR/.gitconfig

if [ -f ".ripgreprc" ]; then
  echo "Found existing .ripgreprc, moving to .ripgreprc.bk"
  mv .ripgreprc .ripgreprc.bk
fi
ln $THIS_DIR/.ripgreprc


if [ -d ".config/fish" ]; then
  echo "Found existing .config/fish, moving to .config/fish.bk"
  mv .config/fish .config/fish.bk
fi
ln -s $THIS_DIR/fish .config/fish

if [ -d ".config/nvim/" ]; then
  echo "Found existing .config/nvim, moving to .config/nvim.bk"
  mv .config/nvim .config/nvim.bk
fi
ln -s $THIS_DIR/nvim .config/nvim
