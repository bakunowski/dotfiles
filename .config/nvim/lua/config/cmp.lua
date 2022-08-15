local cmp = require('cmp')

cmp.setup {
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
  -- preselect = cmp.PreselectMode.None,
  sources = {
    { name = 'nvim_lsp' },
    { name = "nvim_lsp_signature_help" },
    { name = 'buffer' },
    { name = 'path' },
    { name = 'vsnip' },
  },
  formatting = {
    format = function(entry, vim_item)
      -- fancy icons and a name of kind
      vim_item.kind = require("lspkind").presets.default[vim_item.kind] .. " " .. vim_item.kind

      -- set a name for each source
      vim_item.menu = ({
        buffer = "[Buffer]",
        nvim_lsp = "[LSP]",
        nvim_lua = "[Lua]",
        latex_symbols = "[Latex]",
        vsnip = "[Vsnip]"
      })[entry.source.name]
      return vim_item
    end,
  },
}
