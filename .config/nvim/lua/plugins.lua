-- Bootstrap installing packer on a new machine
local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  Packer_bootstrap = fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim',
    install_path })
end

-- Compile whenever changes are made to this file
vim.cmd([[
	augroup packer_user_config
		autocmd!
		autocmd BufWritePost plugins.lua source <afile> | PackerCompile
	augroup end
]])

return require('packer').startup(function(use)
  -- Manage yourself pls :)
  use 'wbthomason/packer.nvim'

  -- Completion
  use {
    'hrsh7th/nvim-cmp',
    requires = {
      { 'hrsh7th/vim-vsnip', after = 'nvim-cmp' },
      { 'hrsh7th/cmp-vsnip', after = 'nvim-cmp' },
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'hrsh7th/cmp-nvim-lsp-signature-help', after = 'nvim-cmp' },
      { 'hrsh7th/cmp-buffer', after = 'nvim-cmp' },
      { 'hrsh7th/cmp-path', after = 'nvim-cmp' },
      { 'hrsh7th/cmp-nvim-lua', after = 'nvim-cmp' },
      { 'onsails/lspkind-nvim' },
    },
    config = function()
      require('config.cmp')
    end,
    event = 'InsertEnter *'
  }

  -- Brackets
  use {
    'windwp/nvim-autopairs',
    config = function()
      require('nvim-autopairs').setup({
        fast_wrap = {
          map = '<C-e>',
        },
      })
    end
  }
  use 'tpope/vim-surround'

  -- Comments
  use {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup({
        toggler = {
          line = '<c-c>',
        },
        opleader = {
          line = '<c-c>',
        },
      })
    end
  }

  -- Classic TJ
  use {
    'nvim-telescope/telescope.nvim',
    requires = {
      { 'nvim-lua/plenary.nvim' },
    },
    config = function()
      require('telescope').setup({
        defaults = {
          sorting_strategy = "ascending",
          layout_config = {
            horizontal = {
              prompt_position = "top",
            },
          },
          path_display = {
            truncate = 8
          },
        },
        pickers = {
          find_files = {
            disable_devicons = true,
            prompt_title = false,
            results_title = false,
            preview_title = false,
          },
          live_grep = {
            disable_devicons = true,
            prompt_title = false,
            results_title = false,
            preview_title = false,
          },
          colorscheme = {
            disable_devicons = true,
            prompt_title = false,
            results_title = false,
            preview_title = false,
          },
        }
      })
      local find_files = function()
        require('telescope.builtin').find_files()
      end
      vim.keymap.set('n', '<leader>f', find_files)

      local live_grep = function()
        require('telescope.builtin').live_grep()
      end
      vim.keymap.set('n', '<leader>g', live_grep)

      local colorscheme = function()
        require('telescope.builtin').colorscheme()
      end
      vim.keymap.set('n', '<leader>cc', colorscheme)
    end
  }

  -- Easy native LSP setup
  use 'neovim/nvim-lspconfig'

  -- Better syntax highlighting
  use {
    'nvim-treesitter/nvim-treesitter',
    requires = {
      'nvim-treesitter/playground',
      cmd = 'TSHighlightCapturesUnderCursor'
    },
    run = ':TSUpdate',
    config = function()
      require('config.treesitter')
    end
  }

  -- Go tests
  -- use { 'buoto/gotests-vim', ft = 'go' }

  use 'towolf/vim-helm'

  -- Git
  use {
    'tpope/vim-fugitive',
    cmd = { 'G', 'Gstatus', 'Gblame', 'Gpush', 'Gpull', 'Gdiff' },
  }
  use 'tpope/vim-rhubarb'

  use {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns').setup()
    end
  }
  use {
    'sindrets/diffview.nvim',
    requires = 'nvim-lua/plenary.nvim',
    cmd = { 'DiffViewOpen' }
  }

  use 'will133/vim-dirdiff'

  -- File tree view
  use {
    'kyazdani42/nvim-tree.lua',
    requires = {
      'kyazdani42/nvim-web-devicons',
    },
    config = function()
      require 'nvim-tree'.setup({
        view = {
          adaptive_size = true,
          signcolumn = "no",
        },
        actions = {
          open_file = {
            quit_on_open = true,
          },
        },
      })
      vim.api.nvim_set_keymap(
        'n', '<leader>e', [[:NvimTreeToggle<cr>]], { noremap = true }
      )
    end,
  }

  use {
    'nvim-lualine/lualine.nvim',
    config = function()
      local fugitiveblame = {
        sections = {
          lualine_a = { 'mode' }
        },
        filetypes = { 'fugitiveblame' }
      }
      require('lualine').setup {
        options = {
          icons_enabled = false,
          theme = 'acme',
          component_separators = { left = '', right = '' },
          section_separators = { left = '', right = '' },
        },
        sections = {
          lualine_a = {
            { 'mode', fmt = function(str) return str:sub(1, 3) end }
          },
          lualine_b = {},
          lualine_c = {
            { 'filename', path = 1 }
          },
          lualine_x = {},
          lualine_y = { 'progress' },
          lualine_z = { 'location' }
        },
        inactive_sections = {
          lualine_a = { { 'mode', fmt = function(str) return str:sub(1, 3) end } },
          lualine_b = {},
          lualine_c = { 'filename' },
          lualine_x = {},
          lualine_y = {},
          lualine_z = {}
        },
        tabline = {},
        winbar = {},
        inactive_winbar = {},
        extensions = { 'nvim-tree', 'fugitive', fugitiveblame }
      }
    end
  }

  use({
    "folke/noice.nvim",
    config = function()
      require("noice").setup({
        views = {
          cmdline_popup = {
            border = {
              style = "none",
              padding = { 1, 1 },
            },
            filter_options = {},
            win_options = {
              winhighlight = "NormalFloat:NormalFloat,FloatBorder:FloatBorder",
            },
          },
          hover = {
            border = {
              style = "none",
              padding = { 1, 1 },
            },
            position = {
              row = 2
            }
            -- filter_options = {},
            -- win_options = {
            --   winhighlight = "NormalFloat:NormalFloat,FloatBorder:FloatBorder",
            -- },
          },
        },
        routes = {
          {
            filter = {
              event = "msg_show",
              kind = "search_count",
            },
            opts = { skip = true },
          },
        },
        lsp = {
          -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
          override = {
            ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
            ["vim.lsp.util.stylize_markdown"] = true,
            ["cmp.entry.get_documentation"] = true,
          },
        },
        -- you can enable a preset for easier configuration
        presets = {
          bottom_search = true, -- use a classic bottom cmdline for search
          command_palette = true, -- position the cmdline and popupmenu together
          long_message_to_split = true, -- long messages will be sent to a split
          inc_rename = false, -- enables an input dialog for inc-rename.nvim
          lsp_doc_border = false, -- add a border to hover docs and signature help
        },
      })
    end,
    requires = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      "MunifTanjim/nui.nvim",
    }
  })
  -- use {
  -- 'lukas-reineke/indent-blankline.nvim',
  --   ft = { 'yaml' },
  --   config = function()
  --     -- Show indent lines only in these files
  --     vim.g.indent_blankline_filetype = { 'yaml' }
  --   end
  -- }

  use({
    "iamcco/markdown-preview.nvim",
    run = function() vim.fn["mkdp#util#install"]() end,
  })
  use 'NvChad/nvim-colorizer.lua'
end)
