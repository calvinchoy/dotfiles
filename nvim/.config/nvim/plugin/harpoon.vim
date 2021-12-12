nnoremap <silent><leader>a :lua require("harpoon.mark").add_file()<CR>
nnoremap <silent><C-h> :lua require("harpoon.ui").toggle_quick_menu()<CR>

nnoremap <silent><S-a> :lua require("harpoon.ui").nav_file(1)<CR>
nnoremap <silent><S-s> :lua require("harpoon.ui").nav_file(2)<CR>
nnoremap <silent><S-d> :lua require("harpoon.ui").nav_file(3)<CR>
nnoremap <silent><S-f> :lua require("harpoon.ui").nav_file(4)<CR>
