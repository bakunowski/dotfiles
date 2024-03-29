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
  -- i don't want this, but i need this
  'martinda/Jenkinsfile-vim-syntax',

  -- Git
  'tpope/vim-fugitive',
  'tpope/vim-rhubarb',

  -- Detect tabstop and shiftwidth automatically
  'tpope/vim-sleuth',

  -- Brackets operations
  'tpope/vim-surround',

  -- Easy native LSP setup
  'neovim/nvim-lspconfig',

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
          fields = { "abbr", "kind" },
          format = function(_, vim_item)
            local cmp_kinds = {
              Text = '  ',
              Method = '  ',
              Function = '  ',
              Constructor = '  ',
              Field = '  ',
              Variable = '  ',
              Class = '  ',
              Interface = '  ',
              Module = '  ',
              Property = '  ',
              Unit = '  ',
              Value = '  ',
              Enum = '  ',
              Keyword = '  ',
              Snippet = '  ',
              Color = '  ',
              File = '  ',
              Reference = '  ',
              Folder = '  ',
              EnumMember = '  ',
              Constant = '  ',
              Struct = '  ',
              Event = '  ',
              Operator = '  ',
              TypeParameter = '  ',
            }
            vim_item.kind = cmp_kinds[vim_item.kind] or ""
            return vim_item
          end,
        },
      })
    end
  },

  { -- Adds git releated signs to the gutter, as well as utilities for managing changes
    'lewis6991/gitsigns.nvim',
    config = true
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
      -- To get fzf loaded and working with telescope, you need to call
      -- load_extension, somewhere after setup function:
      require('telescope').load_extension('fzf')

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
  -- fzf extension for telescope with better speed
  {
    "nvim-telescope/telescope-fzf-native.nvim", run = 'make'
  },

  { -- Better syntax highlighting
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
    },
    build = ':TSUpdate',
    config = function()
      require 'nvim-treesitter.configs'.setup {
        ensure_installed = {
          "go",
          "gomod",
          "bash",
          "comment",
          "dockerfile",
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
        indent = { enable = true },
        textobjects = {
          move = {
            enable = true,
            set_jumps = true, -- whether to set jumps in the jumplist
            goto_next_start = {
              [']f'] = '@function.outer',
              [']b'] = '@block.outer',
            },
            goto_next_end = {
              [']F'] = '@function.outer',
            },
            goto_previous_start = {
              ['[f'] = '@function.outer',
              ['[b'] = '@block.outer',
            },
            goto_previous_end = {
              ['[F'] = '@function.outer',
            },
          },
        },
      }
    end
  },

  {
    'nvim-tree/nvim-tree.lua',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require("nvim-tree").setup({
        actions = {
          open_file = { quit_on_open = true },
        },
        view = {
          width = {},

        }
      })
      vim.api.nvim_set_keymap(
        "n",
        "<leader>e",
        ':NvimTreeToggle<cr>',
        { noremap = true, silent = true }
      )
    end
  },
}, {})
