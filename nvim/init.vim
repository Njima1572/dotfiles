" -.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.
" File Name : init.vim
" Purpose :
" Creation Date : 2021-01-15
" Last Modified : 2022-01-11 11:37
" Created By : Njima1572
" ._._._._._._._._._._._._._._._._._._._._.

"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

source ~/.config/nvim/configs/plugins.vim
source ~/.config/nvim/configs/basics.vim
source ~/.config/nvim/configs/functions.vim
source ~/.config/nvim/configs/keybindings.vim
" defx
source ~/.config/nvim/configs/defx_bindings.vim

" ------ Coc Stuff
let g:coc_global_extensions = ['coc-prettier', 'coc-omnisharp', 'coc-pyright', 'coc-rust-analyzer']


augroup vim
  autocmd!
  source ~/.config/nvim/configs/languages/vim.vim
  "autocmd bufnewfile *.vim call GenerateHeader('vim')
  autocmd Bufwritepre,filewritepre *.vim call UpdateHeader()
  autocmd bufwritepost,filewritepost *.vim execute 'normal `a'
augroup END


augroup cpp
  autocmd!
  source ~/.config/nvim/configs/languages/cpp.vim
  autocmd BufWritePost *.cpp,*.h ClangFormat
augroup END

augroup js
  autocmd!
  source ~/.config/nvim/configs/languages/js.vim
  autocmd FileType typescript :set makeprg=tsc
  autocmd BufNewFile,BufRead *.ts,*.tsx,*.jsx set filetype=typescriptreact
  autocmd BufNewFile,BufRead *.vue set filetype=vue
  autocmd BufWritePost *.vue,*.js,*.jsx,*.ts,*.tsx PrettierAsync
augroup END

augroup rust
  autocmd!
  source ~/.config/nvim/configs/languages/rust.vim
  autocmd BufWritePost *.rs RustFmt
augroup END
