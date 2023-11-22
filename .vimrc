"-------------------------------
"- Author:        Njima1572
"- Created:       06/19/2020
"- Last Updated:  09/10/2020
"-------------------------------
"
"Cheat sheet: https://devhints.io/vimscript
"
" Quickguide for folding
" `[visual]zf to fold the visual selected place
" `zd` to delete the fold
" `zo` to open the fold
" `zc` to close the fold that was opened

"----- Plugin
set nocompatible
filetype off
" set rtp+=~/.vim/bundle/Vundle.vim
" call vundle#begin()

let mapleader = " "

"----- Refresh vimrc with <F5>
noremap <silent> <F5> :source ~/.vimrc<CR>:noh<CR>:echo "Refreshed config!"<CR>

"----- Some basic vim stuff
set title
set number
set autoindent
set smartindent
set virtualedit=onemore
set scrolloff=20
set laststatus=2
set cursorline
set cursorcolumn
set clipboard=unnamedplus
set guioptions-=T
set guioptions-=m
set guioptions-=r
set incsearch

set showcmd

set foldmethod=marker

set hlsearch
set wrapscan
set foldmethod=marker

noremap n j
noremap e k
noremap n gj
noremap e gk
noremap i l

noremap k n
noremap l i
noremap I L
noremap N J
noremap E K
noremap K N
noremap L I

noremap <Esc><Esc> :nohl<CR>

syntax on

"----- Tab stuff
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set list listchars=tab:\-\-

"---- Vim file explorer
"delete the header for the explorer
let g:netrw_banner=0
let g:netrw_liststyle = 3

"----- Undo
if has('persistent_undo')
  set undodir=~/.vim/undo
  set undofile
endif

"----- Setting <Space> as a leader key

"----- Disable arrow keys
inoremap <Left> <Nop>
inoremap <Up> <Nop>
inoremap <Down> <Nop>
inoremap <Right> <Nop>

inoremap <S-Tab> <C-Q><Tab>

"----- Find
noremap F K

"----- Remap HJKL
noremap <S-h> ^
noremap <S-l> $
""---- Scroll Faster
nnoremap <S-n> }
nnoremap <S-e> {

vnoremap <S-n> }
vnoremap <S-e> {

"----- Normal mode shortcut
imap xx <Esc>

"----- Save and quit
noremap <Leader><Leader> :mkview<CR>:w<CR>
noremap <Leader><Leader><Leader> :wq<CR>

"----- Shortcut for config files
noremap <Leader>. :tabe ~/.vimrc<CR>
noremap <Leader>t :tabe ~/.tmux.conf<CR>
noremap <Leader>i :tabe ~/.config/i3/config<CR>

"----- Keymapping for tabs
nmap <C-t> :tabe <C-d>
nmap <C-s> :vsplit <C-d>
nmap <F7> :tabp<CR>
nmap <F8> :tabn<CR>
"----- Scorll Faster

map <C-z> <Nop>

" ------ Move between panes with Ctrl + hjkl *Note map Alt + hjkl for tmux and
"  win + hjkl for i3
nmap <C-h> :wincmd h<CR>
nmap <C-n> :wincmd j<CR>
nmap <C-e> :wincmd k<CR>
nmap <C-i> :wincmd l<CR>

"----- gj gk mapping
noremap j gj
noremap k gk

"----- Line Start and line end 
nmap <Leader>l $

"----- Window Split open with tree
nmap <Leader> h :split .<CR>
nmap <Leader> v :vsplit .<CR>

nmap <Leader>= <C-w>=

"----- Replace Undo and redo with g+-
noremap u g-
noremap <C-r> g+ 

"----- Bracket Completion
inoremap ( ()<Left>
inoremap [ []<Left>
inoremap () ()
inoremap [] []
inoremap {<CR> {<CR>}<Esc>O
inoremap [<CR> [<CR>]<Esc>O
inoremap (<CR> (<CR>)<Esc>O

"----- Call command line commands
vnoremap <Leader><CR> :!sh<CR>
nnoremap <Leader><CR> V:!sh<CR>

"----- Colors
hi Search ctermbg=LightMagenta
hi ErrorMsg guibg=Blue

"----- Airline Theme
let g:ariline_solarized_bg='dark'

noremap <Leader>o :e .<CR>
noremap <Leader>v :vs .<CR>
noremap <Leader>h :split .<CR>
noremap <Leader>= <C-w>=


" hi Ignore ctermfg=60
hi Ignore ctermfg=15 guifg=bg
hi Title term=bold ctermfg=5 gui=bold guifg=Magenta
hi SpecialKey guifg=Gray
hi CursorLine cterm=None term=reverse ctermbg=250
"hi Special ctermbg=1"
hi Normal ctermfg=52 guifg=black guibg=NONE ctermbg=NONE
hi Constant ctermfg=Magenta
hi Identifier ctermfg=1
hi Cursor ctermbg=54
hi PreProc ctermfg=17 CTErm=BOLD
hi String ctermfg=22
hi Repeat ctermfg=211 cterm=BOLD
hi SpecialKey ctermfg=0
hi Identifier ctermfg=0
" hi Comment ctermfg=60 guifg=NONE ctermbg=NONE guibg=NONE
hi Comment term=bold ctermfg=4 guifg=Blue
hi pythonComment ctermfg=236 guibg=NONE
hi vimGlobal ctermfg=255
