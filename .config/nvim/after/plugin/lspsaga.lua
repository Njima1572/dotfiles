local saga = require 'lspsaga'

saga.setup({
  move_in_saga = {
    keybinds = {
      next = { '<C-n>', '<Down>' },
      prev = { '<C-e>', '<Up>' },
    }
  },
})

vim.keymap.set('n', "gh", "<cmd>Lspsaga lsp_finder<CR>")
vim.keymap.set('n', "gr", "<cmd>Lspsaga rename<CR>")
vim.keymap.set('n', "gd", "<cmd>Lspsaga goto_definition<CR>")
