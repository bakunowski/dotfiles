highlight clear

" primary:
"   background: '#d9d5ba'
"   foreground: '#444444'
" normal:
"   black:   '#444444'
"   red:     '#825b69'
"   green:   '#69825b'
"   yellow:  '#82755b'
"   blue:    '#5b6982'
"   magenta: '#755b82'
"   cyan:    '#5b8275'
"   white:   '#d9d7cc'
" bright:
"   black:   '#333333'
"   red:     '#bda0aa'
"   green:   '#aabda0'
"   yellow:  '#bdb3a0'
"   blue:    '#a0aabd'
"   magenta: '#b3a0bd'
"   cyan:    '#a0bdb3'
"   white:   '#e5e5e5'

"----------------------------------Page----------------------------------------
highlight! Normal guibg=#d9d5ba guifg=#444444
highlight! SignColumn guibg=#d9d5ba guifg=#444444
highlight! Visual guibg=#333333 guifg=#d9d5ba
highlight! Todo guibg=#d9d5ba guifg=#444444 gui=bold

highlight! CursorLine guibg=#ffffca guifg=#ffffff
highlight! CursorLineNr guibg=#d9d5ba guifg=#333333 gui=bold,italic
highlight! LineNr guibg=#d9d5ba guifg=#333333 gui=italic

highlight! Pmenu guibg=#d9d5ba guifg=#444444

highlight! StatusLine guibg=#444444 guifg=#d9d5ba gui=NONE
highlight! StatusLineNC guibg=#444444 guifg=#444444 gui=NONE

highlight! NonText guibg=#d9d5ba guifg=#cacaca
highlight! ColorColumn guibg=#ffffc3

highlight! Statement guibg=#d9d5ba guifg=#444444 gui=italic
highlight! Comment guibg=#d9d5ba guifg=#777777 gui=italic

" To sort
highlight! Constant guibg=#d9d5ba guifg=#444444 gui=bold
highlight! WildMenu guibg=#d9d5ba guifg=#444444 gui=NONE
highlight! VertSplit guibg=#d9d5ba guifg=#444444 gui=NONE

highlight! Folded guibg=#d9d5ba guifg=#444444 gui=italic
highlight! FoldColumn guibg=#d9d5ba guifg=#444444

highlight! Conceal guibg=#d9d5ba guifg=#444444 gui=NONE
highlight! PmenuSel guibg=#444444 guifg=#d9d5ba

highlight! Identifier guibg=#d9d5ba guifg=#444444 gui=bold
highlight! Type guibg=#d9d5ba guifg=#444444 gui=NONE
highlight! PreProc guibg=#d9d5ba guifg=#444444 gui=bold
highlight! Special guibg=#d9d5ba guifg=#444444 gui=bold
highlight! SpecialKey guibg=#d9d5ba guifg=#444444 gui=bold
highlight! Directory guibg=#d9d5ba guifg=#444444 gui=bold

"-------------------------------Treesitter-------------------------------------
highlight! TSComment guibg=#d9d5ba guifg=#7c7c7c gui=italic
highlight! TSInclude guibg=#d9d5ba guifg=#101010 gui=bold
highlight! TSString guibg=#d9d5ba guifg=#101010 gui=bold
highlight! TSNumber guibg=#d9d5ba guifg=#101010 gui=bold
highlight! TSBoolean guibg=#d9d5ba guifg=#101010 gui=bold
highlight! TSPunctBracket guibg=#d9d5ba guifg=#101010
highlight! TSPunctDelimiter guibg=#d9d5ba guifg=#101010
highlight! TSFunction guibg=#d9d5ba guifg=#101010

highlight! TSProperty guibg=#d9d5ba guifg=#101010

highlight! TSMethod guibg=#d9d5ba guifg=#101010
highlight! TSKeyword guibg=#d9d5ba guifg=#101010 gui=italic
highlight! TSKeywordFunction guibg=#d9d5ba guifg=#101010 gui=italic
highlight! TSOperator guibg=#d9d5ba guifg=#101010
highlight! TSConditional guibg=#d9d5ba guifg=#101010
highlight! TSConstBuiltin guibg=#d9d5ba guifg=#101010 gui=bold

highlight! TSType guibg=#d9d5ba guifg=#101010 gui=bold
highlight! TSTypeBuiltin guibg=#d9d5ba guifg=#101010 gui=bold


highlight! TSParameter guibg=#d9d5ba guifg=#101010
highlight! TSRepeat guibg=#d9d5ba guifg=#101010
highlight! TSFuncBuiltin guibg=#d9d5ba guifg=#101010

"----------------------------------LSP-----------------------------------------
highlight! LspDiagnosticsDefaultError guibg=#d9d5ba guifg=#825b69 gui=italic

"-----------------------------------Markdown-----------------------------------
highlight! link markdownH1 Todo
highlight! link markdownH2 Todo
highlight! link markdownH3 Todo
highlight! link markdownH4 Todo
highlight! link markdownH5 Todo
highlight! link markdownH6 Todo
highlight! markdownLinkText guibg=#d9d5ba guifg=#101010 gui=underline

let g:colors_name = "acme"
