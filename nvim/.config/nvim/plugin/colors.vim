"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and themes
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set termguicolors
lua << EOF
require'colorizer'.setup()
EOF
let g:tokyonight_transparent = "true"
let g:tokyonight_style = "storm"
colorscheme kanagawa

" leave terminal background alone.
" highlight Normal          ctermbg=NONE guibg=NONE
" highlight SignColumn      ctermbg=NONE guibg=NONE

" Custom linenumber highlights
" highlight LineNr          ctermbg=NONE guifg=#616B9B guibg=NONE
" highlight CursorLineNr    ctermbg=NONE guifg=#93A3EA guibg=NONE
" highlight CursorLine      ctermbg=darkred guifg=NONE guibg=#22273D

