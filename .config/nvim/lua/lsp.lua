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
    buf_set_keymap('n', '<space>D', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)

    buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
    buf_set_keymap('n', 'ga', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
    buf_set_keymap('n', 'ff', '<cmd>lua vim.lsp.buf.formatting_sync(nil, 1000)<CR>', opts)

end

  -- Setup lspconfig.
  local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

require'lspconfig'.gopls.setup{
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
        gopls = {
            gofumpt = true,
            linksInHover = false,
        },
    }
}

-- Format these files on save
vim.cmd('autocmd BufWritePre *.go,*.tf,*.py,*.yaml,*.yml,*.lua lua vim.lsp.buf.formatting_sync(nil, 1000)')
