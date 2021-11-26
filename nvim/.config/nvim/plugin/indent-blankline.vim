lua << EOF
vim.opt.list = true
require("indent_blankline").setup()
EOF

nnoremap <leader>id <cmd>IndentBlanklineToggle<cr>
