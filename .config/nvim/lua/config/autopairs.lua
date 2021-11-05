require('nvim-autopairs').setup({
	fast_wrap = {
		map = '<C-e>',
	},
})

-- Deprecated - there's a different setup currently - but I use snippets
-- for brackers after function
-- you need setup cmp first put this after cmp.setup()
-- require("nvim-autopairs.completion.cmp").setup({
--   map_cr = true, --  map <CR> on insert mode
--   map_complete = true, -- it will auto insert `(` after select function or method item
-- })
