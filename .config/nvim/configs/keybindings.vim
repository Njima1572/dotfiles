" -.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.
" File Name : keybindings.vim
" Purpose :
" Creation Date : 2022-01-11
" Last Modified : 2022-01-11 11:33
" Created By : Njima1572
" ._._._._._._._._._._._._._._._._._._._._.
" Colemak version of jj <Esc>
imap xx <Esc>

" ---- Colemak remapping to use qwerty hjkl
noremap n j
noremap e k
noremap n gj
noremap e gk
noremap i l

noremap k n
noremap l i
noremap N J
noremap E K
noremap I L
noremap K N
noremap L I

tnoremap <C-e> <C-p>

" Tab move
nnoremap <silent> <S-i> :bn<CR>
nnoremap <silent> <S-h> :bp<CR>


" inserting actual tab instead of expanded tab
inoremap <S-Tab> <C-Q><Tab>
nnoremap Y y$

inoremap , ,<c-g>U
inoremap . .<c-g>U
inoremap ! !<c-g>U
inoremap ? ?<c-g>U

" Moving Chunks
" vnoremap N :m '>+1<CR>gv=gv
" vnoremap E :m '<-2<CR>gv=gv

noremap <silent> <F5> :source ~/.config/nvim/init.vim<CR>:noh<CR>:echo "Refreshed config!"<CR>

noremap <Esc><Esc> :nohl<CR>
map <C-z> <Nop>
noremap <Leader><Leader> :w<CR>
noremap <Leader><Leader><Leader> :wq<CR>

"----- Disable arrow keys
inoremap <Left> <Nop>
inoremap <Up> <Nop>
inoremap <Down> <Nop>
inoremap <Right> <Nop>

nnoremap <silent> <Left> :vertical resize +5<CR>
nnoremap <silent> <Up> :resize -5<CR>
nnoremap <silent> <Down> :resize +5<CR>
nnoremap <silent> <Right> :vertical resize -5<CR>

noremap <C-z> <Nop>


nmap <silent> <C-h> :wincmd h<CR>
nmap <silent> <C-n> :wincmd j<CR>
nmap <silent> <C-e> :wincmd k<CR>
nmap <silent> <C-i> :wincmd l<CR>


" ~/.vimrc
noremap <Leader>. :tabe ~/.config/nvim/init.vim<CR>
noremap <Leader>t :tabe ~/.tmux.conf<CR>
noremap <Leader>i :tabe ~/.config/sway/config<CR>

" ----- Execute shell in vim and paste it
vnoremap <Leader><CR> :!sh<CR>
nnoremap <Leader><CR> V:!sh<CR>
nnoremap <Leader>c command! -nargs=1 Nf call CreateAndStartEdit(<q-args>)

"----- Buffers
set hidden
" noremap <Leader>b :ls<CR>:b 
noremap <Leader>x :bd<CR>


noremap <Leader>o :Defx<CR>
noremap <Leader>v :vs +Defx<CR>:vertical resize 30<CR>
noremap <Leader>h :sp +Defx<CR>
"noremap <Leader>h :split .<CR>
noremap <Leader>= <C-w>=

" ------ Undotree
nnoremap <leader>u :UndotreeToggle<CR>

""----- Easymotion
map , <Plug>(easymotion-prefix)

" ----- Defx Config
"noremap <Leader>o :e .<CR>
"noremap <Leader>v :vs .<CR> :vertical resize 30<CR>
"noremap <Leader>h :split .<CR>
noremap <Leader>= <C-w>=

" ----- Git
nmap <leader>gs :G<CR>

" ripgrep
let g:rg_command = 'rg --vimgrep -S'
command! GitRootRg execute 'cd '.system('git rev-parse --show-cdup') 'Rg'
command! GitRootFileRg execute 'cd '.system('git rev-parse --show-cdup') 'GFiles'
if system('git rev-parse --is-inside-work-tree') == 'true'
  nnoremap <silent> <Leader>s :GitRootRg<CR>
  nnoremap <silent> <Leader>f :GitRootFileRg<CR>
else
  nnoremap <silent> <Leader>s :Rg<CR>
  nnoremap <silent> <Leader>f :Files<CR>
endif

" coc
"xmap <leader>a <Plug>(coc-codeaction-line)
"nmap <leader>a <Plug>(coc-codeaction-line)
"
"nmap <silent> gd <Plug>(coc-definition)
"nmap <silent> gr <Plug>(coc-references)


nnoremap <silent> / :BLines<CR>
nnoremap <CR> <cmd> lua vim.lsp.buf.formatting()<CR>
