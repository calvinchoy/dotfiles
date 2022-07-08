require("which-key").setup({
	window = {
		border = "single",
	},
	layout = {
		height = { min = 10, max = 35 },
	},
	triggers_blacklist = {
		i = { "j", "k", "s" },
		v = { "j", "k", "s" },
	},
})
