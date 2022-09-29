" -.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.
" File Name : plugins.vim
" Purpose :
" Creation Date : 2022-01-11
" Last Modified : 2022-01-11 11:59
" Created By : Njima1572
" ._._._._._._._._._._._._._._._._._._._._.
call plug#begin('~/.config/nvim/plugged')

Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-lualine/lualine.nvim'
Plug 'akinsho/bufferline.nvim'
Plug 'Shatur/neovim-session-manager'
Plug 'easymotion/vim-easymotion'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
"Plug 'jremmen/vim-ripgrep.vim'
Plug 'mbbill/undotree'
"Plug 'neoclide/coc.nvim', {'branch': 'release'} =? moved to configs/coc.nvim
"Plug 'wakatime/vim-wakatime'
"Plug 'Shougo/defx.nvim', {'do': ':UpdateRemotePlugins'}
"Plug 'kristijanhusak/defx-icons'
Plug 'cohama/lexima.vim'
"Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }

" --- Fern
Plug 'lambdalisue/fern.vim'
Plug 'lambdalisue/fern-hijack.vim'

" --- Lsps
Plug 'neovim/nvim-lspconfig'
Plug 'lspcontainers/lspcontainers.nvim'
Plug 'williamboman/nvim-lsp-installer'
Plug 'glepnir/lspsaga.nvim'
Plug 'nvim-treesitter/nvim-treesitter', { 'do' :  ':TSUpdate'  }

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

Plug 'nvim-lua/plenary.nvim'
Plug 'akinsho/flutter-tools.nvim'

" Dart more syntax highlights
Plug 'dart-lang/dart-vim-plugin'

Plug 'lambdalisue/gina.vim'

" --- SKK
"Plug 'vim-skk/eskk.vim'
Plug 'vim-denops/denops.vim'
Plug 'vim-skk/denops-skkeleton.vim'
Plug 'Shougo/ddc.vim'
Plug 'Shougo/ddc-matcher_head'
Plug 'Shougo/ddc-sorter_rank'


" --- Aoki stuff
Plug 'siberowl/vim-tiny-surround'

call plug#end()

lua  << EOF
require('lualine').setup()
require('bufferline').setup()
local Path = require('plenary.path')
require('session_manager').setup({
  sessions_dir = Path:new(vim.fn.stdpath('data'), 'sessions'), -- The directory where the session files will be saved.
  path_replacer = '__', -- The character to which the path separator will be replaced for session files.
  colon_replacer = '++', -- The character to which the colon symbol will be replaced for session files.
  autoload_mode = require('session_manager.config').AutoloadMode.CurrentDir, -- Define what to do when Neovim is started without arguments. Possible values: Disabled, CurrentDir, LastSession
  autosave_last_session = true, -- Automatically save last session on exit and on session switch.
  autosave_ignore_not_normal = true, -- Plugin will not save a session when no buffers are opened, or all of them aren't writable or listed.
  autosave_ignore_filetypes = { -- All buffers of these file types will be closed before the session is saved.
    'gitcommit',
  }, 
  autosave_only_in_session = false, -- Always autosaves session. If true, only autosaves after a session is active.
  max_path_length = 80,  -- Shorten the display path if length exceeds this threshold. Use 0 if don't want to shorten the path at all.
})
EOF
