set nu 
syntax on 
set incsearch
set virtualedit=onemore
set undofile
set title
set autoindent
set smartindent
set cursorline
set cursorcolumn
set showcmd
set wrapscan
set hlsearch
set scrolloff=999

noremap n j
noremap e k
noremap i l
noremap N }
noremap E {
noremap K N
noremap I L
noremap l i

noremap k n
noremap <Space><Space> :w<CR> 
noremap <Space><Space><Space> :wq<CR> 

inoremap xx <Esc>


" Vim color file Toast - modified
" URL: https://github.com/jsit/toast.vim

" Grays {{{

if &background == "light"
  let s:white = ["#f1f2ea", 231]
  let s:black = ["#323434", 16]

  let s:lightgray       = ["#eae8e1", 188]
  let s:mediumlightgray = ["#e4e2d8", 188]
  let s:mediumgray      = ["#7f7757", 101]
  let s:mediumdarkgray  = ["#4f4a36", 52]
  let s:darkgray        = ["#423e2e", 16]

  let s:grayone=s:lightgray
  let s:graytwo=s:mediumlightgray
  let s:graythree=s:mediumdarkgray
  let s:grayfour=s:mediumdarkgray

  let s:fg=s:black
  let s:bg=s:white
else " &background == 'dark'
  let s:white = ["#c3d2df", 188]
  let s:black = ["#17222b", 234]

  let s:lightgray       = ["#b9cbda", 152]
  let s:mediumlightgray = ["#acc1d3", 146]
  let s:mediumgray      = ["#547d9c", 242]
  let s:mediumdarkgray  = ["#253846", 236]
  let s:darkgray        = ["#1e2d38", 235]

  let s:grayone=s:darkgray
  let s:graytwo=s:mediumdarkgray
  let s:graythree=s:mediumlightgray
  let s:grayfour=s:lightgray

  let s:fg=s:white
  let s:bg=s:black
endif

let s:graymid=s:mediumgray

" }}}

" Colors {{{

" Terminal Colors {{{
if has('nvim')
  let g:terminal_color_1  = "#D12D00"
  let g:terminal_color_2  = "#427B00"
  let g:terminal_color_3  = "#B68200"
  let g:terminal_color_4  = "#006fd1"
  let g:terminal_color_5  = "#a53bce"
  let g:terminal_color_6  = "#119c97"
  let g:terminal_color_9  = "#E74D23"
  let g:terminal_color_10 = "#7dc030"
  let g:terminal_color_11 = "#ffc233"
  let g:terminal_color_12 = "#5aa2e0"
  let g:terminal_color_13 = "#b968d9"
  let g:terminal_color_14 = "#15c1bb"

  if &background == "light"
    let g:terminal_color_0  = "#323434"
    let g:terminal_color_7  = "#e4e2d8"
    let g:terminal_color_8  = "#4f4a36"
    let g:terminal_color_15 = "#f4f3ef"
  else " &background == 'dark'
    let g:terminal_color_0  = "#1e2d38"
    let g:terminal_color_7  = "#acc1d3"
    let g:terminal_color_8  = "#253846"
    let g:terminal_color_15 = "#b9cbda"
  endif
else
  let g:terminal_ansi_colors = repeat([0], 16)
  let g:terminal_ansi_colors[1]  = "#D12D00"
  let g:terminal_ansi_colors[2]  = "#427B00"
  let g:terminal_ansi_colors[3]  = "#B68200"
  let g:terminal_ansi_colors[4]  = "#006fd1"
  let g:terminal_ansi_colors[5]  = "#a53bce"
  let g:terminal_ansi_colors[6]  = "#119c97"
  let g:terminal_ansi_colors[9]  = "#E74D23"
  let g:terminal_ansi_colors[10] = "#7dc030"
  let g:terminal_ansi_colors[11] = "#ffc233"
  let g:terminal_ansi_colors[12] = "#5aa2e0"
  let g:terminal_ansi_colors[13] = "#b968d9"
  let g:terminal_ansi_colors[14] = "#15c1bb"

  if &background == "light"
    let g:terminal_ansi_colors[0]  = "#323434"
    let g:terminal_ansi_colors[7]  = "#e4e2d8"
    let g:terminal_ansi_colors[8]  = "#4f4a36"
    let g:terminal_ansi_colors[15] = "#f4f3ef"
  else " &background == 'dark'
    let g:terminal_ansi_colors[0]  = "#1e2d38"
    let g:terminal_ansi_colors[7]  = "#acc1d3"
    let g:terminal_ansi_colors[8]  = "#253846"
    let g:terminal_ansi_colors[15] = "#b9cbda"
  endif
endif
" }}}

let s:darkyellow  = ["#B68200", 136]
let s:darkgreen   = ["#427B00", 28]
let s:darkcyan    = ["#119c97", 36]
let s:darkblue    = ["#006fd1", 26]
let s:darkmagenta = ["#a53bce", 128]
let s:darkred     = ["#D12D00", 160]
let s:lightyellow  = ["#ffc233", 214]
let s:lightgreen   = ["#7dc030", 106]
let s:lightcyan    = ["#15c1bb", 37]
let s:lightblue    = ["#5aa2e0", 74]
let s:lightmagenta = ["#b968d9", 134]
let s:lightred     = ["#E74D23", 166]

if &background == "light"
  let s:yellow  = s:darkyellow
  let s:green   = s:darkgreen
  let s:cyan    = s:darkcyan
  let s:blue    = s:darkblue
  let s:magenta = s:darkmagenta
  let s:red     = s:darkred
  let s:altyellow  = s:lightyellow
  let s:altgreen   = s:lightgreen
  let s:altcyan    = s:lightcyan
  let s:altblue    = s:lightblue
  let s:altmagenta = s:lightmagenta
  let s:altred     = s:lightred
else " &background == 'dark'
  let s:yellow  = s:lightyellow
  let s:green   = s:lightgreen
  let s:cyan    = s:lightcyan
  let s:blue    = s:lightblue
  let s:magenta = s:lightmagenta
  let s:red     = s:lightred
  let s:altyellow  = s:darkyellow
  let s:altgreen   = s:darkgreen
  let s:altcyan    = s:darkcyan
  let s:altblue    = s:darkblue
  let s:altmagenta = s:darkmagenta
  let s:altred     = s:darkred
endif

" }}}

" References {{{

let s:truered     = s:red
let s:truegreen   = s:green
let s:trueyellow  = ["#ffc233", 214]
let s:trueblue    = s:blue
let s:truemagenta = s:magenta
let s:truecyan    = s:cyan

if &background == "light"
  let s:constant   = s:red
  let s:identifier = s:yellow
  let s:statement  = s:blue
  let s:preproc    = s:magenta
  let s:type       = s:green
  let s:special    = s:cyan
else " &background == 'dark'
  let s:constant   = s:red
  let s:identifier = s:yellow
  let s:statement  = s:cyan
  let s:preproc    = s:magenta
  let s:special    = s:green
  let s:type       = s:blue
endif

let s:none = ["NONE", "NONE"]

" }}}

" }}}

"
" Everthing from this point forward can probably be ignored
"

" Setup {{{

hi clear
syntax on

let g:colors_name = "toast"

if exists("syntax_on")
  syntax reset
endif

" }}}

" Highlight shorthand {{{
" From chriskempson/vim-tomorrow-theme
function! s:hl(...)
  if len(a:000) > 1 && len(a:2) > 0
    exec "hi " . a:1 . " guifg=" . a:2[0] . " ctermfg=" . a:2[1]
  endif
  if len(a:000) > 2 && len(a:3) > 0
    exec "hi " . a:1 . " guibg=" . a:3[0] . " ctermbg=" . a:3[1]
  endif
  if len(a:000) > 3 && a:4 != ""
    exec "hi " . a:1 . " gui=" . a:4 . " cterm=" . a:4
  endif
endfunction
" }}}

" UI {{{

call s:hl("ColorColumn", s:none, s:none)
call s:hl("CursorColumn", [], s:grayone)
call s:hl("CursorLine", [], s:grayone, "NONE")
call s:hl("Conceal", [])
call s:hl("Cursor", s:none, s:none, "reverse")
call s:hl("CursorIM", [], [], "")
call s:hl("CursorLineNr", s:graymid, s:grayone, "NONE")
call s:hl("Directory", s:blue)
call s:hl("DiffAdd", s:green, s:white, "reverse")
call s:hl("DiffDelete", s:red, s:white, "reverse")
call s:hl("DiffChange", s:altmagenta, s:white, "reverse")
call s:hl("DiffText", s:magenta, s:white, "reverse")
exec "hi link EndOfBuffer NonText"
call s:hl("ErrorMsg", s:white, s:truered)
call s:hl("VertSplit", s:bg, s:graytwo, "reverse")
call s:hl("Folded", s:none, s:grayone)
call s:hl("FoldColumn", s:yellow, s:bg)
call s:hl("SignColumn", s:none, s:bg)
call s:hl("IncSearch", s:trueyellow, '', "reverse")
call s:hl("LineNr", s:graymid)
call s:hl("MatchParen", s:cyan, s:bg)
call s:hl("ModeMsg", s:green)
call s:hl("Error", s:truered, s:white, "reverse")
call s:hl("Ignore", s:grayone)
call s:hl("InfoPopup", s:fg, s:grayone)
call s:hl("MoreMsg", s:green)
call s:hl("NonText", s:graytwo)
call s:hl("Normal", s:fg, s:bg)
call s:hl("NvimInternalError", s:red, s:red)
call s:hl("PMenu", s:graymid, s:grayone)
call s:hl("PMenuSbar", s:fg, s:grayone)
call s:hl("PMenuSel", s:fg, s:graytwo)
call s:hl("PMenuThumb", s:fg, s:grayone)
call s:hl("Question", s:green)
call s:hl("RedrawDebugClear", s:fg, s:yellow)
call s:hl("RedrawDebugComposed", s:fg, s:green)
call s:hl("RedrawDebugRecompose", s:fg, s:red)
call s:hl("Search", s:trueyellow, s:black, "reverse")
call s:hl("SpecialKey", s:blue)
call s:hl("SpellBad", s:truered, s:white, "reverse")
call s:hl("SpellCap", s:truered, s:white, "reverse")
call s:hl("SpellLocal", s:truered, s:white, "reverse")
call s:hl("SpellRare", s:truered, s:white, "reverse")
call s:hl("StatusLine", s:graymid, s:grayone, "reverse")
call s:hl("StatusLineNC", s:grayone, s:graymid, "reverse,underline")
call s:hl("StatusLineTerm", s:green, s:none, "reverse")
call s:hl("StatusLineTermNC", s:green, s:none, "reverse")
call s:hl("TabLine", s:graymid, s:grayone)
call s:hl("TabLineFill", s:grayone, s:grayone)
exec "hi TabLineSel gui='NONE'"
call s:hl("Title", s:magenta)
call s:hl("Todo", s:yellow, s:none, "reverse")
call s:hl("ToolbarButton", s:fg, s:graythree, "NONE")
call s:hl("ToolbarLine", "", s:grayone)
exec "hi Underlined gui='underline'"
call s:hl("Visual", [], s:graytwo)
call s:hl("VisualNOS", s:graytwo)
call s:hl("WarningMsg", s:red, s:none)
call s:hl("WildMenu", s:green, s:grayone)

" }}}

" Group Names (:h group-name) {{{

call s:hl("Comment", s:graymid, "")

call s:hl("Constant", s:constant)
hi link String Constant
hi link Character Constant
hi link Number Constant
hi link Boolean Constant
hi link Float Constant

call s:hl("Identifier", s:identifier, [], "NONE")
hi link Function Identifier

call s:hl("Statement", s:statement, "", "NONE")
hi link Conditional Statement
hi link Repeat Statement
hi link Label Statement
hi link Operator Statement
hi link Keyword Statement
hi link Exception Statement

call s:hl("PreProc", s:preproc)
hi link Include PreProc
hi link Define PreProc
hi link Macro PreProc
hi link PreCondit PreProc

call s:hl("Type", s:type, "", "NONE")
hi link StorageClass Type
hi link Structure Type
hi link Typedef Type

call s:hl("Special", s:special)
hi link SpecialChar Special
hi link Tag Special
hi link Delimiter Special
hi link SpecialComment Special
hi link Debug Special

" End Group Names }}}

" ex: set tabstop=2 expandtab nolist foldmethod=marker:
