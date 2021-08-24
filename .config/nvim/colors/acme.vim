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
highlight! LineNr guibg=#d9d5ba guifg=#777777 gui=italic

highlight! Pmenu guibg=#d9d5ba guifg=#444444

highlight! StatusLine guibg=#444444 guifg=#d9d5ba gui=NONE
highlight! StatusLineNC guibg=#444444 guifg=#444444 gui=NONE

highlight! NonText guibg=#d9d5ba guifg=#c4be94
highlight! ColorColumn guibg=#d2cdad guifg=none

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

highlight! MatchParen guibg=#d9d5ba guifg=#ff6e67 gui=bold

"-------------------------------Treesitter-------------------------------------
highlight! TSComment guibg=none guifg=#777777 gui=italic

highlight! TSInclude guibg=none guifg=#444444 gui=bold

highlight! TSString guibg=none guifg=#444444 gui=bold
highlight! TSNumber guibg=none guifg=#444444 gui=bold
highlight! TSBoolean guibg=none guifg=#444444 gui=bold
highlight! TSFunction guibg=none guifg=#444444
highlight! TSProperty guibg=none guifg=#444444
highlight! TSMethod guibg=none guifg=#444444
highlight! TSKeyword guibg=none guifg=#444444
highlight! TSOperator guibg=none guifg=#444444

highlight! TSKeywordFunction guibg=none guifg=#444444 gui=italic

highlight! TSPunctBracket guibg=none guifg=#444444
highlight! TSPunctDelimiter guibg=none guifg=#444444

highlight! TSConditional guibg=none guifg=#444444
highlight! TSConstBuiltin guibg=none guifg=#444444 gui=bold

highlight! TSType guibg=none guifg=#444444 gui=bold
highlight! TSTypeBuiltin guibg=none guifg=#444444 gui=bold

highlight! TSParameter guibg=none guifg=#444444
highlight! TSRepeat guibg=none guifg=#444444
highlight! TSFuncBuiltin guibg=none guifg=#444444

"----------------------------------LSP-----------------------------------------
highlight! LspDiagnosticsDefaultError guibg=none guifg=#825b69 gui=italic
highlight! TelescopeMatching guibg=none guifg=#825b69
highlight! TelescopeSelection guibg=#d2cdad guifg=none

"----------------------------------Git-----------------------------------------
highlight! DiffAdd guibg=none guifg=#69825b
highlight! DiffChange guibg=none guifg=#5b6982
highlight! DiffDelete guibg=none guifg=#825b69

"-----------------------------------Markdown-----------------------------------
highlight! link markdownH1 Todo
highlight! link markdownH2 Todo
highlight! link markdownH3 Todo
highlight! link markdownH4 Todo
highlight! link markdownH5 Todo
highlight! link markdownH6 Todo
highlight! markdownLinkText guibg=#d9d5ba guifg=#444444 gui=underline

let g:colors_name = "acme"
