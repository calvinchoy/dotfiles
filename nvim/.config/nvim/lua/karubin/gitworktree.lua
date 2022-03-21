local opts = { noremap = true, silent = true }
Keymap("n", "<Leader>gw", "<cmd>lua require('telescope').extensions.git_worktree.git_worktrees()<cr>", opts)
Keymap("n", "<Leader>gwa", "<cmd>lua require('telescope').extensions.git_worktree.create_git_worktree()<cr>", opts)
