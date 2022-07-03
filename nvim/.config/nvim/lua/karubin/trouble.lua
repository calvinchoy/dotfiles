require('trouble').setup {
  height = 20,
  mode = "document_diagnostics"
}

local opts = { noremap = true, silent = true }
Keymap("n", "<Leader>x", "<cmd>TroubleToggle<cr>", opts)
Keymap("n", "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>", opts)
Keymap("n", "<leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>", opts)
Keymap("n", "<leader>xq", "<cmd>TroubleToggle quickfix<cr>", opts)
Keymap("n", "<leader>xl", "<cmd>TroubleToggle loclist<cr>", opts)
Keymap("n", "<leader>fr", "<cmd>TroubleToggle lsp_references<cr>", opts)
Keymap("n", "gd", "<cmd>TroubleToggle lsp_definitions<cr>", opts)
