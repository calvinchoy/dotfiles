require("nvim-tree").setup({
	disable_netrw = false,
	hijack_netrw = false,
	auto_close = false,
	update_to_buf_dir = {
		enable = true,
		auto_open = false,
	},
	git = {
		enable = false,
	},
})

-- keymaps
local opts = { noremap = true, silent = true }
Keymap("n", "<C-n>", ":NvimTreeToggle<CR>", opts)
Keymap("n", "<leader>fl", ":NvimTreeFindFile<CR>", opts)
