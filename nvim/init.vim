" -.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.
" File Name : init.vim
" Purpose :
" Creation Date : 2021-01-15
" Last Modified : 2022-01-11 12:24
" Created By : Njima1572
" ._._._._._._._._._._._._._._._._._._._._.

"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

source ~/.config/nvim/configs/plugins.vim
source ~/.config/nvim/configs/basics.vim
source ~/.config/nvim/configs/functions.vim
source ~/.config/nvim/configs/keybindings.vim
" defx
source ~/.config/nvim/configs/defx_bindings.vim

" From alacritty-colorcheme
if filereadable(expand("~/.vimrc_background"))
  source ~/.vimrc_background
endif
