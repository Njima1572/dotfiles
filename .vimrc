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

packloadall

"----- Color Scheme
" source ~/.vim/colorscheme.vim

" Plugin 'VundleVim/Vundle.vim'
" Plugin 'tpope/vim-fugitive'
" Plugin 'airblade/vim-gitgutter'
" Plugin 'vim-airline/vim-airline'
" Plugin 'jacquesbh/vim-showmarks'
" "Plugin 'easymotion/vim-easymotion'
" Plugin 'junegunn/fzf', { 'do': { -> fzf#install() } }
" Plugin 'junegunn/fzf.vim'
" Plugin 'rhysd/vim-clang-format'
" Plugin 'prettier/vim-prettier', { 'do': 'yarn install' }
" Plugin 'sjl/gundo.vim',
" Plugin 'leafgarland/typescript-vim'
" Plugin 'peitalin/vim-jsx-typescript'
" Plugin 'zah/nim.vim'
" Plugin 'altercation/vim-colors-solarized'
" Plugin 'psf/black', { 'tag': '19.10b0' }
" Plugin 'rust-lang/rust.vim'
" Plugin 'dag/vim-fish'
" Plugin 'alvan/vim-closetag'
" Plugin 'dart-lang/dart-vim-plugin'
" Plugin 'natebosch/vim-lsc'
" Plugin 'natebosch/vim-lsc-dart'
" "" An autocompletion plugin but replaced by kite
" " Plugin 'neoclide/coc.nvim', {'branch': 'release'}
" Plugin 'jparise/vim-graphql'
" Plugin 'kiteco/vim-plugin'
" 
" call vundle#end()
" filetype plugin indent on


"----- Refresh vimrc with <F5>
noremap <silent> <F5> :source ~/.vimrc<CR>:noh<CR>:echo "Refreshed config!"<CR>

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
set clipboard=unnamedplus
set guioptions-=T
set guioptions-=m
set guioptions-=r
set incsearch


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


set showcmd

set foldmethod=marker

set hlsearch
set wrapscan
set foldmethod=marker

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

inoremap <S-Tab> <C-Q><Tab>

"----- Find
noremap F K

"----- Remap HJKL
noremap <S-h> ^
noremap <S-l> $
""---- Scroll Faster
nnoremap <S-n> jjj
nnoremap <S-e> kkk

vnoremap <S-n> jjj
vnoremap <S-e> kkk

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
noremap <Leader>= <C-w>=

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

" Kite config
let g:kite_supported_languages = ["python", "javascript"]
let g:kite_tab_complete=1
let g:kite_completions=0
set completeopt+=noinsert
set completeopt+=menuone

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

augroup rust
  autocmd!
  autocmd! BufNewFile,BufRead *.rs source ~/.vim/rust/rust.vim
augroup END
  
" Dart is for flutter
augroup dart_group
  autocmd!
  autocmd BufNewFile,BufRead *.dart source ~/.vim/dart/dart.vim
augroup END
