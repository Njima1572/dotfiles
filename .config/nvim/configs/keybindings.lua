-- -.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.
-- File Name : keybindings.vim
-- Purpose :
-- Creation Date : 2022-01-11
-- Last Modified : 2022-01-11 11:33
-- Created By : Njima1572
-- ._._._._._._._._._._._._._._._._._._._._.
-- Colemak version of jj <Esc>
-- imap xx <Esc>
imap('xx', '<Esc>')
-- 
-- " ---- Colemak remapping to use qwerty hjkl
map('n', 'j')
map('e', 'k')
map('n', 'gj')
map('e', 'gk')
map('i', 'l')
-- 
map('k', 'n')
map('l', 'i')
map('N', 'J')
map('E', 'K')
map('I', 'L')
map('K', 'N')
map('L', 'I')
-- 
tmap('<C-e>', '<C-p>')
-- 
-- " Tab move
nmap('<S-i>', ':bn<CR>')
nmap('<S-h>', ':bp<CR>')
-- 
-- 
-- " inserting actual tab instead of expanded tab
-- imap <S-Tab> <C-Q><Tab>
nmap('Y', 'y$')
-- 
imap(',', ',<c-g>U')
imap('.', '.<c-g>U')
imap('!', '!<c-g>U')
imap('?', '?<c-g>U')
-- 
-- " Moving Chunks
-- " vnoremap N :m '>+1<CR>gv=gv
-- " vnoremap E :m '<-2<CR>gv=gv
-- 
nmap('<F5>', ':source ~/.config/nvim/init.lua<CR>:noh<CR>:echo "Refreshed config!"<CR>')
-- 
nmap('<Esc><Esc>', ':nohl<CR>')
map('<C-z>', '<Nop>')
nmap('<Leader><Leader>', ':w<CR>')
nmap('<Leader><Leader><Leader>', ':wq<CR>')
-- 
-- "----- Disable arrow keys
imap('<Left>', '<Nop>')
imap('<Up>', '<Nop>')
imap('<Down>', '<Nop>')
imap('<Right>', '<Nop>')
-- 
nmap('<Left>', ':vertical resize +5<CR>')
nmap('<Up>', ':resize -5<CR>')
nmap('<Down>', ':resize +5<CR>')
nmap('<Right>', ':vertical resize -5<CR>')
-- 
-- 
nmap('<C-h>', ':wincmd h<CR>')
nmap('<C-n>', ':wincmd j<CR>')
nmap('<C-e>', ':wincmd k<CR>')
nmap('<C-i>', ':wincmd l<CR>')
-- 
-- 
-- " ~/.vimrc
nmap('<Leader>.', ':tabe ~/.config/nvim/init.lua<CR>')
nmap('<Leader>i', ':tabe ~/.config/sway/config<CR>')
-- 
-- " ----- Execute shell in vim and paste it
vmap('<Leader><CR>', ':!sh<CR>')
nmap('<Leader><CR>', 'V:!sh<CR>')

-- 
-- "----- Buffers
-- set hidden
-- "noremap <Leader>b :ls<CR>:b 
nmap('<Leader>x', ':bd<CR>')
-- 
-- 
-- "noremap <Leader>h :split .<CR>
nmap('<Leader>=', '<C-w>=')
-- 
-- " ------ Undotree
nmap('<leader>u', ':UndotreeToggle<CR>')
-- 
-- ""----- Easymotion
map(',', '<Plug>(easymotion-prefix)')
-- 
-- " ----- Git
nmap('<leader>gs', ':G<CR>')
-- 
-- " ----- Gina
-- " https://kitagry.github.io/blog/programmings/2020/09/gina-browse/ 
-- 
-- " ripgrep
rg_command = 'rg --vimgrep -S'
-- let g:rg_command = 'rg --vimgrep -S'
vim.api.nvim_create_user_command('GitRootRg', 'cd '..os.execute('git rev-parse --show-cdup')..' Rg', {})
vim.api.nvim_create_user_command('GitRootFileRg', 'cd '..os.execute('git rev-parse --show-cdup')..' GFiles', {})
-- command! GitRootRg execute 'cd '.system('git rev-parse --show-cdup') 'Rg'
-- command! GitRootFileRg execute 'cd '.system('git rev-parse --show-cdup') 'GFiles'

if os.execute('git rev-parse --is-inside-work-tree') == 'true' then
  nmap('<Leader>s', ':GitRootRg<CR>')
  nmap('<Leader>f', ':GitRootFileRg<CR>')
else
  nmap('<Leader>s', ':Rg<CR>')
  nmap('<Leader>f', ':Files<CR>')
end

-- if system('git rev-parse --is-inside-work-tree') == 'true'
--   nnoremap <silent> <Leader>s :GitRootRg<CR>
--   nnoremap <silent> <Leader>f :GitRootFileRg<CR>
-- else
--   nnoremap <silent> <Leader>s :Rg<CR>
--   nnoremap <silent> <Leader>f :Files<CR>
-- endif
-- 
nmap('<Leader>b', ':Buffers<CR>')
nmap('/', ':BLines<CR>')
nmap('<CR>', ':lua vim.lsp.buf.formatting()<CR>')
-- 
-- " ESKK
imap('xz', '<Plug>(eskk:toggle)')
cmap('xz', '<Plug>(eskk:toggle)')
