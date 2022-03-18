require'nvim-treesitter.configs'.setup {
	ensure_installed = {
        "go",
        "comment",
        "python",
        "hcl",
        "yaml",
        "bash",
        "lua",
        "vim",
        "json",
        "java",
        "dockerfile",
        "rust"
    },
	highlight = {
		enable = true,
		disable = {"yaml"},
	},
    indent = {
        enable = true,
		disable = {"yaml"},
    },
}
