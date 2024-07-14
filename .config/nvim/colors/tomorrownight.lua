vim.cmd.highlight('clear')
vim.g.colors_name = 'tomorrownight'

local hi = function(name, val)
  -- Force links
  val.force = true

  -- Make sure that `cterm` attribute is not populated from `gui`
  val.cterm = val.cterm or {}

  -- Define global highlight
  vim.api.nvim_set_hl(0, name, val)
end

-- bright
-- foreground = "#eaeaea"
-- background = "#000000"
-- selection  = "#424242"
-- line       = "#2a2a2a"
-- comment    = "#969896"
-- red        = "#d54e53"
-- orange     = "#e78c45"
-- yellow     = "#e7c547"
-- green      = "#b9ca4a"
-- aqua       = "#70c0b1"
-- blue       = "#7aa6da"
-- purple     = "#c397d8"
-- window     = "#4d5057"

local gui00        = "#1d1f21"
local gui01        = "#282a2e"
local gui02        = "#373b41"
local gui03        = "#969896"
local gui04        = "#b4b7b4"
local gui05        = "#c5c8c6"
local gui06        = "#e0e0e0"
local gui07        = "#ffffff"
local gui08        = "#cc6666"
local gui09        = "#de935f"
local gui0A        = "#f0c674"
local gui0B        = "#b5bd68"
local gui0C        = "#8abeb7"
local gui0D        = "#81a2be"
local gui0E        = "#b294bb"
local gui0F        = "#a3685a"

-- default
-- local gui00        = "#181818"
-- local gui01        = "#282828"
-- local gui02        = "#383838"
-- local gui03        = "#585858"
-- local gui04        = "#b8b8b8"
-- local gui05        = "#d8d8d8"
-- local gui06        = "#e8e8e8"
-- local gui07        = "#f8f8f8"
-- local gui08        = "#ab4642"
-- local gui09        = "#dc9656"
-- local gui0A        = "#f7ca88"
-- local gui0B        = "#a1b56c"
-- local gui0C        = "#86c1b9"
-- local gui0D        = "#7cafc2"
-- local gui0E        = "#ba8baf"
-- local gui0F        = "#a16946"

-- if vim.o.bg=="dark" then
--   bg1         = '#383838'
--   green       = '#a1b56c'
--   red         = '#ab4642'
--   blue        = '#7cafc2'
--   comment     = '#585858'
--   int         = '#dc9656'
--   t           = '#d8d8d8'
--   o           = '#d8d8d8'
--   g           = '#d8d8d8'
--   gr          = '#d8d8d8'
--   v           = '#d8d8d8'
--   s           = '#d8d8d8'
-- else
-- end

-- General
hi('Normal',       { fg = gui05, bg = gui00 })
hi('NormalFloat',  { fg = gui05, bg = gui01 })
hi('FloatBorder',  { fg = gui05, bg = gui01 })
hi('Bold',         { bold = true })
hi('Debug',        { fg = gui08 })
hi('Directory',    { fg = gui0D })
hi('Error',        { fg = gui00, bg = gui08 })
hi('ErrorMsg',     { fg = gui08, bg = gui00 })
hi('EndOfBuffer',  { fg = gui02 }) --
hi('Exception',    { fg = gui08 })
hi('FoldColumn',   { fg = gui0C, bg = gui01 })
hi('Folded',       { fg = gui03, bg = gui01 })
hi('IncSearch',    { fg = gui01, bg = gui09 })
hi('Italic',       { italic = true })
hi('Macro',        { fg = gui08 })
hi('MatchParen',   { bg = gui03 })
hi('ModeMsg',      { fg = gui0B })
hi('MoreMsg',      { fg = gui0B })
hi('Question',     { fg = gui0D })
hi('Search',       { fg = gui01, bg = gui0A })
hi('Substitute',   { fg = gui01, bg = gui0A })
hi('SpecialKey',   { fg = gui03 })
hi('Underlined',   { fg = gui08, underline = true })
hi('Visual',       { bg = gui02 })
hi('WarningMsg',   { fg = gui08 })
hi('WildMenu',     { fg = gui08, bg = gui0A })
hi('Title',        { fg = gui0D })
hi('Conceal',      { fg = gui0D, bg = gui00 })
hi('Cursor',       { fg = gui00, bg = gui05 })
hi('NonText',      { fg = gui03, bold = true })
hi('LineNr',       { fg = gui05 })
hi('LineNrAbove',  { fg = gui03 })
hi('LineNrBelow',  { fg = gui03 })
hi('SignColumn',   { fg = gui03 })
hi('StatusLine',   { fg = gui04, bg = gui02 })
hi('StatusLineNC', { fg = gui03, bg = gui01 })
hi('VertSplit',    { fg = gui01, bg = gui00 })
hi('WinSeparator', { fg = gui02, bg = gui00 })
hi('ColorColumn',  { bg = gui01 })
hi('CursorColumn', { bg = gui01 })
hi('CursorLine',   { bg = gui01 })
hi('CursorLineNr', { fg = gui04 })
hi('QuickFixLine', { bg = gui01 })
hi('Pmenu',        { fg = gui05, bg = gui01 })
hi('PmenuSel',     { fg= gui01, bg = gui05 })
-- hi('PmenuThumb',   { bg = 'White',                              })
-- hi('PmenuKind',      { link = 'Pmenu' })
-- hi('PmenuKindSel',   { link = 'PmenuSel' })
-- hi('PmenuExtra',     { link = 'Pmenu' })
-- hi('PmenuExtraSel',  { link = 'PmenuSel' })
-- hi('PmenuSbar',    { bg = 'Grey',                       })
hi('TabLine',      { fg = gui03, bg = gui01 })
hi('TabLineFill',  { fg = gui03, bg = gui01 })
hi('TabLineSel',   { fg = gui0B, bg = gui01 })

hi('Boolean',        { fg = gui09 })
hi('Character',      { fg = gui08 })
hi('Comment',        { fg = gui03 })
hi('Conditional',    { fg = gui0E })
hi('Constant',       { fg = gui09 })
hi('Define',         { fg = gui0E })
hi('Delimiter',      { fg = gui0F })
hi('Float',          { fg = gui09 })
hi('Function',       { fg = gui0D })
hi('Identifier',     { fg = gui08 })
hi('Keyword',        { fg = gui0E })
hi('Label',          { fg = gui0A })
hi('Number',         { fg = gui09 })
hi('Operator',       { fg = gui05 })
hi('PreProc',        { fg = gui0A })
hi('Include',        { fg = gui0D })
hi('Repeat',         { fg = gui0A })
hi('Special',        { fg = gui0C })
hi('SpecialChar',    { fg = gui0F })
hi('Statement',      { fg = gui08 })
hi('StorageClass',   { fg = gui0A })
hi('String',         { fg = gui0B })
hi('Structure',      { fg = gui0E })
hi('Tag',            { fg = gui0A })
hi('Todo',           { fg = gui0A })
hi('Type',           { fg = gui0A })
hi('Typedef',        { fg = gui0A })

hi('DiagnosticError',            { fg = gui08 })
hi('DiagnosticWarn',             { fg = gui09 })
hi('DiagnosticInfo',             { fg = gui0D })
hi('DiagnosticHint',             { fg = gui06 })
hi('DiagnosticOk',               { fg = gui0B })
hi('DiagnosticUnderlineError',   { sp = 'Red', underline = true,        })
hi('DiagnosticUnderlineWarn',    { sp = 'Orange', underline = true,     })
hi('DiagnosticUnderlineInfo',    { sp = 'LightBlue', underline = true,  })
hi('DiagnosticUnderlineHint',    { sp = 'LightGrey', underline = true,  })
hi('DiagnosticUnderlineOk',      { sp = 'LightGreen', underline = true, })
hi('DiagnosticVirtualTextError', { link = 'DiagnosticError' })
hi('DiagnosticVirtualTextWarn',  { link = 'DiagnosticWarn' })
hi('DiagnosticVirtualTextInfo',  { link = 'DiagnosticInfo' })
hi('DiagnosticVirtualTextHint',  { link = 'DiagnosticHint' })
hi('DiagnosticVirtualTextOk',    { link = 'DiagnosticOk' })
hi('DiagnosticFloatingError',    { link = 'DiagnosticError' })
hi('DiagnosticFloatingWarn',     { link = 'DiagnosticWarn' })
hi('DiagnosticFloatingInfo',     { link = 'DiagnosticInfo' })
hi('DiagnosticFloatingHint',     { link = 'DiagnosticHint' })
hi('DiagnosticFloatingOk',       { link = 'DiagnosticOk' })
hi('DiagnosticSignError',        { link = 'DiagnosticError' })
hi('DiagnosticSignWarn',         { link = 'DiagnosticWarn' })
hi('DiagnosticSignInfo',         { link = 'DiagnosticInfo' })
hi('DiagnosticSignHint',         { link = 'DiagnosticHint' })
hi('DiagnosticSignOk',           { link = 'DiagnosticOk' })
hi('DiagnosticDeprecated',       { sp = 'Red', strikethrough = true })
hi('DiagnosticUnnecessary', { link = 'Comment' })
hi('LspInlayHint',          { link = 'NonText' })
hi('SnippetTabstop',        { link = 'Visual' })

hi('LspReferenceText',      { fg = gui05, bg = gui02})
hi('LspReferenceRead',      { fg = gui05, bg = gui02})
hi('LspReferenceWrite',     { fg = gui05, bg = gui02})

-- Treesitter
hi('@variable',          { fg = gui05 })
hi('@punctuation', 		 { fg = gui04 })
hi('@module',            { fg = gui05 })

hi('@markup.raw',       { link = 'Comment' })
hi('@markup.link',      { link = 'Identifier' })
-- hi('@markup.heading',   { link = 'Title' })
-- hi('@markup.link.url',  { link = 'Underlined' })
-- hi('@markup.underline', { link = 'Underlined' })
-- hi('@comment.todo',     { link = 'Todo' })

-- hi('@comment',     { link = 'Comment' })

-- Constants
hi('@constant',          { fg = gui05 })
hi('@constant.builtin',  { fg = gui09 })
-- hi('@constant.macro',    { link = 'Define' })
-- hi('@keyword.directive', { link = 'Define' })
-- hi('@string',            { link = 'String' })
hi('@string.escape',     { link = 'Special' })
-- hi('@string.special',    { link = 'SpecialChar' })
hi('@string.special.url',    { fg = gui03, underline = true })
-- hi('@character',         { link = 'Character' })
-- hi('@character.special', { link = 'SpecialChar' })
-- hi('@number',            { link = 'Number' })
-- hi('@boolean',           { link = 'Boolean' })
-- hi('@number.float',      { link = 'Float' })

-- Functions
hi('@function',           { fg = gui05 })
hi('@function.call',      { link = 'Function'})
hi('@function.builtin',   { link = 'Function' })
-- hi('@function.method',    { link = 'Function' })
-- hi('@function.macro',     { link = 'Macro' })
-- hi('@variable.parameter', { link = 'Identifier' })
-- hi('@variable.member',    { link = 'Identifier' })
hi('@property',           { fg = gui0C })
hi('@constructor',        { link = 'Function' })

-- Keywords
-- hi('@keyword.conditional', { link = 'Conditional' })
-- hi('@keyword.repeat',      { link = 'Repeat' })
-- hi('@label',               { link = 'Label' })
-- hi('@operator',            { link = 'Operator' })
-- hi('@keyword',             { link = 'Keyword' })
-- hi('@keyword.exception',   { link = 'Exception' })
hi('@keyword.return',      { fg = gui08 })
-- hi('@conditional',         { link = 'Conditional' })

hi('@type',              { link = 'Type' })
hi('@type.builtin',      { link = 'Type' })
-- hi('@type.definition',   { link = 'Typedef' })
-- hi('@keyword.storage',   { link = 'StorageClass' })
-- hi('@keyword.import',    { link = 'Include' })
-- hi('@keyword.directive', { link = 'PreProc' })
-- hi('@keyword.debug',     { link = 'Debug' })
-- hi('@tag',               { link = 'Tag' })
-- hi('@include',           { link = 'Include' })

-- LSP semantic tokens
-- hi('@lsp.type.class',         { link = 'Structure' })
-- hi('@lsp.type.comment',       { link = 'Comment' })
-- hi('@lsp.type.decorator',     { link = 'Function' })
-- hi('@lsp.type.enum',          { link = 'Structure' })
-- hi('@lsp.type.enumMember',    { link = 'Constant' })
-- hi('@lsp.type.function',      { link = 'Function' })
-- hi('@lsp.type.interface',     { link = 'Structure' })
-- hi('@lsp.type.macro',         { link = 'Macro' })
-- hi('@lsp.type.method',        { link = 'Function' })
-- hi('@lsp.type.namespace',     { link = 'Structure' })
-- hi('@lsp.type.parameter',     { link = 'Identifier' })
-- hi('@lsp.type.property',      { link = 'Identifier' })
-- hi('@lsp.type.struct',        { link = 'Structure' })
-- hi('@lsp.type.type',          { link = 'Type' })
-- hi('@lsp.type.typeParameter', { link = 'TypeDef' })
-- hi('@lsp.type.variable',      { link = 'Identifier' })

hi('DiffAdd',      { fg = gui0B, bg = gui00 })
hi('DiffChange',   { fg = gui0D, bg = gui00 })
hi('DiffDelete',   { fg = gui08, bg = gui00 })
hi('DiffText',     { fg = gui05, bg = blue })
hi('DiffAdded',    { fg = gui0B, bg = gui00 })
hi('DiffFile',     { fg = gui0D })
hi('DiffNewFile',  { fg = gui0D })
hi('DiffLine',     { fg = v })
hi('DiffRemoved',  { fg = red, bg = gui00 })

hi('SpellBad',     { sp = 'Red', undercurl = true,              })
hi('SpellCap',     { sp = 'Blue', undercurl = true,             })
hi('SpellLocal',   { sp = 'Cyan', undercurl = true,             })
hi('SpellRare',    { sp = 'Magenta', undercurl = true,          })

hi('Ignore',       {                                            })
