local M = {}

local function set_highlights(hlgroups)
  for group, colors in pairs(hlgroups) do
    vim.api.nvim_set_hl(0, group, colors)
  end
end

function M.load()
  if vim.g.colors_name then
    vim.cmd("hi clear")
  end

  vim.g.colors_name = "karol"
  vim.o.termguicolors = true

  local theme = ""
  if vim.o.background == "light" then
    theme = "light"
  elseif vim.o.background == "dark" then
    theme = "dark"
  end

  local colors = require("karol.palette").setup(theme)
  local hlgroups = require("karol.hlgroups").setup(colors)
  -- print(vim.inspect(karol))

  set_highlights(hlgroups)
end

return M
