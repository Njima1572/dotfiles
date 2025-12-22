vim.g.mapleader = " "
vim.g.maplocalleader = " "

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Required:
vim.cmd('filetype plugin indent on')
vim.cmd('syntax enable') -- Turned on by default in nvim
vim.o.termguicolors = true

vim.g.python3_host_prog = '/home/nakajima/.pyenv/versions/3.10.15/bin/python3'

require("bindings")
require('lazy').setup(require("plugins"))
require("basics")

-- vim.cmd 'source ~/.config/nvim/bindings.vim'

-- Gopass disable swapfile, backup, undo
vim.cmd('autocmd BufNewFile,BufRead /private/**/gopass** setlocal noswapfile nobackup noundofile shada=""')
