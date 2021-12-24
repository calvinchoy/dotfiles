require("nvim-tree").setup({
	disable_netrw = false,
	hijack_netrw = false,
	auto_close = true,
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
local keymap = vim.api.nvim_set_keymap

keymap("n", "<C-n>", ":NvimTreeToggle<CR>", opts)
