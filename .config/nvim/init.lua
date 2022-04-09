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
vim.o.list = true									-- Always show invisible characters

vim.cmd [[ let g:gruvbox_material_background = 'hard' ]]
local dn = require('dark_notify')
dn.run({
	schemes = {
		dark = {
			colorscheme = "zenwritten"
		},
			light = {
				colorscheme = "gruvbox-material",
			}
		},
})

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

--command to get syntax highlighting in a new buffer
--so $VIMRUNTIME/syntax/hitest.vim
