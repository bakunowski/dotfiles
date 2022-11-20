hi clear

if exists("syntax_on")
  syntax reset
endif

let colors_name = "karol"
set termguicolors

" General
hi Normal guifg=#a4a0e8 guibg=#3b224c
hi NonText guifg=#a4a0e8
hi EndOfBuffer guifg=#3b224c
hi LineNr guifg=#dbbfef
hi LineNrAbove guifg=#5a5977
hi LineNrBelow guifg=#5a5977

hi StatusLine guifg=#3b224c
hi StatusLineNC guifg=#3b224c

hi Visual guibg=#540099
hi Search guibg=#540099 guifg=none

hi VertSplit guifg=#432c54 guibg=none
hi Pmenu guibg=#281733
hi PmenuSel guifg=#281733 guibg=#ffffff
hi FloatBorder guibg=#281733
" hi WinBar guibg=#283442
" hi WinBarNC guibg=#283442
hi! link SignColumn Normal
hi! link TabLineFill NormalFloat
hi! link TabLine NormalFloat
hi MatchParen guibg=#a4a0e8 guifg=#ffffff
hi! link Folded Normal
hi! link FoldColumn Folded

" Diff
hi DiffAdd guifg=#35bf86 guibg=none
hi DiffChange guifg=#6f44f0 guibg=none
hi DiffDelete guifg=#f22c86 guibg=none
hi DiffText guibg=#6f44f0
"
" Diagnostics
hi DiagnosticError guifg=#f47868	
hi DiagnosticWarn guifg=#ffcd1c
hi DiagnosticInfo guifg=#6F44F0
hi DiagnosticHint guifg=#cccccc

" Syntax highlighting
hi Include guifg=#eccdba
hi Comment guifg=#697C81
hi Constant guifg=#cccccc
hi Number guifg=#E8DCA0
hi Delimiter guifg=#a4a0e8
hi Identifier guifg=#a4a0e8
hi Macro guifg=#dbbfef
hi PreProc guifg=#697C81
hi Special guifg=#ffffff
hi Statement guifg=#eccdba gui=none
hi Operator guifg=#dbbfef gui=none
hi Type guifg=#ffffff gui=none
hi Function guifg=#ffffff gui=none
hi Underlined guifg=#cccccc
hi! link SpecialKey Underlined

" Treesitter
hi @property guifg=#ffffff gui=none
hi @method guifg=#ffffff gui=none
hi @field guifg=#ffffff gui=none
hi @constant guifg=#ffffff gui=none
hi @string.escape guifg=#efba5d gui=none
hi @text.literal guifg=#eccdba gui=none
hi @text.referenceliteral guifg=#eccdba gui=none
hi @variable.builtin guifg=#9ff28f
hi @storageclass guifg=#efba5d
hi @type.qualifier guifg=#eccdba
hi @punctuation.special guifg=#dbbfef

hi @namespace.rust guifg=#dbbfef

" Markdow
hi Title guifg=#dbbfef gui=none

" File viewer
hi Directory guifg=#ffffff

" Plugins
hi IndentBlankLineChar guifg=#5a5977
hi! link TelescopeSelection PmenuSel
" hi! link TelescopeBorder Normal
"
hi NvimTreeSpecialFile guifg=#ffffff
hi NvimTreeGitNew guifg=#ffffff
hi NvimTreeRootFolder guifg=#eccdba

hi! link NoiceCmdlinePopupBorder Normal
