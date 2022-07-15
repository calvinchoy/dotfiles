require("searchbox").setup({
	popup = {
		relative = "win",
		position = {
			row = "5%",
			col = "95%",
		},
		size = 30,
		border = {
			style = "single",
			highlight = "conceal",
			text = {
				top = " Search ",
				top_align = "left",
			},
		},
		win_options = {
			winhighlight = "Normal:Normal",
		},
	},
	hooks = {
		before_mount = function(input)
			-- code
		end,
		after_mount = function(input)
			-- code
		end,
		on_done = function(value, search_type)
			-- code
		end,
	},
})

-- search
Map("n", "<C-f>", ":SearchBoxMatchAll clear_matches=true <CR>")
Map("x", "<C-f>", ":SearchBoxMatchAll clear_matches=true visual_mode=true <CR>")
Map("n", "<M-f>", ":SearchBoxMatchAll clear_matches=true exact=true <CR>")
Map("x", "<M-f>", ":SearchBoxMatchAll clear_matches=true exact=true visual_mode=true <CR>")
-- relace
Map("n", "<C-r>", ":SearchBoxReplace clear_matches=true confirm=menu <CR>")
Map("x", "<C-r>", ":SearchBoxReplace clear_matches=true confirm=menu visual_mode=true <CR>")
Map("n", "<M-r>", ":SearchBoxReplace clear_matches=true exact=true confirm=menu <CR>")
Map("x", "<M-r>", ":SearchBoxReplace clear_matches=true exact=true confirm=menu visual_model=true <CR>")
-- replace word
Map("n", "<leader>r", ":SearchBoxReplace title='Replace word' exact=true -- <C-r>=expand('<cword>')<CR><CR>")
