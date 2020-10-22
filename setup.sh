THIS_DIR=$PWD

if ! command -v tmux &> /dev/null
then
  echo "tmux not found" 
  sudo apt install tmux
fi

if ! command -v fish &> /dev/null
then
  echo "Fish not found"
  sudo apt install fish
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
ln -s $THIS_DIR/.vimrc .


if [ -f ".tmux.conf" ]; then
  echo "Found existing .tmux.conf, moving to .tmux.conf.bk"
  mv .tmux.conf .tmux.conf.bk
fi
ln -s $THIS_DIR/.tmux.conf .

if [ -f ".gitconfig" ]; then
  echo "Found existing .gitconfig, moving to .gitconfig.bk"
  mv .gitconfig .gitconfig.bk
fi
ln -s $THIS_DIR/.gitconfig


if [ -f ".config/fish/config.fish" ]; then
  echo "Found existing config.fish, moving to config.fish.bk"
  mv .config/fish/config.fish .config/fish/config.fish.bk
fi
ln -s $THIS_DIR/config.fish .config/fish/config.fish

if [ -f ".config/fish/.aliases.fish" ]; then
  echo "Found existing .aliases.fish, moving to .aliases.fish.bk"
  mv .config/fish/.aliases.fish .config/fish/.aliases.fish.bk
fi
ln -s $THIS_DIR/.aliases.fish .config/fish/.aliases.fish
