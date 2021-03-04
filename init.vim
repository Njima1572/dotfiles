"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=/home/kochi/.cache/dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('/home/kochi/.cache/dein')
  call dein#begin('/home/kochi/.cache/dein')

  " Let dein manage dein
  " Required:
  call dein#add('/home/kochi/.cache/dein/repos/github.com/Shougo/dein.vim')

  " Add or remove your plugins here like this:
  "call dein#add('Shougo/neosnippet.vim')
  "call dein#add('Shougo/neosnippet-snippets')

  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
"if dein#check_install()
"  call dein#install()
"endif

"End dein Scripts-------------------------

" Colemak remapping to use qwerty hjkl
noremap n j
noremap e k
noremap i l
noremap N J
noremap E K
noremap I L


" Colemak version of jj <Esc>
imap nnn <Esc>


nmap <S-n> jjj
nmap <S-e> kkk

vmap <S-n> jjj
vmap <S-e> kkk


" From original vimrc
"
let mapleader = " "

noremap <F5> :source ~/.config/nvim/init.vim<CR>:noh<CR>

set title
set number
set autoindent
set smartindent
set virtualedit=onemore
set scrolloff=999
set laststatus=2
set cursorline
set cursorcolumn
set showcmd

set foldmethod=marker

set hlsearch
set wrapscan
noremap <Esc><Esc> :nohl<CR>

syntax on

"----- Tab stuff
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set list listchars=tab:\-\-


noremap <Leader><Leader> :w<CR>
noremap <Leader><Leader><Leader> :wq<CR>


"---- Vim file explorer
"delete the header for the explorer
let g:netrw_banner=0
let g:netrw_liststyle = 3


"----- Disable arrow keys
inoremap <Left> <Nop>
inoremap <Up> <Nop>
inoremap <Down> <Nop>
inoremap <Right> <Nop>
