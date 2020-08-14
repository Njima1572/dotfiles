THIS_DIR=$PWD
sudo apt install tmux
ln -s $THIS_DIR/.vim .
git clone https://github.com/VundleVim/Vundle.vim.git $THIS_DIR/.vim/bundle/Vundle.vim
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

mkdir -p $THIS_DIR/.vim/undo
mkdir -p $THIS_DIR/.vim/session
cd ~/
ln -s $THIS_DIR/.vimrc .
ln -s $THIS_DIR/.tmux.conf .
