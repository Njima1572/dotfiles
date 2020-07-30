THIS_DIR=$PWD
sudo apt install tmux
ln -s $THIS_DIR/.vim .
ln -s $THIS_DIR/.tmux.conf .
ln -s $THIS_DIR/.vimrc .
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

mkdir -p $THIS_DIR/vim/undo
mkdir -p $THIS_DIR/vim/session
cd ~/
