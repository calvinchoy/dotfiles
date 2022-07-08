require("gitsigns").setup({
	on_attach = function(bufnr)
		local gs = package.loaded.gitsigns

		local function map(mode, l, r, opts)
			opts = opts or {}
			opts.buffer = bufnr
			vim.keymap.set(mode, l, r, opts)
		end

		-- Navigation
		map("n", "]c", "&diff ? ']c' : '<cmd>Gitsigns next_hunk<CR>'", { expr = true })
		map("n", "[c", "&diff ? '[c' : '<cmd>Gitsigns prev_hunk<CR>'", { expr = true })

		-- Actions
		map({ "n", "v" }, "<leader>hs", ":Gitsigns stage_hunk<CR>")
		map({ "n", "v" }, "<leader>hr", ":Gitsigns reset_hunk<CR>")
		map("n", "<leader>hS", ":Gitsigns stage_buffer<CR>")
		map("n", "<leader>hu", ":Gitsigns undo_stage_hunk<CR>")
		map("n", "<leader>hR", ":Gitsigns reset_buffer<CR>")
		map("n", "<leader>hp", ":Gitsigns preview_hunk<CR>")
		map("n", "<leader>hb", ":Gitsigns blame_line full=true<CR>")
		map("n", "<leader>tb", ":Gitsigns toggle_current_line_blame<CR>")
		map("n", "<leader>hd", ":Gitsigns diffthis<CR>")
		map("n", "<leader>td", ":Gitsigns toggle_deleted<CR>")

		-- Text object
		map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>")
	end,
})
