"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => nvim devicons
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
lua << EOF
require('nvim-web-devicons').setup {
    override = {
        zsh = {
            icon = "",
            color = "#428850",
            name = "Zsh"
        }
    };
    default = true;
}
EOF