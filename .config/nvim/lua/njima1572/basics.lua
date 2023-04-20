local set = vim.opt

vim.cmd('filetype plugin indent on')
vim.cmd 'colorscheme moonlight'
vim.g.mapleader = " "
vim.o.termguicolors = true

set.mouse = ''
set.exrc = true
set.relativenumber = true
set.hidden = true
set.swapfile = false
set.backup = false

set.tabstop = 2
set.shiftwidth = 2
set.softtabstop = 2
set.expandtab = true
set.listchars = { tab = '--' }

set.title = true
set.number = true
set.autoindent = true
set.smartindent = true
set.virtualedit = 'onemore'
set.scrolloff = 40
set.laststatus = 2
set.showcmd = true
set.foldmethod = 'marker'
set.hlsearch = true
set.wrapscan = true
set.errorbells = false
set.incsearch = true
set.undofile = true
set.undodir = os.getenv("HOME") .. '/.vim/undo'

set.cursorline = true
set.cursorcolumn = true

vim.cmd 'hi CursorLine ctermbg=7 guibg=#414863'
