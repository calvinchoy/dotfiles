-- ---------------------------------------------
-- => Colors and themes
-- ---------------------------------------------
vim.cmd([[
    set termguicolors
    let g:tokyonight_transparent = "true"
    let g:tokyonight_transparent_sidebar = "true"
    let g:tokyonight_style = "storm"
    colorscheme tokyonight

    " -----------------------------------------------------------------
    " Override colorscheme highlights
    " -----------------------------------------------------------------

    " Custom linenumber highlights
    highlight LineNr          ctermbg=NONE guifg=#50587d guibg=NONE
    highlight CursorLineNr    ctermbg=NONE guifg=#CCCCCC guibg=NONE
    highlight CursorLine      ctermbg=darkred guifg=NONE guibg=#22273D

    " Custom split border color
    highlight VertSplit       guibg=bg guifg=#3b4261

    " Custom diff colors
    highlight DiffDelete      guifg=#3b4261

]])

require("colorizer").setup()
