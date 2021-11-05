local nvim_lsp = require 'lspconfig'

local on_attach = function(client, bufnr)
    local function buf_set_keymap(...)
        vim.api.nvim_buf_set_keymap(bufnr, ...)
    end

    -- Use telescope for references and code actions
    vim.lsp.handlers["textDocument/references"] = require("telescope.builtin").lsp_references
    vim.lsp.handlers["textDocument/codeAction"] = require("telescope.builtin").lsp_code_actions

    -- Mappings.
    vim.api.nvim_set_keymap('n', '<leader>d', [[<cmd>Telescope lsp_workspace_diagnostics<cr>]], {noremap = true})
    vim.api.nvim_set_keymap('n', 'gd', [[<cmd>Telescope lsp_definitions jump_type=never<cr>]], {noremap = true})

    local opts = {noremap = true, silent = true}
    buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    -- buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
    buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
    buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
    buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
    buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
    buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
    buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
    buf_set_keymap('n', 'ga', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
    buf_set_keymap('n', 'ff', '<cmd>lua vim.lsp.buf.formatting_sync(nil, 1000)<CR>', opts)

    -- Add a rounded border over hover window
    -- vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {border = "rounded"})

    require("lsp_signature").on_attach({
        bind = true,
        handler_opts = {
            border = "none"
        },
        floating_window = true,
        hint_enable = false,
        hint_prefix = ""
        })
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
-- capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.resolveSupport = {
    properties = {'documentation', 'detail', 'additionalTextEdits'}
}

-- Use a loop to conveniently both setup defined servers
-- and map buffer local keybindings when the language server attaches
local servers = {
    'gopls',
    'terraformls',
    'vimls',
    'dockerls',
    -- 'pylsp'
    -- "yamlls",
    'pyright',
}
for _, lsp in ipairs(servers) do
    nvim_lsp[lsp].setup {
        on_attach = on_attach,
        capabilities = capabilities,
        settings = {
            -- disable showing links in floating windows for gopls
            gopls = {
                gofumpt = true,
                linksInHover = false,
                codelenses = {
                    generate = true,
                    gc_details = true
                }
            },
            -- pylsp = {
            --     plugins = {
            --         pydocstyle = {
            --             enabled = true
            --         }
            --     }
            -- }
            -- yaml = {
            -- schemas = {
            -- ['https://raw.githubusercontent.com/cappyzawa/concourse-pipeline-jsonschema/master/concourse_jsonschema.json'] = '/nthg.yml'
            -- },
            -- },
        }
        -- flags = {
        -- 	debounce_text_changes = 150,
        -- 	}
    }
end

-- Format these files on save
vim.cmd('autocmd BufWritePre *.go,*.tf,*.py,*.yaml,*.yml,*.lua lua vim.lsp.buf.formatting_sync(nil, 1000)')
-- vim.cmd('autocmd BufWritePre *.py 0,$!yapf')

-- lua LSP setup...
local sumneko_root_path = '/Users/KBI11/lua-language-server'
local sumneko_binary = sumneko_root_path .. "/bin/macOS/lua-language-server"

local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

require'lspconfig'.sumneko_lua.setup {
    on_attach = on_attach,
    cmd = {sumneko_binary, "-E", sumneko_root_path .. "/main.lua"},
    settings = {
        Lua = {
            runtime = {
                -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                version = 'LuaJIT',
                -- Setup your lua path
                path = runtime_path
            },
            diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = {'vim'}
            },
            workspace = {
                -- Make the server aware of Neovim runtime files
                library = vim.api.nvim_get_runtime_file("", true)
            },
            -- Do not send telemetry data containing a randomized but unique identifier
            telemetry = {enable = false}
        }
    }
}
-- require"lspconfig".efm.setup {
--     on_attach = on_attach,
--     init_options = {documentFormatting = true},
--     filetypes = {"lua"},
--     settings = {
--         rootMarkers = {".git/"},
--         languages = {
--             lua = {
--                 {
--                     formatCommand = "lua-format -i --no-keep-simple-function-one-line --no-break-after-operator --column-limit=150 --break-after-table-lb",
--                     formatStdin = true
--                 }
--             }
--         }
--     }
-- }
