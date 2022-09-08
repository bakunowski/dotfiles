hi clear

if exists("syntax_on")
  syntax reset
endif

let colors_name = "playground"
set termguicolors

let s:is_dark=(&background == 'dark')

if s:is_dark
 " General
 hi Normal guifg=#f0f1f2 guibg=#283442
 " hi NormalNC guifg=#f0f1f2 guibg=#4B525B
 hi NonText guifg=#f0f1f2
 hi EndOfBuffer guifg=#283442
 hi LineNr guifg=#d3d3d3
 hi VertSplit guifg=#d3d3d3 guibg=#283442
 hi Pmenu guibg=#1e2a36
 hi WinBar guibg=#283442
 hi WinBarNC guibg=#283442
 hi! link SignColumn Normal

 " Diff
 " hi DiffAdd ctermbg=10 ctermfg=0
 " hi DiffChange ctermbg=12 ctermfg=0
 " hi DiffDelete ctermbg=9 ctermfg=0
 " hi DiffText ctermfg=7 ctermbg=4

 " Syntax highlighting
 hi Comment guifg=#c6cace
 hi Constant guifg=#f0f1f2
 hi Delimiter guifg=#9199a0
 hi Identifier guifg=#f0f1f2
 hi PreProc guifg=#f0f1f2
 hi Special guifg=#f0f1f2
 hi Statement guifg=#f0f1f2 gui=none
 hi Type guifg=#f0f1f2 gui=none

 " Markdow
 hi Title guifg=#f0f1f2 gui='bold'

 " File viewer
 hi Directory guifg=#f0f1f2 gui='bold'

 " Plugins
 hi IndentBlankLineChar guifg=#9199a0
 hi! link TelescopeBorder Normal

else

 " General
 hi Normal guifg=#202224 guibg=#FFFFE0
 hi NormalNC guifg=#202224 guibg=#4B525B
 hi NonText guifg=#202224
 hi EndOfBuffer guifg=#283442
 hi LineNr guifg=#d3d3d3
 hi VertSplit guifg=#d3d3d3 guibg=#283442
 hi Pmenu guibg=#1e2a36
 hi! link SignColumn Normal

 " Diff
 " hi DiffAdd ctermbg=10 ctermfg=0
 " hi DiffChange ctermbg=12 ctermfg=0
 " hi DiffDelete ctermbg=9 ctermfg=0
 " hi DiffText ctermfg=7 ctermbg=4

 " Syntax highlighting
 hi Comment guifg=#45494e
 hi Constant guifg=#202224
 hi Delimiter guifg=#737a81
 hi Identifier guifg=#202224
 hi PreProc guifg=#202224
 hi Special guifg=#202224
 hi Statement guifg=#202224 gui=none
 hi Type guifg=#202224 gui=none

 " Markdown
 hi Title guifg=#202224 gui='bold'

 " File viewer
 hi Directory guifg=#gui='bold'

 " Plugins
 hi IndentBlankLineChar guifg=#9199a0
 hi! link TelescopeBorder Normal

endif
