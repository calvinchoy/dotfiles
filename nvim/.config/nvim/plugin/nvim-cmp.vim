lua << EOF
-- -----------------------------------------------------------
-- Setup nvim-cmp
-------------------------------------------------------------
local cmp = require'cmp'
local lspkind = require('lspkind')

cmp.setup({
    snippet = {
      expand = function(args)
        require('luasnip').lsp_expand(args.body)
      end,
    },
    mapping = {
      ['<C-d>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.close(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }),
    },
    sources = {
      { name = 'nvim_lsp', keyword_length = 3, max_item_count = 5 },
      { name = 'luasnip', keyword_length = 3, max_item_count = 5 },
      { name = 'path', keyword_length = 3, max_item_count = 5 },
      { name = 'buffer', keyword_length = 3, max_item_count = 5 },
    },
    formatting = {
      format = lspkind.cmp_format {
        with_text = true,
        menu = {
          buffer = "[buf]",
          nvim_lsp = "[lsp]",
          luasnip = "[snip]",
        }
      }
    },
    experimental = {
      native_menu = false,
      ghost_text = true,
    }
})

-- -----------------------------------------------------------
-- Snippets setup 
-- -----------------------------------------------------------
local snippets_paths = function()
    local plugins = { "friendly-snippets" }
    local paths = {}
    local path
    local root_path = vim.env.HOME .. '/.vim/plugged/'
    for _, plug in ipairs(plugins) do
        path = root_path .. plug
        if vim.fn.isdirectory(path) ~= 0 then
            table.insert(paths, path)
        end
    end
    return paths
end

require("luasnip.loaders.from_vscode").lazy_load({
    paths = snippets_paths(),
    include = nil,  -- Load all languages
    exclude = {}
})
EOF
