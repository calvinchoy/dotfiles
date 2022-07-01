local saga = require("lspsaga")
saga.init_lsp_saga({
    -- use emoji lightbulb in default
    code_action_icon = "",
    -- same as nvim-lightbulb but async
    code_action_lightbulb = {
        enable = true,
        sign = false,
        sign_priority = 20,
        virtual_text = true,
    },
    max_preview_lines = 30
})

-- LSP Saga shortcuts
vim.keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", { silent = true })
vim.keymap.set("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", { silent = true,noremap = true })
vim.keymap.set("v", "<leader>ca", "<cmd><C-U>Lspsaga range_code_action<CR>", { silent = true,noremap = true })
vim.keymap.set("n", "<leader>gd", "<cmd>Lspsaga preview_definition<CR>", { silent = true })
vim.keymap.set("n", "<leader>cd", "<cmd>Lspsaga show_line_diagnostics<CR>", { silent = true,noremap= true })

