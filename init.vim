" Colemak remapping to use qwerty hjkl
noremap n j
noremap k n
noremap e k
noremap i l
noremap l i
noremap N J
noremap E K
noremap I L
noremap L I
noremap K N


" Colemak version of jj <Esc>
imap nnn <Esc>


nmap <S-n> jjj
nmap <S-e> kkk

vmap <S-n> jjj
vmap <S-e> kkk


" From original vimrc
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
