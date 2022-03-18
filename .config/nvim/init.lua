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
vim.o.laststatus = 3             -- Global status line

-- vim.o.list = true                -- Always show invisible characters

-- vim.cmd [[ syntax off ]]
vim.cmd [[ let g:gruvbox_material_background='hard']]

-- light
-- vim.cmd [[ set background=light ]]
-- vim.cmd [[ colorscheme gruvbox-material ]]
-- dark
vim.cmd [[ set background=dark ]]
require("github-theme").setup({
  theme_style = "dark_default",
  comment_style = "NONE",
  keyword_style = "NONE",
  sidebars = {"qf", "vista_kind", "terminal", "packer"},
  dark_sidebar = false,
  -- Change the "hint" color to the "orange" color, and make the "error" color bright red
  -- colors = {hint = "orange", error = "#ff0000"},
  -- Overwrite the highlight groups
  overrides = function(c)
    return {
      Normal = {bg = "#171B21"},
      NormalNC = {bg = "#171B21"},
      VertSplit = {fg = "#a6b4c1", bg = "#171B21"},
      -- WinSeparator = {fg = "#a6b4c1", bg="#171b21"},
      TSType = {fg = "#c9d1d9"},
      TSTypeBuiltin = {fg = "#c9d1d9"},
      TSOperator = {fg = "#79c0ff"},
      TSProperty = {fg = "#79c0ff"},
      StatusLine = {bg = "#212730"},
    }
  end
})

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
