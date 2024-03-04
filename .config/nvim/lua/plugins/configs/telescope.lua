local config  = function()
  local builtin = require('telescope.builtin')
  vim.keymap.set("n", "gh", builtin.lsp_references)
  vim.keymap.set("n", "gd", builtin.lsp_definitions)
  vim.keymap.set("n", "/", builtin.current_buffer_fuzzy_find)
  -- vim.keymap.set("n", "<Leader>h", builtin.diagnostics)
  vim.keymap.set("n", "<Leader>m", builtin.marks)
  vim.keymap.set("n", "<Leader>f", builtin.git_files)
  vim.keymap.set("n", "<Leader>s", builtin.live_grep)
  require('telescope').setup({
    borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
    defaults = {
      layout_config = {
        vertical = { width = 0.5 }
      },
      pickers = {
        find_files = {
          theme = "dropdown"
        }
      },
      mappings = {
        n = {},
        v = {},
        i = {
          -- ["<esc>"] = require('telescope.actions').close,
          -- ["<C-h>"] = require('telescope.actions').close,
        },
      },
    }
  })
end

return config
