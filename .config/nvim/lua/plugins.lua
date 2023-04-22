local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  -- kill me
  'martinda/Jenkinsfile-vim-syntax',

  -- Colorscheme
  {
    'lourenci/github-colors',
    lazy = false,
    priority = 1000,
    -- config = function()
    --   vim.cmd [[
    --   colorscheme github-colors
    --   ]]
    -- end
  },

  -- Git
  'tpope/vim-fugitive',
  'tpope/vim-rhubarb',

  -- Detect tabstop and shiftwidth automatically
  'tpope/vim-sleuth',

  -- Brackets operations
  'tpope/vim-surround',

  -- Easy native LSP setup
  'neovim/nvim-lspconfig',

  -- Replaced by helm-treesitter
  -- 'towolf/vim-helm',

  { -- Brackets
    'windwp/nvim-autopairs',
    opts = {
      fast_wrap = {
        map = '<C-e>',
      },
    },
  },

  { -- Autocompletion
    'hrsh7th/nvim-cmp',
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/vim-vsnip',
      'hrsh7th/cmp-vsnip',
      'hrsh7th/cmp-nvim-lsp-signature-help',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-nvim-lua',
      'onsails/lspkind-nvim'
    },
    init = function()
      local cmp = require('cmp')
      local lspkind = require('lspkind')

      cmp.setup({
        preselect = cmp.PreselectMode.None,
        snippet = {
          expand = function(args)
            vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ['<C-b>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<C-e>'] = cmp.mapping.abort(),
          ['<CR>'] = cmp.mapping.confirm({ select = true }),
        }),
        completion = {
          completeopt = 'menu,menuone,noinsert',
        },
        sources = {
          { name = 'nvim_lsp' },
          -- { name = "nvim_lsp_signature_help" },
          { name = 'buffer' },
          { name = 'path' },
          { name = 'vsnip' },
        },
        formatting = {
          format = lspkind.cmp_format(),
        },
      })
    end
  },

  { -- Adds git releated signs to the gutter, as well as utilities for managing changes
    'lewis6991/gitsigns.nvim',
    config = true
  },

  {
    'nvim-lualine/lualine.nvim',
    opts = {
      options = {
        icons_enabled = false,
        theme = 'default',
        -- theme = 'auto',
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
      extensions = { 'nvim-tree', 'fugitive' }
    },
  },

  { -- Add indentation guides even on blank lines
    'lukas-reineke/indent-blankline.nvim',
    opts = {
      filetype = { 'yaml' }
    },
  },

  { -- Comments
    'numToStr/Comment.nvim',
    opts = {
      toggler = { line = '<c-c>', },
      opleader = { line = '<c-c>', },
    },
  },

  { -- Classic TJ
    'nvim-telescope/telescope.nvim',
    dependencies = {
      { 'nvim-lua/plenary.nvim' },
    },
    opts = {
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
        borderchars = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
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
        file_browser = {
          disable_devicons = true,
          prompt_title = false,
          results_title = false,
          preview_title = false,
        },
      },
    },
    init = function()
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
  },

  { -- Better syntax highlighting
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    config = function()
      require 'nvim-treesitter.configs'.setup {
        ensure_installed = {
          "bash",
          "comment",
          "dockerfile",
          "go",
          "hcl",
          "java",
          "json",
          "lua",
          "python",
          "rust",
          "vim",
          "yaml",
          "markdown",
          "markdown_inline",
        },
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false,
        },
        indent = {
          enable = true,
        },
      }
    end
  },

  -- {
  --   'norcalli/nvim-colorizer.lua',
  --   config = function()
  --     require 'colorizer'.setup()
  --   end,
  -- },

  {
    "folke/noice.nvim",
    opts = {
      cmdline = {
        -- use regular cmdline
        view = "cmdline",
      },
      views = {
        hover = {
          border = { style = "none", padding = { 1, 1 }, },
          position = { row = 2 }
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
      presets = {
        bottom_search = true, -- use a classic bottom cmdline for search
        long_message_to_split = true, -- long messages will be sent to a split
      },
      messages = {
        view_search = false
      }
    },
    dependencies = { "MunifTanjim/nui.nvim" }
  },

  {
    'nvim-tree/nvim-tree.lua',
    config = function()
      require("nvim-tree").setup()
      vim.api.nvim_set_keymap(
        "n",
        "<leader>e",
        ':NvimTreeToggle<cr>',
        { noremap = true, silent = true }
      )
    end
  },

  {
    'f-person/auto-dark-mode.nvim',
    config = function()

      local auto_dark_mode = require('auto-dark-mode')
      auto_dark_mode.setup({
        -- update_interval = 1000,
        set_dark_mode = function()
          vim.api.nvim_set_option('background', 'dark')
          vim.cmd('colorscheme habamax')
        end,
        set_light_mode = function()
          vim.api.nvim_set_option('background', 'light')
          vim.cmd('colorscheme github-colors')
        end,
      })
      auto_dark_mode.init()
    end,
  },

}, {})
