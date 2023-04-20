--  -.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.
--  File Name : functions.vim
--  Purpose :
--  Creation Date : 2022-01-11
--  Last Modified : 2022-01-11 11:36
--  Created By : Njima1572
--  ._._._._._._._._._._._._._._._._._._._._.
-- function CreateAndStartEdit(filename)
--   echom a:filename
--   execute "e " .expand("%:h") . "/" . a:filename
-- endfunction
--
-- " function GenerateHeader(filetype)
-- "   if a:filetype == 'vim'
-- "     r$HOME/.config/nvim/header_template/header_template.vim
-- "     exec setline(0, '')
-- "   elseif a:filetype == 'py'
-- "     r$HOME/.config/nvim/header_template/header_template.vim
-- "     exec setline(0, '')
-- "   endif
-- "   exe '1,' . 8 . 'g/File Name :.*/s//File Name : ' .expand('%')
-- "   exe '1,' . 8 . 'g/Creation Date :.*/s//Creation Date : ' .strftime('%Y-%m-%d %H:%M')
-- " endfunction
--
-- function UpdateHeader()
--   execute 'normal ma'
--   exe '1,' . 8 . 'g/Last Modified :.*/s/Last Modified :.*/Last Modified : ' .strftime('%Y-%m-%d %H:%M')
--   exe '1,' . 8 . 'g/Created By :.*/s/Created By :.*/Created By : Njima1572'
--
-- endfunction

local function _map(mode, shortcut, command)
  vim.api.nvim_set_keymap(mode, shortcut, command, { noremap = true, silent = true })
end

function map(shortcut, command)
  _map('', shortcut, command)
end

function nmap(shortcut, command)
  _map('n', shortcut, command)
end

function imap(shortcut, command)
  _map('i', shortcut, command)
end

function vmap(shortcut, command)
  _map('v', shortcut, command)
end

function xmap(shortcut, command)
  _map('x', shortcut, command)
end

function cmap(shortcut, command)
  _map('c', shortcut, command)
end

function tmap(shortcut, command)
  _map('t', shortcut, command)
end
