-- Bootstrap installing packer on a new machine
local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
	Packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
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

	-- Complete my brackets!
	use 'windwp/nvim-autopairs'

	use 'tpope/vim-surround'

	-- Comments with a keybinding
	use {
			'numToStr/Comment.nvim',
			config = function()
					require('Comment').setup()
			end
	}

	-- Classic TJ
	use {
		'nvim-telescope/telescope.nvim',
		requires = { {'nvim-lua/plenary.nvim'} }
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
	}

	-- Go tests
	use { 'buoto/gotests-vim', ft = 'go' }

	use 'towolf/vim-helm'

	-- Git
	use {
			{
					'tpope/vim-fugitive',
					cmd = { 'G', 'Gstatus', 'Gblame', 'Gpush', 'Gpull', 'Gdiff' },
			},
			{
					'lewis6991/gitsigns.nvim',
					requires = { 'nvim-lua/plenary.nvim' },
					config = function() require('gitsigns').setup() end,
			}
	}

	-- File tree view
	use {
			'kyazdani42/nvim-tree.lua',
			requires = {
				'kyazdani42/nvim-web-devicons', -- optional, for file icon
			},
			config = function() require'nvim-tree'.setup {} end,
			cmd = 'NvimTreeToggle'
	}

	-- And now make everything pretty
	use {
			"mcchrish/zenbones.nvim",
			requires = "rktjmp/lush.nvim"
	}

  use 'stevearc/dressing.nvim'
	use 'lukas-reineke/indent-blankline.nvim'
end)
