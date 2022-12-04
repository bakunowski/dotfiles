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
    "markdown",
    "markdown_inline",
  },
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  indent = {
    enable = true,
  },
}
