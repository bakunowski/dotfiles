local bg = vim.opt.background:get()
local c = require('karol.palette').setup(bg)

local colors = {
  fg1 = c.bg_darker,
  fg2 = c.fg,
  fg3 = c.bg_light2,
}

return {
  normal = {
    a = { bg = colors.fg1, fg = colors.fg2, },
    b = { bg = colors.fg1, fg = colors.fg2, },
    c = { bg = colors.fg1, fg = colors.fg2, }
  },
  insert = {
    a = { bg = colors.fg1, fg = colors.fg2, },
    b = { bg = colors.fg1, fg = colors.fg2, },
    c = { bg = colors.fg1, fg = colors.fg2, }
  },
  visual = {
    a = { bg = colors.fg1, fg = colors.fg2, },
    b = { bg = colors.fg1, fg = colors.fg2, },
    c = { bg = colors.fg1, fg = colors.fg2, }
  },
  replace = {
    a = { bg = colors.fg1, fg = colors.fg2, },
    b = { bg = colors.fg1, fg = colors.fg2, },
    c = { bg = colors.fg1, fg = colors.fg2, }
  },
  command = {
    a = { bg = colors.fg1, fg = colors.fg2, },
    b = { bg = colors.fg1, fg = colors.fg2, },
    c = { bg = colors.fg1, fg = colors.fg2, }
  },
  inactive = {
    a = { bg = colors.fg1, fg = colors.fg1 },
    b = { bg = colors.fg1, fg = colors.fg3 },
    c = { bg = colors.fg1, fg = colors.fg3 }
  }
}
