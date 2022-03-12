-- ---------------------------------------------
-- => Colors and themes
-- ---------------------------------------------
vim.cmd([[
    set termguicolors
    let g:tokyonight_transparent = "true"
    let g:tokyonight_transparent_sidebar = "true"
    let g:tokyonight_style = "storm"
    colorscheme tokyonight

    " Custom linenumber highlights
    highlight LineNr          ctermbg=NONE guifg=#616B9B guibg=NONE
    highlight CursorLineNr    ctermbg=NONE guifg=#CCCCCC guibg=NONE
    highlight CursorLine      ctermbg=darkred guifg=NONE guibg=#22273D
]])

require'colorizer'.setup()



