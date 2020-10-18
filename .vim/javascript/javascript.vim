command! ReactClass call s:react_class()
command! ReactFunction call s:react_function()

function! s:react_class()
  r~/.vim/javascript/react_class_template.js
endfunction

function! s:react_function()
  r~/.vim/javascript/react_function_template.js
endfunction
