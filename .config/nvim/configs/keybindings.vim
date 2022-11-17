" -.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.
" File Name : keybindings.vim
" Purpose :
" Creation Date : 2022-01-11
" Last Modified : 2022-01-11 11:33
" Created By : Njima1572
" ._._._._._._._._._._._._._._._._._._._._.

" Moving Chunks
" vnoremap N :m '>+1<CR>gv=gv
" vnoremap E :m '<-2<CR>gv=gv
" ----- Gina
" https://kitagry.github.io/blog/programmings/2020/09/gina-browse/ 

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
