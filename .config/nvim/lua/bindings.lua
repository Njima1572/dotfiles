local function _map(mode, shortcut, command)
  vim.api.nvim_set_keymap(mode, shortcut, command, { noremap = true, silent = true })
end

local function map(shortcut, command)
  _map('', shortcut, command)
end

local function nmap(shortcut, command)
  _map('n', shortcut, command)
end

local function imap(shortcut, command)
  _map('i', shortcut, command)
end

local function vmap(shortcut, command)
  _map('v', shortcut, command)
end

-- Xmap is a select mode mapping ()
local function xmap(shortcut, command)
  _map('x', shortcut, command)
end

local function tmap(shortcut, command)
  _map('t', shortcut, command)
end

-- Colemak version of jj <Esc>
imap('xx', '<Esc>')

---- Full colemak remap
-- map('q', 'q')
-- map('w', 'w')
-- map('e', 'f')
-- map('r', 'p')
-- map('t', 'g')
-- map('y', 'j')
-- map('u', 'l')
-- map('i', 'u')
-- map('o', 'y')
-- map('p', ';')
-- map('a', 'a')
-- map('s', 'r')
-- map('d', 's')
-- map('f', 't')
-- map('g', 'd')
-- map('h', 'h')
-- map('j', 'n')
-- map('k', 'e')
-- map('l', 'i')
-- map(';', 'o')
-- map('z', 'z')
-- map('x', 'x')
-- map('c', 'c')
-- map('b', 'b')
-- map('n', 'k')
-- map('m', 'm')

---- Colemak remapping to use qwerty hjkl
map('n', 'j')
map('e', 'k')
map('n', 'gj')
map('e', 'gk')
map('i', 'l')

map('k', 'n')
map('l', 'i')
map('N', 'J')
map('E', 'K')
map('I', 'L')
map('K', 'N')
map('L', 'I')

-- Tab move
nmap('<S-i>', ':bn<CR>')
nmap('<S-h>', ':bp<CR>')

-- inserting actual tab instead of expanded tab
imap('<S-Tab>', '<C-Q><Tab>')
nmap('Y', 'y$')

imap(',', ',<c-g>U')
imap('.', '.<c-g>U')
imap('!', '!<c-g>U')
imap('?', '?<c-g>U')

nmap('<F5>', ':source ~/.config/nvim/init.lua<CR>:noh<CR>:echo "Refreshed config!"<CR>')
nmap('<leader>.', ':e ~/.config/nvim/init.lua<CR>')
nmap('<leader>i', ':e ~/.config/sway/config<CR>')
nmap('<leader>,', ':e ~/.config/fish/config.fish<CR>')


nmap('<Esc><Esc>', ':nohl<CR>')
map('<C-z>', '<Nop>')
nmap('<Leader><Leader>', ':w<CR>')
nmap('<Leader><Leader><Leader>', ':wq<CR>')
nmap('<Leader><Leader><Leader>', ':wq<CR>')

----- Disable arrow keys
imap('<Left>', '<Nop>')
imap('<Up>', '<Nop>')
imap('<Down>', '<Nop>')
imap('<Right>', '<Nop>')

nmap('<Left>', ':vertical resize +5<CR>')
nmap('<Up>', ':resize -5<CR>')
nmap('<Down>', ':resize +5<CR>')
nmap('<Right>', ':vertical resize -5<CR>')

map('<C-z>', '<Nop>')
map('<C-l>', '<C-i>')

nmap('<C-e>', '<Nop>')
nmap('<C-h>', '<Nop>')
nmap('<C-n>', '<Nop>')
nmap('<C-i>', '<Nop>')

nmap('<C-h>', ':wincmd h<CR>')
nmap('<C-n>', ':wincmd j<CR>')
nmap('<C-e>', ':wincmd k<CR>')
nmap('<C-i>', ':wincmd l<CR>')

nmap('<S-n>', '}')
nmap('<S-e>', '{')

nmap('<Leader>=', '<C-w>=')

----- Execute shell in vim and paste it
vmap('<Leader><CR>', ':!sh<CR>')
nmap('<Leader><CR>', 'V:!sh<CR>')

----- Buffers
-- noremap <Leader>b :ls<CR>:b
map('<Leader>c', '<C-w>o')
map('<Leader>x', ':bd<CR>')

nmap('<Leader>=', '<C-w>=')

----- Tabs
nmap('<C-t>', ':tabnew<CR>')
nmap("<C-Tab>", ':tabnext<CR>')
nmap("<C-S-Tab>", ':tabp<CR>')


-- nmap('<C-w>', ':bd!<CR>')
tmap('<C-x>', '<C-\\><C-N>')

xmap("<leader>p", '"_dP')

nmap("<leader>y", '"+y"')
vmap("<leader>y", '"+y"')
nmap("<leader>Y", '"+Y"')

vmap("<S-n>", ":m '>+1<CR>gv=gv")
vmap("<S-e>", ":m '<-2<CR>gv=gv")

--- NvTerm
-- nmap('<leader>t', ':lua require("nvterm.terminal").toggle("float") <CR>')
