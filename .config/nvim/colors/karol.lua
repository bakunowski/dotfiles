local colors_name = "karol"
vim.g.colors_name = colors_name -- Required when defining a colorscheme

local lush = require "lush"
local hsluv = lush.hsluv -- Human-friendly hsl
local util = require "zenbones.util"

local bg = vim.opt.background:get()

-- Define a palette. Use `palette_extend` to fill unspecified colors
-- Based on https://github.com/gruvbox-community/gruvbox#palette
local palette
if bg == "light" then
  palette = util.palette_extend({
    bg = hsluv "#fbf1c7",
    fg = hsluv "#3c3836",
    rose = hsluv "#9d0006",
    leaf = hsluv "#79740e",
    wood = hsluv "#b57614",
    water = hsluv "#076678",
    blossom = hsluv "#8f3f71",
    sky = hsluv "#427b58",
  }, bg)
else
  palette = util.palette_extend({
    bg = hsluv "#15191e",
    fg = hsluv "#dbdbdb",
    rose = hsluv "#a64431",
    leaf = hsluv "#57bf37",
    wood = hsluv "#fabd2f",
    water = hsluv "#2d42c0",
    blossom = hsluv "#d3869b",
    sky = hsluv "#83c07c",
    blue = hsluv "#a7aaec",
    red = '#cf7e77',
  }, bg)
end

-- Generate the lush specs using the generator util
local generator = require "zenbones.specs"
local base_specs = generator.generate(palette, bg, generator.get_global_config(colors_name, bg))

-- Optionally extend specs using Lush
local specs = lush.extends({ base_specs }).with(function()
  return {
    Function { fg = palette.blue },
    TSMethodCall { fg = palette.blue, gui = 'bold' },
    String { fg = palette.sky },
    StatusLine { fg = palette.bg, bg = palette.fg, gui = 'bold' },
    TSKeywordReturn { fg = palette.red },
  }
end)

-- Pass the specs to lush to apply
lush(specs)

-- Optionally set term colors
require("zenbones.term").apply_colors(palette)
