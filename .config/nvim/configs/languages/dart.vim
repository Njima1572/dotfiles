augroup Dart
  autocmd!
  au Filetype dart nnoremap K <Cmd>lua vim.lsp.buf.hover()<CR>
  au Filetype dart nnoremap gd <Cmd>lua vim.lsp.buf.definition()<CR>
  au Filetype dart nnoremap <leader>ca <Cmd>lua vim.lsp.buf.code_action()<CR>
  au Filetype dart xnoremap <leader>ca <Cmd>lua vim.lsp.buf.range_code_action()<CR>
  au Filetype dart nnoremap <leader>z :FlutterOutlineToggle<CR>
augroup end
