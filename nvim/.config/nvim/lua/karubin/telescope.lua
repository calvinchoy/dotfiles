--------------------------------------------------
-- Default telescope setup
--------------------------------------------------
local action_layout = require("telescope.actions.layout")
require("telescope").setup({
	defaults = {
		file_sorter = require("telescope.sorters").get_fzy_sorter,
		prompt_prefix = " > ",
		color_devicons = true,
		file_previewer = require("telescope.previewers").vim_buffer_cat.new,
		grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
		qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
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
		fzy_native = {
			override_generic_sorter = false,
			override_file_sorter = true,
		}
	}
})

require("telescope").load_extension("fzy_native")
require("telescope").load_extension("file_browser")                                                   
require("telescope").load_extension("frecency")
require('telescope').load_extension("termfinder")
--------------------------------------------------
-- Custom telescope pickers
--------------------------------------------------
local M = {}

-- automatically switch between git files and normal file picker
M.project_files = function()
	local opts_git = {
		prompt_title = " Git Files",
		previewer = false,
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
		file_ignore_patterns = {
		  ".git",
			"node_modules",
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
      height = 0.35
    }
  }

  require('telescope.builtin').buffers(require("telescope.themes").get_dropdown(opts))
end

M.browse_frecency = function()
	local opts = {
	  prompt_title = " Frecency",
		previewer = false,
		layout_config = {
			width = 0.5,
			height = 0.35,
		}
	}

	require("telescope").extensions.frecency.frecency(require("telescope.themes").get_dropdown(opts))
end
M.term_finder = function()
	local opts = {
	  prompt_title = " Terminal",
		previewer = false,
		layout_config = {
			width = 0.5,
			height = 0.35,
		}
	}

	require("telescope").extensions.termfinder.find(require("telescope.themes").get_dropdown(opts))
end
-- custom picker creation
--  https://github.com/nvim-telescope/telescope.nvim/blob/master/developers.md
--  https://www.reddit.com/r/neovim/comments/n9vt6d/chaining_2_telescope_pickers/

return M
