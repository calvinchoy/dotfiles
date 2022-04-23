vim.opt.list = true
vim.cmd[[highlight IndentBlanklineContextChar guifg=#616B9B gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent1 guifg=#2f2f40 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent2 guifg=#2f2f40 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent3 guifg=#2f2f40 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent4 guifg=#2f2f40 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent5 guifg=#2f2f40 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent6 guifg=#2f2f40 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent7 guifg=#2f2f40 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent8 guifg=#2f2f40 gui=nocombine]]

require("indent_blankline").setup({
    show_current_context = true,
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
    space_highlight_list = {
        "IndentBlanklineIndent1",
        "IndentBlanklineIndent2",
        "IndentBlanklineIndent3",
        "IndentBlanklineIndent4",
        "IndentBlanklineIndent5",
        "IndentBlanklineIndent6",
        "IndentBlanklineIndent7",
        "IndentBlanklineIndent8",
    }, 
    space_char_blank_highlight_list = {
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

local opts = { noremap = true, silent = true }
Keymap("n", "<leader>id", "<CMD>IndentBlanklineToggle<CR>", opts)
