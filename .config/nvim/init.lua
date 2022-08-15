vim.o.clipboard = 'unnamedplus' -- Yank to system cliboard
vim.o.number = true -- Show current line number
vim.o.relativenumber = true -- Show relative line numbers
vim.g.mapleader = [[ ]] -- Set leader to space
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.expandtab = true -- Use spaces instead of <Tab>
vim.o.softtabstop = 4 -- Soft tab width in spaces
vim.o.tabstop = 4 -- Tab width in spaces
vim.o.shiftwidth = 4 -- Amount of spaces when shifting
vim.o.termguicolors = true -- Use 24-bit RGB color in terminal
vim.o.mouse = 'a' -- Enable mouse support
vim.o.laststatus = 3 -- Global status line
vim.o.list = true -- Always show invisible characters
vim.o.listchars = 'nbsp:¬,tab:  ,trail:·,extends:>' -- Set the characters for the invisibles

vim.o.fixendofline = false -- If there isn't an empty line at EOF don't insert it
vim.o.hidden = true -- Allow buffers to be backgrounded without being saved
vim.o.updatetime = 100 -- cursor hold trigger after 100ms
vim.o.colorcolumn = '80' -- Highlight 80 character limit
vim.o.signcolumn = 'auto' -- How to display gitgutter signs next to numbers column
vim.o.showmode = false -- Don't show current mode in status line
vim.o.scroll = 10 -- Number of lines to scroll with CTRL-U and CTRL-D commands
vim.o.pumheight = 10 -- Maximum number of items to show in the popup menu
vim.o.cmdheight = 0 -- Don't show empty command line if not in use
vim.o.winbar = '%=%f%m%='
vim.o.linebreak = true

-- Tab is 2 spaces in these files:
vim.cmd [[autocmd FileType yaml setlocal ts=2 sw=2]]
vim.cmd [[autocmd FileType helm setlocal ts=2 sw=2]]
vim.cmd [[autocmd FileType lua setlocal ts=2 sw=2]]
vim.cmd [[autocmd FileType terraform setlocal ts=2 sw=2]]

-- Show indent lines only in these files
vim.cmd [[ let g:indent_blankline_filetype = ['yaml'] ]]

-- Lua library
require('mappings')
require('plugins')
require('telescope').setup({
  defaults = {
    layout_config = {
      horizontal = {
        width = 0.95,
        height = 0.9,
        preview_cutoff = 120,
        prompt_position = "bottom",
      },
    },
    path_display = {
      truncate = 3
    },
  },
})
require('config.telescope')
require('config.treesitter')
require('nvim-autopairs').setup({
  fast_wrap = {
    map = '<C-e>',
  },
})
require('lsp')

-- vim.cmd [[ set bg=light ]]
vim.cmd [[ colorscheme rasmus ]]

--command to get syntax highlighting in a new buffer
--so $VIMRUNTIME/syntax/hitest.vim
