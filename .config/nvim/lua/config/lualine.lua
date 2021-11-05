local function getLuaLineTheme()
	-- acme
	local colors = {
	  bg		   = '#444444',
	  fg		   = '#d9d5ba',
	  normal_hi    = '#a0aabd',
	  green        = '#aabda0',
	  black        = '#bdb3a0',
	  gray         = '#e5e5e5',
	}
	return {
	  normal = {
	    a = {bg = colors.green, fg = colors.bg, gui = 'bold'},
	    b = {bg = colors.bg, fg = colors.fg},
	    c = {bg = colors.bg, fg = colors.fg}
	  },
	  insert = {
	    a = {bg = colors.normal_hi, fg = colors.bg, gui = 'bold'},
	    b = {bg = colors.bg, fg = colors.fg},
	    c = {bg = colors.bg, fg = colors.fg}
	  },
	  visual = {
	    a = {bg = colors.black, fg = colors.bg, gui = 'bold'},
	    b = {bg = colors.bg, fg = colors.fg},
	    c = {bg = colors.bg, fg = colors.fg}
	  },
	  replace = {
	    a = {bg = colors.gray, fg = colors.bg, gui = 'bold'},
	    b = {bg = colors.bg, fg = colors.fg},
	    c = {bg = colors.bg, fg = colors.fg}
	  },
	  command = {
	    a = {bg = colors.gray, fg = colors.bg, gui = 'bold'},
	    b = {bg = colors.bg, fg = colors.fg},
	    c = {bg = colors.bg, fg = colors.fg}
	  },
	  inactive = {
	    b = {bg = colors.bg, fg = colors.fg},
	    c = {bg = colors.bg, fg = colors.fg}
	  }
	}
end


function Darcula()
	local colors = {
	  bg        = '#262627',
      bg1       = '#303031',
	  fg	    = '#ced1d4',
	  orange    = '#CD7832',
	  green     = '#8FA867',
	  black     = '#bdb3a0',
	  gray      = '#e5e5e5',
	}
	return {
	  normal = {
	    a = {bg = colors.green, fg = colors.bg, gui = 'bold'},
	    b = {bg = colors.bg, fg = colors.fg},
	    c = {bg = colors.bg, fg = colors.fg}
	  },
	  insert = {
	    a = {bg = colors.orange, fg = colors.bg, gui = 'bold'},
	    b = {bg = colors.bg, fg = colors.fg},
	    c = {bg = colors.bg, fg = colors.fg}
	  },
	  visual = {
	    a = {bg = colors.black, fg = colors.bg, gui = 'bold'},
	    b = {bg = colors.bg, fg = colors.fg},
	    c = {bg = colors.bg, fg = colors.fg}
	  },
	  replace = {
	    a = {bg = colors.gray, fg = colors.bg, gui = 'bold'},
	    b = {bg = colors.bg, fg = colors.fg},
	    c = {bg = colors.bg, fg = colors.fg}
	  },
	  command = {
	    a = {bg = colors.gray, fg = colors.bg, gui = 'bold'},
	    b = {bg = colors.bg, fg = colors.fg},
	    c = {bg = colors.bg, fg = colors.fg}
	  },
	  inactive = {
	    b = {bg = colors.bg1, fg = colors.fg},
	    c = {bg = colors.bg1, fg = colors.fg}
	  }
	}
end

function Karol()
	local colors = {
	  bg        = '#303030',
      bg1       = '#282a2e',
	  fg	    = '#c5c8c6',
	  insert    = '#b5bd68',
	  normal    = '#cc6666',
	  visual    = '#8d6f9e',
	  command   = '#f4bf75',
	}
	return {
	  normal = {
	    a = {bg = colors.normal, fg = colors.bg},
	    b = {bg = colors.bg, fg = colors.fg},
	    c = {bg = colors.bg, fg = colors.fg}
	  },
	  insert = {
	    a = {bg = colors.insert, fg = colors.bg},
	    b = {bg = colors.bg, fg = colors.fg},
	    c = {bg = colors.bg, fg = colors.fg}
	  },
	  visual = {
	    a = {bg = colors.visual, fg = colors.bg, gui = 'bold'},
	    b = {bg = colors.bg, fg = colors.fg},
	    c = {bg = colors.bg, fg = colors.fg}
	  },
	  replace = {
	    a = {bg = colors.gray, fg = colors.bg, gui = 'bold'},
	    b = {bg = colors.bg, fg = colors.fg},
	    c = {bg = colors.bg, fg = colors.fg}
	  },
	  command = {
	    a = {bg = colors.command, fg = colors.bg, gui = 'bold'},
	    b = {bg = colors.bg, fg = colors.fg},
	    c = {bg = colors.bg, fg = colors.fg}
	  },
	  inactive = {
	    b = {bg = colors.bg, fg = colors.fg},
	    c = {bg = colors.bg, fg = colors.fg}
	  }
	}
end

function Sonokai()
	local colors = {
	  bg        = '#303030',
      bg1       = '#282a2e',
	  fg	    = '#c5c8c6',
	  insert    = '#b5bd68',
	  normal    = '#cc6666',
	  visual    = '#8d6f9e',
	  command   = '#f4bf75',
	}
	return {
	  normal = {
	    a = {bg = colors.normal, fg = colors.bg},
	    b = {bg = colors.bg, fg = colors.fg},
	    c = {bg = colors.bg, fg = colors.fg}
	  },
	  insert = {
	    a = {bg = colors.insert, fg = colors.bg},
	    b = {bg = colors.bg, fg = colors.fg},
	    c = {bg = colors.bg, fg = colors.fg}
	  },
	  visual = {
	    a = {bg = colors.visual, fg = colors.bg, gui = 'bold'},
	    b = {bg = colors.bg, fg = colors.fg},
	    c = {bg = colors.bg, fg = colors.fg}
	  },
	  replace = {
	    a = {bg = colors.gray, fg = colors.bg, gui = 'bold'},
	    b = {bg = colors.bg, fg = colors.fg},
	    c = {bg = colors.bg, fg = colors.fg}
	  },
	  command = {
	    a = {bg = colors.command, fg = colors.bg, gui = 'bold'},
	    b = {bg = colors.bg, fg = colors.fg},
	    c = {bg = colors.bg, fg = colors.fg}
	  },
	  inactive = {
	    b = {bg = colors.bg, fg = colors.fg},
	    c = {bg = colors.bg, fg = colors.fg}
	  }
	}
end

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

require('lualine').setup {
    options = {
        -- theme = 'nord',
        -- theme = 'vscode',
        theme = 'auto',
	    section_separators = '',
	    component_separators = '',
	},
    sections = {
        lualine_a = {'mode'},
        lualine_b = {'branch'},
        lualine_c = { 'filename',
            {'diagnostics', sources = {'nvim_lsp'}},
            {'diff', colored=false},
            {get_client},
        },
        lualine_x = { 'encoding', 'fileformat',
            {'filetype', colored=false}
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
