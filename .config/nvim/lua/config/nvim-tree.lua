-- Define the size of the floating window
local width = 30
local height = 30

-- Get the current UI
local ui = vim.api.nvim_list_uis()[1]

require 'nvim-tree'.setup {
  remove_keymaps = {
    "<C-e>",
  },
  view = {
    float = {
      enable = true,
      open_win_config = {
        relative = "editor",
        border = "rounded",
        width = width,
        height = height,
        col = (ui.width / 2) - (width / 2),
        row = (ui.height / 2) - (height / 2),
      },
    },
  }
}
