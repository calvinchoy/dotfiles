vim.cmd([[
  " use tpop vim-surround mappings, ys, cs yss, css etc.
  runtime macros/sandwich/keymap/surround.vim
  xmap is <Plug>(textobj-sandwich-auto-i)
  xmap as <Plug>(textobj-sandwich-auto-a)
  omap is <Plug>(textobj-sandwich-auto-i)
  omap as <Plug>(textobj-sandwich-auto-a)
]])
