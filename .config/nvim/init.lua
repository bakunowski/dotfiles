vim.o.number = true -- Show current line number
vim.o.relativenumber = true -- Show relative line numbers
vim.g.mapleader = [[ ]] -- Set leader to space
vim.o.ignorecase = true -- Case insensitive search
vim.o.smartcase = true -- If uppercase char specified in search, it becomes case sensitive
vim.o.tabstop = 4 -- Tab width in spaces
vim.o.shiftwidth = 4 -- Amount of spaces when shifting
vim.o.expandtab = true -- Use spaces instead of <Tab>
vim.o.softtabstop = 4 -- Soft tab width in spaces
vim.o.linebreak = true -- Break at word, not last character
vim.o.fixendofline = false -- If there isn't an empty line at EOF don't insert it
vim.o.hidden = true -- Allow buffers to be backgrounded without being saved
vim.o.mouse = 'a' -- Enable mouse support
vim.o.list = true -- Always show invisible characters
vim.o.listchars = 'nbsp:¬,tab:  ,trail:·,extends:>' -- Set the characters for the invisibles
vim.o.colorcolumn = '80' -- Highlight 80 character limit
vim.o.signcolumn = 'auto' -- How to display gitgutter signs next to numbers column
vim.o.splitright = true
vim.o.splitbelow = true
vim.o.swapfile = false
vim.o.pumheight = 10
vim.o.breakindent = true
vim.opt.diffopt = vim.opt.diffopt + { linematch = 50 }
vim.o.smoothscroll = true
vim.o.cmdheight = 0

-- vim.cmd [[
-- augroup default
--   autocmd!
--   autocmd ColorScheme default hi clear Function
--   autocmd ColorScheme default hi clear Special
--   autocmd ColorScheme default hi clear Identifier
--   autocmd ColorScheme default hi! link Comment DiagnosticHint
--   autocmd ColorScheme default hi! link WinSeparator LineNr
--
--   "autocmd ColorScheme default hi! link LspReferenceText ColorColumn
--   "autocmd ColorScheme default hi clear MiniFilesNormal
--   "autocmd ColorScheme default hi clear MiniFilesBorder
--   "autocmd ColorScheme default hi GitSignsAdd guifg=NvimDarkGreen
--   "autocmd ColorScheme default hi GitSignsChange guifg=NvimDarkGrey4
--   "autocmd ColorScheme default hi GitSignsDelete guifg=NvimLightRed
-- augroup END
-- ]]
-- vim.cmd[[colorscheme default]]

-- Lua library
require('mappings')
require('plugins')
require('lsp')

vim.cmd [[ colorscheme kanagawa ]]
