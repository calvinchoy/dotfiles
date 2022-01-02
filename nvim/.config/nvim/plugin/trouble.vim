lua << EOF
-- -----------------------------------------------------------
-- Setup lsp trouble
-- -----------------------------------------------------------
require('trouble').setup {}
require'toggle_lsp_diagnostics'.init()
EOF

nnoremap <leader>x <cmd>TroubleToggle<cr>
nnoremap <leader>xw <cmd>TroubleToggle lsp_workspace_diagnostics<cr>
nnoremap <leader>xd <cmd>TroubleToggle document_diagnostics<cr>
nnoremap <leader>xq <cmd>TroubleToggle quickfix<cr>
nnoremap <leader>xl <cmd>TroubleToggle loclist<cr>

" Below replacement for telescope find references and go to definitions
nnoremap <leader>fr <cmd>TroubleToggle lsp_references<cr>
nnoremap <leader>gd <cmd>TroubleToggle lsp_definitions<cr>

" Toggles for lsp ui using toggle-lsp-diagnostics plugin
nmap <leader>xv <Plug>(toggle-lsp-diag-vtext)
