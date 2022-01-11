" -.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.
" File Name : plugins.vim
" Purpose :
" Creation Date : 2022-01-11
" Last Modified : 2022-01-11 11:59
" Created By : Njima1572
" ._._._._._._._._._._._._._._._._._._._._.
call plug#begin('~/.config/nvim/plugged')

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'easymotion/vim-easymotion'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
"Plug 'jremmen/vim-ripgrep.vim'
Plug 'mbbill/undotree'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'wakatime/vim-wakatime'
Plug 'Shougo/defx.nvim', {'do': ':UpdateRemotePlugins'}
Plug 'kristijanhusak/defx-icons'
Plug 'jiangmiao/auto-pairs'
Plug 'neovim/nvim-lspconfig'
Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }

" --- Git
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

Plug 'jparise/vim-graphql'

" --- Web development
Plug 'alvan/vim-closetag'
Plug 'ap/vim-css-color'

" Javascript
Plug 'mxw/vim-jsx'
Plug 'pangloss/vim-javascript'
Plug 'simeji/winresizer'

Plug 'dag/vim-fish'

" --- Aoki stuff
Plug 'siberowl/vim-tiny-surround'

call plug#end()


" ------ Coc Stuff
let g:coc_global_extensions = [
      \'coc-prettier', 
      \'coc-pyright', 
      \'coc-omnisharp', 
      \'coc-rust-analyzer',
      \'coc-fish',
      \'coc-yaml',
      \'coc-json',
      \'coc-tsserver',
      \'coc-sh',
      \'coc-eslint',
      \'coc-css'
      \]
