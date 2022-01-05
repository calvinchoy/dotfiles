require("nvim-tree").setup({
	disable_netrw = false,
	hijack_netrw = false,
	auto_close = false,
	update_to_buf_dir = {
		enable = true,
		auto_open = false,
	},
	update_cwd = false,
	update_focused_file = {
		enable = false,
		update_cwd = false,
		ignore_list = { ".git", "node_modules", ".cache" },
	},
	git = {
		enable = false,
	},
})

-- keymaps
local opts = { noremap = true, silent = true }
vim.api.nvim_set_keymap("n", "<C-n>", ":NvimTreeToggle<CR>", opts)
