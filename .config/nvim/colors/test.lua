-- Clear hlgroups and set colors_name {{{
vim.cmd.hi('clear')
vim.g.colors_name = 'test'
-- }}}

-- Palette {{{
-- stylua: ignore start
local gui00
local gui01
local gui02
local gui03
local gui04
local gui05
local gui06
local gui07
local gui08
local gui09
local gui0A
local gui0B
local gui0C
local gui0D
local gui0E
local gui0F

if vim.go.bg == 'dark' then
    gui00 = '#181818'
    gui01 = '#282828'
    gui02 = '#383838'
    gui03 = '#585858'
    gui04 = '#b8b8b8'
    gui05 = '#d8d8d8'
    gui06 = '#e8e8e8'
    gui07 = '#f8f8f8'
    gui08 = '#ab4642'
    gui09 = '#dc9656'
    gui0A = '#f7ca88'
    gui0B = '#a1b56c'
    gui0C = '#86c1b9'
    gui0D = '#7cafc2'
    gui0E = '#ba8baf'
    gui0F = '#a16946'
else
    gui00 = '#181818'
    gui01 = '#282828'
    gui02 = '#383838'
    gui03 = '#585858'
    gui04 = '#b8b8b8'
    gui05 = '#d8d8d8'
    gui06 = '#e8e8e8'
    gui07 = '#f8f8f8'
    gui08 = '#ab4642'
    gui09 = '#dc9656'
    gui0A = '#f7ca88'
    gui0B = '#a1b56c'
    gui0C = '#86c1b9'
    gui0D = '#7cafc2'
    gui0E = '#ba8baf'
    gui0F = '#a16946'
end
-- stylua: ignore end
-- }}}

-- Set terminal colors {{{
-- stylua: ignore start
if vim.go.bg == 'dark' then
    vim.g.terminal_color_0  = gui00
    vim.g.terminal_color_1  = gui08
    vim.g.terminal_color_2  = gui0F
    vim.g.terminal_color_3  = gui0A
    vim.g.terminal_color_4  = gui0D
    vim.g.terminal_color_5  = gui0E
    vim.g.terminal_color_6  = gui0C
    vim.g.terminal_color_7  = gui05
    vim.g.terminal_color_8  = gui03
    vim.g.terminal_color_9  = gui08
    vim.g.terminal_color_10 = gui0B
    vim.g.terminal_color_11 = gui0E
    vim.g.terminal_color_12 = gui0D
    vim.g.terminal_color_13 = gui0E
    vim.g.terminal_color_14 = gui0C
    vim.g.terminal_color_15 = gui07
else
    vim.g.terminal_color_0  = gui00
    vim.g.terminal_color_1  = gui08
    vim.g.terminal_color_2  = gui0F
    vim.g.terminal_color_3  = gui0A
    vim.g.terminal_color_4  = gui0D
    vim.g.terminal_color_5  = gui0E
    vim.g.terminal_color_6  = gui0C
    vim.g.terminal_color_7  = gui05
    vim.g.terminal_color_8  = gui03
    vim.g.terminal_color_9  = gui08
    vim.g.terminal_color_10 = gui0B
    vim.g.terminal_color_11 = gui0E
    vim.g.terminal_color_12 = gui0D
    vim.g.terminal_color_13 = gui0E
    vim.g.terminal_color_14 = gui0C
    vim.g.terminal_color_15 = gui07
end
-- stylua: ignore end
-- }}}

-- Highlight groups {{{1
local hlgroups = {
    -- Vim editor colors {{{2
    Normal       = { fg = gui05, bg = gui00 },
    Bold         = { bold = true },
    Debug        = { fg = gui08 },
    Directory    = { fg = gui0D },
    Error        = { fg = gui00, bg = gui08 },
    ErrorMsg     = { fg = gui08, bg = gui00 },
    Exception    = { fg = gui08 },
    FoldColumn   = { fg = gui03, bg = gui00 },
    Folded       = { fg = gui02, bg = gui00 },
    IncSearch    = { fg = gui01, bg = gui09 },
    Italic       = { italic = true },
    Macro        = { fg = gui0C },
    MatchParen   = { bg = gui03 },
    ModeMsg      = { fg = gui0B },
    MoreMsg      = { fg = gui0B },
    Question     = { fg = gui0D },
    Search       = { fg = gui01, bg = gui0A },
    Substitute   = { fg = gui01, bg = gui0A },
    SpecialKey   = { fg = gui03 },
    TooLong      = { fg = gui08 },
    Underlined   = { underline = true },
    Visual       = { bg = gui02 },
    VisualNOS    = { fg = gui08 },
    WarningMsg   = { fg = gui08 },
    WildMenu     = { fg = gui00, bg = gui05 },
    Title        = { fg = gui0D },
    Conceal      = { fg = gui0D },
    Cursor       = { fg = gui05, bg = gui00, reverse = true },
    NonText      = { fg = gui03 },
    Whitespace   = { fg = gui03 },
    LineNr       = { fg = gui03, bg = gui00 },
    SignColumn   = { fg = gui03, bg = gui00 },
    StatusLine   = { fg = gui04, bg = gui01 },
    StatusLineNC = { fg = gui03, bg = gui01 },
    VertSplit    = { fg = gui02, bg = gui00 },
    WinSeparator = { fg = gui02, bg = gui00 },
    ColorColumn  = { bg = gui01 },
    CursorColumn = { bg = gui01 },
    CursorLine   = { bg = gui01 },
    CursorLineNr = { fg = gui04, bg = gui01, bold = true },
    QuickFixLine = { bg = gui01 },
    Pmenu        = { fg = gui06, bg = gui01 },
    PmenuSbar    = { bg = gui03 },
    PmenuSel     = { fg = gui06, bg = gui02 },
    PmenuThumb   = { bg = gui04 },
    TabLine      = { fg = gui03, bg = gui01 },
    TabLineFill  = { fg = gui03, bg = gui01 },
    TabLineSel   = { fg = gui0B, bg = gui01 },
    -- }}}

    -- Standard syntax {{{2
    Boolean      = { fg = gui09 },
    Character    = { fg = gui08 },
    Comment      = { fg = gui03 },
    Conditional  = { fg = gui0E },
    Constant     = { fg = gui09 },
    Define       = { fg = gui0E },
    Delimiter    = { fg = gui04 },
    Deprecated   = { strikethrough = true },
    Float        = { fg = gui09 },
    Function     = { fg = gui05 },
    Identifier   = { fg = gui0D },
    Include      = { fg = gui0D },
    Keyword      = { fg = gui0D },
    Label        = { fg = gui0A },
    Number       = { fg = gui09 },
    Operator     = { fg = gui09 },
    PreProc      = { fg = gui0C },
    Repeat       = { fg = gui0E },
    Special      = { fg = gui0C },
    SpecialChar  = { fg = gui0F },
    Statement    = { fg = gui08 },
    StorageClass = { fg = gui0A },
    String       = { fg = gui0B },
    Structure    = { fg = gui05 },
    Tag          = { fg = gui0A },
    Todo         = { fg = gui08, bg = gui00, bold = true },
    Type         = { fg = gui0A },
    Typedef      = { fg = gui0A },
    -- }}}

    -- Common {{{2
    -- CurSearch = { link = 'IncSearch' },
    -- CursorIM = { link = 'Cursor' },
    -- DiffAdd = { bg = c_grass },
    -- DiffChange = { bg = c_lavender },
    -- DiffDelete = { fg = c_faint },
    -- DiffText = { fg = c_foreground, bg = c_violet },
    -- EndOfBuffer = { fg = c_subtle },
    -- FloatBorder = { fg = c_foreground, bg = c_subtle },
    -- FloatShadow = { bg = c_black, blend = 70 },
    -- FloatShadowThrough = { link = 'None' },
    -- HealthSuccess = { fg = c_faded },
    -- MsgArea = { link = 'Normal' },
    -- MsgSeparator = { link = 'StatusLine' },
    -- NormalFloat = { fg = c_foreground, bg = c_subtle },
    -- NormalNC = { link = 'Normal' },
    -- SpellBad = { underdashed = true },
    -- SpellCap = { link = 'SpellBad' },
    -- SpellLocal = { link = 'SpellBad' },
    -- SpellRare = { link = 'SpellBad' },
    -- TermCursor = { fg = c_subtle, bg = c_popout },
    -- TermCursorNC = { fg = c_critical, bg = c_subtle },
    -- WinBar = { fg = c_foreground },
    -- WinBarNC = { fg = c_faded },
    -- lCursor = { link = 'Cursor' },
    -- }}}2

    -- -- Syntax {{{2
    -- DocumentKeyword = { link = 'Keyword' },
    -- Array = { fg = c_critical },
    -- Builtin = { fg = c_foreground },
    -- Field = { link = 'None' },
    -- Enum = { fg = c_faded },
    -- Namespace = { fg = c_foreground },
    -- Specifier = { fg = c_salient },
    -- Object = { fg = c_salient },
    -- PreCondit = { link = 'PreProc' },
    -- Bracket = { fg = c_foreground },
    -- SpecialComment = { link = 'SpecialChar' },
    -- Ignore = { fg = c_subtle },
    -- -- }}}2
    --
    -- -- Treesitter syntax {{{2
    -- ['@field'] = { link = 'Field' },
    ['@property'] = { link = 'Normal' },
    -- ['@annotation'] = { link = 'Operator' },
    -- ['@comment'] = { link = 'Comment' },
    -- ['@none'] = { link = 'None' },
    -- ['@preproc'] = { link = 'PreProc' },
    -- ['@define'] = { link = 'Define' },
    -- ['@operator'] = { link = 'Operator' },
    -- ['@punctuation.delimiter'] = { link = 'Delimiter' },
    -- ['@punctuation.bracket'] = { link = 'Bracket' },
    -- ['@punctuation.special'] = { link = 'Delimiter' },
    -- ['@string'] = { link = 'String' },
    -- ['@string.regex'] = { link = 'String' },
    -- ['@string.escape'] = { link = 'SpecialChar' },
    -- ['@string.special'] = { link = 'SpecialChar' },
    -- ['@character'] = { link = 'Character' },
    -- ['@character.special'] = { link = 'SpecialChar' },
    -- ['@boolean'] = { link = 'Boolean' },
    -- ['@number'] = { link = 'Number' },
    -- ['@float'] = { link = 'Float' },
    -- ['@function'] = { link = 'Function' },
    -- ['@function.call'] = { link = 'Function' },
    -- ['@function.builtin'] = { link = 'Function' },
    -- ['@function.macro'] = { link = 'Macro' },
    -- ['@method'] = { link = 'Function' },
    -- ['@method.call'] = { link = 'Function' },
    -- ['@constructor'] = { link = 'Function' },
    -- ['@constructor.lua'] = { link = 'None' },
    -- ['@parameter'] = { link = 'Parameter' },
    -- ['@keyword'] = { link = 'Keyword' },
    -- ['@keyword.function'] = { link = 'Keyword' },
    -- ['@keyword.return'] = { link = 'Keyword' },
    -- ['@conditional'] = { link = 'Conditional' },
    -- ['@repeat'] = { link = 'Repeat' },
    -- ['@debug'] = { link = 'Debug' },
    -- ['@label'] = { link = 'Keyword' },
    -- ['@include'] = { link = 'Include' },
    -- ['@exception'] = { link = 'Exception' },
    -- ['@type'] = { link = 'Type' },
    -- ['@type.Builtin'] = { link = 'Type' },
    -- ['@type.qualifier'] = { link = 'Type' },
    -- ['@type.definition'] = { link = 'Typedef' },
    -- ['@storageclass'] = { link = 'StorageClass' },
    -- ['@attribute'] = { link = 'Label' },
    -- ['@variable'] = { link = 'Identifier' },
    -- ['@variable.Builtin'] = { link = 'Builtin' },
    -- ['@constant'] = { link = 'Constant' },
    -- ['@constant.Builtin'] = { link = 'Constant' },
    -- ['@constant.macro'] = { link = 'Macro' },
    -- ['@namespace'] = { link = 'Namespace' },
    -- ['@symbol'] = { link = 'Identifier' },
    -- ['@text.title'] = { link = 'Title' },
    -- ['@text.literal'] = { link = 'String' },
    -- ['@text.uri'] = { link = 'htmlLink' },
    -- ['@text.environment'] = { link = 'Macro' },
    -- ['@text.environment.name'] = { link = 'Type' },
    -- ['@text.reference'] = { link = 'Constant' },
    -- ['@text.title.1.markdown'] = { link = 'markdownH1' },
    -- ['@text.title.2.markdown'] = { link = 'markdownH2' },
    -- ['@text.title.3.markdown'] = { link = 'markdownH3' },
    -- ['@text.title.4.markdown'] = { link = 'markdownH4' },
    -- ['@text.title.5.markdown'] = { link = 'markdownH5' },
    -- ['@text.title.6.markdown'] = { link = 'markdownH6' },
    -- ['@text.title.1.marker.markdown'] = { link = 'markdownH1Delimiter' },
    -- ['@text.title.2.marker.markdown'] = { link = 'markdownH2Delimiter' },
    -- ['@text.title.3.marker.markdown'] = { link = 'markdownH3Delimiter' },
    -- ['@text.title.4.marker.markdown'] = { link = 'markdownH4Delimiter' },
    -- ['@text.title.5.marker.markdown'] = { link = 'markdownH5Delimiter' },
    -- ['@text.title.6.marker.markdown'] = { link = 'markdownH6Delimiter' },
    -- ['@text.todo'] = { link = 'Todo' },
    -- ['@text.todo.unchecked'] = { link = 'Todo' },
    -- ['@text.todo.checked'] = { link = 'Done' },
    -- ['@text.note'] = { link = 'SpecialComment' },
    -- ['@text.warning'] = { link = 'WarningMsg' },
    -- ['@text.danger'] = { link = 'ErrorMsg' },
    -- ['@text.diff.add'] = { link = 'DiffAdded' },
    -- ['@text.diff.delete'] = { link = 'DiffRemoved' },
    -- ['@tag'] = { link = 'Tag' },
    -- ['@tag.attribute'] = { link = 'Identifier' },
    -- ['@tag.delimiter'] = { link = 'Delimiter' },
    -- ['@text.strong'] = { bold = true },
    -- ['@text.strike'] = { strikethrough = true },
    -- ['@text.emphasis'] = { fg = c_popout, bold = true },
    -- ['@text.underline'] = { underline = true },
    -- ['@keyword.operator'] = { link = 'Operator' },
    -- -- }}}2


    -- LSP semantic {{{2
    -- ['@lsp.type.enum'] = { link = 'Type' },
    -- ['@lsp.type.type'] = { link = 'Type' },
    -- ['@lsp.type.class'] = { link = 'Structure' },
    -- ['@lsp.type.struct'] = { link = 'Structure' },
    -- ['@lsp.type.macro'] = { link = 'Macro' },
    -- ['@lsp.type.method'] = { link = 'Function' },
    -- ['@lsp.type.comment'] = { link = 'Comment' },
    -- ['@lsp.type.function'] = { link = 'Function' },
    -- ['@lsp.type.property'] = { link = 'Field' },
    -- ['@lsp.type.variable'] = { link = 'Variable' },
    -- ['@lsp.type.decorator'] = { link = 'Label' },
    -- ['@lsp.type.interface'] = { link = 'Structure' },
    -- ['@lsp.type.namespace'] = { link = 'Namespace' },
    -- ['@lsp.type.parameter'] = { link = 'Parameter' },
    -- ['@lsp.type.enumMember'] = { link = 'Enum' },
    -- ['@lsp.type.typeParameter'] = { link = 'Parameter' },
    -- ['@lsp.typemod.keyword.documentation'] = { link = 'DocumentKeyword' },
    -- ['@lsp.typemod.function.defaultLibrary'] = { link = 'Function' },
    -- ['@lsp.typemod.variable.defaultLibrary'] = { link = 'Builtin' },
    -- ['@lsp.typemod.variable.global'] = { link = 'Identifier' },
    -- }}}2

    -- LSP {{{2
    -- LspReferenceText = { link = 'Visual' },
    -- LspReferenceRead = { link = 'LspReferenceText' },
    -- LspReferenceWrite = { link = 'LspReferenceText' },
    -- LspSignatureActiveParameter = { link = 'IncSearch' },
    -- LspInfoBorder = { link = 'FloatBorder' },
    -- }}}2

    -- Diagnostic {{{2
    -- DiagnosticOk = { fg = c_pine },
    -- DiagnosticError = { fg = c_critical },
    -- DiagnosticWarn = { fg = c_popout },
    -- DiagnosticInfo = { fg = c_salient },
    -- DiagnosticHint = { fg = c_foreground },
    -- DiagnosticVirtualTextOk = { fg = c_faded, bg = c_highlight },
    -- DiagnosticVirtualTextError = { fg = c_critical, bg = c_highlight },
    -- DiagnosticVirtualTextWarn = { fg = c_popout, bg = c_highlight },
    -- DiagnosticVirtualTextInfo = { fg = c_salient, bg = c_highlight },
    -- DiagnosticVirtualTextHint = { fg = c_foreground, bg = c_highlight },
    -- DiagnosticUnderlineOk = { underline = true, sp = c_faded },
    -- DiagnosticUnderlineError = { undercurl = true, sp = c_critical },
    -- DiagnosticUnderlineWarn = { undercurl = true, sp = c_popout },
    -- DiagnosticUnderlineInfo = { undercurl = true, sp = c_salient },
    -- DiagnosticUnderlineHint = { undercurl = true, sp = c_subtle },
    -- DiagnosticFloatingOk = { link = 'DiagnosticOk' },
    -- DiagnosticFloatingError = { link = 'DiagnosticError' },
    -- DiagnosticFloatingWarn = { link = 'DiagnosticWarn' },
    -- DiagnosticFloatingInfo = { link = 'DiagnosticInfo' },
    -- DiagnosticFloatingHint = { link = 'DiagnosticHint' },
    -- DiagnosticSignOk = { link = 'DiagnosticOk' },
    -- DiagnosticSignError = { link = 'DiagnosticError' },
    -- DiagnosticSignWarn = { link = 'DiagnosticWarn' },
    -- DiagnosticSignInfo = { link = 'DiagnosticInfo' },
    -- DiagnosticSignHint = { link = 'DiagnosticHint' },
    -- }}}2

    -- Filetype {{{2
    -- HTML
    -- htmlArg = { fg = c_foreground },
    -- htmlBold = { bold = true },
    -- htmlBoldItalic = { bold = true, italic = true },
    -- htmlTag = { fg = c_foreground },
    -- htmlTagName = { link = 'Tag' },
    -- htmlSpecialTagName = { fg = c_strong },
    -- htmlEndTag = { fg = c_strong },
    -- htmlH1 = { fg = c_salient, bold = true },
    -- htmlH2 = { fg = c_salient, bold = true },
    -- htmlH3 = { fg = c_salient, bold = true },
    -- htmlH4 = { fg = c_salient, bold = true },
    -- htmlH5 = { fg = c_salient, bold = true },
    -- htmlH6 = { fg = c_salient, bold = true },
    -- htmlItalic = { italic = true },
    -- htmlLink = { fg = c_faded, underline = true },
    -- htmlSpecialChar = { link = 'SpecialChar' },
    -- htmlTitle = { fg = c_foreground },

    -- Json
    -- jsonKeyword = { link = 'Keyword' },
    -- jsonBraces = { fg = c_foreground },

    -- Markdown
    -- markdownBold = { bold = true },
    -- markdownBoldItalic = { bold = true, italic = true },
    -- markdownCode = { fg = c_popout },
    -- markdownError = { link = 'None' },
    -- markdownEscape = { link = 'None' },
    -- markdownListMarker = { fg = c_critical },
    -- markdownH1 = { link = 'htmlH1' },
    -- markdownH2 = { link = 'htmlH2' },
    -- markdownH3 = { link = 'htmlH3' },
    -- markdownH4 = { link = 'htmlH4' },
    -- markdownH5 = { link = 'htmlH5' },
    -- markdownH6 = { link = 'htmlH6' },

    -- Shell
    -- shDeref = { link = 'Macro' },
    -- shDerefVar = { link = 'Macro' },

    -- Git
    -- gitHash = { fg = c_faded },

    -- Checkhealth
    -- helpHeader = { fg = c_foreground, bold = true },
    -- helpSectionDelim = { fg = c_faded, bold = true },
    -- helpCommand = { fg = c_salient },
    -- helpBacktick = { fg = c_salient },

    -- Man
    -- manBold = { fg = c_salient, bold = true },
    -- manItalic = { fg = c_faded, italic = true },
    -- manOptionDesc = { fg = c_faded },
    -- manReference = { link = 'htmlLink' },
    -- manSectionHeading = { link = 'manBold' },
    -- manUnderline = { fg = c_popout },
    -- }}}2

    -- Plugins {{{2
    -- netrw
    -- netrwClassify = { link = 'Directory' },

    -- nvim-cmp
    -- CmpItemAbbrDeprecated = { strikethrough = true },
    -- CmpItemAbbrMatch = { fg = c_salient },
    -- CmpItemAbbrMatchFuzzy = { link = 'CmpItemAbbrMatch' },
    -- CmpItemKindText = { link = 'String' },
    -- CmpItemKindMethod = { link = 'Function' },
    -- CmpItemKindFunction = { link = 'Function' },
    -- CmpItemKindConstructor = { link = 'Function' },
    -- CmpItemKindField = { fg = c_salient },
    -- CmpItemKindProperty = { link = 'CmpItemKindField' },
    -- CmpItemKindVariable = { fg = c_popout },
    -- CmpItemKindReference = { link = 'CmpItemKindVariable' },
    -- CmpItemKindModule = { fg = c_salient },
    -- CmpItemKindEnum = { fg = c_faded },
    -- CmpItemKindEnumMember = { link = 'CmpItemKindEnum' },
    -- CmpItemKindKeyword = { link = 'Keyword' },
    -- CmpItemKindOperator = { link = 'Operator' },
    -- CmpItemKindSnippet = { fg = c_pine },
    -- CmpItemKindColor = { fg = c_faded },
    -- CmpItemKindConstant = { link = 'Constant' },
    -- CmpItemKindCopilot = { fg = c_salient },
    -- CmpItemKindValue = { link = 'Number' },
    -- CmpItemKindClass = { link = 'Type' },
    -- CmpItemKindStruct = { link = 'Type' },
    -- CmpItemKindEvent = { fg = c_tea },
    -- CmpItemKindInterface = { fg = c_faded },
    -- CmpItemKindFile = { link = 'DevIconDefault' },
    -- CmpItemKindFolder = { link = 'Directory' },
    -- CmpItemKindUnit = { fg = c_salient },
    -- CmpItemKind = { fg = c_foreground },
    -- CmpItemMenu = { link = 'Pmenu' },
    -- CmpVirtualText = { fg = c_faint, italic = true },

    -- gitsigns
    -- GitSignsAdd = { fg = c_tea },
    -- GitSignsAddInline = { fg = c_pine },
    -- GitSignsAddLnInline = { fg = c_pine },
    -- GitSignsAddPreview = { fg = c_pine },
    -- GitSignsChange = { fg = c_violet },
    -- GitSignsChangeInline = { fg = c_violet },
    -- GitSignsChangeLnInline = { fg = c_violet },
    -- GitSignsCurrentLineBlame = { fg = c_violet },
    -- GitSignsDelete = { fg = c_vermillion },
    -- GitSignsDeleteInline = { fg = c_popout },
    -- GitSignsDeleteLnInline = { fg = c_popout },
    -- GitSignsDeletePreview = { fg = c_popout },
    -- GitSignsDeleteVirtLnInLine = { fg = c_popout },
    -- GitSignsUntracked = { fg = c_subtle },
    -- GitSignsUntrackedLn = { fg = c_subtle },
    -- GitSignsUntrackedNr = { fg = c_subtle },

    -- fugitive
    -- fugitiveHash = { link = 'gitHash' },
    -- fugitiveHeader = { link = 'Title' },
    -- fugitiveHeading = { fg = c_critical, bold = true },
    -- fugitiveHelpTag = { fg = c_critical },
    -- fugitiveSymbolicRef = { fg = c_strong },
    -- fugitiveStagedModifier = { fg = c_pine, bold = true },
    -- fugitiveUnstagedModifier = { fg = c_salient, bold = true },
    -- fugitiveUntrackedModifier = { fg = c_faded, bold = true },
    -- fugitiveStagedHeading = { fg = c_pine, bold = true },
    -- fugitiveUnstagedHeading = { fg = c_salient, bold = true },
    -- fugitiveUntrackedHeading = { fg = c_faded, bold = true },
    -- DiffAdded = { fg = c_pine },

    -- telescope
    -- TelescopeNormal = { fg = c_foreground, bg = c_background },
    -- TelescopePromptNormal = { bg = c_highlight },
    -- TelescopeTitle = { fg = c_subtle, bg = c_faded, bold = true },
    -- TelescopeBorder = { fg = c_foreground, bg = c_background },
    -- TelescopePromptBorder = { fg = c_foreground, bg = c_highlight },
    -- TelescopePreviewLine = { bg = c_shaded },
    -- TelescopePreviewMatch = { fg = c_salient, bold = true },
    -- TelescopeMatching = { fg = c_salient, bold = true },
    -- TelescopePromptCounter = { link = 'Comment' },
    -- TelescopePromptPrefix = { fg = c_critical },
    -- TelescopeSelection = { fg = c_foreground, bg = c_shaded },
    -- TelescopeMultiIcon = { fg = c_salient, bold = true },
    -- TelescopeMultiSelection = { bg = c_shaded, bold = true },
    -- TelescopeSelectionCaret = { fg = c_critical, bg = c_shaded },

    -- nvim-dap-ui
    -- DapUIBreakpointsCurrentLine = { link = 'CursorLineNr' },
    -- DapUIBreakpointsInfo = { fg = c_faded },
    -- DapUIBreakpointsPath = { link = 'Directory' },
    -- DapUICurrentFrameName = { fg = c_faded, bold = true },
    -- DapUIDecoration = { fg = c_strong },
    -- DapUIFloatBorder = { link = 'FloatBorder' },
    -- DapUILineNumber = { link = 'LineNr' },
    -- DapUIModifiedValue = { fg = c_salient, bold = true },
    -- DapUINormalFloat = { link = 'NormalFloat' },
    -- DapUIPlayPause = { fg = c_faded },
    -- DapUIPlayPauseNC = { fg = c_faded },
    -- DapUIRestart = { fg = c_faded },
    -- DapUIRestartNC = { fg = c_faded },
    -- DapUIScope = { fg = c_critical },
    -- DapUISource = { link = 'Directory' },
    -- DapUIStepBack = { fg = c_salient },
    -- DapUIStepBackRC = { fg = c_salient },
    -- DapUIStepInto = { fg = c_salient },
    -- DapUIStepIntoRC = { fg = c_salient },
    -- DapUIStepOut = { fg = c_salient },
    -- DapUIStepOutRC = { fg = c_salient },
    -- DapUIStepOver = { fg = c_salient },
    -- DapUIStepOverRC = { fg = c_salient },
    -- DapUIStop = { fg = c_popout },
    -- DapUIStopNC = { fg = c_popout },
    -- DapUIStoppedThread = { fg = c_faded },
    -- DapUIThread = { fg = c_foreground },
    -- DapUIType = { link = 'Type' },
    -- DapUIValue = { link = 'Number' },
    -- DapUIVariable = { link = 'Identifier' },
    -- DapUIWatchesEmpty = { link = 'Comment' },
    -- DapUIWatchesError = { link = 'Error' },
    -- DapUIWatchesValue = { fg = c_critical },

    -- vimtex
    -- texArg = { fg = c_foreground },
    -- texArgNew = { fg = c_salient },
    -- texCmd = { fg = c_strong },
    -- texCmdBib = { link = 'texCmd' },
    -- texCmdClass = { link = 'texCmd' },
    -- texCmdDef = { link = 'texCmd' },
    -- texCmdE3 = { link = 'texCmd' },
    -- texCmdEnv = { link = 'texCmd' },
    -- texCmdEnvM = { link = 'texCmd' },
    -- texCmdError = { link = 'ErrorMsg' },
    -- texCmdFatal = { link = 'ErrorMsg' },
    -- texCmdGreek = { link = 'texCmd' },
    -- texCmdInput = { link = 'texCmd' },
    -- texCmdItem = { link = 'texCmd' },
    -- texCmdLet = { link = 'texCmd' },
    -- texCmdMath = { link = 'texCmd' },
    -- texCmdNew = { link = 'texCmd' },
    -- texCmdPart = { link = 'texCmd' },
    -- texCmdRef = { link = 'texCmd' },
    -- texCmdSize = { link = 'texCmd' },
    -- texCmdStyle = { link = 'texCmd' },
    -- texCmdTitle = { link = 'texCmd' },
    -- texCmdTodo = { link = 'texCmd' },
    -- texCmdType = { link = 'texCmd' },
    -- texCmdVerb = { link = 'texCmd' },
    -- texComment = { link = 'Comment' },
    -- texDefParm = { link = 'Keyword' },
    -- texDelim = { fg = c_foreground },
    -- texE3Cmd = { link = 'texCmd' },
    -- texE3Delim = { link = 'texDelim' },
    -- texE3Opt = { link = 'texOpt' },
    -- texE3Parm = { link = 'texParm' },
    -- texE3Type = { link = 'texCmd' },
    -- texEnvOpt = { link = 'texOpt' },
    -- texError = { link = 'ErrorMsg' },
    -- texFileArg = { link = 'Directory' },
    -- texFileOpt = { link = 'texOpt' },
    -- texFilesArg = { link = 'texFileArg' },
    -- texFilesOpt = { link = 'texFileOpt' },
    -- texLength = { fg = c_salient },
    -- texLigature = { fg = c_foreground },
    -- texOpt = { fg = c_foreground },
    -- texOptEqual = { fg = c_critical },
    -- texOptSep = { fg = c_critical },
    -- texParm = { fg = c_foreground },
    -- texRefArg = { fg = c_salient },
    -- texRefOpt = { link = 'texOpt' },
    -- texSymbol = { fg = c_critical },
    -- texTitleArg = { link = 'Title' },
    -- texVerbZone = { fg = c_foreground },
    -- texZone = { fg = c_subtle },
    -- texMathArg = { fg = c_foreground },
    -- texMathCmd = { link = 'texCmd' },
    -- texMathSub = { fg = c_foreground },
    -- texMathOper = { fg = c_critical },
    -- texMathZone = { fg = c_strong },
    -- texMathDelim = { fg = c_foreground },
    -- texMathError = { link = 'Error' },
    -- texMathGroup = { fg = c_foreground },
    -- texMathSuper = { fg = c_foreground },
    -- texMathSymbol = { fg = c_strong },
    -- texMathZoneLD = { fg = c_foreground },
    -- texMathZoneLI = { fg = c_foreground },
    -- texMathZoneTD = { fg = c_foreground },
    -- texMathZoneTI = { fg = c_foreground },
    -- texMathCmdText = { link = 'texCmd' },
    -- texMathZoneEnv = { fg = c_foreground },
    -- texMathArrayArg = { fg = c_strong },
    -- texMathCmdStyle = { link = 'texCmd' },
    -- texMathDelimMod = { fg = c_foreground },
    -- texMathSuperSub = { fg = c_foreground },
    -- texMathDelimZone = { fg = c_foreground },
    -- texMathStyleBold = { fg = c_foreground, bold = true },
    -- texMathStyleItal = { fg = c_foreground, italic = true },
    -- texMathEnvArgName = { fg = c_salient },
    -- texMathErrorDelim = { link = 'Error' },
    -- texMathDelimZoneLD = { fg = c_faded },
    -- texMathDelimZoneLI = { fg = c_faded },
    -- texMathDelimZoneTD = { fg = c_faded },
    -- texMathDelimZoneTI = { fg = c_faded },
    -- texMathZoneEnsured = { fg = c_foreground },
    -- texMathCmdStyleBold = { fg = c_strong, bold = true },
    -- texMathCmdStyleItal = { fg = c_strong, italic = true },
    -- texMathStyleConcArg = { fg = c_foreground },
    -- texMathZoneEnvStarred = { fg = c_foreground },

    -- lazy.nvim
    -- LazyDir = { link = 'Directory' },
    -- LazyUrl = { link = 'htmlLink' },
    -- LazySpecial = { link = 'Special' },
    -- LazyCommit = { fg = c_faded },
    -- LazyReasonFt = { fg = c_salient },
    -- LazyReasonCmd = { fg = c_salient },
    -- LazyReasonPlugin = { fg = c_salient },
    -- LazyReasonSource = { fg = c_salient },
    -- LazyReasonRuntime = { fg = c_salient },
    -- LazyReasonEvent = { fg = c_salient },
    -- LazyReasonKeys = { fg = c_faded },
    -- LazyButton = { bg = c_subtle },
    -- LazyButtonActive = { bg = c_shaded, bold = true },
    -- LazyH1 = { fg = c_subtle, bg = c_faint, bold = true },
    --
    -- -- copilot.lua
    -- CopilotSuggestion = { fg = c_faint, italic = true },
    -- CopilotAnnotation = { fg = c_faint, italic = true },
    --
    -- -- statusline
    -- StatusLineDiagnosticError = { fg = c_critical, bg = c_subtle },
    -- StatusLineDiagnosticHint = { fg = c_foreground, bg = c_subtle },
    -- StatusLineDiagnosticInfo = { fg = c_salient, bg = c_subtle },
    -- StatusLineDiagnosticWarn = { fg = c_popout, bg = c_subtle },
    -- StatusLineGitAdded = { fg = c_pine, bg = c_subtle },
    -- StatusLineGitChanged = { fg = c_faded, bg = c_subtle },
    -- StatusLineGitRemoved = { fg = c_popout, bg = c_subtle },
    -- StatusLineHeader = { fg = c_background, bg = c_faded },
    -- StatusLineHeaderModified = { fg = c_background, bg = c_popout },
    --
    -- -- winbar
    -- WinBarIconUIIndicator = { fg = c_salient },
    -- WinBarMenuNormalFloat = { fg = c_foreground, bg = c_highlight },
    -- WinBarMenuHoverIcon = { fg = c_salient, bg = c_faint },
    -- WinBarMenuHoverEntry = { fg = c_foreground, bg = c_subtle },
    -- WinBarMenuCurrentContext = { fg = c_foreground, bg = c_subtle },

    -- }}}2
}
-- }}}1

-- Highlight group overrides {{{1
-- if vim.go.bg == 'dark' then
-- 	hlgroups.String = { fg = c_popout }
-- 	hlgroups.CmpItemAbbrMatch = { fg = c_critical }
-- 	hlgroups.DiffText = { fg = c_background, bg = c_faded }
-- 	hlgroups.TelescopePreviewMatch = { fg = c_critical, bold = true }
-- 	hlgroups.TelescopeMatching = { fg = c_critical, bold = true }
-- end
-- }}}1

-- Set highlight groups {{{1
for hlgroup_name, hlgroup_attr in pairs(hlgroups) do
    vim.api.nvim_set_hl(0, hlgroup_name, hlgroup_attr)
end
-- }}}1
