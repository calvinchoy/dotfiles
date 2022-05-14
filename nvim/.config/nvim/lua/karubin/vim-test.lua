vim.cmd([[
  let test#strategy = "neovim"
]])
local opts = { noremap = true, silent = true }
Keymap("n", "<leader>tt", "<cmd> TestNearest <cr>", opts)
Keymap("n", "<leader>tf", "<cmd> TestFile <cr>", opts)
Keymap("n", "<leader>ts", "<cmd> TestSuite <cr>", opts)
Keymap("n", "<leader>tv", "<cmd> TestVisit <cr>", opts)
Keymap("n", "<leader>tl", "<cmd> TestLast <cr>", opts)
