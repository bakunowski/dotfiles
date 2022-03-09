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

vim.o.list = true                -- Always show invisible characters

-- light
-- vim.cmd [[ syntax off ]]
-- vim.cmd [[ set background=light ]]
-- vim.cmd [[ colorscheme zenwritten ]]
-- vim.cmd [[ highlight Normal guibg=#ffffdb ]]
-- vim.cmd [[ hi StatusLine guibg=#000000 guifg=#ffffff ]]

-- dark
vim.cmd [[ set background=dark ]]
vim.cmd [[ colorscheme zenwritten ]]

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

--command to get syntax highlighting in a new buffer
--so $VIMRUNTIME/syntax/hitest.vim
