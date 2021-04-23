syntax enable
set background=light
" colorscheme solarized

hi Search ctermbg=224


"dein Scripts-----------------------------

if &compatible
  set nocompatible               " Be iMproved
endif
call plug#begin('~/.vim/plugged')

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
Plug 'easymotion/vim-easymotion'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'mbbill/undotree'
Plug 'leafgarland/typescript-vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'dbeniamine/cheat.sh-vim'
Plug 'cohama/lexima.vim'

" --- C++
Plug 'rhysd/vim-clang-format'

" --- Dart
Plug 'dart-lang/dart-vim-plugin'

" --- Telescope
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'
Plug 'nvim-telescope/telescope.nvim'

Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }

" --- Git
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

Plug 'jparise/vim-graphql'

" --- Rust
Plug 'rust-lang/rust.vim'

" --- Web development
Plug 'alvan/vim-closetag'
Plug 'peitalin/vim-jsx-typescript'

" --- Vim improvement tools
Plug 'theprimeagen/vim-be-good'
Plug 'ThePrimeagen/vim-apm'

" Javascript
Plug 'mxw/vim-jsx'
Plug 'pangloss/vim-javascript'

" C++
Plug 'cjuniet/clang-format.vim'

call plug#end()


"End dein Scripts-------------------------

" Colemak remapping to use qwerty hjkl
noremap n j
noremap e k
noremap n gj
noremap e gk
noremap i l

noremap k n
noremap l i
noremap N J
noremap E K
noremap I L
noremap K N
noremap L I

" Colemak version of jj <Esc>
imap xx <Esc>

nnoremap <silent> <S-h> :bp<CR>
nnoremap <silent> <S-i> :bn<CR>

nnoremap <S-n> jjj
nnoremap <S-e> kkk

vnoremap <S-n> jjj
vnoremap <S-e> kkk


" From original vimrc
let mapleader = " "

noremap <silent> <F5> :source ~/.config/nvim/init.vim<CR>:noh<CR>:echo "Refreshed config!"<CR>

set exrc
set relativenumber
set hidden
set noswapfile
set nobackup

set title
set number
set autoindent
set smartindent
set virtualedit=onemore
set scrolloff=20
set laststatus=2
set cursorline
set cursorcolumn
set showcmd
set foldmethod=marker
set hlsearch
set wrapscan
set noerrorbells
set incsearch
set undofile
set undodir=~/.vim/undo

noremap <Esc><Esc> :nohl<CR>

syntax on

"----- Tab stuff
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set list listchars=tab:\-\-

map <C-z> <Nop>


noremap <Leader><Leader> :w<CR>
noremap <Leader><Leader><Leader> :wq<CR>


"---- Vim file explorer
"delete the header for the explorer
let g:netrw_banner=0
let g:netrw_liststyle = 3
let g:netrw_winsize=25

"----- Disable arrow keys
inoremap <Left> <Nop>
inoremap <Up> <Nop>
inoremap <Down> <Nop>
inoremap <Right> <Nop>
noremap <C-z> <Nop>


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
" noremap <Leader>b :ls<CR>:b 
noremap <Leader>x :bd<CR>


noremap <Leader>o :e .<CR>
noremap <Leader>v :vs .<CR> :vertical resize 30<CR>
noremap <Leader>h :split .<CR>
noremap <Leader>= <C-w>=

"----- Telescope
"" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>b <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" ------ Undotree
nnoremap <leader>u :UndotreeToggle<CR>

""----- Easymotion
map , <Plug>(easymotion-prefix)

"
" ----- Git
nmap <leader>gs :G<CR>

" ----- Execute shell in vim and paste it
vnoremap <Leader><CR> :!sh<CR>
nnoremap <Leader><CR> V:!sh<CR>

" YouCompleteMe
nmap gd :call CocAction('jumpDefinition', 'tab drop') <CR>
" nnoremap <silent> <Leader>gf :YcmCompleter FixIt<CR>

" ------ Airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='angr'


"----- Tag Closing
" filenames like *.xml, *.html, *.xhtml, ...
" These are the file extensions where this plugin is enabled.
"
let g:closetag_filenames = '*.html,*.xhtml,*.phtml'

" filenames like *.xml, *.xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
"
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx'

" filetypes like xml, html, xhtml, ...
" These are the file types where this plugin is enabled.
"
let g:closetag_filetypes = 'html,xhtml,phtml'

" filetypes like xml, xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
"
let g:closetag_xhtml_filetypes = 'xhtml,jsx'

" integer value [0|1]
" This will make the list of non-closing tags case-sensitive (e.g. `<Link>` will be closed while `<link>` won't.)
"
let g:closetag_emptyTags_caseSensitive = 1

" dict
" Disables auto-close if not in a "valid" region (based on filetype)
"
let g:closetag_regions = {
    \ 'typescript.tsx': 'jsxRegion,tsxRegion',
    \ 'javascript.jsx': 'jsxRegion',
    \ }

" Shortcut for closing tags, default is '>'
"
let g:closetag_shortcut = '>'

" Add > at current position without closing the current tag, default is ''
"
let g:closetag_close_shortcut = '<leader>>'


augroup cpp
  autocmd!
  autocmd BufWritePost *.cpp,*.h ClangFormat
augroup END

augroup js
  autocmd!
  autocmd BufWritePost *.js,*.jsx,*.ts,*.tsx PrettierAsync
augroup END

augroup rust
  autocmd!
  autocmd BufWritePost *.rs RustFmt
augroup END
