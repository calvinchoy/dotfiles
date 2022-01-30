vim.cmd([[
    nnoremap <silent><leader>a :lua require("harpoon.mark").add_file()<CR>
    nnoremap <silent><M-h> :lua require("harpoon.ui").toggle_quick_menu()<CR>
    
    nnoremap <silent>h1 :lua require("harpoon.ui").nav_file(1)<CR>
    nnoremap <silent>h2 :lua require("harpoon.ui").nav_file(2)<CR>
    nnoremap <silent>h3 :lua require("harpoon.ui").nav_file(3)<CR>
    nnoremap <silent>h4 :lua require("harpoon.ui").nav_file(4)<CR>
]])

