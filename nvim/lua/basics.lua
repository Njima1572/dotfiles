local set = vim.opt

set.number = true
set.hidden = true

set.exrc         = true
set.backup       = false
set.title        = true
set.autoindent   = true
set.smartindent  = true
set.cursorline   = true
set.cursorcolumn = true
set.showcmd      = true
set.virtualedit  = 'onemore'
set.hlsearch     = true
set.wrapscan     = true
set.incsearch    = true
set.errorbells   = false
set.swapfile     = false
set.scrolloff    = 20
set.mouse        = ''

set.undofile = true
set.undodir = os.getenv('HOME') .. '/.vim/undo'

set.foldmethod = 'marker'

----- Tab stuff
set.tabstop = 2
set.shiftwidth = 2
set.softtabstop = 2
set.expandtab = true

set.listchars = { tab = '--' }

vim.cmd 'hi CursorLine ctermbg=242 guibg=#414863'
