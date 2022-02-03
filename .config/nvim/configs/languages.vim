
augroup filetypedetect
  au BufRead,BufNewFile *.dockerfile,Dockerfile.* setfiletype dockerfile
augroup END

augroup dart
  autocmd! 
  source ~/.config/nvim/configs/languages/dart.lua
augroup END
