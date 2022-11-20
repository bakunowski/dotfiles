vim.api.nvim_set_keymap('n', '<c-p>', [[<cmd>Telescope find_files<cr>]], { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>fg', [[<cmd>Telescope live_grep<cr>]], { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>cc', [[<cmd>Telescope colorscheme<cr>]], { noremap = true })
