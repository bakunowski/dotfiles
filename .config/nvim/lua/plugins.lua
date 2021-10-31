return require('packer').startup(
    function()
        -- Packer
        use 'wbthomason/packer.nvim'

        -- LSP support
        use 'neovim/nvim-lspconfig'

        -- Notify on code action
        use {
            'kosayoda/nvim-lightbulb',
            config = function()
                vim.cmd [[autocmd CursorHold,CursorHoldI * lua require'nvim-lightbulb'.update_lightbulb({sign = {enabled=false}, virtual_text = {enabled=true, text=""}})]]
            end
        }

        -- Completion
        use {
            'hrsh7th/nvim-cmp',
            requires = {
                'hrsh7th/cmp-nvim-lsp',
                { 'L3MON4D3/LuaSnip', after = 'nvim-cmp' },
                { 'hrsh7th/cmp-buffer', after = 'nvim-cmp' },
                { 'hrsh7th/cmp-path', after = 'nvim-cmp' },
                { 'hrsh7th/cmp-nvim-lua', after = 'nvim-cmp' },
                { 'saadparwaiz1/cmp_luasnip', after = 'nvim-cmp' },
                { 'onsails/lspkind-nvim', after = 'nvim-cmp', },
            },
            config = [[require('config.cmp')]],
            event = 'InsertEnter *'
        }

        -- Show function signature when in brackets
        use {
            'ray-x/lsp_signature.nvim',
            opt = true,
            module = 'lsp_signature'
        }

        -- Telescope
        use {
            'nvim-telescope/telescope.nvim',
            requires = { 'nvim-lua/plenary.nvim', },
            module = 'telescope',
            cmd = 'Telescope'
        }

        -- Go tests
        use { 'buoto/gotests-vim', ft = 'go' }

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

        -- Comments with one keybinding
        use  'tpope/vim-commentary'

        -- Parantheses
        use {
            'windwp/nvim-autopairs',
            after = 'nvim-cmp',
            config = [[require('config.autopairs')]],
        }
        use 'tpope/vim-surround' 

        -- Better syntax highlighting
        use {
            'nvim-treesitter/nvim-treesitter',
            requires = {
                'nvim-treesitter/playground',
                cmd = 'TSHighlightCapturesUnderCursor'
            },
            run = ':TSUpdate',
            config = [[require('config.treesitter')]]
        }

        -- Tree view
        use {
            'kyazdani42/nvim-tree.lua',
            requires = 'kyazdani42/nvim-web-devicons',
            config = function() require'nvim-tree'.setup {} end,
            cmd = 'NvimTreeToggle'
        }

        use 'towolf/vim-helm'

        -- Eyecandy
        -- use 'shaunsingh/nord.nvim'
        use 'arcticicestudio/nord-vim'
        use 'navarasu/onedark.nvim'
        use 'Mofiqul/vscode.nvim'
        use 'RRethy/nvim-base16'
        use 'sainnhe/everforest'
        use 'sainnhe/sonokai'
        use 'mcchrish/zenbones.nvim'
        use 'martinsione/darkplus.nvim'

        use {
            'briones-gabriel/darcula-solid.nvim',
            requires = 'rktjmp/lush.nvim'
        }

        use { 
            'nvim-lualine/lualine.nvim',
            config = [[require('config.lualine')]],
            requires = {'kyazdani42/nvim-web-devicons', opt = true}
        }

        use 'lukas-reineke/indent-blankline.nvim'
    end
)
