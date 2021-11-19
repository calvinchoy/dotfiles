lua << EOF
-- -----------------------------------------------------------
-- Setup language servers 
-- -----------------------------------------------------------
-- nvim-cmp
local function config(_config)
    return vim.tbl_deep_extend("force", {
        capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
    }, _config or {})
end

-- change default lsp gutter signs
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

-- configure lsp diagnostics
vim.lsp.handlers["textDocument/publishDiagnostics"] =
  vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics,
  {
    virtual_text = false,
  }
)

vim.lsp.handlers["textDocument/hover"] =
  vim.lsp.with(
  vim.lsp.handlers.hover,
  {
    border = "single"
  }
)

vim.lsp.handlers["textDocument/signatureHelp"] =
  vim.lsp.with(
  vim.lsp.handlers.signature_help,
  {
    border = "single"
  }
)

require'lspconfig'.tsserver.setup(config())
require'lspconfig'.vuels.setup(config())
require'lspconfig'.pyright.setup(config())
require'lspconfig'.rust_analyzer.setup(config())
require'lspconfig'.cssls.setup(config())
require'lspconfig'.html.setup(config())
require'lspconfig'.jsonls.setup(config())
require'lspconfig'.eslint.setup(config())
require'lspconfig'.vimls.setup(config())

-- show diagnostic on hover
vim.o.updatetime = 250
vim.cmd [[autocmd CursorHold,CursorHoldI * lua vim.lsp.diagnostic.show_position_diagnostics({border = "single", focusable=false})]]
EOF

" Manually show diagnostics float details -- disabled for cursor hover
" nnoremap <Leader>dg :lua vim.lsp.diagnostic.show_line_diagnostics({border = "single", focusable=false})<CR>
