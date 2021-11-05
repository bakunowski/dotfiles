local zephyr = {
  bg = '#1e1e1e';

  bg1 = '#d2cdad';
  bg2 = '#777777';
  bg3 = '#c4be94';

  bg_popup = '#1c1c1c';
  bg_highlight  = '#2E323C';
  bg_visual = '#b3deef';


  fg = '#ffffff';

  fg1 = '#888888';

  red = '#825b69';
  green =   '#69825b';

  orange = '#D98E48';
  yellow = '#efed54';

  -- bracket = '#80A0C2';
  bracket = '#eaeaea';
  currsor_bg = '#4f5b66';
  none = 'NONE';
}

function zephyr.terminal_color()
  vim.g.terminal_color_0 = zephyr.bg
  vim.g.terminal_color_1 = zephyr.fg
  vim.g.terminal_color_2 = zephyr.fg
  vim.g.terminal_color_3 = zephyr.yellow
  vim.g.terminal_color_4 = zephyr.fg
  vim.g.terminal_color_5 = zephyr.fg
  vim.g.terminal_color_6 = zephyr.fg
  vim.g.terminal_color_7 = zephyr.bg1
  vim.g.terminal_color_8 = zephyr.fg
  vim.g.terminal_color_9 = zephyr.fg
  vim.g.terminal_color_10 = zephyr.fg
  vim.g.terminal_color_11 = zephyr.yellow
  vim.g.terminal_color_12 = zephyr.fg
  vim.g.terminal_color_13 = zephyr.fg
  vim.g.terminal_color_14 = zephyr.fg
  vim.g.terminal_color_15 = zephyr.fg
end

function zephyr.highlight(group, color)
    local style = color.style and 'gui=' .. color.style or 'gui=NONE'
    local fg = color.fg and 'guifg=' .. color.fg or 'guifg=NONE'
    local bg = color.bg and 'guibg=' .. color.bg or 'guibg=NONE'
    local sp = color.sp and 'guisp=' .. color.sp or ''
    vim.api.nvim_command('highlight ' .. group .. ' ' .. style .. ' ' .. fg ..
                             ' ' .. bg..' '..sp)
end

function zephyr.load_syntax()
  local syntax = {
    Normal = {fg = zephyr.fg,bg=zephyr.bg};
    EndOfBuffer = {fg=zephyr.bg1,bg=zephyr.none};
    ColorColumn = {fg=zephyr.none,bg=zephyr.bg1};
    LineNr = {fg=zephyr.bg2};
    VertSplit = {fg=zephyr.bg,bg=zephyr.bg};

    -- floating windows
    NormalFloat = {fg=zephyr.fg,bg=zephyr.bg_popup};

    -- completion menu
    Pmenu = {fg=zephyr.fg,bg=zephyr.bg_popup};
    PmenuSel = {fg=zephyr.bg,bg=zephyr.fg};
    PmenuSbar = {fg=zephyr.none,bg=zephyr.bg_popup};
    PmenuThumb = {fg=zephyr.none,bg=zephyr.bg1};

    -- search
    IncSearch = {fg=zephyr.bg1,bg=zephyr.orange,style=zephyr.none};
    Search = {fg=zephyr.bg,bg=zephyr.orange};


    Terminal = {fg = zephyr.fg,bg=zephyr.bg};
    SignColumn = {fg=zephyr.fg,bg=zephyr.bg};
    FoldColumn = {fg=zephyr.fg,bg=zephyr.bg};
    Folded = {fg=zephyr.fg,bg=zephyr.bg_highlight};

    Conceal = {fg=zephyr.fg,bg=zephyr.none};
    Cursor = {fg=zephyr.none,bg=zephyr.none,style='reverse'};
    vCursor = {fg=zephyr.none,bg=zephyr.none,style='reverse'};
    iCursor = {fg=zephyr.none,bg=zephyr.none,style='reverse'};
    lCursor = {fg=zephyr.none,bg=zephyr.none,style='reverse'};
    CursorIM = {fg=zephyr.none,bg=zephyr.none,style='reverse'};
    CursorColumn = {fg=zephyr.none,bg=zephyr.bg_highlight};
    CursorLine = {fg=zephyr.none,bg=zephyr.bg_highlight};

    qfLineNr = {fg=zephyr.fg};
    CursorLineNr = {fg=zephyr.fg};

    DiffAdd = {fg=zephyr.bg,bg=zephyr.green};
    DiffChange = {fg=zephyr.bg,bg=zephyr.yellow};
    DiffDelete = {fg=zephyr.bg,bg=zephyr.fg};
    DiffText = {fg=zephyr.bg,bg=zephyr.fg};

    Directory = {fg=zephyr.fg,bg=zephyr.none};

    ErrorMsg = {fg=zephyr.fg,bg=zephyr.none,style='bold'};
    WarningMsg = {fg=zephyr.yellow,bg=zephyr.none,style='bold'};
    ModeMsg = {fg=zephyr.fg,bg=zephyr.none,style='bold'};
    MatchParen = {fg=zephyr.fg,bg=zephyr.none};
    NonText = {fg=zephyr.bracket};
    Whitespace = {fg=zephyr.fg};
    SpecialKey = {fg=zephyr.bg1};
    WildMenu = {fg=zephyr.fg,bg=zephyr.fg};
    Question = {fg=zephyr.yellow};
    Tabline = {fg=zephyr.fg,bg=zephyr.bg};
    TabLineFill = {style=zephyr.none};
    TabLineSel = {fg=zephyr.fg,bg=zephyr.fg};
    StatusLine = {fg=zephyr.fg,bg=zephyr.bg,style=zephyr.none};
    StatusLineNC = {fg=zephyr.fg,bg=zephyr.bg,style=zephyr.none};
    SpellBad = {fg=zephyr.fg,bg=zephyr.none,style='undercurl'};
    SpellCap = {fg=zephyr.fg,bg=zephyr.none,style='undercurl'};
    SpellLocal = {fg=zephyr.fg,bg=zephyr.none,style='undercurl'};
    SpellRare = {fg=zephyr.fg,bg=zephyr.none,style = 'undercurl'};
    Visual = {fg=zephyr.bg,bg=zephyr.bg_visual};
    VisualNOS = {fg=zephyr.bg,bg=zephyr.bg_visual};
    QuickFixLine = {fg=zephyr.fg,style='bold'};
    Debug = {fg=zephyr.orange};
    debugBreakpoint = {fg=zephyr.bg,bg=zephyr.fg};

    Boolean = {fg=zephyr.fg};
    Number = {fg=zephyr.fg};
    Float = {fg=zephyr.fg};
    PreProc = {fg=zephyr.fg};
    PreCondit = {fg=zephyr.fg};
    Include = {fg=zephyr.fg};
    Define = {fg=zephyr.fg};
    Conditional = {fg=zephyr.fg};
    Repeat = {fg=zephyr.fg};
    Keyword = {fg=zephyr.yellow,style='italic'};
    Typedef = {fg=zephyr.fg};
    Exception = {fg=zephyr.fg};
    Statement = {fg=zephyr.fg};
    Error = {fg=zephyr.fg};
    StorageClass = {fg=zephyr.orange};
    Tag = {fg=zephyr.orange};
    Label = {fg=zephyr.orange};
    Structure = {fg=zephyr.orange};
    Operator = {fg=zephyr.fg};
    Title = {fg=zephyr.orange,style='bold'};
    Special = {fg=zephyr.yellow};
    SpecialChar = {fg=zephyr.yellow};
    Type = {fg=zephyr.fg};
    Function = {fg=zephyr.yellow};
    String = {fg=zephyr.fg1};
    Character = {fg=zephyr.fg};
    Constant = {fg=zephyr.fg};
    Macro = {fg=zephyr.fg};
    Identifier = {fg=zephyr.fg};

    Comment = {fg=zephyr.fg1};
    -- SpecialComment = {fg=zephyr.fg};
    Todo = {fg=zephyr.fg};
    Delimiter = {fg=zephyr.fg};
    Ignore = {fg=zephyr.fg};
    Underlined = {fg=zephyr.none,style='underline'};

    DashboardShortCut = {fg=zephyr.fg};
    DashboardHeader = {fg=zephyr.orange};
    DashboardCenter = {fg=zephyr.fg};
    DashboardFooter = {fg=zephyr.yellow,style='bold'};
  }
  return syntax
end

function zephyr.load_plugin_syntax()
  local plugin_syntax = {
    -- treesitter
    TSComment = {fg=zephyr.fg1};
    TSInclude = {fg=zephyr.fg,style='bold'};
    TSString = {fg=zephyr.fg};
    TSFunction = {fg=zephyr.fg};
    TSMethod = {fg=zephyr.fg,style='italic'};
    TSProperty = {fg=zephyr.fg};
    TSOperator = {fg=zephyr.fg};
    TSConditional = {fg=zephyr.fg};
    TSKeyword = {fg=zephyr.yellow,style='italic'};
    TSVariable = {fg=zephyr.fg};
    TSParameter = {fg=zephyr.fg};
    TSField = {fg=zephyr.fg,style='bold'};
    TSNumber = {fg=zephyr.fg,style='bold'};
    TSType = {fg=zephyr.fg,style='bold'};
    TSRepeat = {fg=zephyr.fg};
    TSConstBuiltin = {fg=zephyr.fg,style='bold'};
    TSTypeBuiltin = {fg=zephyr.fg,style='bold'};
    TSFuncBuiltin = {fg=zephyr.fg};
    TSVariableBuiltin = {fg=zephyr.fg};
    TSFuncMacro = {fg=zephyr.fg};
    TSKeywordFunction = {fg=zephyr.fg,style='italic'};
    TSPunctBracket = {fg=zephyr.bracket};

    -- treesitter language specific
    yamlTSNumber = {fg=zephyr.fg};
    yamlTSBoolean = {fg=zephyr.fg};

    IndentBlanklineChar = {fg=zephyr.bg3};

    vimCommentTitle = {fg=zephyr.fg,style='bold'};
    vimLet = {fg=zephyr.orange};
    vimVar = {fg=zephyr.fg};
    vimFunction = {fg=zephyr.fg};
    vimIsCommand = {fg=zephyr.fg};
    vimCommand = {fg=zephyr.fg};
    vimNotFunc = {fg=zephyr.fg,style='bold'};
    vimUserFunc = {fg=zephyr.yellow,style='bold'};
    vimFuncName= {fg=zephyr.yellow,style='bold'};

    diffAdded = {fg = zephyr.green};
    diffRemoved = {fg =zephyr.fg};
    diffChanged = {fg = zephyr.fg};
    diffOldFile = {fg = zephyr.yellow};
    diffNewFile = {fg = zephyr.orange};
    diffFile    = {fg = zephyr.aqua};
    diffLine    = {fg = zephyr.fg};
    diffIndexLine = {fg = zephyr.fg};

    gitcommitSummary = {fg = zephyr.fg};
    gitcommitUntracked = {fg = zephyr.fg};
    gitcommitDiscarded = {fg = zephyr.fg};
    gitcommitSelected = { fg=zephyr.fg};
    gitcommitUnmerged = { fg=zephyr.fg};
    gitcommitOnBranch = { fg=zephyr.fg};
    gitcommitArrow  = {fg = zephyr.fg};
    gitcommitFile  = {fg = zephyr.green};

    VistaBracket = {fg=zephyr.fg};
    VistaChildrenNr = {fg=zephyr.orange};
    VistaKind = {fg=zephyr.purpl};
    VistaScope = {fg=zephyr.fg};
    VistaScopeKind = {fg=zephyr.fg};
    VistaTag = {fg=zephyr.fg,style='bold'};
    VistaPrefix = {fg=zephyr.fg};
    VistaColon = {fg=zephyr.fg};
    VistaIcon = {fg=zephyr.yellow};
    VistaLineNr = {fg=zephyr.fg};

    GitGutterAdd = {fg=zephyr.green};
    GitGutterChange = {fg=zephyr.fg};
    GitGutterDelete = {fg=zephyr.red};
    GitGutterChangeDelete = {fg=zephyr.fg};

    GitSignsAdd = {fg=zephyr.green};
    GitSignsChange = {fg=zephyr.fg};
    GitSignsDelete = {fg=zephyr.fg};
    GitSignsAddNr = {fg=zephyr.green};
    GitSignsChangeNr = {fg=zephyr.fg};
    GitSignsDeleteNr = {fg=zephyr.fg};
    GitSignsAddLn = {bg=zephyr.bg_popup};
    GitSignsChangeLn = {bg=zephyr.bg_highlight};
    GitSignsDeleteLn = {bg=zephyr.bg1};

    SignifySignAdd = {fg=zephyr.green};
    SignifySignChange = {fg=zephyr.fg};
    SignifySignDelete = {fg=zephyr.fg};

    dbui_tables = {fg=zephyr.fg};

    LspDiagnosticsSignError = {fg=zephyr.red};
    LspDiagnosticsSignWarning = {fg=zephyr.yellow};
    LspDiagnosticsSignInformation = {fg=zephyr.fg};
    LspDiagnosticsSignHint = {fg=zephyr.fg};

    LspDiagnosticsVirtualTextError = {fg=zephyr.red};
    LspDiagnosticsVirtualTextWarning= {fg=zephyr.yellow};
    LspDiagnosticsVirtualTextInformation = {fg=zephyr.fg};
    LspDiagnosticsVirtualTextHint = {fg=zephyr.fg};

    LspDiagnosticsUnderlineError = {style="undercurl",sp=zephyr.red};
    LspDiagnosticsUnderlineWarning = {style="undercurl",sp=zephyr.yellow};
    LspDiagnosticsUnderlineInformation = {style="undercurl",sp=zephyr.fg};
    LspDiagnosticsUnderlineHint = {style="undercurl",sp=zephyr.fg};

    CursorWord0 = {bg=zephyr.currsor_bg};
    CursorWord1 = {bg=zephyr.currsor_bg};

    NvimTreeFolderName = {fg=zephyr.fg};
    NvimTreeRootFolder = {fg=zephyr.fg,style='bold'};
    NvimTreeSpecialFile = {fg=zephyr.fg,bg=zephyr.none,stryle='NONE'};

    TelescopeBorder = {fg=zephyr.fg};
    TelescopePromptBorder = {fg=zephyr.fg};
    TelescopeMatching = {fg=zephyr.fg};
    TelescopeSelection = {fg=zephyr.bg,bg=zephyr.fg,style= 'bold'};
    TelescopeSelectionCaret = {fg=zephyr.fg};
    TelescopeMultiSelection = {fg=zephyr.fg};
  }
  return plugin_syntax
end

local async_load_plugin

async_load_plugin = vim.loop.new_async(vim.schedule_wrap(function ()
  zephyr.terminal_color()
  local syntax = zephyr.load_plugin_syntax()
  for group,colors in pairs(syntax) do
    zephyr.highlight(group,colors)
  end
  async_load_plugin:close()
end))

function zephyr.colorscheme()
  vim.api.nvim_command('hi clear')
  if vim.fn.exists('syntax_on') then
    vim.api.nvim_command('syntax reset')
  end
  vim.o.background = 'dark'
  vim.o.termguicolors = true
  vim.g.colors_name = 'zephyr'
  local syntax = zephyr.load_syntax()
  for group,colors in pairs(syntax) do
    zephyr.highlight(group,colors)
  end
  async_load_plugin:send()
end

zephyr.colorscheme()

return zephyr
