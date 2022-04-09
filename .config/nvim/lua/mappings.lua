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

-- Nvim Tree
vim.api.nvim_set_keymap('n', '<c-n>', [[:NvimTreeToggle<cr>]], {noremap = true})
