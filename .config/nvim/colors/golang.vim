" GUI color definitions
if &background ==# 'light'
    let s:bg           = '#ffffea'
    let s:bg1          = '#eeee9e'
    let s:bg2          = '#eaffff'
    let s:fg           = '#000000'
    let s:green        = '#718c00'
    let s:red          = '#c82829'
    let s:blue         = '#4271ae'

    let s:darkerFg     = '#101010'
    let s:smth         = '#8e908c'

    let s:bl           = '#000000'
    let s:y            = '#000000'
    let s:r            = '#000000'
    let s:t            = '#000000'
    let s:n            = '#000000'
    let s:o            = '#000000'
    let s:g            = '#000000'
    let s:gr           = '#525252'
    let s:v            = '#000000'
else
    let s:bg           = '#1e1f22' ""
    let s:bg1          = '#4b5059' ""
    let s:bg2          = '#2b2d30' ""
    let s:fg           = '#bcbec4' ""
    let s:fg1          = '#a1a3ab' ""
    let s:green        = '#549159'
    let s:red          = '#868A91'
    let s:red2          = '#F0524F'
    let s:blue         = '#375FAD'

    let s:dgreen        = '#2f4337'
    let s:dred          = '#45302B'
    let s:dblue         = '#2a3540'
    let s:dblue2        = '#43698D'

    let s:darkerFg     = '#bcbec4'
    let s:smth         = '#bcbec4'

    let s:bl           = '#6fafbd' ""
    let s:y            = '#56a8f5' ""
    let s:r            = '#bcbec4'
    let s:t            = '#cf8e6d' ""
    let s:n            = '#6aab73' ""
    let s:o            = '#2aacb8' ""
    let s:g            = '#bcbec4'
    let s:gr           = '#7a7e85' ""
    let s:v            = '#bcbec4'
    let s:ns           = '#afbf7e' ""
    let s:mc           = '#b09d79' ""
    let s:cs           = '#cc7832' ""
    let s:pi           = '#c77dbb' ""
    let s:mp           = '#373B39' ""
    let s:sr           = '#165E70' ""
    let s:srl          = '#72D6D6' ""
    let s:yel          = '#D5B778' ""
endif

" Theme setup
hi clear
syntax reset
let g:colors_name = "goland"

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
call <sid>hi("FloatBorder",   s:fg, s:bg2, "", "", "", "")
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
call <sid>hi("IncSearch",     "none", s:srl, "", "", "none", "")
call <sid>hi("Italic",        "", "", "", "", "italic", "")
"---
call <sid>hi("Macro",         s:bl, "", "", "", "", "")
"
call <sid>hi("MatchParen",    "none", s:mp, "", "",  "bold", "")
"---
call <sid>hi("ModeMsg",       s:fg, "", "", "", "", "")
call <sid>hi("MoreMsg",       s:fg, "", "", "", "", "")
call <sid>hi("Question",      s:fg, "", "", "", "", "")
"
call <sid>hi("Search",        "none", s:sr, "", "",  "", "")
"---
call <sid>hi("Substitute",    "none", s:dred, "", "", "none", "")
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
call <sid>hi("LineNr",        s:fg1, "none", "", "", "", "")
call <sid>hi("LineNrAbove",   s:bg1, "none", "", "", "", "")
call <sid>hi("LineNrBelow",   s:bg1, "none", "", "", "", "")
call <sid>hi("SignColumn",    s:fg, "none", "", "", "", "")
call <sid>hi("StatusLine",    s:fg, s:bg2, "", "", "none", "")
call <sid>hi("StatusLineNC",  s:bg2, s:bg2, "", "", "none", "")
call <sid>hi("VertSplit",     s:bg1, s:bg, "", "", "none", "")
"---
call <sid>hi("ColorColumn",   s:bg1, s:bg1, "",             "", "none", "")
call <sid>hi("CursorColumn",  "", s:bg, "",             "", "none", "")
call <sid>hi("CursorLine",    "", s:bg, "",             "", "none", "")
call <sid>hi("CursorLineNr",  s:fg, s:bg,            "", "", "", "")
call <sid>hi("QuickFixLine",  "",      s:bg, "",        "", "none", "")
"
call <sid>hi("PMenu",         s:fg, s:bg2, "", "", "none", "")
call <sid>hi("PMenuSel",      s:fg, s:bg1, "", "", "bold", "")
call <sid>hi("TabLine",       s:fg, s:bg2, "", "", "none", "")
call <sid>hi("TabLineFill",   s:fg, s:bg, "", "", "none", "")
call <sid>hi("TabLineSel",    s:fg, s:bg, "", "", "none", "")

" Standard syntax highlighting
call <sid>hi("Boolean",      s:o, "", "", "", "", "")
" call <sid>hi("Character",    s:fg, "", "", "", "", "")
call <sid>hi("Comment",      s:gr, "", "", "", "", "")
call <sid>hi("Conditional",  s:t, "", "", "", "", "")
call <sid>hi("Constant",     s:pi, "", "", "", "", "")
call <sid>hi("Define",       s:v, "", "", "", "none", "")
call <sid>hi("Delimiter",    s:g, "", "", "", "", "")
call <sid>hi("Float",        s:fg, "", "", "", "", "")
" call <sid>hi("Function",     s:y, "", "", "", "bold", "")
call <sid>hi("Function",     s:y, "", "", "", "none", "")
call <sid>hi("Identifier",   s:g, "", "", "", "none", "")
call <sid>hi("Keyword",      s:t, "", "", "", "", "")
call <sid>hi("Label",        s:t, "", "", "", "", "")
call <sid>hi("Number",       s:o, "", "", "", "", "")
call <sid>hi("Operator",     s:fg, "", "", "", "none", "")
call <sid>hi("PreProc",      s:t, "", "", "", "", "")
" call <sid>hi("Include",      s:r, "", "", "", "", "")
call <sid>hi("Repeat",       s:t, "", "", "", "", "")
call <sid>hi("Special",      s:t, "", "", "", "", "")
call <sid>hi("SpecialChar",  s:fg, "", "", "", "", "")
call <sid>hi("Statement",    s:fg, "", "", "", "", "")
call <sid>hi("StorageClass", s:fg, "", "", "", "", "")
call <sid>hi("String",       s:n, "", "", "", "", "")
call <sid>hi("Structure",    s:fg, "", "", "", "", "")
call <sid>hi("Tag",          s:yel, "", "", "", "", "")
call <sid>hi("Todo",         s:o, s:bg, "", "", "", "")
call <sid>hi("Type",         s:bl, "", "", "", "none", "")
call <sid>hi("Typedef",      s:bl, "", "", "", "", "")

" Treesitter
" call <sid>hi("@variable",      s:fg, "", "", "", "", "")
" call <sid>hi("@property",      s:b, "", "", "", "", "")
" call <sid>hi("@punctuation",   s:fg, "", "", "", "", "")
" call <sid>hi("@field",         s:b, "", "", "", "", "")
" call <sid>hi("@namespace",     s:ns, "", "", "", "", "")
" call <sid>hi("@parameter",     s:fg, "", "", "", "", "")
" call <sid>hi("@keyword.return",     s:red, "", "", "", "", "")
call <sid>hi("@method.call",   s:mc, "", "", "", "", "")
call <sid>hi("@function.call", s:mc, "", "", "", "", "")
" call <sid>hi("@function",      s:fg, "", "", "", "", "")
call <sid>hi("@function.builtin",      s:cs, "", "", "", "", "")
" call <sid>hi("@constant.comment",      s:fg, "", "", "", "", "")
call <sid>hi("@constant.builtin",      s:cs, "", "", "", "", "")
" call <sid>hi("@function.builtin",      s:r, "", "", "", "bold", "")
call <sid>hi("@type.builtin",      s:cs, "", "", "", "", "")
call <sid>hi("@text.uri.comment",      s:gr, "", "", "", "underline", "")
call <sid>hi("@text.uri.html",      s:n, "", "", "", "underline", "")
call <sid>hi("@tag.attribute.html",      s:fg, "", "", "", "", "")

" Language specific
call <sid>hi("@field.yaml",       s:t, "", "", "", "", "")
" call <sid>hi("@string.yaml",      s:v, "", "", "", "", "")
" call <sid>hi("@function.gotmpl",      s:blue, "", "", "", "", "")
"
" Semantic tokens
lua << EOF
    for _, group in ipairs(vim.fn.getcompletion("@lsp", "highlight")) do
      vim.api.nvim_set_hl(0, group, {})
    end
EOF
call <sid>hi("@lsp.type.namespace",     s:ns, "", "", "", "", "")
call <sid>hi("@lsp.mod.readonly",     s:pi, "", "", "", "", "")
call <sid>hi("@lsp.typemod.variable.defaultLibrary",     s:cs, "", "", "", "", "")

" Lsp
call <sid>hi("DiagnosticError",   s:red, "", "", "", "", "")

call <sid>hi("LspReferenceText",   s:fg, s:bg1, "", "", "", "")
call <sid>hi("LspReferenceRead",   s:fg, s:bg1, "", "", "", "")
call <sid>hi("LspReferenceWrite",   s:fg, s:bg1, "", "", "", "")

" Plugins
call <sid>hi("IndentBlankLineChar", s:bg1, "", "", "", "", "")

" Diff highlighting
call <sid>hi("DiffAdd",      "none", s:dgreen,  "", "", "", "")
call <sid>hi("DiffChange",   "none",  s:dblue,  "", "", "", "")
call <sid>hi("DiffText",     "none",  s:dblue2,  "", "", "none", "")
call <sid>hi("DiffDelete",   s:dred,   s:dred,  "", "", "", "")

call <sid>hi("DiffAdded",    s:green, "none",   "", "", "", "")
call <sid>hi("DiffFile",     "none", s:bg,   "", "", "", "")
call <sid>hi("DiffNewFile",  "none", s:bg,   "", "", "", "")
call <sid>hi("DiffLine",     "none", s:bg,   "", "", "", "")
call <sid>hi("DiffRemoved",  s:red2, "none",   "", "", "", "")

call <sid>hi("GitSignsAdd",     s:green, s:bg,   "", "", "", "")
call <sid>hi("GitSignsChange",  s:blue,  s:bg,   "", "", "", "")
call <sid>hi("GitSignsDelete",  s:red,   s:bg,   "", "", "", "")

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
