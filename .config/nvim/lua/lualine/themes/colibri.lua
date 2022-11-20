local colors = {
  fg1 = '#281733',
  fg2 = '#dbbfef',
  fg3 = '#a4a0e8',
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
