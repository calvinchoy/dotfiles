lua << EOF
  -- local saga = require 'lspsaga'
  -- saga.init_lsp_saga {
    -- error_sign = '',
    -- warn_sign = '',
    -- hint_sign = '',
    -- infor_sign = '',
  -- code_action_prompt = {
    -- enable = true,
    -- sign = false,
    -- sign_priority = 20,
    -- virtual_text = true,
    -- }
 -- }
EOF

" nnoremap <silent> gh <cmd>lua require'lspsaga.provider'.lsp_finder()<CR>
