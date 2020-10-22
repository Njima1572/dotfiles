THIS_DIR=$PWD

if ! command -v tmux &> /dev/null
then
  echo "tmux not found" 
  sudo apt install tmux
fi

if ! command -v fish & > /dev/null
then
  echo "Fish not found"
  sudo apt install fish
fi

git clone https://github.com/VundleVim/Vundle.vim.git $THIS_DIR/.vim/bundle/Vundle.vim
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

mkdir -p $THIS_DIR/.vim/undo
mkdir -p $THIS_DIR/.vim/session


cd ~/
ln -s $THIS_DIR/.vim .
ln -s $THIS_DIR/.vimrc .
ln -s $THIS_DIR/.tmux.conf .
ln -s $THIS_DIR/.gitconfig
