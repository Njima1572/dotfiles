" -.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.
" File Name : init.vim
" Purpose :
" Creation Date : 2021-01-15
" Last Modified : 2022-01-11 12:24
" Created By : Njima1572
" ._._._._._._._._._._._._._._._._._._._._.

if &compatible
  set nocompatible               " Be iMproved
endif

source ~/.config/nvim/configs/functions.vim
call g:Initialization()

source ~/.config/nvim/configs/paths.vim
source ~/.config/nvim/configs/plugins.vim
source ~/.config/nvim/configs/basics.vim
source ~/.config/nvim/configs/keybindings.vim

" Extras
source ~/.config/nvim/configs/defx_bindings.vim
"source ~/.config/nvim/configs/coc.vim
source ~/.config/nvim/configs/lsps.vim

source ~/.config/nvim/configs/languages.vim

" From alacritty-colorcheme
if filereadable(expand("~/.vimrc_background"))
  source ~/.vimrc_background
else
  set background=light
endif

