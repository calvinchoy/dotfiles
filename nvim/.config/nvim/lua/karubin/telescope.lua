--------------------------------------------------
-- Default telescope setup
local action_layout = require("telescope.actions.layout")
require("telescope").setup({
	defaults = {
		file_sorter = require("telescope.sorters").get_fzy_sorter,
		prompt_prefix = " > ",
		color_devicons = true,
		file_previewer = require("telescope.previewers").vim_buffer_cat.new,
		grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
		qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
		vimgrep_arguments = {
			"rg",
			"--color=never",
			"--no-heading",
			"--with-filename",
			"--line-number",
			"--column",
			"--smart-case",
			"--hidden",
		},
		file_ignore_patterns = {
			".git/.*",
			"node_modules",
			"**/*.svg",
			"**/*.ttf",
			"dist",
			"coverage",
			"report",
		},
		mappings = {
			n = {
				["<M-p>"] = action_layout.toggle_preview,
			},
			i = {
				-- ["<esc>"] = actions.close,
				["<M-p>"] = action_layout.toggle_preview,
			},
		},
	},
	extensions = {
		fzf = {
			fuzzy = true, -- false will only do exact matching
			override_generic_sorter = true, -- override the generic sorter
			override_file_sorter = true, -- override the file sorter
			case_mode = "smart_case", -- or "ignore_case" or "respect_case"
		},
		file_browser = {
			path = "%:p:h",
		},
	},
})

require("telescope").load_extension("fzf")
require("telescope").load_extension("file_browser")

--------------------------------------------------
-- Mappings
--------------------------------------------------
local opts = { noremap = true, silent = true }
Keymap(
	"n",
	"<leader>ff",
	"<cmd>lua require('telescope.builtin').find_files({no_ignore = true, hidden = true})<cr>",
	opts
)
Keymap("n", "<leader>bf", "<cmd>lua require('karubin.telescope').browse_files()<cr>", opts)
Keymap("n", "<leader>fg", "<cmd>lua require('karubin.telescope').generic_live_grep()<cr>", opts)
Keymap("n", "<leader>fb", "<cmd>lua require('karubin.telescope').browse_buffers()<cr>", opts)
Keymap("n", "<M-b>", "<cmd>lua require('karubin.telescope').browse_buffers()<cr>", opts)
Keymap("n", "<leader>fh", "<cmd>lua require('telescope.builtin').help_tags()<cr>", opts)
Keymap("n", "<leader>fz", "<cmd>lua require('karubin.telescope').fuzzy_buffer_grep()<cr>", opts)
Keymap("n", "<C-p>", "<cmd>lua require('karubin.telescope').project_files()<cr>", opts)
Keymap("n", "<S-p>", "<cmd>lua require('karubin.telescope').document_symbols()<cr>", opts)
Keymap("n", "<leader>dcf", "<cmd>lua require('karubin.telescope').browse_dotfiles()<cr>", opts)
Keymap("n", "gd", "<cmd>lua require('karubin.telescope').go_to_definitions()<cr>", opts)

-- Basic git helper
Keymap("n", "<leader>gb", "<cmd>lua require('telescope.builtin').git_branches()<cr>", opts)

--------------------------------------------------
-- Custom telescope pickers
--------------------------------------------------
local M = {}

-- automatically switch between git files and normal file picker
M.project_files = function()
	local opts_git = {
		prompt_title = " Git Files",
		previewer = false,
		show_untracked = true,
		layout_config = {
			width = 0.5,
			height = 0.35,
		},
	}
	local opts_files = {
		prompt_title = " Files",
		previewer = false,
		layout_config = {
			width = 0.5,
			height = 0.35,
		},
	}

	local ok = pcall(require("telescope.builtin").git_files, require("telescope.themes").get_dropdown(opts_git))
	if not ok then
		require("telescope.builtin").find_files(require("telescope.themes").get_dropdown(opts_files))
	end
end

-- Simple fuzzy code structure/symbols navigation
M.document_symbols = function()
	local opts = {
		prompt_title = " Navigate Code",
		layout_config = {
			width = 0.5,
			height = 0.35,
		},
	}

	require("telescope.builtin").lsp_document_symbols(require("telescope.themes").get_dropdown(opts))
end

-- Sleek file browser to create new folder and files
M.browse_files = function()
	local opts = {
		hidden = true,
		depth = 1,
		previewer = false,
		layout_config = {
			width = 0.5,
			height = 0.35,
		},
	}

	require("telescope").extensions.file_browser.file_browser(require("telescope.themes").get_dropdown(opts))
end

M.browse_buffers = function()
	local opts = {
		prompt_title = "﬘ Buffers",
		previewer = false,
		layout_config = {
			width = 0.5,
			height = 0.35,
		},
	}

	require("telescope.builtin").buffers(require("telescope.themes").get_dropdown(opts))
end

M.term_finder = function()
	local opts = {
		prompt_title = " Terminal",
		previewer = false,
		layout_config = {
			width = 0.5,
			height = 0.35,
		},
	}

	require("telescope").extensions.termfinder.find(require("telescope.themes").get_dropdown(opts))
end

-- dotfiles pickers quick access
M.browse_dotfiles = function()
	local dotfiles_path = HOME_PATH .. "/.dotfiles"
	if IsWindows() then
		local home_path = os.getenv("USERPROFILE")
		dotfiles_path = HOME_PATH .. "\\dotfiles"
	end
	local opts = {
		prompt_title = " Dotfiles",
		cwd = dotfiles_path,
		previewer = false,
		layout_config = {
			width = 0.5,
			height = 0.35,
		},
	}
	require("telescope.builtin").git_files(require("telescope.themes").get_dropdown(opts))
end

M.generic_live_grep = function()
	local opts = {
		prompt_title = " Find all",
		previewer = false,
		layout_config = {
			height = 0.5,
		},
	}
	require("telescope.builtin").live_grep(require("telescope.themes").get_ivy(opts))
end

M.go_to_definitions = function()
	local opts = {
		prompt_title = " Find all",
		layout_config = {
			height = 0.5,
		},
	}
	require("telescope.builtin").lsp_definitions(require("telescope.themes").get_ivy(opts))
end

M.fuzzy_buffer_grep = function()
	local opts = {
		prompt_title = " Find in buffer",
		layout_config = {
			height = 0.5,
		},
	}
	require("telescope.builtin").current_buffer_fuzzy_find(require("telescope.themes").get_ivy(opts))
end

return M
