-- Try to retrieve an active LSP client and show it's name if found
local function get_client()
    local clients = vim.lsp.get_active_clients()
        if next(clients) ~= nil then
            -- Hopefully only one LSP client will ever be attached to a buffer
            -- so we're accessing that directly
            return " " .. "  " .. " LSP: " .. clients[1].name
        else
            return ""
        end
end

-- local gps = require("nvim-gps")
require('lualine').setup {
    options = {
        theme = 'zenwritten',
	    section_separators = '',
	    component_separators = '',
	},
    sections = {
        lualine_a = {'mode'},
        lualine_b = {'branch'},
        lualine_c = { 'filename',
            {'diagnostics', sources = {'nvim_diagnostic'}},
            -- {'diff', colored=true},
            {get_client},
			-- { gps.get_location, cond = gps.is_available },
        },
        lualine_x = {
            'filetype',
            'encoding',
        },
        lualine_y = { 'progress' },
        lualine_z = { 'location' },
    },
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
    	lualine_c = {'filename'},
		lualine_x = {},
		lualine_y = {},
		lualine_z = {}
	},
    tabline = {},
	extensions = {'nvim-tree'},
}
