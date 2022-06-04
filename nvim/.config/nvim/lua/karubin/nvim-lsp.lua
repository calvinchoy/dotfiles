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

require'lspconfig'.sumneko_lua.setup {
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = {'vim'},
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  },
}

-- check: https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
-- require'lspconfig'.phpactor.setup(config())
require'lspconfig'.tsserver.setup(config())
-- require'lspconfig'.vuels.setup(config())
require'lspconfig'.volar.setup(config({filetypes = {'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue', 'json'}}))
require'lspconfig'.pyright.setup(config())
-- require'lspconfig'.rust_analyzer.setup(config())
require'lspconfig'.cssls.setup(config())
require'lspconfig'.html.setup(config())
require'lspconfig'.jsonls.setup(config())
require'lspconfig'.eslint.setup(config())
require'lspconfig'.vimls.setup(config())
require'lspconfig'.gopls.setup(config())
require'lspconfig'.yamlls.setup(config())
require'lspconfig'.bashls.setup(config())
require'lspconfig'.dotls.setup(config())
require'lspconfig'.emmet_ls.setup(config())
