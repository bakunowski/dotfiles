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
      --   require('telescope').setup({
      --     defaults = {
      --       layout_config = {
      --         horizontal = {
      --           width = 0.95,
      --           height = 0.9,
      --           preview_cutoff = 120,
      --           prompt_position = "bottom",
      --         },
      --       },
      --       path_display = {
      --         truncate = 3
      --       },
      --     },
      --   })
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

  -- File tree view
  use {
    'kyazdani42/nvim-tree.lua',
    requires = {
      'kyazdani42/nvim-web-devicons',
    },
    config = function()
      require 'nvim-tree'.setup {}
    end,
    cmd = 'NvimTreeToggle'
  }

  -- Pretty
  use "lukas-reineke/indent-blankline.nvim"
  use {
    "mcchrish/zenbones.nvim",
    requires = "rktjmp/lush.nvim"
  }
end)
