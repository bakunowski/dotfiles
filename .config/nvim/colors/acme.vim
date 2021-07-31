highlight clear 

"----------------------------------Page----------------------------------------
highlight! Normal guibg=#ffffea guifg=#000000 ctermbg=230 ctermfg=232 
highlight! SignColumn guibg=#ffffea guifg=#000000 ctermbg=230 ctermfg=232 
highlight! Visual guibg=fg guifg=bg ctermbg=fg ctermfg=bg
highlight! Todo guibg=bg guifg=fg gui=bold

highlight! CursorLine guibg=#ffffca guifg=fg ctermbg=230 ctermfg=fg
highlight! CursorLineNr guibg=#ffffea guifg=fg gui=bold,italic
highlight! LineNr guibg=bg guifg=#505050 gui=italic

highlight! Pmenu guibg=bg guifg=fg ctermbg=bg ctermfg=fg

highlight! StatusLine guibg=#aeeeee guifg=#000000 gui=NONE ctermbg=159 ctermfg=232 cterm=NONE
highlight! StatusLineNC guibg=#eaffff guifg=#000000 gui=NONE ctermbg=194 ctermfg=232 cterm=NONE

highlight! NonText guibg=bg guifg=#cacaca
highlight! ColorColumn guibg=#ffffc3

highlight! Statement guibg=bg guifg=fg gui=italic
highlight! Comment guibg=bg guifg=#303030 gui=italic

"-------------------------------Treesitter-------------------------------------
highlight! TSComment guibg=bg guifg=#7c7c7c gui=italic
highlight! TSInclude guibg=bg guifg=#101010 gui=bold
highlight! TSString guibg=bg guifg=#101010 gui=bold
highlight! TSNumber guibg=bg guifg=#101010 gui=bold
highlight! TSBoolean guibg=bg guifg=#101010 gui=bold
highlight! TSPunctBracket guibg=bg guifg=#101010
highlight! TSPunctDelimiter guibg=bg guifg=#101010
highlight! TSFunction guibg=bg guifg=#101010

highlight! TSProperty guibg=bg guifg=#101010

highlight! TSMethod guibg=bg guifg=#101010
highlight! TSKeyword guibg=bg guifg=#101010 gui=italic
highlight! TSKeywordFunction guibg=bg guifg=#101010 gui=italic
highlight! TSOperator guibg=bg guifg=#101010
highlight! TSConditional guibg=bg guifg=#101010
highlight! TSConstBuiltin guibg=bg guifg=#101010 gui=bold

highlight! TSType guibg=bg guifg=#101010 gui=bold
highlight! TSTypeBuiltin guibg=bg guifg=#101010 gui=bold


highlight! TSParameter guibg=bg guifg=#101010
highlight! TSRepeat guibg=bg guifg=#101010
highlight! TSFuncBuiltin guibg=bg guifg=#101010
"------------------------------------------------------------------------------

"----------------------------------LSP-----------------------------------------
highlight! LspDiagnosticsDefaultError guibg=bg guifg=#ff6161 gui=italic
"------------------------------------------------------------------------------

"-----------------------------------Markdown-----------------------------------
highlight! link markdownH1 Todo
highlight! link markdownH2 Todo
highlight! link markdownH3 Todo
highlight! link markdownH4 Todo
highlight! link markdownH5 Todo
highlight! link markdownH6 Todo
highlight! markdownLinkText guibg=bg guifg=#101010 gui=underline

"-------------------------------------To sort----------------------------------
 highlight! Constant guibg=bg guifg=#101010 gui=bold ctermbg=bg ctermfg=233 cterm=italic
 highlight! WildMenu guibg=#000000 guifg=#eaffff gui=NONE ctermbg=black ctermfg=159 cterm=NONE
 highlight! VertSplit guibg=#ffffea guifg=#000000 gui=NONE ctermbg=159 ctermfg=232 cterm=NONE

 highlight! Folded guibg=#cccc7c guifg=fg gui=italic ctermbg=187 ctermfg=fg cterm=italic
 highlight! FoldColumn guibg=#fcfcce guifg=fg ctermbg=229 ctermfg=fg

 highlight! Conceal guibg=bg guifg=fg gui=NONE ctermbg=bg ctermfg=fg cterm=NONE
 highlight! PmenuSel guibg=fg guifg=bg ctermbg=fg ctermfg=bg

 highlight! Identifier guibg=bg guifg=fg gui=bold ctermbg=bg ctermfg=fg cterm=bold
 highlight! Type guibg=bg guifg=fg gui=bold ctermbg=bg ctermfg=fg cterm=bold
 highlight! PreProc guibg=bg guifg=fg gui=bold ctermbg=bg ctermfg=fg cterm=bold
 highlight! Special guibg=bg guifg=fg gui=bold ctermbg=bg ctermfg=fg cterm=bold
 highlight! SpecialKey guibg=bg guifg=fg gui=bold ctermbg=bg ctermfg=fg cterm=bold
 highlight! Directory guibg=bg guifg=fg gui=bold ctermbg=bg ctermfg=fg cterm=bold
"------------------------------------------------------------------------------

let g:colors_name = "acme"
