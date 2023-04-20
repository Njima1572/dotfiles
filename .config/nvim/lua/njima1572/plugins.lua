-- -.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.
-- File Name : plugins.vim
-- Purpose :
-- Creation Date : 2022-01-11
-- Last Modified : 2022-01-11 11:59
-- Created By : Njima1572
-- ._._._._._._._._._._._._._._._._._._._._.
vim.cmd('packadd vim-jetpack')
require('jetpack.packer').startup(function(use)
  use { 'tani/vim-jetpack', opt = 1 }
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
  --  use { 'github/copilot.vim' }

  --- Fern
  use { 'lambdalisue/fern.vim' }
  use { 'lambdalisue/fern-hijack.vim' }

  --- Lsps
  use { 'jose-elias-alvarez/null-ls.nvim' }
  use { 'neovim/nvim-lspconfig' }
  use { 'lspcontainers/lspcontainers.nvim' }
  use { 'williamboman/nvim-lsp-installer' }
  use { 'glepnir/lspsaga.nvim' }
  use { 'nvim-treesitter/nvim-treesitter' }

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
  use { 'vim-denops/denops.vim' }
  use { 'vim-skk/denops-skkeleton.vim' }
  use { 'Shougo/ddc.vim' }
  use { 'Shougo/ddc-matcher_head' }
  use { 'Shougo/ddc-sorter_rank' }
end)

