" -.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.
" File Name : basics.vim
" Purpose :
" Creation Date : 2022-01-11
" Last Modified : 2022-01-11 11:32
" Created By : Njima1572
" ._._._._._._._._._._._._._._._._._._._._.

syntax enable
set background=dark
colorscheme solarized

let mapleader = " "

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

syntax on

"----- Tab stuff
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set list listchars=tab:\-\-

" Custom
let g:python3_host_prog = '/usr/bin/python3'
let g:vue_disable_pre_processors=1

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

" ------ Airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='angr'

"----- Tag Closing
" filenames like *.xml, *.html, *.xhtml, ...
" These are the file extensions where this plugin is enabled.
"
let g:closetag_filenames = '*.html,*.xhtml,*.phtml'
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx'
let g:closetag_filetypes = 'html,xhtml,phtml'
let g:closetag_xhtml_filetypes = 'xhtml,jsx'

let g:closetag_emptyTags_caseSensitive = 1
let g:closetag_regions = {
    \ 'typescript.tsx': 'jsxRegion,tsxRegion',
    \ 'javascript.jsx': 'jsxRegion',
    \ }

let g:typescript_compile_binary = 'tsc'
let g:typescript_compile_options = ''
let g:closetag_shortcut = '>'
let g:closetag_close_shortcut = '<leader>>'

