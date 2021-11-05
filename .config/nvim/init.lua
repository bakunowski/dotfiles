vim.g.mapleader = [[ ]]
vim.g.maplocalleader = [[;]]

vim.o.fixendofline = false      -- If there isn't an empty line at EOF don't insert it
vim.o.hidden = true             -- Allow buffers to be backgrounded without being saved
vim.o.splitbelow = true         -- Splits show up below by default
vim.o.splitright = true         -- Splits go to the right by default
vim.o.clipboard = 'unnamedplus' -- Yank to system cliboard
vim.o.mouse = 'a'               -- Enable mouse support
vim.o.updatetime = 100          -- cursor hold trigger after 100ms

vim.o.ignorecase = true
vim.o.smartcase = true

vim.o.expandtab = true  -- Expand tabs to the proper type and size
vim.o.tabstop = 4       -- Tabs width in spaces
vim.o.softtabstop = 4   -- Soft tab width in spaces
vim.o.shiftwidth = 4    -- Amount of spaces when shifting

vim.o.relativenumber = true
vim.o.number = true
vim.o.colorcolumn = '80'    -- Highlight 80 character limit
vim.o.signcolumn = 'yes'   -- How to display gitgutter signs next to numbers column
vim.o.showmode = false      -- Don't show current mode in status line
-- vim.o.scrolloff = 10
vim.o.list = true           -- Always show invisible characters
vim.o.termguicolors = true  -- Use 24-bit RGB color in terminal
vim.o.pumheight = 10

vim.cmd [[colorscheme nord]]
-- vim.cmd [[colorscheme base16-tomorrow-night]]
-- don't want red variables...
-- vim.cmd [[hi TSVariable guifg=#c5c8c6]]
-- vim.cmd [[hi TSProperty guifg=#cc6666]]
-- vim.cmd [[hi IndentBlanklineChar guifg=#373b41]]
-- vim.cmd [[hi Vertsplit guifg=#282a2e]]

vim.cmd[[autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab]]
vim.cmd[[autocmd FileType helm setlocal ts=2 sts=2 sw=2 expandtab]]

-------------------
-- Mappings
-------------------

-- Window movement
vim.api.nvim_set_keymap('n', '<c-h>', '<c-w>h', {})
vim.api.nvim_set_keymap('n', '<c-j>', '<c-w>j', {})
vim.api.nvim_set_keymap('n', '<c-k>', '<c-w>k', {})
vim.api.nvim_set_keymap('n', '<c-l>', '<c-w>l', {})

-- Close buffer
vim.api.nvim_set_keymap('n', '<c-c>', '<c-w>c', {})

-- Make j/k visual down and up instead of whole lines. This makes word
-- wrapping a lot more pleasent.
vim.api.nvim_set_keymap('n', 'j', 'gj', {})
vim.api.nvim_set_keymap('n', 'k', 'gk', {})

-- Hit esc to clear search
vim.api.nvim_set_keymap('n', '<esc>', ':noh<cr><esc>', {noremap = true, silent = true})

-- Leader R to replace word under *
vim.api.nvim_set_keymap('n', '<Leader>r', [[:%s/\<<C-r><C-w>\>//g<Left><Left>]], {noremap = true})

-- aka multiple cursors
vim.api.nvim_set_keymap('n', '<Leader>x', [[*``cgn]], {noremap = true})

-- map C-l to skip a char eg. )
vim.api.nvim_set_keymap('i', '<c-l>', '<c-o>a', {noremap = true})

-- toggle spellcheck
vim.cmd [[map <leader>sp :setlocal spell! spelllang=en_gb<CR>]]

-------------------
-- Plugins
-------------------

---- Nvim Tree
vim.api.nvim_set_keymap('n', '<c-n>', [[:NvimTreeToggle<cr>]], {noremap = true})

---- Telescope
vim.api.nvim_set_keymap('n', '<c-p>', [[<cmd>Telescope find_files<cr>]], {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>fg', [[<cmd>Telescope live_grep<cr>]], {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>fb', [[<cmd>Telescope buffers<cr>]], {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>fh', [[<cmd>Telescope help_tags<cr>]], {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>cc', [[<cmd>Telescope colorscheme<cr>]], {noremap = true})

---- Packer
vim.cmd [[command! PackerInstall packadd packer.nvim | lua require('plugins').install()]]
vim.cmd [[command! PackerUpdate packadd packer.nvim | lua require('plugins').update()]]
vim.cmd [[command! PackerSync packadd packer.nvim | lua require('plugins').sync()]]
vim.cmd [[command! PackerStatus packadd packer.nvim | lua require('plugins').status()]]
vim.cmd [[command! PackerClean packadd packer.nvim | lua require('plugins').clean()]]
vim.cmd [[command! PackerCompile packadd packer.nvim | lua require('plugins').compile()]]

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

-------------------
-- Lsp
-------------------
require('lsp')

vim.fn.sign_define('LightBulbSign', { text = "🧚", texthl = "", linehl="", numhl="" })
