--------------------------------------------------
-- Default telescope setup 
--------------------------------------------------
local actions = require('telescope.actions')
local action_layout = require('telescope.actions.layout')
require('telescope').setup{
  defaults = {
      file_sorter = require('telescope.sorters').get_fzy_sorter,
      prompt_prefix = ' > ',
      color_devicons = true,
      file_previewer   = require('telescope.previewers').vim_buffer_cat.new,
      grep_previewer   = require('telescope.previewers').vim_buffer_vimgrep.new,
      qflist_previewer = require('telescope.previewers').vim_buffer_qflist.new,
      mappings = {
        n = {
          ['<M-p>'] = action_layout.toggle_preview
        },
        i = {
          -- ["<esc>"] = actions.close,
          ['<M-p>'] = action_layout.toggle_preview
        }
      }
  },
  extensions = {
      fzy_native = {
          override_generic_sorter = false,
          override_file_sorter = true,
      },
      bookmarks = {
        selected_browser = 'google_chrome',
        url_open_command = 'open'
      }
  }
}

require('telescope').load_extension('fzy_native')
require("telescope").load_extension('file_browser')
require('telescope').load_extension('bookmarks')
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
      height = 0.35
    }
  }
  local opts_files = {
    prompt_title = " Files",
    previewer = false,
    layout_config = {
      width = 0.5, 
      height = 0.35
    }
  }

  local ok = pcall(require'telescope.builtin'.git_files, require('telescope.themes').get_dropdown(opts_git))
  if not ok then require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown(opts_files)) end
end

-- Simple fuzzy code structure/symbols navigation
M.document_symbols = function()
  local opts = {
    prompt_title = " Navigate Code", 
    layout_config = {
      width = 0.5, 
      height = 0.35
    }
  }

  require'telescope.builtin'.lsp_document_symbols(require('telescope.themes').get_dropdown(opts))
end

-- Sleek file browser to create new folder and files
M.browse_files = function()
  local opts = {
    depth = 1,
    previewer = false,
    layout_config = {
      width = 0.5,
      height = 0.35
    },
    file_ignore_patterns = {
      "node_modules"
    }
  }

  require'telescope'.extensions.file_browser.file_browser(require('telescope.themes').get_dropdown(opts))
end

M.browser_bookmarks = function()
  require('telescope').extensions.bookmarks.bookmarks()
end

return M
