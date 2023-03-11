" GUI color definitions
if &background ==# 'light'
    " let s:bg           = '#ffffdd'
    let s:bg           = '#ffffea'
    " let s:bg1          = '#ffffb6'
    let s:bg1          = '#eeee9e'
    " let s:fg           = '#202224'
    let s:fg           = '#000000'
    let s:fg1          = '#61676d'
    let s:fg2          = '#e3e3c5'
    let s:green        = '#859900'
    let s:red          = '#dc322f'
    let s:blue         = '#268bd2'

    let s:b           = '#000000'
    let s:bl          = '#000000'
    let s:y           = '#000000'
    let s:r           = '#000000'
    let s:t           = '#000000'
    let s:n           = '#000000'
    let s:o           = '#000000'
    let s:g           = '#000000'
    let s:gr          = '#000000'
else
    " tomorrow
    " let s:bg           = '#1d1f21'
    " let s:bg1          = '#373b41'
    " let s:fg           = '#c5c8c6'
    " let s:fg1          = '#61676d'
    " let s:fg2          = '#282a2e'
    " let s:green        = '#b5bd68'
    " let s:red          = '#cc6666'
    " let s:blue         = '#81a2be'
    "
    " let s:b          = '#81a2be'
    " let s:y          = '#f0c674'
    " let s:r          = '#cc6666'
    " let s:t          = '#8abeb7'
    " let s:n          = '#b294bb'
    " let s:o          = '#de935f'
    " let s:g          = '#b5bd68'
    " let s:gr         = '#969896'

    " default dark
    let s:bg           = '#181818'
    let s:bg1          = '#383838'
    let s:fg           = '#d8d8d8'
    let s:fg1          = '#585858'
    let s:fg2          = '#282828'
    let s:green        = '#b5bd68'
    let s:red          = '#cc6666'
    let s:blue         = '#81a2be'

    " let s:b          = '#7cafc2'
    let s:bl          = '#7cafc2'
    let s:b          = '#d8d8d8' ""
    let s:y          = '#f7ca88'
    let s:r          = '#ab4642'
    let s:t          = '#86c1b9'
    " let s:t          = '#d8d8d8' ""
    let s:n          = '#ba8baf'
    let s:o          = '#dc9656'
    let s:g          = '#a1b56c'
    let s:gr         = '#969896'
"#181818"
"#282828"
"#383838"
"#585858"
"#b8b8b8"
"#d8d8d8"
"#e8e8e8"
"#f8f8f8"
"#ab4642"
"#dc9656"
"#f7ca88"
"#a1b56c"
"#86c1b9"
"#7cafc2"
"#ba8baf"
"#a16946"

endif

"#969896"
"#b4b7b4"
"#c5c8c6"
"#e0e0e0"
"#ffffff"
"#a3685a"

" Theme setup
hi clear
syntax reset
let g:colors_name = "acme"

" Highlighting function
" Optional variables are attributes and guisp
function! g:Base16hi(group, guifg, guibg, ctermfg, ctermbg, ...)
  let l:attr = get(a:, 1, "")
  let l:guisp = get(a:, 2, "")

  if a:guifg != ""
    exec "hi " . a:group . " guifg=" . a:guifg
  endif
  if a:guibg != ""
    exec "hi " . a:group . " guibg=" . a:guibg
  endif
  if a:ctermfg != ""
    exec "hi " . a:group . " ctermfg=" . a:ctermfg
  endif
  if a:ctermbg != ""
    exec "hi " . a:group . " ctermbg=" . a:ctermbg
  endif
  if l:attr != ""
    exec "hi " . a:group . " gui=" . l:attr . " cterm=" . l:attr
  endif
  if l:guisp != ""
    exec "hi " . a:group . " guisp=#" . l:guisp
  endif
endfunction


fun <sid>hi(group, guifg, guibg, ctermfg, ctermbg, attr, guisp)
  call g:Base16hi(a:group, a:guifg, a:guibg, a:ctermfg, a:ctermbg, a:attr, a:guisp)
endfun

" Vim editor colors
call <sid>hi("Normal",        s:fg, s:bg, "", "", "", "")
" call <sid>hi("NormalNC",      s:fg, s:fg2, "", "", "", "")
call <sid>hi("Bold",          "", "", "", "", "bold", "")
call <sid>hi("Debug",         s:fg, "", "", "", "", "")
call <sid>hi("Directory",     s:fg, "", "", "", "bold", "")
"---
call <sid>hi("Error",         s:fg, s:bg, "", "", "", "")
call <sid>hi("ErrorMsg",      s:fg, s:bg, "", "", "", "")
call <sid>hi("EndOfBuffer",   s:bg, "none", "", "", "", "")
call <sid>hi("Exception",     s:fg, "", "", "", "", "")
call <sid>hi("FoldColumn",    s:fg, s:bg, "", "", "", "")
call <sid>hi("Folded",        s:fg, s:bg, "", "", "", "")
"
call <sid>hi("IncSearch",     s:bg, s:fg, "", "", "none", "")
call <sid>hi("Italic",        "", "", "", "", "italic", "")
"---
call <sid>hi("Macro",         s:b, "", "", "", "", "")
"
call <sid>hi("MatchParen",    "", s:bg, "", "",  "bold", "")
"---
call <sid>hi("ModeMsg",       s:fg, "", "", "", "", "")
call <sid>hi("MoreMsg",       s:fg, "", "", "", "", "")
call <sid>hi("Question",      s:fg, "", "", "", "", "")
"
call <sid>hi("Search",        s:bg, s:fg, "", "",  "", "")
"---
call <sid>hi("Substitute",    s:fg, s:bg, "", "", "none", "")
call <sid>hi("SpecialKey",    s:fg, "", "", "", "", "")
call <sid>hi("TooLong",       s:fg, "", "", "", "", "")
call <sid>hi("Underlined",    s:fg, "", "", "", "", "")
"
call <sid>hi("Visual",        "", s:bg1, "", "", "", "")
"---
call <sid>hi("VisualNOS",     s:fg, "", "", "", "", "")
call <sid>hi("WarningMsg",    s:fg, "", "", "", "", "")
call <sid>hi("WildMenu",      s:fg, s:bg, "", "", "", "")
call <sid>hi("Title",         s:fg, "", "", "", "bold", "")
call <sid>hi("Conceal",       s:fg, s:bg, "", "", "", "")
"
call <sid>hi("Cursor",        s:bg, s:fg, "", "", "", "")
"---
call <sid>hi("NonText",       s:fg, "", "", "", "", "")
"
call <sid>hi("LineNr",        s:fg, "none", "", "", "", "")
call <sid>hi("LineNrAbove",   s:fg1, "none", "", "", "", "")
call <sid>hi("LineNrBelow",   s:fg1, "none", "", "", "", "")
call <sid>hi("SignColumn",    s:fg, "none", "", "", "", "")
call <sid>hi("StatusLine",    s:bg, s:bg, "", "", "none", "")
call <sid>hi("StatusLineNC",  s:fg, s:bg, "", "", "none", "")
call <sid>hi("VertSplit",     s:fg1, s:bg, "", "", "none", "")
"---
call <sid>hi("ColorColumn",   s:fg1, s:fg1, "",             "", "none", "")
call <sid>hi("CursorColumn",  "", s:bg, "",             "", "none", "")
call <sid>hi("CursorLine",    "", s:bg, "",             "", "none", "")
call <sid>hi("CursorLineNr",  s:fg, s:bg,            "", "", "", "")
call <sid>hi("QuickFixLine",  "",      s:bg, "",        "", "none", "")
"
call <sid>hi("PMenu",         s:fg, s:fg2, "", "", "none", "")
call <sid>hi("PMenuSel",      s:fg, s:bg1, "", "", "bold", "")
call <sid>hi("TabLine",       s:fg, s:fg2, "", "", "none", "")
call <sid>hi("TabLineFill",   s:fg, s:bg, "", "", "none", "")
call <sid>hi("TabLineSel",    s:fg, s:bg, "", "", "none", "")

" Standard syntax highlighting
call <sid>hi("Boolean",      s:fg, "", "", "", "", "")
call <sid>hi("Character",    s:fg, "", "", "", "", "")
call <sid>hi("Comment",      s:gr, "", "", "", "", "")
call <sid>hi("Conditional",  s:t, "", "", "", "", "")
call <sid>hi("Constant",     s:fg, "", "", "", "", "")
call <sid>hi("Define",       s:fg, "", "", "", "none", "")
call <sid>hi("Delimiter",    s:fg, "", "", "", "", "")
call <sid>hi("Float",        s:fg, "", "", "", "", "")
call <sid>hi("Function",     s:b, "", "", "", "none", "")
call <sid>hi("Identifier",   s:fg, "", "", "", "none", "")
call <sid>hi("Include",      s:t, "", "", "", "", "")
call <sid>hi("Keyword",      s:t, "", "", "", "", "")
call <sid>hi("Label",        s:fg, "", "", "", "", "")
call <sid>hi("Number",       s:o, "", "", "", "", "")
call <sid>hi("Operator",     s:fg, "", "", "", "none", "")
call <sid>hi("PreProc",      s:fg, "", "", "", "", "")
call <sid>hi("Repeat",       s:t, "", "", "", "", "")
call <sid>hi("Special",      s:t, "", "", "", "", "")
call <sid>hi("SpecialChar",  s:fg, "", "", "", "", "")
call <sid>hi("Statement",    s:fg, "", "", "", "", "")
call <sid>hi("StorageClass", s:fg, "", "", "", "", "")
call <sid>hi("String",       s:n, "", "", "", "", "")
call <sid>hi("Structure",    s:fg, "", "", "", "", "")
call <sid>hi("Tag",          s:fg, "", "", "", "", "")
call <sid>hi("Todo",         s:fg, s:bg, "", "", "", "")
call <sid>hi("Type",         s:bl, "", "", "", "none", "")
call <sid>hi("Typedef",      s:fg, "", "", "", "", "")

" Treesitter
call <sid>hi("@variable",      s:fg, "", "", "", "", "")
call <sid>hi("@property",      s:fg, "", "", "", "", "")
call <sid>hi("@punctuation",   s:fg, "", "", "", "", "")
call <sid>hi("@field",         s:fg, "", "", "", "", "")
call <sid>hi("@namespace",     s:g, "", "", "", "", "")
call <sid>hi("@parameter",     s:fg, "", "", "", "", "")
" call <sid>hi("@keyword.return",     s:r, "", "", "", "", "")
call <sid>hi("@method.call",   s:y, "", "", "", "", "")
call <sid>hi("@function.call", s:y, "", "", "", "", "")
call <sid>hi("@function",      s:y, "", "", "", "", "")

call <sid>hi("@field.yaml",       s:fg, "", "", "", "", "")

" Lsp
call <sid>hi("DiagnosticError",   s:red, "", "", "", "", "")

call <sid>hi("LspReferenceText",   s:fg, s:bg1, "", "", "", "")
call <sid>hi("LspReferenceRead",   s:fg, s:bg1, "", "", "", "")
call <sid>hi("LspReferenceWrite",   s:fg, s:bg1, "", "", "", "")

" Plugins
call <sid>hi("IndentBlankLineChar", s:fg2, "", "", "", "", "")

" Diff highlighting
call <sid>hi("DiffAdd",      s:green, s:bg,  "", "", "", "")
call <sid>hi("DiffChange",   s:blue, s:bg,  "", "", "", "")
call <sid>hi("DiffDelete",   s:red, s:bg,  "", "", "", "")
call <sid>hi("DiffText",     s:fg, s:blue,  "", "", "", "")
call <sid>hi("DiffAdded",    s:green, s:bg,  "", "", "", "")
call <sid>hi("DiffFile",     s:fg, s:bg,  "", "", "", "")
call <sid>hi("DiffNewFile",  s:fg, s:bg,  "", "", "", "")
call <sid>hi("DiffLine",     s:fg, s:bg,  "", "", "", "")
call <sid>hi("DiffRemoved",  s:red, s:bg,  "", "", "", "")

" Git highlighting
" call <sid>hi("gitcommitOverflow",       s:fg, "", "", "", "", "")
" call <sid>hi("gitcommitSummary",        s:fg, "", "", "", "", "")
" call <sid>hi("gitcommitComment",        s:fg, "", "", "", "", "")
" call <sid>hi("gitcommitUntracked",      s:fg, "", "", "", "", "")
" call <sid>hi("gitcommitDiscarded",      s:fg, "", "", "", "", "")
" call <sid>hi("gitcommitSelected",       s:fg, "", "", "", "", "")
" call <sid>hi("gitcommitHeader",         s:fg, "", "", "", "", "")
" call <sid>hi("gitcommitSelectedType",   s:fg, "", "", "", "", "")
" call <sid>hi("gitcommitUnmergedType",   s:fg, "", "", "", "", "")
" call <sid>hi("gitcommitDiscardedType",  s:fg, "", "", "", "", "")
" call <sid>hi("gitcommitBranch",         s:fg, "", "", "", "bold", "")
" call <sid>hi("gitcommitUntrackedFile",  s:fg, "", "", "", "", "")
" call <sid>hi("gitcommitUnmergedFile",   s:fg, "", "", "", "bold", "")
" call <sid>hi("gitcommitDiscardedFile",  s:fg, "", "", "", "bold", "")
" call <sid>hi("gitcommitSelectedFile",   s:fg, "", "", "", "bold", "")

" Spelling highlighting
call <sid>hi("SpellBad",     "", "", "", "", "undercurl", s:bg)
call <sid>hi("SpellLocal",   "", "", "", "", "undercurl", s:bg)
call <sid>hi("SpellCap",     "", "", "", "", "undercurl", s:bg)
call <sid>hi("SpellRare",    "", "", "", "", "undercurl", s:bg)

" Remove functions
delf <sid>hi

" Remove color variables
" unlet s:gui00 s:gui01 s:gui02 s:gui03  s:gui04  s:gui05  s:gui06  s:gui07  s:gui08  s:gui09 s:gui0A  s:gui0B  s:gui0C  s:gui0D  s:gui0E  s:gui0F
" unlet s:cterm00 s:cterm01 s:cterm02 s:cterm03 s:cterm04 s:cterm05 s:cterm06 s:cterm07 s:cterm08 s:cterm09 s:cterm0A s:cterm0B s:cterm0C s:cterm0D s:cterm0E s:cterm0F
