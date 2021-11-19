lua << EOF
-- -----------------------------------------------------------
-- Setup lsp trouble
-- -----------------------------------------------------------
require('trouble').setup {}

EOF
nnoremap <Leader>tb <cmd>:Trouble<cr>
