local bg = vim.opt.background:get()

local colors = {}
if bg == "light" then
  colors = {
    -- fg1 = '#e3e3c5',
    fg1 = '#e8e8dc',
    -- fg2 = '#202224',
    fg2 = '#000000',
    fg3 = '#61676d',
  }
else
  colors = {
    fg1 = '#282828',
    fg2 = '#d8d8d8',
    fg3 = '#61676d',
  }
end

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
