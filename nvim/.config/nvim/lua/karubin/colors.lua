-- ---------------------------------------------
-- => Colors and themes
-- ---------------------------------------------
vim.cmd([[
    set termguicolors

    " -----------------------------------------
    " TokyoNight
    " -----------------------------------------
    let g:tokyonight_transparent = "true"
    let g:tokyonight_transparent_sidebar = "true"
    let g:tokyonight_style = "storm"
    colorscheme tokyonight

    " Custom linenumber highlights
    highlight LineNr          ctermbg=NONE guifg=#50587d guibg=NONE
    highlight CursorLineNr    ctermbg=NONE guifg=#CCCCCC guibg=NONE
    highlight CursorLine      ctermbg=darkred guifg=NONE guibg=#272c45
    highlight VertSplit       guibg=bg guifg=#3b4261
    
    highlight TelescopeBorder guibg=NONE
    
    " -----------------------------------------
    " Catpuccin
    " -----------------------------------------
    " let g:catppuccin_flavour = "macchiato" " latte, frappe, macchiato, mocha
    " colorscheme catppuccin

    " -----------------------------------------
    " Nightfox
    " -----------------------------------------
    " colorscheme nightfox

    " -----------------------------------------
    " Custom overrides
    " -----------------------------------------
    " Custom diff colors
    highlight DiffDelete      guifg=#3b4261

]])

require("colorizer").setup()
