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

local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

require'lspconfig'.tsserver.setup(config())
require'lspconfig'.vuels.setup(config())
require'lspconfig'.pyright.setup(config())
require'lspconfig'.rust_analyzer.setup(config())
require'lspconfig'.cssls.setup(config())
require'lspconfig'.html.setup(config())
require'lspconfig'.jsonls.setup(config())
require'lspconfig'.eslint.setup(config())

EOF
