" -.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.
" File Name : plugins.vim
" Purpose :
" Creation Date : 2022-01-11
" Last Modified : 2022-01-11 11:33
" Created By : Njima1572
" ._._._._._._._._._._._._._._._._._._._._.
call plug#begin('~/.vim/plugged')

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
Plug 'easymotion/vim-easymotion'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
"Plug 'jremmen/vim-ripgrep.vim'
Plug 'mbbill/undotree'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'dbeniamine/cheat.sh-vim'
Plug 'wakatime/vim-wakatime'
Plug 'Shougo/defx.nvim', {'do': ':UpdateRemotePlugins'}
Plug 'kristijanhusak/defx-icons'
Plug 'jiangmiao/auto-pairs'
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

Plug 'neovim/nvim-lspconfig'

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
Plug 'ap/vim-css-color'


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

" --- Aoki stuff
Plug 'siberowl/vim-tiny-surround'

" --- Instant nvim (nvim liveshare)
" Plug 'jbyuki/instant.nvim'


call plug#end()
