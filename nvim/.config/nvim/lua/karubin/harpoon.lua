Keymap('n','<M-h>', '<cmd>lua require("harpoon.ui").toggle_quick_menu()<cr>')
Keymap('n', ']h', '<cmd>lua require("harpoon.ui").nav_next()<cr>')
Keymap('n', '[h', '<cmd>lua require("harpoon.ui").nav_prev()<cr>')

Keymap('n', '!', '<cmd>lua require("harpoon.ui").nav_file(1)<cr>')
Keymap('n', '<leader>1', '<cmd>lua require("harpoon.mark").set_current_at(1)<cr>')
Keymap('n', '@', '<cmd>lua require("harpoon.ui").nav_file(2)<cr>')
Keymap('n', '<leader>2', '<cmd>lua require("harpoon.mark").set_current_at(2)<cr>')
Keymap('n', '#', '<cmd>lua require("harpoon.ui").nav_file(3)<cr>')
Keymap('n', '<leader>3', '<cmd>lua require("harpoon.mark").set_current_at(3)<cr>')
Keymap('n', '$', '<cmd>lua require("harpoon.ui").nav_file(4)<cr>')
Keymap('n', '<leader>4', '<cmd>lua require("harpoon.mark").set_current_at(4)<cr>')
Keymap('n', '%', '<cmd>lua require("harpoon.ui").nav_file(5)<cr>')
Keymap('n', '<leader>5', '<cmd>lua require("harpoon.mark").set_current_at(5)<cr>')
