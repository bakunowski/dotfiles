vim.o.number = true -- Show current line number
vim.o.relativenumber = true -- Show relative line numbers
vim.g.mapleader = [[ ]] -- Set leader to space
vim.o.ignorecase = true -- Case insensitive search
vim.o.smartcase = true -- If uppercase char specified in search, it becomes case sensitive
vim.o.tabstop = 4 -- Tab width in spaces
-- vim.o.shiftwidth = 4 -- Amount of spaces when shifting
-- vim.o.expandtab = true -- Use spaces instead of <Tab>
-- vim.o.softtabstop = 4 -- Soft tab width in spaces
vim.o.linebreak = true -- Break at word, not last character
vim.o.fixendofline = false -- If there isn't an empty line at EOF don't insert it
vim.o.hidden = true -- Allow buffers to be backgrounded without being saved
vim.o.termguicolors = true -- Use 24-bit RGB color in terminal
vim.o.mouse = 'a' -- Enable mouse support
vim.o.list = true -- Always show invisible characters
vim.o.listchars = 'nbsp:¬,tab:  ,trail:·,extends:>' -- Set the characters for the invisibles
vim.o.colorcolumn = '80' -- Highlight 80 character limit
vim.o.signcolumn = 'auto' -- How to display gitgutter signs next to numbers column
vim.o.splitright = true
vim.o.splitbelow = true
vim.o.updatetime = 250
vim.o.timeout = true
vim.o.timeoutlen = 300
vim.o.swapfile = false
vim.o.pumheight = 100
vim.o.breakindent = true
vim.o.completeopt = 'menuone,noselect'
vim.opt.diffopt = vim.opt.diffopt + { linematch = 50 }

vim.cmd [[
augroup habamax_override
  autocmd!
  " treesitter - don't want christmas tree
  autocmd ColorScheme habamax hi @variable        guifg=#bcbcbc guibg=none
  autocmd ColorScheme habamax hi @function        guifg=#bcbcbc guibg=none
  autocmd ColorScheme habamax hi @parameter       guifg=#bcbcbc guibg=none
  autocmd ColorScheme habamax hi @namespace       guifg=#bcbcbc guibg=none
  autocmd ColorScheme habamax hi @operator        guifg=#bcbcbc guibg=none
  autocmd ColorScheme habamax hi @property        guifg=#bcbcbc guibg=none
  autocmd ColorScheme habamax hi @field           guifg=#bcbcbc guibg=none
  autocmd ColorScheme habamax hi @punctuation     guifg=#bcbcbc guibg=none
  autocmd ColorScheme habamax hi @type.definition guifg=#bcbcbc guibg=none
  autocmd ColorScheme habamax hi! link @function.call @method
  autocmd ColorScheme habamax hi! link @constructor @method
  autocmd ColorScheme habamax hi! link @constant.builtin Number

  " lsp
  autocmd ColorScheme habamax hi LspReferenceText guibg=#303030
  autocmd ColorScheme habamax hi LspReferenceRead guibg=#303030
  autocmd ColorScheme habamax hi LspReferenceWrite guibg=#303030

  " builtin
  autocmd ColorScheme habamax hi! link WinSeparator Comment
  autocmd ColorScheme habamax hi! link Todo Number

  " plugins
  autocmd ColorScheme habamax hi! link GitSignsChange Type
augroup END
]]

vim.cmd [[ colorscheme habamax ]]

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

local parser_config = require 'nvim-treesitter.parsers'.get_parser_configs()
parser_config.gotmpl = {
  install_info = {
    url = "https://github.com/ngalaiko/tree-sitter-go-template",
    files = { "src/parser.c" }
  },
  filetype = "helm",
  used_by = { "gohtmltmpl", "gotexttmpl", "gotmpl", "helm" }
}
