return {
  dark = function(colors)
    return {
      bg        = colors.grey1,
      bg_dark   = colors.grey6,
      bg_darker = colors.grey11,
      bg_dark2  = colors.grey9,
      bg_light2 = colors.grey4,
      fg_dark   = colors.grey10,
      fg        = colors.grey5,
      st        = colors.grey12,
      br        = colors.grey7,
      bl        = colors.blue,
      op        = colors.orange,

      diag = {
        error = colors.red,
        warning = colors.orange,
        info = colors.blue,
        hint = colors.blue,
      },

      diff = {
        add = colors.dadd,
        delete = colors.ddelete,
        change = colors.dchange,
        text = colors.dtext,
      },

      git = {
        added = colors.green,
        removed = colors.red,
        changed = colors.blue,
      }
    }
  end,
  light = function(colors)
    return {
      bg        = colors.lgrey1,
      bg_dark   = colors.lgrey9,
      bg_dark2  = colors.lgrey9,
      bg_light2 = colors.lgrey4,
      fg_dark   = colors.lgrey10,
      fg        = colors.lgrey5,
      st        = colors.lgreen,
      br        = colors.lgrey7,
      bl        = colors.lblue,
      op        = colors.lorange,

      diag = {
        error = colors.lred,
        warning = colors.lorange,
        info = colors.lblue,
        hint = colors.lblue,
      },

      diff = {
        add = colors.ldadd,
        delete = colors.lddelete,
        change = colors.ldchange,
        text = colors.ldtext,
      },

      git = {
        added = colors.lgreen,
        removed = colors.lred,
        changed = colors.lblue,
      }
    }
  end,
}
