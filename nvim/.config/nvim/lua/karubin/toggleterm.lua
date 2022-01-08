require("toggleterm").setup({
	-- size can be a number or function which is passed the current terminal
	size = function(term)
		if term.direction == "horizontal" then
			return 15
		elseif term.direction == "vertical" then
			return vim.o.columns * 0.3
		end
	end,
	open_mapping = [[<C-\>]],
	hide_numbers = true, -- hide the number column in toggleterm buffers
	shade_filetypes = {},
	shade_terminals = true,
	start_in_insert = true,
	insert_mappings = true, -- whether or not the open mapping applies in insert mode
	persist_size = true,
	direction = "vertical",
	close_on_exit = true, -- close the terminal window when the process exits
})

function _G.set_terminal_keymaps()
	local opts = { noremap = true }
	vim.api.nvim_buf_set_keymap(0, "t", "jj", [[<C-\><C-n>]], opts)
	vim.api.nvim_buf_set_keymap(0, "t", "<C-h>", [[<C-\><C-n><C-W>h]], opts)
	vim.api.nvim_buf_set_keymap(0, "t", "<C-j>", [[<C-\><C-n><C-W>j]], opts)
	vim.api.nvim_buf_set_keymap(0, "t", "<C-k>", [[<C-\><C-n><C-W>k]], opts)
	vim.api.nvim_buf_set_keymap(0, "t", "<C-l>", [[<C-\><C-n><C-W>l]], opts)
end

-- -----------------------------------------------------------
-- Lazy git toggle
-- -----------------------------------------------------------
vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")
local Terminal = require("toggleterm.terminal").Terminal
local lazygit = Terminal:new({
	cmd = "lazygit",
	dir = "git_dir",
	direction = "float",
	float_opts = {
		border = "single",
	},
	-- function to run on opening the terminal
	on_open = function(term)
		vim.cmd("startinsert!")
		vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", { noremap = true, silent = true })
	end,
	-- function to run on closing the terminal
	on_close = function(term)
		vim.cmd("q")
	end,
})

function _lazygit_toggle()
	lazygit:toggle()
end

vim.api.nvim_set_keymap("n", "<leader>g", "<cmd>lua _lazygit_toggle()<cr>", { noremap = true, silent = true })

-- -----------------------------------------------------------
-- Floating terminal toggle
-- -----------------------------------------------------------
local floatterminal = Terminal:new({
	dir = "git_dir",
	direction = "float",
	float_opts = {
		border = "single",
	},
	-- function to run on opening the terminal
	on_open = function(term)
		vim.cmd("startinsert!")
		vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", { noremap = true, silent = true })
	end,
	-- function to run on closing the terminal
	on_close = function(term)
		  -- vim.cmd("exit")
	end,
})

function _floatterminal_toggle()
	floatterminal:toggle()
end

vim.api.nvim_set_keymap("n", "<leader>/", "<cmd>lua _floatterminal_toggle()<CR>", { noremap = true, silent = true })

-- -----------------------------------------------------------
-- Mappings 
-- -----------------------------------------------------------
local opts = { noremap = true, silent = true }
Keymap("n", "<C-t>", '<Cmd>exe v:count1 . "ToggleTerm"<CR>', opts)
Keymap("i", "<C-t>", '<Esc><Cmd>exe v:count1 . "ToggleTerm"<CR>', opts)
