
call plug#begin('~/.config/nvim/plugged')
Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

" ------ Coc Stuff
let g:coc_global_extensions = [
      \'coc-prettier', 
      \'coc-pyright', 
      \'coc-omnisharp', 
      \'coc-rust-analyzer',
      \'coc-flutter',
      \'coc-snippets',
      \'coc-fish',
      \'coc-yaml',
      \'coc-json',
      \'coc-tsserver',
      \'coc-sh',
      \'coc-eslint',
      \'coc-css'
      \]
