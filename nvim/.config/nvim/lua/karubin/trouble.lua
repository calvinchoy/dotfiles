require('trouble').setup {}
require'toggle_lsp_diagnostics'.init()

local opts = { noremap = true, silent = true }
Keymap("n", "<leader>x", "<cmd>TroubleToggle<cr>", opts)
Keymap("n", "<leader>xw", "<cmd>TroubleToggle lsp_workspace_diagnostics<cr>", opts)
Keymap("n", "<leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>", opts)
Keymap("n", "<leader>xq", "<cmd>TroubleToggle quickfix<cr>", opts)
Keymap("n", "<leader>xl", "<cmd>TroubleToggle loclist<cr>", opts)
Keymap("n", "<leader>fr", "<cmd>TroubleToggle lsp_references<cr>", opts)
Keymap("n", "<leader>gd", "<cmd>TroubleToggle lsp_definitions<cr>", opts)
Keymap("n", "<leader>xv", "<Plug>(toggle-lsp-diag-vtext)", opts)