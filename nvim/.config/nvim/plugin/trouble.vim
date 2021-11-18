lua << EOF
-- -----------------------------------------------------------
-- Setup lsp trouble
-- -----------------------------------------------------------
require('trouble').setup {}

EOF
nnoremap <M+t> <cmd>:Trouble<cr>
