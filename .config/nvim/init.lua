vim.o.clipboard = 'unnamedplus'  -- Yank to system cliboard

vim.o.number = true              -- Show current line number
vim.o.relativenumber = true      -- Show relative line numbers

vim.g.mapleader = [[ ]]          -- Set leader to space

vim.o.ignorecase = true
vim.o.smartcase = true

vim.o.expandtab = true           -- Expand tabs to the proper type and size
vim.o.tabstop = 4                -- Tabs width in spaces
vim.o.softtabstop = 4            -- Soft tab width in spaces
vim.o.shiftwidth = 4             -- Amount of spaces when shifting

vim.o.termguicolors = true       -- Use 24-bit RGB color in terminal

vim.o.mouse = 'a'                -- Enable mouse support

-- vim.o.list = true                -- Always show invisible characters

-- vim.cmd [[ syntax off ]]
vim.cmd [[ let g:gruvbox_material_background='hard']]
vim.cmd [[ let g:gruvbox_contrast_dark='hard' ]]
vim.cmd [[ let g:gruvbox_bold=0 ]]

-- light
-- vim.cmd [[ set background=light ]]
-- vim.cmd [[ colorscheme gruvbox-material ]]

-- vim.cmd [[ colorscheme zenwritten ]]
-- vim.cmd [[ highlight Normal guibg=#ffffdb ]]
-- vim.cmd [[ hi StatusLine guibg=#000000 guifg=#ffffff ]]

-- dark
vim.cmd [[ set background=dark ]]
-- vim.cmd [[ colorscheme gruvbox ]]
-- vim.cmd [[ colorscheme karol ]]

local default_colors = require("kanagawa.colors").setup()
local my_colors = {
    fujiWhite     = "#c5c8c6",
    -- oldWhite      = "#bbbebc",
    -- sumiInk0      = "#141517",
    sumiInk1      = "#1d1f21",
    -- sumiInk2      = "#26292b",
    -- sumiInk3      = "#2f3336",
    -- sumiInk4      = "#393c40",
    -- oniViolet     = "#b294bb", -- Statements and keywords
    -- crystalBlue   = "#81a2be", -- Functions and titles
    -- springViolet2 = "#c5c8c6", -- Brackets and punctuation
    -- springBlue    = "#c397d8", -- Specials and builtin functions
    -- springGreen   = "#b5bd68", -- Strings
    -- -- peachRed      = "#cc6666", -- Standout specials 2 (exception handling, return)
    -- waveAqua2     = "#8abeb7",
    -- carpYellow    = "#f0c674", -- Identifiers
}
require'kanagawa'.setup({ overrides = overrides, colors = my_colors })
vim.cmd[[ colorscheme kanagawa ]]

-- vim.cmd [[ colorscheme kanagawa ]]

-- vim.cmd [[ colorscheme zenwritten ]]
-- vim.cmd [[ let g:sonokai_better_performance=1 ]]
-- vim.cmd [[ colorscheme sonokai ]]

-- 2 tabs in these files:
vim.cmd[[autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab]]
vim.cmd[[autocmd FileType helm setlocal ts=2 sts=2 sw=2 expandtab]]

-- Lua library
require('mappings')
require('plugins')
require('cmpconfig')
require('telescopeconfig')
require('treesitterconfig')
require('nvim-autopairs').setup({
	fast_wrap = {
		map = '<C-e>',
	},
})
require('lsp')
require('lualine').setup{
    options = {
    theme = 'auto',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {},
    always_divide_middle = true,
  },}

--command to get syntax highlighting in a new buffer
--so $VIMRUNTIME/syntax/hitest.vim
