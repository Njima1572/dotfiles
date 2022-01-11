augroup python
  autocmd!
  "autocmd bufnewfile *.py call GenerateHeader('py')
  "autocmd Bufwritepre,filewritepre *.py call UpdateHeader()
  "autocmd bufwritepost,filewritepost *.py execute 'normal `a'
augroup END
