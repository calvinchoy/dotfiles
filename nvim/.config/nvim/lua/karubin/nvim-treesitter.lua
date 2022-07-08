require("nvim-treesitter.configs").setup({
	ensure_insalled = "maintained",
	sync_install = false,
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = true,
	},
	incremental_selection = {
		enable = true,
	},
	textobjects = {
		enable = true,
	},
	context_commentstring = {
		enable = true,
	},
})
