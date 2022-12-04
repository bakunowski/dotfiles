local find_files = function()
  require('telescope.builtin').find_files({
    prompt_title = false,
    preview_title = false,
    disable_devicons = true,
  })
end
vim.keymap.set('n', '<c-p>', find_files)

local live_grep = function()
  require('telescope.builtin').live_grep({
    prompt_title = false,
    preview_title = false,
    disable_devicons = true,
  })
end
vim.keymap.set('n', '<leader>fg', live_grep)

local colorscheme = function()
  require('telescope.builtin').colorscheme({
    prompt_title = false,
    preview_title = false,
    disable_devicons = true,
  })
end
vim.keymap.set('n', '<leader>cc', colorscheme)
