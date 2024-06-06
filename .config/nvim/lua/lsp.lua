-- Override diagnostics symbols
local signs = { Error = "⏺", Warn = "⏺", Hint = "⏺", Info = "⏺" }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

local opts = { noremap = true, silent = true }
-- vim.keymap.set('n', '<space>D', vim.diagnostic.open_float, opts)
-- vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
-- vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
-- vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- client.server_capabilities.semanticTokensProvider = nil
  -- Override handlers
  local telescope_builtin = require 'telescope.builtin'

  local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
  if client.supports_method("textDocument/formatting") then
    vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
    vim.api.nvim_create_autocmd("BufWritePre", {
      group = augroup,
      buffer = bufnr,
      callback = function()
        vim.lsp.buf.format()
      end,
    })
  end

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

local border = {
  { " ", "FloatBorder" },
  { "", "FloatBorder" },
  { " ", "FloatBorder" },
  { " ", "FloatBorder" },
  { " ", "FloatBorder" },
  { " ", "FloatBorder" },
  { " ", "FloatBorder" },
  { " ", "FloatBorder" },
}

local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
  opts = opts or {}
  opts.border = opts.border or border
  opts.max_width = opts.max_width or 80
  return orig_util_open_floating_preview(contents, syntax, opts, ...)
end

-- Setup lspconfig.
local lspconfig = require('lspconfig')

require 'lspconfig'.gopls.setup {
  on_attach = on_attach,
  settings = {
    gopls = {
      gofumpt = true,
      semanticTokens = false,
      -- hints = {
      --   assignVariableTypes = true,
      --   compositeLiteralFields = true,
      --   compositeLiteralTypes = true,
      --   constantValues = true,
      -- functionTypeParameters = true,
      -- parameterNames = true,
      --   rangeVariableTypes = true,
      -- },
    },
  }
}

require 'lspconfig'.terraformls.setup {
  on_attach = on_attach,
}

require 'lspconfig'.rust_analyzer.setup {
  on_attach = on_attach,
}

require 'lspconfig'.html.setup {
  on_attach = on_attach,
}

require 'lspconfig'.cssls.setup {
  on_attach = on_attach,
}

require 'lspconfig'.bashls.setup {
  on_attach = on_attach,
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
}

-- require('lspconfig').yamlls.setup {
--   on_attach = on_attach,
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
}

require 'lspconfig'.tsserver.setup {
  on_attach = on_attach,
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
