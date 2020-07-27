THIS_DIR=$PWD
sudo apt install tmux
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

mkdir -p $THIS_DIR/vim/undo
cd ~/
ln -s $THIS_DIR/.vimrc .
ln -s $THIS_DIR/.tmux.conf .
ln -s $THIS_DIR/.vim .
