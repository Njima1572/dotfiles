
augroup filetypedetect
  au BufRead,BufNewFile *.dockerfile,Dockerfile.* setfiletype dockerfile
augroup END

augroup dart
  autocmd! 
  source ~/.config/nvim/configs/languages/dart.vim
augroup END

augroup diff
  autocmd!
  source ~/.config/nvim/configs/languages/diff.lua
augroup END
