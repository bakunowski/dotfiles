-- Override diagnostics symbols
local signs = { Error = "⏺", Warn = "⏺", Hint = "⏺", Info = "⏺" }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

local opts = { noremap = true, silent = true }
vim.keymap.set('n', '<space>D', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  client.server_capabilities.semanticTokensProvider = nil
  -- Override handlers
  local telescope_builtin = require 'telescope.builtin'

  vim.lsp.handlers["textDocument/references"]     = function()
    return telescope_builtin.lsp_references({
      jump_type = "never",
      include_declaration = false,
      show_line = false,
      prompt_title = false,
      results_title = false,
      preview_title = false,
    })
  end
  vim.lsp.handlers["textDocument/implementation"] = function()
    return telescope_builtin.lsp_implementations({
      show_line = false,
      prompt_title = false,
      results_title = false,
      preview_title = false,
    })
  end
  vim.lsp.handlers["textDocument/definition"]     = function()
    return telescope_builtin.lsp_definitions({
      jump_type = "never",
      show_line = false,
      prompt_title = false,
      results_title = false,
      preview_title = false,
    })
  end

  -- Mappings.
  local bufopts = { noremap = true, silent = true, buffer = bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', '<space>k', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  -- vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', 'ga', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', '<space>h', vim.lsp.buf.document_highlight, bufopts)
  vim.keymap.set('n', 'gf', function() vim.lsp.buf.format { async = false } end, bufopts)

  vim.api.nvim_create_autocmd({ "CursorMoved" }, {
    callback = function()
      vim.lsp.buf.clear_references()
    end,
  })

end

-- Setup lspconfig.
local capabilities = require('cmp_nvim_lsp').default_capabilities()

require 'lspconfig'.gopls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    gopls = {
      gofumpt = false,
      semanticTokens = false,
    },
  }
}

require 'lspconfig'.terraformls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
}

require 'lspconfig'.rust_analyzer.setup {
  on_attach = on_attach,
  capabilities = capabilities,
}

require 'lspconfig'.html.setup {
  on_attach = on_attach,
  capabilities = capabilities,
}

require 'lspconfig'.cssls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
}

require 'lspconfig'.bashls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
}

require 'lspconfig'.lua_ls.setup {
  on_attach = on_attach,
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = { 'vim' },
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  },
}

require 'lspconfig'.jsonnet_ls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
}

-- require('lspconfig').yamlls.setup {
--   on_attach = on_attach,
--   capabilities = capabilities,
--   settings = {
--     yaml = {
--       trace = {
--         server = "verbose"
--       },
--       schemas = {
--         kubernetes = "/*.yaml"
--       },
--       schemaDownload = { enable = true },
--       validate = true,
--     },
--   }
-- }

require 'lspconfig'.pyright.setup {
  on_attach = on_attach,
  capabilities = capabilities,
}

require 'lspconfig'.tsserver.setup {
  on_attach = on_attach,
  capabilities = capabilities,
}

local configs = require('lspconfig.configs')
local lspconfig = require('lspconfig')
local util = require('lspconfig.util')

if not configs.helm_ls then
  configs.helm_ls = {
    default_config = {
      cmd = { "helm_ls", "serve" },
      filetypes = { 'helm' },
      root_dir = function(fname)
        return util.root_pattern('Chart.yaml')(fname)
      end,
    },
  }
end

lspconfig.helm_ls.setup {
  on_attach = on_attach,
  filetypes = { "helm" },
  cmd = { "helm-ls", "serve" },
}

-- Format these files on save
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  pattern = { "*.lua", "*.rs", "*.go", "*.tf", "*.tfvars", "*.html" },
  callback = function()
    vim.lsp.buf.format({ async = true })
  end,
})
