vim.o.number = true -- Show current line number
vim.o.relativenumber = true -- Show relative line numbers
vim.g.mapleader = [[ ]] -- Set leader to space
vim.o.ignorecase = true -- Case insensitive search
vim.o.smartcase = true -- If uppercase char specified in search, it becomes case sensitive
-- vim.o.expandtab = true -- Use spaces instead of <Tab>
-- vim.o.softtabstop = 4 -- Soft tab width in spaces
vim.o.tabstop = 4 -- Tab width in spaces
-- vim.o.shiftwidth = 4 -- Amount of spaces when shifting
vim.o.linebreak = true -- Break at word, not last character
vim.o.fixendofline = false -- If there isn't an empty line at EOF don't insert it
vim.o.hidden = true -- Allow buffers to be backgrounded without being saved
vim.o.termguicolors = true -- Use 24-bit RGB color in terminal
vim.o.mouse = 'a' -- Enable mouse support
vim.o.list = true -- Always show invisible characters
vim.o.listchars = 'nbsp:¬,tab:  ,trail:·,extends:>' -- Set the characters for the invisibles
-- vim.o.colorcolumn = '80' -- Highlight 80 character limit
vim.o.signcolumn = 'auto' -- How to display gitgutter signs next to numbers column
vim.o.splitright = true
vim.o.splitbelow = true
vim.o.updatetime = 250
vim.o.timeout = true
vim.o.timeoutlen = 300
vim.o.swapfile = 0
vim.o.pumheight = 100
-- vim.o.splitkeep = 'screen'
vim.o.breakindent = true
vim.o.completeopt = 'menuone,noselect'
vim.opt.diffopt = vim.opt.diffopt + { linematch = 50 }
-- vim.o.conceallevel = 2
-- vim.o.stc = '%=%{v:relnum?v:relnum:v:lnum}  '

-- Override diagnostics symbols
local signs = { Error = "⏺", Warn = "⏺", Hint = "⏺", Info = "⏺" }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

-- Tab is 2 spaces in these files:
vim.cmd [[ autocmd FileType yaml setlocal ts=2 sw=2 ]]
vim.cmd [[ autocmd FileType helm setlocal ts=2 sw=2 ]]
vim.cmd [[ autocmd FileType lua setlocal ts=2 sw=2 ]]
vim.cmd [[ autocmd FileType terraform setlocal ts=2 sw=2 ]]
vim.cmd [[ autocmd FileType groovy setlocal ts=2 sw=2 ]]

-- Lua library
require('mappings')
require('plugins')
require('lsp')

-- vim.cmd [[ set bg=light ]]
vim.cmd.colorscheme 'acme'
