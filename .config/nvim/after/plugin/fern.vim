let g:fern#disable_default_mappings=1
let g:fern#default_hidden=1
let g:fern#drawer_keep=v:true

noremap <silent><Leader>o :Fern .<CR>
noremap <silent><Leader>O :Fern %:h<CR>
noremap <silent><Leader>v :Fern . -drawer -toggle<CR>
noremap <silent><Leader>V :Fern %:h -drawer<CR>
noremap <silent><Leader>= <C-w>=

autocmd FileType fern call s:init_fern()
function! s:init_fern() abort
  nnoremap <buffer><silent>
        \ <Plug>(fern-my-enter-project-root)
        \ :<-u>call fern#helper#call(funcref('<SID>map_enter_project_root'))<CR>
  nmap <buffer><expr><silent>
        \ ^,
        \fern#smart#scheme(
        \ "^",
        \     {
        \       'file': "\<Plug>(fern-my-enter-project-root)",
        \     }
        \)
  nmap <buffer><nowait> i <Nop>
  nmap <buffer><buffer><nowait> <Return> <Plug>(fern-action-open-or-enter)
  nmap <buffer><nowait> o <Plug>(fern-action-open-or-enter)<CR>
  nmap <buffer><nowait> i <Plug>(fern-action-open)<CR>
  nmap <buffer><nowait> I <Plug>(fern-action-open:side)<CR>
  nmap <buffer><nowait> , <Plug>(fern-action-hidden:toggle)<CR>
  nmap <buffer><nowait> h <Plug>(fern-action-leave)<CR>
  nmap <buffer><nowait> k <Plug>(fern-action-new-file)<CR>
  nmap <buffer><nowait> K <Plug>(fern-action-new-dir)<CR>
endfunction

function! s:map_enter_Project_root(helper) abort
  " NOTE: require 'file' scheme
  let root = a:helper.get_root_node()
  let path = root._path
  let path = finddir('.git/..', path, ';')
  execute printf('Fern %s', fnameescape(path))
  
endfunction
