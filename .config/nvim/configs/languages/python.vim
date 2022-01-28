autocmd bufnewfile python call GenerateHeader('py')
autocmd Bufwritepre,filewritepre python call UpdateHeader()
autocmd bufwritepost,filewritepost python execute 'normal `a'
