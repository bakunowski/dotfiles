local palette = {
  grey1  = "#191919",
  grey4  = "#616161",
  grey5  = "#bbbbbb",
  grey6  = "#303030",
  grey7  = "#808080",
  grey8  = "#d8d8d8",
  grey9  = "#232323",
  grey10 = "#9e9e9e",
  grey11 = "#171717",
  grey12 = "#8b8b8b",
  green  = "#819B69",
  blue   = "#6099C0",
  orange = "#D68C67",
  red    = "#DE6E7C",

  dadd    = '#232d1a',
  ddelete = '#3e2225',
  dchange = '#1d2c36',
  dtext   = '#324757',

  lgrey1  = "#eeeeee",
  lgrey4  = "#8b8b8b",
  lgrey5  = "#353535",
  lgrey6  = "#303030",
  lgrey7  = "#808080",
  lgrey8  = "#d8d8d8",
  lgrey9  = "#b3b3b3",
  lgrey10 = "#505050",
  lgreen  = "#4F6C31",
  lblue   = "#286486",
  lorange = "#944927",
  lred    = "#A8334C",

  ldadd    = '#cbe5b8',
  lddelete = '#ebd8da',
  ldchange = '#d4dee7',
  ldtext   = '#a9bed1'
}

local M = {}

--- generate color table
-- @param config config options containing colors and theme fields (optional)
-- @return table of palette colors and theme colors merged with config.colors
function M.setup(theme)
  return require("karol.themes")[theme](palette)
end

return M
