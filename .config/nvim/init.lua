vim.o.clipboard = 'unnamedplus'		-- Yank to system cliboard
vim.o.number = true								-- Show current line number
vim.o.relativenumber = true				-- Show relative line numbers
vim.g.mapleader = [[ ]]						-- Set leader to space
vim.o.ignorecase = true
vim.o.smartcase = true
-- vim.o.expandtab = true					-- Use spaces instead of <Tab>
-- vim.o.softtabstop = 4					-- Soft tab width in spaces
vim.o.tabstop = 4									-- Tab width in spaces
vim.o.shiftwidth = 4							-- Amount of spaces when shifting
vim.o.termguicolors = true				-- Use 24-bit RGB color in terminal
vim.o.mouse = 'a'									-- Enable mouse support
vim.o.laststatus = 3							-- Global status line
-- vim.o.list = true									-- Always show invisible characters

-- Tab is 2 spaces in these files:
vim.cmd[[autocmd FileType yaml setlocal ts=2 sw=2]]
vim.cmd[[autocmd FileType helm setlocal ts=2 sw=2]]
vim.cmd[[autocmd FileType lua setlocal ts=2 sw=2]]

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
require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'zenwritten',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {},
    always_divide_middle = true,
    globalstatus = false,
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  extensions = {}
}

local dn = require('dark_notify')
dn.run({
	schemes = {
		dark = {
			colorscheme = "zenwritten"
		},
			light = {
				colorscheme = "zenwritten",
			}
		},
})
dn.update()

--command to get syntax highlighting in a new buffer
--so $VIMRUNTIME/syntax/hitest.vim
