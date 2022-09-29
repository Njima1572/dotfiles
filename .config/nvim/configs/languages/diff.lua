
-- Checks if the line was added or removed
-- Checks for + / - at the start of the line
-- If added, then it returns 1,
-- If removed then it returns -1,
-- If neither, it returns 0
function _G.check_added_or_removed()
  print("HI")
  local first_char = vim.api.nvim_win_get_cursor(0)
  -- print("FIRSTCHAR: ", first_char)
  return first_char[0]
end


vim.api.nvim_set_keymap('i', '<<', 'v:lua.check_added_or_removed() ', {expr = true, noremap = true})
-- vim.api.nvim_set_keymap('v', '<<', 'r ', {expr = false, noremap = true})
