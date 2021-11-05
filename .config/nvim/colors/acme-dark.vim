highlight clear

" Sets the highlighting for the given group
fun <SID>X(group, fg, bg, attr)
	if a:fg != ""
		exec "hi " . a:group . " guifg=#" . a:fg . " ctermfg=" . <SID>rgb(a:fg)
	endif
	if a:bg != ""
		exec "hi " . a:group . " guibg=#" . a:bg . " ctermbg=" . <SID>rgb(a:bg)
	endif
	if a:attr != ""
		exec "hi " . a:group . " gui=" . a:attr . " cterm=" . a:attr
	endif
endfun

"----------------------------------Page----------------------------------------
highlight! Normal guibg=#000000 guifg=#b6b6b6
highlight! SignColumn guibg=#000000 guifg=#b6b6b6
highlight! Visual guibg=#333333 guifg=#000000
highlight! Todo guibg=#000000 guifg=#b6b6b6 gui=bold

highlight! CursorLine guibg=#ffffca guifg=#b6b6b6
highlight! CursorLineNr guibg=#000000 guifg=#333333 gui=bold,italic
highlight! LineNr guibg=#000000 guifg=#777777 gui=italic

highlight! Pmenu guibg=#d2cdad guifg=#b6b6b6

highlight! StatusLine guibg=#b6b6b6 guifg=#000000 gui=NONE
highlight! StatusLineNC guibg=#b6b6b6 guifg=#b6b6b6 gui=NONE

highlight! NonText guibg=#none guifg=#444444
highlight! ColorColumn guibg=#d2cdad guifg=none

highlight! Statement guibg=none guifg=#b6b6b6 gui=italic
highlight! Comment guibg=none guifg=#777777 gui=italic

" To sort
highlight! Constant guibg=none guifg=#b6b6b6 gui=NONE
highlight! WildMenu guibg=#000000 guifg=#b6b6b6 gui=NONE
highlight! VertSplit guibg=#000000 guifg=#b6b6b6 gui=NONE

highlight! Folded guibg=#000000 guifg=#b6b6b6 gui=italic
highlight! FoldColumn guibg=#000000 guifg=#b6b6b6

highlight! Conceal guibg=#000000 guifg=#b6b6b6 gui=NONE
highlight! PmenuSel guibg=#b6b6b6 guifg=#000000

highlight! Identifier guibg=#000000 guifg=#b6b6b6 gui=bold
highlight! Type guibg=none guifg=#b6b6b6 gui=NONE
highlight! PreProc guibg=#000000 guifg=#b6b6b6 gui=bold
highlight! Special guibg=#000000 guifg=#b6b6b6 gui=bold
highlight! SpecialKey guibg=#000000 guifg=#b6b6b6 gui=bold
highlight! Directory guibg=#000000 guifg=#b6b6b6 gui=bold

highlight! MatchParen guibg=#000000 guifg=#ff6e67 gui=bold

"-------------------------------Treesitter-------------------------------------

call <SID>X("TSKeyword", s:green, "", "")

highlight! TSComment guibg=none guifg=#777777 gui=italic

highlight! TSInclude guibg=none guifg=#b6b6b6 gui=bold

highlight! TSString guibg=none guifg=#b6b6b6 gui=bold
highlight! TSNumber guibg=none guifg=#b6b6b6 gui=bold
highlight! TSBoolean guibg=none guifg=#b6b6b6 gui=bold
highlight! TSFunction guibg=none guifg=#b6b6b6
highlight! TSProperty guibg=none guifg=#b6b6b6
highlight! TSMethod guibg=none guifg=#b6b6b6
" highlight! TSKeyword guibg=none guifg=#b6b6b6
highlight! TSOperator guibg=none guifg=#b6b6b6

highlight! TSKeywordFunction guibg=none guifg=#b6b6b6 gui=italic

highlight! TSPunctBracket guibg=none guifg=#b6b6b6
highlight! TSPunctDelimiter guibg=none guifg=#b6b6b6

highlight! TSConditional guibg=none guifg=#b6b6b6
highlight! TSConstBuiltin guibg=none guifg=#b6b6b6 gui=bold

highlight! TSType guibg=none guifg=#b6b6b6 gui=bold
highlight! TSTypeBuiltin guibg=none guifg=#b6b6b6 gui=bold

highlight! TSParameter guibg=none guifg=#b6b6b6
highlight! TSRepeat guibg=none guifg=#b6b6b6
highlight! TSFuncBuiltin guibg=none guifg=#b6b6b6

" Language specific
highlight! yamlTSBoolean guibg=none guifg=#b6b6b6 gui=NONE
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
highlight! markdownLinkText guibg=#000000 guifg=#b6b6b6 gui=underline

let g:colors_name = "acme"
