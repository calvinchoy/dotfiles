" Default mappings from documentation
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files({no_ignore = true, hidden = true})<cr>
nnoremap <leader>bf <cmd>lua require('karubin.telescope').browse_files()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>

" File and code navigation 
nnoremap <C-p> <cmd>lua require('karubin.telescope').project_files()<cr>
nnoremap <S-p> <cmd>lua require('karubin.telescope').document_symbols()<cr>
nnoremap <leader>fz <cmd>:Telescope current_buffer_fuzzy_find<cr>
" 
" " LSP related
nnoremap <leader>gd <cmd>lua require('telescope.builtin').lsp_definitions()<cr>
nnoremap <leader>fr <cmd>lua require('telescope.builtin').lsp_references()<cr>
nnoremap <leader>dg <cmd>lua require('telescope.builtin').lsp_document_diagnostics()<cr>

" Basic git helpers
nnoremap <leader>gb <cmd>lua require('telescope.builtin').git_branches()<cr>
nnoremap <leader>gl <cmd>lua require('telescope.builtin').git_bcommits()<cr>
