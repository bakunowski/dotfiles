require 'nvim-treesitter.configs'.setup {
  ensure_installed = {
    "bash",
    "comment",
    "dockerfile",
    "go",
    "hcl",
    "java",
    "json",
    "lua",
    "python",
    "rust",
    "vim",
    "yaml",
  },
  highlight = {
    enable = true,
  },
  indent = {
    enable = true,
  },
}
