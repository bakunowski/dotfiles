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
      { 'onsails/lspkind-nvim', after = 'nvim-cmp', },
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
      require('Comment').setup()
    end
  }

  -- Classic TJ
  use {
    'nvim-telescope/telescope.nvim',
    requires = {
      { 'nvim-lua/plenary.nvim' },
    },
    config = function()
      require('config.telescope')
      require('telescope').setup({
        defaults = {
          sorting_strategy = "ascending",
          layout_config = {
            horizontal = {
              -- width = 0.95,
              -- height = 0.9,
              -- preview_cutoff = 120,
              prompt_position = "top",
            },
          },
          path_display = {
            -- tail = true
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
        }
      })
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

  -- Linting
  use {
    'mfussenegger/nvim-lint',
    config = function()
      require('lint').linters_by_ft = {
        go = { 'golangcilint', },
        -- yaml = { 'yamllint', }
      }

      vim.api.nvim_create_autocmd({ "BufWritePost" }, {
        callback = function()
          require("lint").try_lint()
        end,
      })
    end
  }

  use 'towolf/vim-helm'

  -- Git
  use {
    'tpope/vim-fugitive',
    cmd = { 'G', 'Gstatus', 'Gblame', 'Gpush', 'Gpull', 'Gdiff' },
  }
  use 'tpope/vim-rhubarb'

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
    end,
    cmd = 'NvimTreeToggle'
  }

  -- Pretty
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true },
    config = function()

      local fugitiveblame = { sections = { lualine_a = { 'mode' } }, filetypes = { 'fugitiveblame' } }

      require('lualine').setup {
        options = {
          icons_enabled = false,
          theme = 'auto',
          component_separators = { left = '', right = '' },
          section_separators = { left = '', right = '' },
        },
        sections = {
          lualine_a = { { 'mode', fmt = function(str) return str:sub(1, 3) end } },
          -- lualine_b = { 'branch', 'diff', 'diagnostics' },
          lualine_b = {},
          lualine_c = { { 'filename', path = 1 } },
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

  use {
    'lukas-reineke/indent-blankline.nvim',
    config = function()
      -- Show indent lines only in these files
      vim.g.indent_blankline_filetype = { 'yaml' }
    end
  }

  use { 'sindrets/diffview.nvim', requires = 'nvim-lua/plenary.nvim' }

  use {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns').setup()
    end
  }

  use({
    "folke/noice.nvim",
    config = function()
      require("noice").setup({
        lsp = {
          -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
          override = {
            ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
            ["vim.lsp.util.stylize_markdown"] = true,
            -- ["cmp.entry.get_documentation"] = true,
          },
        },
        views = {
          hover = {
            border = {
              style = "none",
              padding = { 1, 1 },
            },
          }
        }
      })
    end,
    requires = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      "MunifTanjim/nui.nvim",
      -- OPTIONAL:
      --   `nvim-notify` is only needed, if you want to use the notification view.
      --   If not available, we use `mini` as the fallback
      -- "rcarriga/nvim-notify",
    }
  })
  use 'rebelot/kanagawa.nvim'
  use {
    "mcchrish/zenbones.nvim",
    requires = "rktjmp/lush.nvim"
  }
  use 'will133/vim-dirdiff'
end)
