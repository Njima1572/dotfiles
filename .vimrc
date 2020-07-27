"-------------------------------
"- Author:        Njima1572
"- Created:       06/19/2020
"- Last Updated:  07/27/2020
"-------------------------------
"
"Cheat sheet: https://devhints.io/vimscript

"----- Plugin
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
Plugin 'vim-airline/vim-airline'
Plugin 'jacquesbh/vim-showmarks'
" Plugin 'easymotion/vim-easymotion'

call vundle#end()
filetype plugin indent on


"----- Refresh vimrc with <F5>
noremap <F5> :source ~/.vimrc<CR>

"----- Some basic vim stuff
set title
set number
set autoindent
set smartindent
set virtualedit=onemore
set scrolloff=999
set laststatus=2

set showcmd

set hlsearch
set wrapscan
noremap <Esc><Esc> :nohl<CR>

"----- Tab stuff
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set list listchars=tab:\-\-

"---- Vim file explorer
"delete the header for the explorer
let g:netrw_banner=0


"----- Undo
if has('persistent_undo')
  set undodir=~/.vim/undo
  set undofile
endif

"----- Setting <Space> as a leader key
let mapleader = " "

"----- Disable arrow keys
inoremap <Left> <Nop>
inoremap <Up> <Nop>
inoremap <Down> <Nop>
inoremap <Right> <Nop>

"----- Find
noremap F K

"----- Remap HJKL
noremap H ^
noremap J :tabp<CR>
noremap K :tabn<CR>
noremap L $

"----- Normal mode shortcut
imap jj <Esc>

"----- Save and quit
noremap <Leader><Leader> :w<CR>
noremap <Leader><Leader><Leader> :wq<CR>

"----- Shortcut for config files
noremap <Leader>. :tabe ~/.vimrc<CR>
noremap <Leader>t :tabe ~/.vimrc<CR>
noremap <Leader>i :tabe ~/.config/i3/config<CR>

"----- Keymapping for tabs
nmap <C-t> :tabe <C-d>
nmap <C-s> :vsplit <C-d>

"----- Scorll Faster
nmap <C-j> jjj
nmap <C-k> kkk

"nmap <S-j> jjj
"nmap <S-k> kkk

"----- gj gk mapping
noremap j gj
noremap k gk

"----- Line Start and line end 
nmap <Leader>h ^
nmap <Leader>l $

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

"----- Colors
hi Search ctermbg=LightMagenta
hi ErrorMsg guibg=Blue

"----- Airline Theme
let g:ariline_solarized_bg='dark'

" ---- Sessions
"  If session was loaded, then overwrites it,
"  if not, then asks for new name
if eval(v:this_session)
  exe "noremap <Space>s :mks! ".v:this_session."<CR>"
else
  noremap <Space>s :mks ~/.vim/session/
endif

noremap <Space>S :mks ~/.vim/session/
noremap <Space>r :source ~/.vim/session/<C-d>


"----- Buffers
set hidden
noremap <Leader>b :ls<CR>:b 
noremap <Leader>x :bd<CR>

"----- Showmarks
augroup show_marks_sync
  autocmd!
  autocmd BufReadPost * silent! DoShowMarks
augroup END

"----- Easymotion Sample : to be cleaned

"map  <C-f> <Plug>(easymotion-bd-f)
"nmap <C-f> <Plug>(easymotion-overwin-f)


" s{char}{char} to move to {char}{char}
nmap <C-s> <Plug>(easymotion-overwin-f2)

" Move to line
map ,L <Plug>(easymotion-bd-jk)
nmap ,L <Plug>(easymotion-overwin-line)

" Move to word
map  ,w <Plug>(easymotion-bd-w)
nmap ,w <Plug>(easymotion-overwin-w)

map , <Plug>(easymotion-prefix))
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)
map  n <Plug>(easymotion-next)
map  N <Plug>(easymotion-prev)))))/ <Plug>(easymotion-sn)
nmap / <Plug>(easymotion-tn)

