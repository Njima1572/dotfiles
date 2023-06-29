-- -.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.
-- File Name : plugins.vim
-- Purpose :
-- Creation Date : 2022-01-11
-- Last Modified : 2022-01-11 11:59
-- Created By : Njima1572
-- ._._._._._._._._._._._._._._._._._._._._.
vim.cmd('packadd vim-jetpack')
require('jetpack.packer').startup(function(use)

  use { 'nvim-lua/plenary.nvim' }
  use { 'nvim-lualine/lualine.nvim' }
  use { 'akinsho/bufferline.nvim' }
  use { 'Shatur/neovim-session-manager' }
  use { 'easymotion/vim-easymotion' }
  use { 'junegunn/fzf', run = 'call fzf#install()' }
  use { 'junegunn/fzf.vim' }
  -- use { 'jremmen/vim-ripgrep.vim'}
  use { 'mbbill/undotree' }
  -- use { 'neoclide/coc.nvim', {'branch': 'release'} =? moved to configs/coc.nvim}
  -- use { 'wakatime/vim-wakatime'}
  -- use { 'Shougo/defx.nvim', {'do': ':UpdateRemotePlugins'}}
  -- use { 'kristijanhusak/defx-icons'}
  use { 'cohama/lexima.vim' }
  -- use { 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }
  use { 'shaunsingh/moonlight.nvim' }

  --- Fern
  use { 'lambdalisue/fern.vim' }
  use { 'lambdalisue/fern-hijack.vim' }

  use { 'jose-elias-alvarez/null-ls.nvim' }
  use { 'neovim/nvim-lspconfig' }
  use { 'lspcontainers/lspcontainers.nvim' }
  use { 'williamboman/nvim-lsp-installer' }
  use { 'glepnir/lspsaga.nvim' }
  -- use { 'nvim-treesitter/nvim-treesitter' }

  --- Git
  use { 'airblade/vim-gitgutter' }
  use { 'tpope/vim-fugitive' }

  use { 'jparise/vim-graphql' }

  --- Web development
  use { 'alvan/vim-closetag' }
  use { 'ap/vim-css-color' }

  -- Javascript
  use { 'mxw/vim-jsx' }
  use { 'pangloss/vim-javascript' }
  use { 'simeji/winresizer' }

  use { 'dag/vim-fish' }

  use { 'nvim-lua/plenary.nvim' }
  use { 'akinsho/flutter-tools.nvim' }

  -- Dart more syntax highlights
  use { 'dart-lang/dart-vim-plugin' }

  use { 'lambdalisue/gina.vim' }

  --- SKK
  -- use { 'vim-skk/eskk.vim'}
  -- use { 'vim-denops/denops.vim' }
  -- use { 'vim-skk/denops-skkeleton.vim' }
  -- use { 'Shougo/ddc.vim' }
  -- use { 'Shougo/ddc-matcher_head' }
  -- use { 'Shougo/ddc-sorter_rank' }

end)

local null_ls = require('null-ls')
null_ls.setup({
  sources = {
    null_ls.builtins.formatting.goimports
  }
})
require('lualine').setup()
require('bufferline').setup()
local Path = require('plenary.path')
require('session_manager').setup({
  sessions_dir = Path:new(vim.fn.stdpath('data'), 'sessions'), -- The directory where the session files will be saved.
  path_replacer = '__', -- The character to which the path separator will be replaced for session files.
  colon_replacer = '++', -- The character to which the colon symbol will be replaced for session files.
  autoload_mode = require('session_manager.config').AutoloadMode.CurrentDir, -- Define what to do when Neovim is started without arguments. Possible values: Disabled, CurrentDir, LastSession
  autosave_last_session = true, -- Automatically save last session on exit and on session switch.
  autosave_ignore_not_normal = true, -- use {in will not save a session when no buffers are opened, or all of them aren't writable or listed.
  autosave_ignore_filetypes = { -- All buffers of these file types will be closed before the session is saved.
    'gitcommit',
  },
  autosave_only_in_session = false, -- Always autosaves session. If true, only autosaves after a session is active.
  max_path_length = 80, -- Shorten the display path if length exceeds this threshold. Use 0 if don't want to shorten the path at all.
})
