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
    { 'github/copilot.vim', },
    { 'will133/vim-dirdiff' },

    -- Git
    'tpope/vim-fugitive',
    'tpope/vim-rhubarb',

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
                sources = {
                    { name = 'nvim_lsp' },
                    { name = "nvim_lsp_signature_help" },
                    { name = 'buffer' },
                    { name = 'path' },
                    { name = 'vsnip' },
                },
            })
        end
    },

    { -- Adds git releated signs to the gutter, as well as utilities for managing changes
        'lewis6991/gitsigns.nvim',
        config = true
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
        dependencies = {
            'nvim-treesitter/nvim-treesitter-textobjects',
        },
        build = ':TSUpdate',
        config = function()
            require 'nvim-treesitter.configs'.setup {
                ensure_installed = {
                    "go",
                    "gomod",
                    "comment",
                    "dockerfile",
                    "hcl",
                    "json",
                    "yaml",
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

                },
                filters = {
                    dotfiles = false,
                    git_ignored = false,
                },
            })
            vim.api.nvim_set_keymap(
                "n",
                "<leader>e",
                ':NvimTreeToggle<cr>',
                { noremap = true, silent = true }
            )
        end
    },

    {
        "ray-x/go.nvim",
        dependencies = { -- optional packages
            "ray-x/guihua.lua",
            "neovim/nvim-lspconfig",
            "nvim-treesitter/nvim-treesitter",
        },
        config = function()
            require("go").setup()
        end,
        event = { "CmdlineEnter" },
        ft = { "go", 'gomod' },
        build = ':lua require("go.install").update_all_sync()' -- if you need to install/update all binaries
    },

    {
        "cuducos/yaml.nvim",
        ft = { "yaml" }, -- optional
        dependencies = {
            -- "nvim-treesitter/nvim-treesitter",
            "nvim-telescope/telescope.nvim", -- optional
        },
        config = function()
            require("yaml_nvim").setup()
        end,
    },

    {
        'nvim-lualine/lualine.nvim',
        dependencies = {
            'arkav/lualine-lsp-progress',
        },
        opts = {
            options = {
                icons_enabled = false,
                -- theme = 'default',
                component_separators = { left = '', right = '' },
                section_separators = { left = '', right = '' },
            },
            sections = {
                lualine_a = {
                    { 'mode', fmt = function(str) return str:sub(1, 3) end }
                },
                lualine_b = { 'branch' },
                lualine_c = {
                    { 'filename', path = 1 },
                    'lsp_progress'
                },
                lualine_x = { 'diagnostics' },
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
            extensions = { 'nvim-tree', 'fugitive' }
        },
    },

    {
        "rebelot/kanagawa.nvim",
        lazy = false,
        priority = 1000,
        opts = {
            commentStyle = { italic = false },
            keywordStyle = { italic = false },
            transparent = false,
            colors = {
                palette = {
                    fujiWhite = "#dcd7d7",
                    oldWhite = "#c8c0c8",
                },
                theme = {
                    all = {
                        ui = {
                            bg_gutter = "none",
                        }
                    }
                },
            },
        },
    },
    -- {
    --   "sindrets/diffview.nvim"
    -- },
}, {})
