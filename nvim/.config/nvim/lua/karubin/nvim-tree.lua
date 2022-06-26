require("nvim-tree").setup({
	disable_netrw = false,
	hijack_netrw = false,
	update_focused_file = {
    enable = true,
    update_cwd = false,
    ignore_list = {},
  },
  git = {
		enable = false,
	},
	view = {
	  side = 'left'
	}
})

-- keymaps
local opts = { noremap = true, silent = true }
Keymap("n", "<C-n>", ":NvimTreeToggle<CR>", opts)
Keymap("n", "<leader>fl", ":NvimTreeFindFile<CR>", opts)
