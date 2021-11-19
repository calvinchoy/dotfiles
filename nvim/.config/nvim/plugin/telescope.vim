lua << EOF
local actions = require('telescope.actions')
require('telescope').setup{
  defaults = {
      file_sorter = require('telescope.sorters').get_fzy_sorter,
      prompt_prefix = ' > ',
      color_devicons = true,
      file_previewer   = require('telescope.previewers').vim_buffer_cat.new,
      grep_previewer   = require('telescope.previewers').vim_buffer_vimgrep.new,
      qflist_previewer = require('telescope.previewers').vim_buffer_qflist.new,
      mappings = {
        i = {
          ["<esc>"] = actions.close
        }
        }
  },
  extensions = {
      fzy_native = {
          override_generic_sorter = false,
          override_file_sorter = true,
      }
  }
}

require('telescope').load_extension('fzy_native')
EOF

" Default mappings from documentation
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>
nnoremap <leader>fz <cmd>:Telescope current_buffer_fuzzy_find<cr>

" Custom telescope mappings - browsing files and fuzzy symbol browsing
nnoremap <C-p> :lua require('telescope.builtin').git_files(require('telescope.themes').get_dropdown({previewer = false, prompt_title = "Git Files", layout_config = {width = 0.5, height = 0.35}}))<CR>
nnoremap <S-p> <cmd>lua require('telescope.builtin').lsp_document_symbols(require('telescope.themes').get_dropdown({ prompt_title = "Navigate Symbols", layout_config = {width = 0.5, height = 0.35}}))<cr>

" Git mappings
nnoremap <leader>gs <cmd>lua require('telescope.builtin').git_status()<cr>
nnoremap <leader>gb <cmd>lua require('telescope.builtin').git_branches()<cr>
nnoremap <leader>gl <cmd>lua require('telescope.builtin').git_bcommits()<cr>

" Coding lsp tooling
nnoremap <leader>dg <cmd>lua require('telescope.builtin').lsp_document_diagnostics()<cr>
