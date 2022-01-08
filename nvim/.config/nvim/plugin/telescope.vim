" Default mappings from documentation
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files({no_ignore = true, hidden = true})<cr>
nnoremap <leader>bf <cmd>lua require('karubin.telescope').browse_files()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('karubin.telescope').browse_buffers()<cr>
nnoremap <leader>ft <cmd>lua require('karubin.telescope').term_finder()<cr>
nnoremap <S-t> <cmd>lua require('karubin.telescope').term_finder()<cr>
nnoremap <S-e> <cmd>lua require('karubin.telescope').browse_buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>
nnoremap <leader>fz <cmd>:Telescope current_buffer_fuzzy_find<cr>
nnoremap <C-p> <cmd>lua require('karubin.telescope').project_files()<cr>
nnoremap <S-p> <cmd>lua require('karubin.telescope').document_symbols()<cr>
nnoremap <leader>dcf <cmd>lua require('karubin.telescope').browse_dotfiles()<cr>

" 
" " LSP related - see Trouble plugin
" nnoremap <leader>gd <cmd>lua require('telescope.builtin').lsp_definitions()<cr>
" nnoremap <leader>fr <cmd>lua require('telescope.builtin').lsp_references()<cr>
" nnoremap <leader>dg <cmd>lua require('telescope.builtin').lsp_document_diagnostics()<cr>

" Basic git helpers
nnoremap <leader>gb <cmd>lua require('telescope.builtin').git_branches()<cr>
nnoremap <leader>gl <cmd>lua require('telescope.builtin').git_bcommits()<cr>
