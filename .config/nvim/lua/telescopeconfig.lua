require("telescope").load_extension "file_browser"

vim.api.nvim_set_keymap('n', '<c-p>', [[<cmd>Telescope find_files<cr>]], {noremap = true})
vim.api.nvim_set_keymap('n', '<c-n>', [[<cmd>Telescope file_browser<cr>]], {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>fg', [[<cmd>Telescope live_grep<cr>]], {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>fb', [[<cmd>Telescope buffers<cr>]], {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>fh', [[<cmd>Telescope help_tags<cr>]], {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>cc', [[<cmd>Telescope colorscheme<cr>]], {noremap = true})
