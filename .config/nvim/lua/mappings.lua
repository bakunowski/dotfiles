-- nnoremap <leader>rw :%s/\s\+$//e<CR> -- remove whitespace
-- nnoremap <leader>jq :%!jq '.'<CR> -- format json

-- Window movement
vim.api.nvim_set_keymap('n', '<c-h>', '<c-w>h', {})
vim.api.nvim_set_keymap('n', '<c-j>', '<c-w>j', {})
vim.api.nvim_set_keymap('n', '<c-k>', '<c-w>k', {})
vim.api.nvim_set_keymap('n', '<c-l>', '<c-w>l', {})

-- vim.api.nvim_set_keymap('n', '<c-d>', '<c-d>zz', {})
-- vim.api.nvim_set_keymap('n', '<c-u>', '<c-u>zz', {})

-- Close buffer
-- vim.api.nvim_set_keymap('n', '<c-c>', '<c-w>c', {})

-- End and beginning of line
vim.api.nvim_set_keymap('n', 'gl', '$', {})
vim.api.nvim_set_keymap('n', 'gh', '0', {})
vim.api.nvim_set_keymap('v', 'gl', '$', {})
vim.api.nvim_set_keymap('v', 'gh', '0', {})

vim.api.nvim_set_keymap('n', 'gs', '^', {})
vim.api.nvim_set_keymap('v', 'gs', '^', {})

-- Make j/k visual down and up instead of whole lines. This makes word
-- wrapping a lot more pleasant.
-- vim.api.nvim_set_keymap('n', 'j', 'gj', {})
-- vim.api.nvim_set_keymap('n', 'k', 'gk', {})

-- Hit esc to clear search
vim.api.nvim_set_keymap('n', '<esc>', ':noh<cr><esc>', { noremap = true, silent = true })

-- Leader R to replace word under * and selected text
vim.api.nvim_set_keymap('n', '<Leader>r', ':%s/<C-r><C-w>//g<Left><Left>', { noremap = true })
vim.api.nvim_set_keymap('v', '<Leader>r', '"hy:%s/<C-r>h//g<left><left>', { noremap = true })

-- aka multiple cursors
vim.api.nvim_set_keymap('n', '<Leader>x', [[*``cgn]], { noremap = true })

-- map C-l to skip a char eg. )
vim.api.nvim_set_keymap('i', '<c-l>', '<c-o>a', { noremap = true })

-- toggle spellcheck
vim.cmd [[map <leader>sp :setlocal spell! spelllang=en_gb<CR>]]

-- Toggle background
vim.api.nvim_set_keymap('n', '<Leader>bgd', ':set bg=dark<cr><esc>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>bgl', ':set bg=light<cr><esc>', { noremap = true, silent = true })
vim.cmd [[
" " Copy to clipboard
vnoremap  <leader>y  "+y
nnoremap  <leader>Y  "+yg_
nnoremap  <leader>y  "+y
nnoremap  <leader>yy  "+yy

" " Paste from clipboard
nnoremap <leader>p "+p
nnoremap <leader>P "+P
vnoremap <leader>p "+p
vnoremap <leader>P "+P
]]
