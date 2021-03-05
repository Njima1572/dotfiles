" colorscheme ----------------------------
syntax enable
set background=light
colorscheme solarized


"dein Scripts-----------------------------

if &compatible
  set nocompatible               " Be iMproved
endif

call plug#begin('~/.vim/plugged')

Plug 'vim-airline/vim-airline'
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
Plug 'easymotion/vim-easymotion'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-fugitive'
Plug 'rhysd/vim-clang-format'
Plug 'sjl/gundo.vim',
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'dbeniamine/cheat.sh-vim'

Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'
Plug 'nvim-telescope/telescope.nvim'

Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }

Plug 'jiangmiao/auto-pairs'

call plug#end()


"End dein Scripts-------------------------

" Colemak remapping to use qwerty hjkl
noremap n j
noremap e k
noremap i l

noremap k n
noremap l i
noremap N J
noremap E K
noremap I L
noremap K N
noremap L I

" Colemak version of jj <Esc>
imap nnn <Esc>


nnoremap <S-n> jjj
nnoremap <S-e> kkk

vnoremap <S-n> jjj
vnoremap <S-e> kkk


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


nmap <C-h> :wincmd h<CR>
nmap <C-n> :wincmd j<CR>
nmap <C-e> :wincmd k<CR>
nmap <C-i> :wincmd l<CR>


" ~/.vimrc
noremap <Leader>. :tabe ~/.config/nvim/init.vim<CR>
noremap <Leader>t :tabe ~/.tmux.conf<CR>
noremap <Leader>i :tabe ~/.config/i3/config<CR>

"----- Buffers
set hidden
noremap <Leader>b :ls<CR>:b 
noremap <Leader>x :bd<CR>


noremap <Leader>o :e .<CR>
noremap <Leader>v :vs .<CR>
noremap <Leader>h :split .<CR>
noremap <Leader>= <C-w>=

"----- Telescope
"" Find files using Telescope command-line sugar.
" nnoremap <leader>ff <cmd>Telescope find_files<cr>
" nnoremap <leader>fg <cmd>Telescope live_grep<cr>
" nnoremap <leader>fb <cmd>Telescope buffers<cr>
" nnoremap <leader>fh <cmd>Telescope help_tags<cr>


"----- Easymotion
" <Leader>f{char} to move to {char}
map  <Leader>f <Plug>(easymotion-bd-f)
nmap <Leader>f <Plug>(easymotion-overwin-f)

" Move to word
map  <Leader>w <Plug>(easymotion-bd-w)
nmap <Leader>w <Plug>(easymotion-overwin-w)
