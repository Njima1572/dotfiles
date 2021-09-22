" -.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.
" File Name : init.vim
" Purpose :
" Creation Date : 2021-01-15
" Last Modified : 2021-09-22 14:10
" Created By : Njima1572
" ._._._._._._._._._._._._._._._._._._._._.

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
Plug 'jremmen/vim-ripgrep.vim'
Plug 'mbbill/undotree'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'dbeniamine/cheat.sh-vim'
Plug 'wakatime/vim-wakatime'
Plug 'Shougo/defx.nvim', {'do': ':UpdateRemotePlugins'}
Plug 'kristijanhusak/defx-icons'
" --- C++
Plug 'rhysd/vim-clang-format'

" --- C#
Plug 'sheerun/vim-polyglot'
Plug 'OmniSharp/omnisharp-vim'

" --- Dart
Plug 'dart-lang/dart-vim-plugin'

" --- Telescope
" Plug 'nvim-lua/popup.nvim'
" Plug 'nvim-lua/plenary.nvim'
" Plug 'nvim-telescope/telescope-fzy-native.nvim'
" Plug 'nvim-telescope/telescope.nvim'

Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }

" --- Git
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

Plug 'jparise/vim-graphql'

" --- Rust
Plug 'rust-lang/rust.vim'

" --- Web development
"Plug 'leafgarland/typescript-vim'
Plug 'alvan/vim-closetag'
"Plug 'peitalin/vim-jsx-typescript'

" --- Vim improvement tools
Plug 'theprimeagen/vim-be-good'
Plug 'ThePrimeagen/vim-apm'

" Javascript
Plug 'mxw/vim-jsx'
Plug 'pangloss/vim-javascript'

" C++
Plug 'cjuniet/clang-format.vim'
" --- Singularity
Plug 'singularityware/singularity.lang'

Plug 'simeji/winresizer'

" --- Firebase
Plug 'delphinus/vim-firestore'

call plug#end()


"End dein Scripts-------------------------

" Custom
"source ~/.config/nvim/customs/aoki_surround.vim

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


" inserting actual tab instead of expanded tab
inoremap <S-Tab> <C-Q><Tab>
nnoremap Y y$

inoremap , ,<c-g>U
inoremap . .<c-g>U
inoremap ! !<c-g>U
inoremap ? ?<c-g>U

" Moving Chunks
" vnoremap N :m '>+1<CR>gv=gv
" vnoremap E :m '<-2<CR>gv=gv

" Colemak version of jj <Esc>
imap xx <Esc>

nnoremap <silent> <S-i> :bn<CR>
nnoremap <silent> <S-h> :bp<CR>

nnoremap <S-n> jjjjj
nnoremap <S-e> kkkkk

vnoremap <S-n> jjjjj
vnoremap <S-e> kkkkk


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
set scrolloff=40
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


noremap <CR> :w<CR>
noremap <Leader><Leader> :w<CR>
noremap <Leader><Leader><Leader> :wq<CR>


"---- Vim file explorer
"delete the header for the explorer
let g:netrw_banner=0
let g:netrw_liststyle = 3
let g:netrw_winsize=25

" ----- Win Resizer
nnoremap <silent> <C-j> :WinResizerStartResize<CR>
let g:winresizer_start_key='<C-j>'
let g:winresizer_keycode_left=104
let g:winresizer_keycode_down=110
let g:winresizer_keycode_up=101
let g:winresizer_keycode_right=105
let g:winresizer_keycode_mode=115

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


noremap <Leader>o :Defx<CR>
noremap <Leader>v :Defx<CR>
"noremap <Leader>h :split .<CR>
noremap <Leader>= <C-w>=

"----- Telescope
"" Find files using Telescope command-line sugar.
" nnoremap <leader>ff <cmd>Telescope find_files<cr>
" nnoremap <leader>fg <cmd>Telescope live_grep<cr>
" nnoremap <leader>b <cmd>Telescope buffers<cr>
" nnoremap <leader>fh <cmd>Telescope help_tags<cr>


" ------ Undotree
nnoremap <leader>u :UndotreeToggle<CR>

""----- Easymotion
map , <Plug>(easymotion-prefix)

" ----- Defx Config
noremap <Leader>o :e .<CR>
"noremap <Leader>v :vs .<CR> :vertical resize 30<CR>
"noremap <Leader>h :split .<CR>
noremap <Leader>= <C-w>=

"
" ----- Git
nmap <leader>gs :G<CR>

function CreateAndStartEdit(filename)
  echom a:filename
  execute "e " .expand("%:h") . "/" . a:filename
endfunction

" ----- Execute shell in vim and paste it
vnoremap <Leader><CR> :!sh<CR>
nnoremap <Leader><CR> V:!sh<CR>
nnoremap <Leader>c command! -nargs=1 Nf call CreateAndStartEdit(<q-args>)

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

let g:typescript_compile_binary = 'tsc'
let g:typescript_compile_options = ''

" Shortcut for closing tags, default is '>'
"
let g:closetag_shortcut = '>'

" Add > at current position without closing the current tag, default is ''
"
let g:closetag_close_shortcut = '<leader>>'

" ripgrep
let g:rg_command = 'rg --vimgrep -S'
command! GitRootRg execute  'cd '.system('git rev-parse --show-toplevel') 'Rg'
command! GitRootFileRg execute  'cd '.system('git rev-parse --show-cdup') 'Rg -g'
nnoremap <silent> <Leader>s :GitRootRg<CR>
nnoremap <silent> <Leader>f :GitRootRg<CR>

" defx
source ~/Git/dotfiles/defx_bindings.vim

" ------ Coc Stuff
let g:coc_global_extensions = ['coc-prettier', 'coc-omnisharp']

" Highlight for tsx
" dark red
hi tsxTagName guifg=#E06C75
hi tsxComponentName guifg=#E06C75
hi tsxCloseComponentName guifg=#E06C75

" orange
hi tsxCloseString guifg=#F99575
hi tsxCloseTag guifg=#F99575
hi tsxCloseTagName guifg=#F99575
hi tsxAttributeBraces guifg=#F99575
hi tsxEqual guifg=#F99575

" yellow
hi tsxAttrib guifg=#F8BD7F cterm=italic

hi ReactState guifg=#C176A7
hi ReactProps guifg=#D19A66
hi ApolloGraphQL guifg=#CB886B
hi Events ctermfg=204 guifg=#56B6C2
hi ReduxKeywords ctermfg=204 guifg=#C678DD
hi ReduxHooksKeywords ctermfg=204 guifg=#C176A7
hi WebBrowser ctermfg=204 guifg=#56B6C2
hi ReactLifeCycleMethods ctermfg=204 guifg=#D19A66

function GenerateHeader(filetype)
  if a:filetype == 'vim'
    r/home/kochi/dotfiles/header_template/.header_template.vim
    exec setline(0, '')
  elseif a:filetype == 'py'
    r/home/kochi/dotfiles/header_template/.header_template.py
    exec setline(0, '')
  endif
  exe "1," . 8 . "g/File Name :.*/s//File Name : " .expand("%")
  exe "1," . 8 . "g/Creation Date :.*/s//Creation Date : " .strftime("%Y-%m-%d %H:%M")
endfunction

function UpdateHeader()
  execute "normal ma"
  exe "1," . 8 . "g/Last Modified :.*/s/Last Modified :.*/Last Modified : " .strftime("%Y-%m-%d %H:%M")
  exe "1," . 8 . "g/Created By :.*/s/Created By :.*/Created By : Njima1572"

endfunction

augroup vim
  autocmd!
  autocmd bufnewfile *.vim call GenerateHeader('vim')
  autocmd Bufwritepre,filewritepre *.vim call UpdateHeader()
  autocmd bufwritepost,filewritepost *.vim execute "normal `a"
augroup END

augroup python
  autocmd!
  "autocmd bufnewfile *.py call GenerateHeader('py')
  "autocmd Bufwritepre,filewritepre *.py call UpdateHeader()
  "autocmd bufwritepost,filewritepost *.py execute "normal `a"
augroup END

augroup cpp
  autocmd!
  autocmd BufWritePost *.cpp,*.h ClangFormat
augroup END

augroup js
  autocmd!
  autocmd FileType typescript :set makeprg=tsc
  autocmd BufNewFile,BufRead *.ts,*.tsx,*.jsx set filetype=typescriptreact
  autocmd BufNewFile,BufRead *.vue set filetype=vue
  autocmd BufWritePost *.vue,*.js,*.jsx,*.ts,*.tsx PrettierAsync
augroup END

augroup rust
  autocmd!
  autocmd BufWritePost *.rs RustFmt
augroup END
