local nord = require("karol.colors")

local theme = {}

theme.loadSyntax = function ()
    -- Syntax highlight groups
    local syntax = {
        Type =           { fg = nord.magenta }, -- int, long, char, etc.
        StorageClass =   { fg = nord.magenta }, -- static, register, volatile, etc.
        Structure =      { fg = nord.magenta }, -- struct, union, enum, etc.
        Constant =       { fg = nord.foreground }, -- any constant
        Character =      { fg = nord.green }, -- any character constant: 'c', '\n'
        Number =         { fg = nord.orange }, -- a number constant: 5
        Boolean =        { fg = nord.magenta }, -- a boolean constant: TRUE, false
        Float =          { fg = nord.orange }, -- a floating point constant: 2.3e10
        Statement =      { fg = nord.magenta }, -- any statement
        Label =          { fg = nord.magenta }, -- case, default, etc.
        Operator =       { fg = nord.magenta }, -- sizeof", "+", "*", etc.
        Exception =      { fg = nord.magenta }, -- try, catch, throw
        PreProc =        { fg = nord.magenta }, -- generic Preprocessor
        Include =        { fg = nord.magenta }, -- preprocessor #include
        Define =         { fg = nord.magenta }, -- preprocessor #define
        Macro =          { fg = nord.magenta }, -- same as Define
        Typedef =        { fg = nord.magenta }, -- A typedef
        PreCondit =      { fg = nord.nord13_gui }, -- preprocessor #if, #else, #endif, etc.
        Special =        { fg = nord.foreground }, -- any special symbol
        SpecialChar =    { fg = nord.nord13_gui }, -- special character in a constant
        Tag =            { fg = nord.foreground }, -- you can use CTRL-] on this
        Delimiter =      { fg = nord.nord6_gui }, -- character that needs attention like , or .
        SpecialComment = { fg = nord.nord8_gui }, -- special things inside a comment
        Debug =          { fg = nord.cyan }, -- debugging statements
        Underlined =     { fg = nord.green, bg = nord.none, style = 'underline' }, -- text that stands out, HTML links
        Ignore =         { fg = nord.background1 }, -- left blank, hidden
        Error =          { fg = nord.cyan, bg = nord.none, style = 'bold,underline' }, -- any erroneous construct
        Todo =           { fg = nord.nord13_gui, bg = nord.none, style = 'bold,italic' }, -- anything that needs extra attention; mostly the keywords TODO FIXME and XXX
        Conceal =        { fg = nord.none, bg = nord.background },


        htmlLink = { fg = nord.green, style = "underline" },
        htmlH1 =   { fg = nord.nord8_gui, style = "bold" },
        htmlH2 =   { fg = nord.cyan, style = "bold" },
        htmlH3 =   { fg = nord.green, style = "bold" },
        htmlH4 =   { fg = nord.orange, style = "bold" },
        htmlH5 =   { fg = nord.magenta, style = "bold" },

        markdownH1 = { fg = nord.nord8_gui, style = "bold" },
        markdownH2 = { fg = nord.cyan, style = "bold" },
        markdownH3 = { fg = nord.green, style = "bold" },
        markdownH1Delimiter = { fg = nord.nord8_gui },
        markdownH2Delimiter = { fg = nord.cyan },
        markdownH3Delimiter = { fg = nord.green },
    }

	syntax.Conditional =		{ fg = nord.magenta, bg = nord.none, style = 'italic' } -- italic if, then, else, endif, switch, etc.
	syntax.Keyword =			{ fg = nord.magenta, bg = nord.none, style = 'italic' } -- italic for, do, while, etc.
	syntax.Repeat =				{ fg = nord.magenta, bg = nord.none, style = 'italic' } -- italic any other keyword
	syntax.Comment =		{ fg = nord.background_bright, bg = nord.none, style = 'italic' } -- italic comments
	syntax.Function =		{ fg = nord.nord8_gui, bg = nord.none, style = 'italic' } -- italic funtion names
	syntax.Identifier =		{ fg = nord.magenta, bg = nord.none, style = 'italic' }; -- any variable name
    syntax.String = { fg = nord.green, bg = nord.none, style= 'italic' } -- any string

  return syntax

end


-- Editor highlight groups
theme.loadEditor = function ()
  local editor = {
    Normal =           { fg = nord.foreground, bg = nord.background }, -- normal text and background color
    SignColumn =       { fg = nord.foreground, bg = nord.none },
    VertSplit =        { fg = nord.background },
    NormalFloat =      { fg = nord.foreground, bg = nord.background }, -- floating window
    FloatBorder =      { fg = nord.foreground, bg = nord.background }, -- floating window
    ColorColumn =      { fg = nord.none, bg = nord.background1 }, --  used for the columns set with 'colorcolumn'
    Conceal =          { fg = nord.background1 }, -- placeholder characters substituted for concealed text (see 'conceallevel')
    Cursor =           { fg = nord.foreground, bg = nord.none, style = 'reverse' }, -- the character under the cursor
    CursorIM =         { fg = nord.nord5_gui, bg = nord.none, style = 'reverse' }, -- like Cursor, but used when in IME mode
    Directory =        { fg = nord.blue, bg = nord.none }, -- directory names (and other special names in listings)
    DiffAdd =          { fg = nord.green, bg = nord.none, style = 'reverse' }, -- diff mode: Added line
    DiffChange =       { fg = nord.orange, bg = nord.none, style = 'reverse' }, --  diff mode: Changed line
    DiffDelete =       { fg = nord.red, bg = nord.none, style = 'reverse' }, -- diff mode: Deleted line
    DiffText =         { fg = nord.orange, bg = nord.none, style = 'reverse' }, -- diff mode: Changed text within a changed line
    EndOfBuffer =      { fg = nord.background1 },
    ErrorMsg =         { fg = nord.none },
    Folded =           { fg = nord.nord_3_gui_bright, nord.none, style = 'italic' },
    FoldColumn =       { fg = nord.blue },
    Search =           { fg = nord.background1, bg = nord.foreground, style = 'reverse' },
    IncSearch =        { fg = nord.foreground, bg = nord.orange },
    LineNr =           { fg = nord.background_bright },
    CursorLineNr =     { fg = nord.foreground },
    MatchParen =       { fg = nord.orange, bg = nord.none, style = 'bold' },
    ModeMsg =          { fg = nord.foreground },
    MoreMsg =          { fg = nord.foreground },
    NonText =          { fg = nord.background1 },
    Pmenu =            { fg = nord.foreground, bg = nord.background1 },
    PmenuSel =         { fg = nord.foreground, bg = nord.background_bright },
    PmenuSbar =        { fg = nord.foreground, bg = nord.background1 },
    PmenuThumb =       { fg = nord.foreground, bg = nord.foreground },
    Question =         { fg = nord.green },
    QuickFixLine =     { fg = nord.foreground, nord.nord6_gui, style = 'reverse' },
    qfLineNr =         { fg = nord.foreground, nord.nord6_gui, style = 'reverse' },
    SpecialKey =       { fg = nord.magenta },
    SpellBad =         { fg = nord.cyan, bg = nord.none, style = 'italic,undercurl' },
    SpellCap =         { fg = nord.blue, bg = nord.none, style = 'italic,undercurl' },
    SpellLocal =       { fg = nord.nord8_gui, bg = nord.none, style = 'italic,undercurl' },
    SpellRare =        { fg = nord.magenta, bg = nord.none, style = 'italic,undercurl' },
    StatusLine =       { fg = nord.foreground, bg = nord.window },
    StatusLineNC =     { fg = nord.foreground, bg = nord.background1 },
    StatusLineTerm =   { fg = nord.foreground, bg = nord.window },
    StatusLineTermNC = { fg = nord.foreground, bg = nord.background1 },
    TabLineFill =      { fg = nord.foreground },
    TablineSel =       { fg = nord.nord8_gui, bg = nord.background1 },
    Tabline =          { fg = nord.foreground },
    Title =            { fg = nord.green, bg = nord.none, style = 'bold' },
    Visual =           { fg = nord.none, bg = nord.background1 },
    VisualNOS =        { fg = nord.none, bg = nord.background1 },
    WarningMsg =       { fg = nord.orange },
    WildMenu =         { fg = nord.nord12_gui, bg = nord.none, style = 'bold' },
    CursorColumn =     { fg = nord.none, bg = nord.cursorlinefg },
    CursorLine =       { fg = nord.none, bg = nord.cursorlinefg },
    ToolbarLine =      { fg = nord.foreground, bg = nord.background1 },
    ToolbarButton =    { fg = nord.foreground, bg = nord.none, style = 'bold' },
    NormalMode =       { fg = nord.foreground, bg = nord.none, style = 'reverse' },
    InsertMode =       { fg = nord.green, bg = nord.none, style = 'reverse' },
    ReplacelMode =     { fg = nord.cyan, bg = nord.none, style = 'reverse' },
    VisualMode =       { fg = nord.magenta, bg = nord.none, style = 'reverse' },
    CommandMode =      { fg = nord.foreground, bg = nord.none, style = 'reverse' },
    Warnings =         { fg = nord.orange },

    healthError =   { fg = nord.cyan },
    healthSuccess = { fg = nord.green },
    healthWarning = { fg = nord.orange },

    -- dashboard
    DashboardShortCut = { fg = nord.blue },
    DashboardHeader =   { fg = nord.magenta },
    DashboardCenter =   { fg = nord.nord8_gui },
    DashboardFooter =   { fg = nord.green, style = "italic" },

    -- BufferLine
    BufferLineIndicatorSelected = { fg = nord.background },
    BufferLineFill =              { bg = nord.background },
  }
  return editor
end

theme.loadTerminal = function ()
  vim.g.terminal_color_0 = nord.background1
  vim.g.terminal_color_1 = nord.cyan
  vim.g.terminal_color_2 = nord.green
  vim.g.terminal_color_3 = nord.nord13_gui
  vim.g.terminal_color_4 = nord.magenta
  vim.g.terminal_color_5 = nord.orange
  vim.g.terminal_color_6 = nord.nord8_gui
  vim.g.terminal_color_7 = nord.nord5_gui
  vim.g.terminal_color_8 = nord.background1
  vim.g.terminal_color_9 = nord.cyan
  vim.g.terminal_color_10 = nord.green
  vim.g.terminal_color_11 = nord.nord13_gui
  vim.g.terminal_color_12 = nord.magenta
  vim.g.terminal_color_13 = nord.orange
  vim.g.terminal_color_14 = nord.blue
  vim.g.terminal_color_15 = nord.nord6_gui
end

-- TreeSitter highlight groups
theme.loadTreeSitter = function ()
    local treesitter = {
        TSAnnotation =        { fg = nord.nord12_gui },    -- For C++/Dart attributes, annotations thatcan be attached to the code to denote some kind of meta information.
        TSCharacter=          { fg = nord.green },    -- For characters.
        TSConstructor =       { fg = nord.magenta }, -- For constructor calls and definitions: `={ }` in Lua, and Java constructors.
        TSConstant =          { fg = nord.nord13_gui },    -- For constants
        TSFloat =             { fg = nord.orange },    -- For floats
        TSNumber =            { fg = nord.orange },    -- For all number
        TSString =            { fg = nord.green },    -- For strings.
        TSAttribute =         { fg = nord.orange },    -- (unstable) TODO: docs
        TSBoolean=            { fg = nord.magenta },    -- For booleans.
        TSConstBuiltin =      { fg = nord.blue },    -- For constant that are built in the language: `nil` in Lua.
        TSConstMacro =        { fg = nord.blue },    -- For constants that are defined by macros: `NULL` in C.
        TSError =             { fg = nord.cyan },    -- For syntax/parser errors.
        TSException =         { fg = nord.orange },    -- For exception related keywords.
        TSField =             { fg = nord.green }, -- For fields.
        TSFuncMacro =         { fg = nord.blue },    -- For macro defined fuctions (calls and definitions): each `macro_rules` in Rust.
        TSInclude =           { fg = nord.cyan },    -- For includes: `#include` in C, `use` or `extern crate` in Rust, or `require` in Lua.
        TSLabel =             { fg = nord.orange }, -- For labels: `label:` in C and `:label:` in Lua.
        TSNamespace =         { fg = nord.foreground},    -- For identifiers referring to modules and namespaces.
        TSOperator =          { fg = nord.blue }, -- For any operator: `+`, but also `->` and `*` in C.
        TSParameter =         { fg = nord.foreground }, -- For parameters of a function.
        TSParameterReference= { fg = nord.red },    -- For references to parameters of a function.
        TSProperty =          { fg = nord.blue }, -- Same as `TSField`.
        TSPunctDelimiter =    { fg = nord.foreground }, -- For delimiters ie: `.`
        TSPunctBracket =      { fg = nord.blue }, -- For brackets and parens.
        TSPunctSpecial =      { fg = nord.blue }, -- For special punctutation that does not fall in the catagories before.
        TSStringRegex =       { fg = nord.blue }, -- For regexes.
        TSStringEscape =      { fg = nord.orange }, -- For escape characters within a string.
        TSSymbol =            { fg = nord.orange },    -- For identifiers referring to symbols or atoms.
        TSType =              { fg = nord.magenta},    -- For types.
        TSTypeBuiltin =       { fg = nord.cyan },    -- For builtin types.
        TSTag =               { fg = nord.foreground },    -- Tags like html tag names.
        TSTagDelimiter =      { fg = nord.orange },    -- Tag delimiter like `<` `>` `/`
        TSText =              { fg = nord.foreground },    -- For strings considenord11_gui text in a markup language.
        TSTextReference =     { fg = nord.orange }, -- FIXME
        TSEmphasis =          { fg = nord.red },    -- For text to be represented with emphasis.
        TSUnderline =         { fg = nord.foreground, bg = nord.none, style = 'underline' },    -- For text to be represented with an underline.
        TSTitle =             { fg = nord.red, bg = nord.none, style = 'bold' },    -- Text that is part of a title.
        TSLiteral =           { fg = nord.foreground },    -- Literal text.
        TSURI =               { fg = nord.green },    -- Any URI like a link or email.
        TSComment=          { fg = nord.background_bright, style = 'italic' },
        TSConditional =     { fg = nord.magenta },   -- For keywords related to conditionnals.
        TSKeyword =         { fg = nord.blue }, -- For keywords that don't fall in previous categories.
        TSRepeat =          { fg = nord.magenta },    -- For keywords related to loops.
        TSKeywordFunction = { fg = nord.blue, style = 'italic' },
        TSKeywordOperator = { fg = nord.blue },
        TSFunction =        { fg = nord.red },    -- For fuction (calls and definitions).
        TSMethod =          { fg = nord.cyan },    -- For method calls and definitions.
        TSFuncBuiltin =     { fg = nord.nord8_gui, style = 'italic' },
        TSVariable =        { fg = nord.foreground }, -- Any variable name that does not have another highlight.
        TSVariableBuiltin = { fg = nord.magenta }
    }
  return treesitter
end

-- Lsp highlight groups
theme.loadLSP = function ()
  local lsp = {
    LspDiagnosticsDefaultError =           { fg = nord.red }, -- used for "Error" diagnostic virtual text
    LspDiagnosticsSignError =              { fg = nord.red }, -- used for "Error" diagnostic signs in sign column
    LspDiagnosticsFloatingError =          { fg = nord.red }, -- used for "Error" diagnostic messages in the diagnostics float
    LspDiagnosticsVirtualTextError =       { fg = nord.red }, -- Virtual text "Error"
    LspDiagnosticsUnderlineError =         { style = 'undercurl', sp = nord.red }, -- used to underline "Error" diagnostics.
    LspDiagnosticsDefaultWarning =         { fg = nord.orange}, -- used for "Warning" diagnostic signs in sign column
    LspDiagnosticsSignWarning =            { fg = nord.orange}, -- used for "Warning" diagnostic signs in sign column
    LspDiagnosticsFloatingWarning =        { fg = nord.orange}, -- used for "Warning" diagnostic messages in the diagnostics float
    LspDiagnosticsVirtualTextWarning =     { fg = nord.orange}, -- Virtual text "Warning"
    LspDiagnosticsUnderlineWarning =       { style = 'undercurl', sp = nord.orange }, -- used to underline "Warning" diagnostics.
    LspDiagnosticsDefaultInformation =     { fg = nord.foreground }, -- used for "Information" diagnostic virtual text
    LspDiagnosticsSignInformation =        { fg = nord.foreground },  -- used for "Information" diagnostic signs in sign column
    LspDiagnosticsFloatingInformation =    { fg = nord.foreground }, -- used for "Information" diagnostic messages in the diagnostics float
    LspDiagnosticsVirtualTextInformation = { fg = nord.foreground }, -- Virtual text "Information"
    LspDiagnosticsUnderlineInformation =   { style = 'undercurl', sp = nord.foreground }, -- used to underline "Information" diagnostics.
    LspDiagnosticsDefaultHint =            { fg = nord.magenta  },  -- used for "Hint" diagnostic virtual text
    LspDiagnosticsSignHint =               { fg = nord.magenta  }, -- used for "Hint" diagnostic signs in sign column
    LspDiagnosticsFloatingHint =           { fg = nord.magenta  }, -- used for "Hint" diagnostic messages in the diagnostics float
    LspDiagnosticsVirtualTextHint =        { fg = nord.magenta  }, -- Virtual text "Hint"
    LspDiagnosticsUnderlineHint =          { style = 'undercurl', sp = nord.red }, -- used to underline "Hint" diagnostics.
    LspReferenceText =                     { fg = nord.foreground, bg = nord.background1 }, -- used for highlighting "text" references
    LspReferenceRead =                     { fg = nord.foreground, bg = nord.background1 }, -- used for highlighting "read" references
    LspReferenceWrite =                    { fg = nord.foreground, bg = nord.background1 }, -- used for highlighting "write" references
  }
  return lsp
end

-- Plugins highlight groups
theme.loadPlugins = function()
  local plugins = {
    -- Diff
    diffAdded =     { fg = nord.green },
    diffRemoved =   { fg = nord.red },
    diffChanged =   { fg = nord.orange },
    diffOldFile =   { fg = nord.yelow },
    diffNewFile =   { fg = nord.nord12_gui },
    diffFile =      { fg = nord.blue },
    diffLine =      { fg = nord.background1 },
    diffIndexLine = { fg = nord.magenta },

    -- GitGutter
    GitGutterAdd =    { fg = nord.green }, -- diff mode: Added line |diff.txt|
    GitGutterChange = { fg = nord.orange }, -- diff mode: Changed line |diff.txt|
    GitGutterDelete = { fg = nord.cyan }, -- diff mode: Deleted line |diff.txt|

    -- GitSigns
    GitSignsAdd =      { fg = nord.green }, -- diff mode: Added line |diff.txt|
    GitSignsAddNr =    { fg = nord.green }, -- diff mode: Added line |diff.txt|
    GitSignsAddLn =    { fg = nord.green }, -- diff mode: Added line |diff.txt|
    GitSignsChange =   { fg = nord.orange }, -- diff mode: Changed line |diff.txt|
    GitSignsChangeNr = { fg = nord.orange }, -- diff mode: Changed line |diff.txt|
    GitSignsChangeLn = { fg = nord.orange }, -- diff mode: Changed line |diff.txt|
    GitSignsDelete =   { fg = nord.red }, -- diff mode: Deleted line |diff.txt|
    GitSignsDeleteNr = { fg = nord.red }, -- diff mode: Deleted line |diff.txt|
    GitSignsDeleteLn = { fg = nord.red }, -- diff mode: Deleted line |diff.txt|

    -- Telescope
    TelescopePromptBorder =   { fg = nord.nord8_gui },
    TelescopeResultsBorder =  { fg = nord.magenta },
    TelescopePreviewBorder =  { fg = nord.green },
    TelescopeSelectionCaret = { fg = nord.magenta },
    TelescopeSelection =      { fg = nord.magenta },
    TelescopeMatching =       { fg = nord.nord8_gui },
    TelescopeNormal =         { fg = nord.foreground, bg = nord.float },

    -- NvimTree
    NvimTreeRootFolder =        { fg = nord.red, style = "bold" },
    NvimTreeGitDirty =          { fg = nord.orange },
    NvimTreeGitNew =            { fg = nord.green },
    NvimTreeImageFile =         { fg = nord.orange },
    NvimTreeExecFile =          { fg = nord.green },
    NvimTreeSpecialFile =       { fg = nord.magenta , style = "underline" },
    NvimTreeFolderName=         { fg = nord.green },
    NvimTreeEmptyFolderName=    { fg = nord.background1 },
    NvimTreeFolderIcon=         { fg = nord.foreground },
    NvimTreeIndentMarker =      { fg  = nord.background1 },

    -- Indent Blankline
    IndentBlanklineChar =        { fg = nord.background1 },
    IndentBlanklineContextChar = { fg = nord.red },
  }
  -- Options:
  -- Disable nvim-tree background
  if vim.g.nord_disable_background then
    plugins.NvimTreeNormal = { fg = nord.foreground, bg = nord.none }
  else
    plugins.NvimTreeNormal = { fg = nord.foreground, bg = nord.sidebar }
  end

  if vim.g.nord_enable_sidebar_background then
    plugins.NvimTreeNormal = { fg = nord.foreground, bg = nord.sidebar }
  else
    plugins.NvimTreeNormal = { fg = nord.foreground, bg = nord.none }
  end

  return plugins
end

return theme
