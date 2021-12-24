lua << EOF
vim.opt.list = true
vim.cmd [[highlight IndentBlanklineIndent1 guifg=#2f2f40 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent2 guifg=#2f2f40 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent3 guifg=#2f2f40 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent4 guifg=#2f2f40 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent5 guifg=#2f2f40 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent6 guifg=#2f2f40 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent7 guifg=#2f2f40 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent8 guifg=#2f2f40 gui=nocombine]]

require("indent_blankline").setup({
    space_char_blankline = " ",
    char_highlight_list = {
        "IndentBlanklineIndent1",
        "IndentBlanklineIndent2",
        "IndentBlanklineIndent3",
        "IndentBlanklineIndent4",
        "IndentBlanklineIndent5",
        "IndentBlanklineIndent6",
        "IndentBlanklineIndent7",
        "IndentBlanklineIndent8",
    }, 
})
EOF

nnoremap <leader>id <cmd>IndentBlanklineToggle<cr>
