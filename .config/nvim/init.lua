-- -.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.
--  File Name : init.vim
--  Purpose :
--  Creation Date : 2021-01-15
--  Last Modified : 2022-01-11 12:24
--  Created By : Njima1572
--  ._._._._._._._._._._._._._._._._._._._._.

-- nvim + Lua
local fn = vim.fn
local jetpackfile = fn.stdpath('data') .. '/site/pack/jetpack/opt/vim-jetpack/plugin/jetpack.vim'
local jetpackurl = 'https://raw.githubusercontent.com/tani/vim-jetpack/master/plugin/jetpack.vim'
if fn.filereadable(jetpackfile) == 0 then
  fn.system('curl -fsSLo ' .. jetpackfile .. ' --create-dirs ' .. jetpackurl)
end


require('njima1572.functions')
require('njima1572.plugins')
require('njima1572.basics')
require('njima1572.keybindings')

-- Extras
-- vim.cmd('source ~/.config/nvim/configs/defx_bindings.vim
-- vim.cmd('source ~/.config/nvim/configs/fern.vim')
-- vim.cmd('source ~/.config/nvim/configs/coc.vim
-- vim.cmd('source ~/.config/nvim/configs/lsps.lua')
-- vim.cmd('source ~/.config/nvim/configs/treesitter.lua')

vim.cmd('source ~/.config/nvim/configs/languages.vim')
