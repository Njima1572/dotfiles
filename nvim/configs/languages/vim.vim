" -.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.
" File Name : vim.vim
" Purpose :
" Creation Date : 2022-01-11
" Last Modified : 2022-01-11 12:15
" Created By : Njima1572
" ._._._._._._._._._._._._._._._._._._._._.

"source ~/.config/nvim/configs/languages/vim.vim
"autocmd bufnewfile *.vim call GenerateHeader('vim')
autocmd Bufwritepre,filewritepre vim call UpdateHeader()
autocmd bufwritepost,filewritepost vim execute 'normal `a'
