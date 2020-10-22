"-------------------------------
"- Author:        Njima1572
"- Created:       06/19/2020
"- Last Updated:  09/10/2020
"-------------------------------
"
"Cheat sheet: https://devhints.io/vimscript

"----- Plugin
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

packloadall

"----- Color Scheme
source ~/.vim/colorscheme.vim

Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
Plugin 'vim-airline/vim-airline'
Plugin 'jacquesbh/vim-showmarks'
"Plugin 'easymotion/vim-easymotion'
Plugin 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plugin 'junegunn/fzf.vim'
Plugin 'rhysd/vim-clang-format'
Plugin 'prettier/vim-prettier', { 'do': 'yarn install' }
Plugin 'sjl/gundo.vim',
Plugin 'leafgarland/typescript-vim'
Plugin 'peitalin/vim-jsx-typescript'
Plugin 'zah/nim.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'psf/black', { 'tag': '19.10b0' }

call vundle#end()
filetype plugin indent on


"----- Refresh vimrc with <F5>
noremap <F5> :source ~/.vimrc<CR>:noh<CR>

"----- Some basic vim stuff
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
let mapleader = " "

"----- Disable arrow keys
inoremap <Left> <Nop>
inoremap <Up> <Nop>
inoremap <Down> <Nop>
inoremap <Right> <Nop>

"----- Find
noremap F K

"----- Remap HJKL
noremap <S-h> ^
noremap <S-l> $
""---- Scroll Faster
nmap <S-j> jjj
nmap <S-k> kkk

vmap <S-j> jjj
vmap <S-k> kkk

"----- Tryin to add emacs useful bindings
noremap <C-e> ?\.<CR>:nohl<CR>
noremap <S-e> /\.<CR>:nohl<CR>

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

nmap <S-j> jjj
nmap <S-k> kkk
vmap <S-j> jjj
vmap <S-k> kkk

map <C-z> <Nop>

" ------ Move between panes with Ctrl + hjkl *Note map Alt + hjkl for tmux and
"  win + hjkl for i3
nmap <C-h> :wincmd h<CR>
nmap <C-j> :wincmd j<CR>
nmap <C-k> :wincmd k<CR>
nmap <C-l> :wincmd l<CR>

nmap <S-j> jjj
nmap <S-k> kkk

"----- gj gk mapping
noremap j gj
noremap k gk

"----- Line Start and line end 
nmap <Leader>l $

"----- Window Split open with tree
nmap <Leader> h :split .<CR>
nmap <Leader> v :vsplit .<CR>

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

" ---- Sessions
"  If session was loaded, then overwrites it,
"  if not, then asks for new name
if empty(v:this_session)
  noremap <Leader>s :mks ~/.vim/session/
  noremap <Leader><Leader><Leader> :wq<CR> 
else
  exe "noremap <Leader>s :mks! ".v:this_session."<CR>"
  exe "noremap <Leader><Leader><Leader> :mks! ".v:this_session."<CR>:wqa<CR>"
endif

noremap <Leader>S :mks ~/.vim/session/
noremap <Leader>r :source ~/.vim/session/<C-d>

noremap <Leader>o :e .<CR>
noremap <Leader>v :vs .<CR>
noremap <Leader>h :split .<CR>

noremap <Leader>f :BLines<CR>
noremap <Leader>g :Lines<CR>

"----- Gundo
if has ('python3')
  let g:gundo_prefer_python3 = 1
endif
noremap <Leader>u :GundoToggle<CR>

"----- Directory stuff
autocmd BufEnter * silent! lcd %:p:h

"----- Buffers
set hidden
noremap <Leader>b :ls<CR>:b 
noremap <Leader>x :bd<CR>

"Automatically set directory to current file
autocmd BufEnter * silent! lcd %:p:h

"----- Showmarks
augroup show_marks_sync
  autocmd!
  autocmd BufReadPost * silent! DoShowMarks
augroup END

"----- Easymotion Sample : to be cleaned

"map  <C-f> <Plug>(easymotion-bd-n)
"nmap <C-f> <Plug>(easymotion-overwin-f)


" s{char}{char} to move to {char}{char}
" nmap <C-s> <Plug>(easymotion-everwin-f2)

" Move to line
" map ,L <Plug>(easymotion-bd-jk)
" nmap ,L <Plug>(easymotion-overwin-line)

" Move to word
" map  ,w <Plug>(easymotion-bd-w)
" nmap ,w <Plug>(easymotion-overwin-w)

" map , <Plug>(easymotion-prefix))
" map  / <Plug>(easymotion-sn)
" omap / <Plug>(easymotion-tn)
" map  n <Plug>(easymotion-next)
" map  N <Plug>(easymotion-prev)))))/ <Plug>(easymotion-sn)
" nmap / <Plug>(easymotion-tn)

" Clang 
augroup c_group
  autocmd!
  autocmd BufRead,BufNewFile *.cpp,*.c source ~/.vim/cpp/cpp.vim
  autocmd BufWritePost *.cpp,*.c,*.h,*.hpp ClangFormat
augroup END

" Python
augroup py_group
  autocmd!
  autocmd BufRead,BufNewFile *.py source ~/.vim/python/python.vim
  autocmd BufWritePost *.py Black
augroup END

" Javascripts
augroup js_group
  autocmd!
  autocmd BufWritePost *.js,*.jsx,*.ts PrettierAsync
augroup END

" Set filetype as typescript.tsx
augroup jsx_group
  autocmd!
  autocmd BufNewFile,BufRead *.js,*.tsx,*.jsx source ~/.vim/javascript/typescript.vim
augroup END
