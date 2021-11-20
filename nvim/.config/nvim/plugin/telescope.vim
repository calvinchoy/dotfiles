" Default mappings from documentation
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>
nnoremap <leader>fz <cmd>:Telescope current_buffer_fuzzy_find<cr>

" Custom telescope mappings - browsing files and fuzzy symbol browsing
nnoremap <C-p> :lua require('karubin.telescope').project_files()<cr>
nnoremap <S-p> :lua require('karubin.telescope').document_symbols()<CR> 
nnoremap <leader>bf :lua require('karubin.telescope').browse_files()<CR> 
nnoremap <leader>gb <cmd>lua require('telescope.builtin').git_branches()<cr>
nnoremap <leader>gl <cmd>lua require('telescope.builtin').git_bcommits()<cr>

" Coding lsp tooling
nnoremap <leader>dg <cmd>lua require('telescope.builtin').lsp_document_diagnostics()<cr>
